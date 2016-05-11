import xml.etree.ElementTree as Etree
import RPython
from copy import deepcopy

def getPlay(what):
    ''' Parse the file name, or if it's not a string, assume it's
a previously parsed tree.  (Should of course check that).
    '''
    if isinstance(what, str):
        return Etree.parse(what)
    else:
        return what

class Act(object):
    def __init__(self, obj = None):
        if obj is None:
            self.title = '<Unspecified>'
        else:
            self.title = obj.findtext('TITLE')
        self.data = obj

def getActs(play):
    ''' Return a list of the acts in the XML object "play".  Each element of the list is
an object of class "Act" with fields "title" and "data" (the XML element for the act).
    '''
    value = [ ]
    acts = play.findall('.//ACT')
    for el in acts:
        act = Act(el)
        value.append(act)
    return value

class Scene(object):
    def __init__(self, act = '<Unspecified>', obj = None):
        self.act = act
        if obj is None:
            self.title = '<Unspecified>'
        else:
            self.title = obj.findtext('TITLE')
        self.data = obj

def getScenes(play):
    ''' Return a list of the scenes in the XML object "play".  Each element of the list is
an object of class "Scene" with fields "title", "act" and "data"
(the XML element for the scene).
    '''
    value = []
    acts = getActs(play)
    for act in acts:
        scenes = act.data.findall('.//SCENE')
        actTitle = act.title
        for scene in scenes:
            obj = Scene(actTitle, scene)
            value.append(obj)
    return value

class Speech(object):
    def __init__(self, obj = None, act = '<Unspecified>', scene = '<Unspecified>'):
        self.act = act
        self.scene = scene
        ## to be a well-behaved class, we always set the 4 fields
        if obj is None:
            self.speaker = '<Unspecified>'
            self.lines = [ ]
        else:
            self.speaker = obj.findtext('SPEAKER')
            lines = obj.findall('.//LINE')
            linetext = []
            for line in lines:
                linetext.append(line.text)
            self.lines = linetext
    def getText(self):
        return RPython.vectorR(self.lines, "character")

def getSpeeches(play):
    ''' Return a list of the speeches in the XML object "play".  Each element of the list is
an object of class "Speech" with fields "title", "act", "scene" and "data"
(the list of lines of text in the speech).
    '''
    value = []
    scenes = getScenes(play)
    for scene in scenes:
        speeches = scene.data.findall('.//SPEECH')
        sceneAct = scene.act
        sceneTitle = scene.title
        for speech in speeches:
            obj = Speech(speech, sceneAct, sceneTitle)
            value.append(obj)
    return value

def getPersonae(play):
    ''' Returns a list of character strings describing the personae in the play.  In the style of
    the XML coding, each string is the name of the person as it will appear in speeches given
    by that character, followed by a description.  <NOT YET>:For personae listed in a group rather than
    separately, this function inserts the group description, in square brackets.
    '''
    value = []
    item = play.find('.//PERSONAE') # assume only one
    items = item.findall('.//PERSONA')
    for p in items:
        value.append(p.text)
    return value

