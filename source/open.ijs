	NB. tabby - open.ijs
'==================== [tabby] open.ijs ===================='
0 :0
Tuesday 18 September 2018  09:17:14
-
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
)

coclass 'tabby'

hasChanged=: 3 : 0
  NB. avoid losing changes
if. (tabengine 'DIRT') and -.heldalt'' do.
  prompt=. 'Save current ttable?'
  ask=. 'Ttable: ',tabengine 'TITL'
  ask=. ask,LF,'has unsaved structural changes.'
  ask=. ask,LF,'OK to continue (and lose the changes)?'
  if. wdquery prompt;ask do.
    confirm '>>> New/load ttable -cancelled'
    1 return.end.end.
0 return.
)

openss=: 3 : 0
  NB. open SAMPLE
tabengine'open $$'
showTtable''
tab_panel_select 1
)

launder=: 3 : 0
  NB. clean-up the path returned by wd 'mb open…'
'\/'charsub y -. CRLF
)

pathof=: ] {.~ [: >: SL i:~ ]

opentt=: 'open' ddefine
  NB. x=='open' - open selected t-table
  NB. x=='append' - append selected t-table
  NB. Side effect: reassigns TPATH_TTABLES to path of last t-table
  NB. BUT a LOCAL copy: TPATH_TTABLES_tabby_ is created by: start
if. hasChanged'' do. return. end.
inst=. 4{.x
invalplot''
title=. sw 'Choose a ttable to (x)…'
  NB. not used by Mac version of jqt??
path=. launder wd sw 'mb open "(title)" *',TPATH_TTABLES
if. 0=#path do. confirm sw '>>> (x)...cancelled' return. end.
TPATH_TTABLES=: pathof path  NB. change ONLY the local copy
confirm tabengine inst,SP,path
showTtable''
tab_panel_select 1
)

NB. opent=: opentt shift openss  NB. doesn't work here!

opent=: 3 : 0
if. heldshift'' do. openss'' else. opentt'' end.
)