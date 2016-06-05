import xml.etree.ElementTree as Etree
import RPython
from copy import copy
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
    def __init__(self, obj = None, playTitle = None):
        if obj is None:
            self.title = '<Unspecified>'
        else:
            self.title = obj.findtext('TITLE')
        self.data = obj
        self.playTitle = playTitle

def getActs(play):
    ''' Return a list of the acts in the XML object "play".  Each element of the list is
an object of class "Act" with fields "title" and "data" (the XML element for the act).
    '''
    value = [ ]
    acts = play.findall('.//ACT')
    title = play.findtext('TITLE')
    for el in acts:
        act = Act(el, title)
        value.append(act)
    return value

class Scene(object):
    def __init__(self, actTitle = '<Unspecified>', playTitle = '<Unspecified>', obj = None):
        if obj is None:
            self.title = '<Unspecified>'
            self.actTitle = '<Unspecified>'
            self.playTitle = '<Unspecified>'
        else:
            self.title = obj.findtext('TITLE')
            self.actTitle = actTitle
            self.playTitle = playTitle
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
        playTitle = act.playTitle
        for scene in scenes:
            obj = Scene(actTitle, playTitle, scene)
            value.append(obj)
    return value

class Speech(object):
    def __init__(self, obj = None, act = '<Unspecified>', scene = '<Unspecified>', playTitle = '<Unspecified>'):
        self.act = act
        self.scene = scene
        self.playTitle = playTitle
        ## to be a well-behaved class, we always set the 4 fields
        if obj is None:
            self.speaker = '<Unspecified>'
            self.lines = [ ]
        else:
            self.speaker = obj.findtext('SPEAKER')
            lines = obj.findall('.//LINE')
            linetext = []
            for line in lines:
                text = line.text
                if isinstance(text, str):
                    linetext.append(text)
                else:
                    for el in list(line):
                        text = el.tail # this is how STAGEDIR elements seem to work
                        if isinstance(text, str):
                            linetext.append(text)
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
    def hasText(self, text, startat = 0):
        value = []
        for i in range(0, len(self.lines)):
            if text in self.lines[i]:
                value.append(i)
        return value
            
def toR_Speech(obj):
    obj = copy(obj)
    obj.lines = RPython.vectorR(obj.lines, "character")
    return RPython.toR_class(obj,  "Speech", "thePlay")

RPython.toR_methods["thePlay.Speech"] = toR_Speech           

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
        sceneAct = scene.actTitle
        sceneTitle = scene.title
        playTitle = scene.playTitle
        for speech in speeches:
            obj = Speech(speech, sceneAct, sceneTitle, playTitle)
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
    if item is None:
        return value
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

## the stopwords data from nltk

from nltk.corpus import stopwords
stopwords = nltk.corpus.stopwords.words('english')

## add some older stopwords

stopwords = stopwords + [ 'thee', 'thou', 'ye', 'thy', 'thine' ]
punctuation = [ '.', ',', '$', '!', ';', ':', "'", "--", "/>", "?" ]

from collections import Counter
import re

def wordsUsed(tokens, includeCommon = False, includePunctuation = False):
    ''' Given a list of tokens, returns a list of the distinct words included.
    Words are converted to lower case for comparison.
    Common words are excluded by default, being defined as the stopwords set from
    NLTK supplemented with a few common words in Elizabethan English.
    Punctuation is also excluded by default.  Optional second & third arguments in
    the call can override if supplied as True.

    The function can also be called with a dictionary whose elements are token lists,
    as returned by the tokens() function. In this case, it calls iself recursively to in
    effect apply the function to each element, returning a corresponding dictionary.
    '''
    if isinstance(tokens, dict):
        value = { }
        speakers = tokens.keys()
        for who in speakers:
            value[who] = wordsUsed(tokens[who])
        return value
    words = Counter()
    for tk in tokens:
        w = tk.lower()
        w = re.sub("[.]$", "", w) # some tokens have a trailing dot
        if w in words:
            continue
        if w in stopwords and not includeCommon:
            continue
        if w in punctuation and not includePunctuation:
            continue
        words.update([ w ])
    return [ w for w in words ]

def speechSearch(text, speeches, before = 3, after = 2, emph = False, filler = "  ......"):
    ''' Given some text and a list of speeches, returns a
    constructed list of speech fragments for any of the speeches that contains the
    text (as determined by the hasText() method.  All lines containing the text will
    be included plus some preceding and following lines as specified by the before=
    and after= arguments.
    (Argument emph= is not currently used.)
    '''
    value = [ ]
    for i in range(len(speeches)):
        sp = speeches[i]
        if not (isinstance(sp, Speech) and isinstance(sp.lines, list)):
            continue
        found = sp.hasText(text)
        if len(found) > 0:
            value.append(speechFragment(sp, found, before, after, filler))
    return value

def speechFragment(speech, lines, before = 3, after = 2, filler = "  ...... "):
    n = len(lines)
    N = len(speech.lines)
    if n == 0:
        return None
    value = copy(speech)
    out = [ ]
    pos = 0
    for i in range(n):
        this = lines[i]
        first = this - before + 1
        if first <= pos:
            first = pos
        else:
            out.append(filler)
        fence = this + after
        if fence > N:
            fence = N
        for j in range(first, fence):
            out.append(speech.lines[j])
        pos = fence
    if pos < N - 1:
        out.append(filler)
    value.lines = out
    return value


def allFieldStrings(objects, what):
    ''' Given a list of objects, all of which have a string-valued field specified by what,
    returns a list of the distinct strings found in all the elements of objects.
    '''
    flds = { }
    nbad = False
    for obj in objects:
        thisField = getattr(obj, what)
        if isinstance(thisField, str):
            flds[thisField] = True
        else:
            nbad = True
    if nbad:
        raise ValueError("Some fields were not strings")
    return flds.keys()

    
