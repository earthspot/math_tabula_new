	NB. tabby - open.ijs
'==================== [tabby] open.ijs ===================='
0 :0
Tuesday 11 September 2018  01:47:13
-
CONTAINS IN-LINE MESSAGES --replace if MESSAGE table provided
-

)

coclass 'tabby'

hasChanged=: 3 : 0
if. (tabengine 'DIRT') and -.heldalt'' do.
  prompt=. 'Save current ttable?'
  ask=. 'Ttable: ',tabengine 'TITL'
  ask=. ask,LF,'has unsaved structural changes.'
  ask=. ask,LF,'OK to continue (and lose the changes)?'
  if. wdquery prompt;ask do.
    confirm '>>> New/load ttable -cancelled'
    1 return.
  end.
end.
0 return.
)

opens=: 3 : 0
  NB. open SAMPLE
tabengine'open $$'
showTtable''
)

launder=: 3 : 0
  NB. clean-up the path returned by wd 'mb open…'
'\/'charsub y -. CRLF
)

pathof=: ] {.~ [: >: SL i:~ ]

opentt=: 'open' ddefine
  NB. x=='open' - open selected t-table
  NB. x=='append' - append selected t-table
  NB. Reassigns visible TPATH_TTABLES to path of last t-table
  NB. TPATH_TTABLES_z_ is created by this locale's CAL copy
  NB. Don't reassign TPATH_TTABLES_z_ itself: affects other CALs
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
)

