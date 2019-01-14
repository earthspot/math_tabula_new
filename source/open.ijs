	NB. tabby - open.ijs
'==================== [tabby] open.ijs ===================='
0 :0
Tuesday 18 September 2018  09:17:14
-
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
)

coclass 'tabby'

	NB. REPLACED BY: preload
NB. hasChanged=: 3 : 0
NB.   NB. avoid losing changes
NB. if. (tabengine 'DIRT') and -.heldalt'' do.
NB.   prompt=. 'Save current ttable?'
NB.   ask=. 'Ttable: ',tabengine 'TITL'
NB.   ask=. ask,LF,'has unsaved structural changes.'
NB.   ask=. ask,LF,'OK to continue (and lose the changes)?'
NB.   if. wdquery prompt;ask do.
NB.     confirm '>>> New/load ttable -cancelled'
NB.     1 return.end.end.
NB. 0 return.
NB. )

openss=: 3 : 0
  NB. open SAMPLE*
if. -. preload'' do. return. end.
if. 0=#y do. y=. '$$' end.
tabengine'open ',":y
showTtable''
setFormTitle''
setSelection 1
tab_panel_select''
restoreFocusToInputField''
)

launder=: 3 : 0
  NB. clean-up the path returned by wd 'mb open…'
'\/'charsub y -. CRLF
)

pathof=: ] {.~ [: >: SL i:~ ]

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
  NB. TPTT is cache to remember last used folder
if. (x-:'open') do.
  if. -.preload'' do. return. end.
end.
TPTT=: 'TPTT' default~ tabengine 'TPTT'
inst=. 4{.x
invalplot''
title=. sw 'Choose a ttable to (x)…'
  NB. not used by Mac version of jqt??
path=. launder wd sw 'mb open "(title)" *',TPTT
if. 0=#path do. confirm sw '>>> (x) ...cancelled' return. end.
TPTT=: pathof path  NB. change ONLY the local copy
confirm tabengine inst,SP,path
showTtable''
setFormTitle''
setSelection 1
tab_panel_select''
restoreFocusToInputField''
)

opent=: 3 : 0
  NB. toolbar sub-handler
if. heldcmnd'' do. start_ttb_'' return. end.  NB. launch: ttbrowse
if. heldshift'' do. opentt'' else. openss'' end.
)

savea=: 3 : 0
  NB. Save As...
  NB. TPTT is cache to remember last used folder
TPTT=: 'TPTT' default~ tabengine 'TPTT'
title=. 'Save ttable as…'
nom=. wd sw 'mb save "(title)" *',TPTT
if. 0=#nom do.
  confirm '>>> Save As... cancelled'
else.
  smoutput '+++ savea: nom=',nom
  tabenginex 'sava' ; ijs nom
end.
)
