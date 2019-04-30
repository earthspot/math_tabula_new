	NB. tabby - open.ijs
'==================== [tabby] open.ijs ===================='
0 :0
Sunday 14 April 2019  04:42:20
-
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
)

coclass 'tabby'

SAMPFORM=: 0 : 0
pc ssn;pn Samples;
cc samps listbox;
pshow;
)

SAMPLES=: 0 : 0
0  angle sine and cosine
1  Church Clock
2  Asteroid Impact
3  Pseudogravity by rotation
4  inversion test
5  Cost of alcohol
6  temperature scales
7  indicator flag
8  untitled
9  untitled
)

openssn=: 3 : 0
  NB. show form to open SAMPLE*
if. -. preload'' do. return. end.
ssn_close''
wd SAMPFORM
wd 'set samps items *',SAMPLES
)

ssn_default=: 3 : 0
ssw '>>> tab_default: handler needed: (syschild) for: (sysevent)'
)

ssn_close=: 3 : 0
wd :: empty 'psel ssn; pclose;'
)

ssn_samps_select=: 3 : 0
n=. 1{.samps
ssw '+++ ssn_samps_select n=(n)'
ssn_close''
openss ".n
)

openss=: 3 : 0
  NB. open SAMPLE*
if. -. preload'' do. return. end.
if. 0=#y do. y=. '$$' end.
tabengine'open ',":y
showTtable''
setSelection 1
tab_panel_select''
restoreFocusToInputField''
)

launder=: 3 : 0
  NB. clean-up the path returned by wd 'mb open…'
'\/'charsub y -. CRLF
)

setFormTitle=: 3 : 0
  NB. set the title of the window to identify the t-table
flag=. (tabengine'DIRT')#brack'UNSAVED'
fname=. tabengine 'TFIT'
NB. title=. sw 'TABULA (flag) (fname)'
title=. sw '(flag) TABULA (fname)'
wd 'psel tab; pn ',title
  NB. other instrs to look at: TNAM TNMS
)

opentt=: 'open' ddefine
  NB. x=='open' - open selected t-table
  NB. x=='append' - append selected t-table
if. (x-:'open') do.
  if. -.preload'' do. return. end.
end.
NB. TPTT=: 'TPTT' default~ tabengine 'TPTT'  ---NO! dont reset TTPT
inst=. 4{.x
invalplot''
title=. sw 'Choose a ttable to (x)…'
  NB. not used by Mac version of jqt??
path=. launder wd sw 'mb open "(title)" *',TPTT
if. 0=#path do. confirm sw '>>> (x) ...cancelled' return. end.
confirm tabengine inst,SP,path
showTtable''
setSelection 1
tab_panel_select''
restoreFocusToInputField''
)

opent=: 3 : 0
  NB. toolbar sub-handler
if. heldshiftcmnd'' do. start_ttb_''	NB. launch: ttbrowse
elseif. heldshift'' do. opentt''	NB. open selected t-table
elseif. heldcmnd''  do. openssn''	NB. open SAMPLEn selection palette
elseif.             do. openss''	NB. open SAMPLE
end.
)

savea=: 3 : 0
  NB. Save As...
NB. TPTT=: 'TPTT' default~ tabengine 'TPTT'  ---NO! dont reset TTPT
title=. 'Save ttable as…'
nom=. wd sw 'mb save "(title)" *',TPTT
if. 0=#nom do.
  confirm '>>> Save As... cancelled'
else.
  smoutput '+++ savea: nom=',nom
  tabenginex 'sava' ; ijs nom
end.
)
