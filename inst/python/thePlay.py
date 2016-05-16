import xml.etree.ElementTree as Etree
import RPython
from copy import deepcopy
import nltk

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
    (the XML element for the scene).  The argument can alternatively be an Act object to obtain a list
    of scenes from just that act.
    '''
    value = []
    if isinstance(play, Act):
        acts = [ play ]
    else:
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
    def tokenize(self):
        text = ""
        for line in self.lines:
            if isinstance(line, str):
                text = text + "$" + line
        text = text[1:len(text)] # remove 1st "$"
        return nltk.word_tokenize(text)
            

def getSpeeches(play):
    ''' Return a list of the speeches in the XML object "play".  Each element of the list is
    an object of class "Speech" with fields "title", "act", "scene" and "data"
    (the list of lines of text in the speech).  The argument can alternatively be an Act  or Scene
    object to obtain a list of speeches from just that act or scene.
    '''
    value = []
    if isinstance(play, Scene):
        scenes = [ play ]
    else:
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

## some counter functions
def char_counter(table, speech):
    who = speech.speaker
    this_count = 0
    for line in speech.lines:
        if isinstance(line, str): #can be None, apparently
            this_count += len(line)
    if who in table.keys():
        table[who] = this_count
    else:
        table[who] += this_count
    return True

def speaker_counter(table, speech):
    who = speech.speaker
    if not who in table.keys():
        table[who] = [ ]
    table[who].append(speech.tokenize())
    return True

def speechTokens(speeches):
    '''A dictionary whose keys are the names of all speakers with speeches in the list.
    The corresponding element is a list of all the speeches spoken by that speaker, with
    each speech converted into a list of its tokens.
    
    The argument can be from the "speeches" field of a Play object or the result
    of any other computation.
    The argument could also be an Act, Scene or Play:  any object for which getSpeeches()
    returns a list of speeches.
    '''
    return speakersTable(speeches, speaker_counter)

def token_counter(table, speech):
    who = speech.speaker
    if not who in table.keys():
        table[who] = [ ]
    table[who] = table[who] + speech.tokenize() + [ "/>" ]
    return True

def tokens(speeches):
    '''A dictionary whose keys are all the names of speakers with speeches in the list.
    The corresponding element is a list of all the tokens spoken by each speaker.
    
    The argument can be from the "speeches" field of a Play object or the result
    of any other computation.
    The argument could also be an Act, Scene or Play:  any object for which getSpeeches()
    returns a list of speeches.
    '''
    return speakersTable(speeches,  token_counter)

def exists_counter(table, speech):
    who = speech.speaker
    table[who] = True
    return True

def speakers(speeches):
    '''A list of all the speakers found in the list. The argument
    can be a list of speeches or an object (Play, Act, Scene) for which
    getSpeeches() returns such a list.
    '''
    return speakersTable(speeches, exists_counter).keys()


def speakersTable(speeches, counter):
    '''A dictionary whose keys are all the names of speakers with speeches in the list.
    The counter argument will usually be a function of two arguments.  For each speech
    matching a particular speaker, the function will be called with the first argument
    being the dictionary and the second argument the current speech object.
    Counter functions are expected to accumulate something relevant in the dictionary entries
    whose keys are the speaker fields of the speeches.  The default counter function
    just sets the element of the dictionary to True.
    
    The speeches argument can be from the "speeches" field of a Play object or the result
    of any other computation.
    The argument could also be an Act, Scene or Play:  any object for which getSpeeches()
    returns a list of speeches.
    '''
    if not isinstance(speeches, list):
        speeches = getSpeeches(speeches)
    value = { }
    for speech in speeches:
        counter(value, speech)
    return value
