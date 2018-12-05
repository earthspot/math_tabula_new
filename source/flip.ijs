	NB. tabby - flip.ijs
'==================== [tabby] flip.ijs ===================='
0 :0
Friday 30 November 2018  09:27:43
-
Performs Undo/Redo after pause until one of these occurs…
  FLIPSTATE takes some other value than 0 or 1 (e.g. _1)
  something else assigns: sys_timer_z_ (e.g. tab_g_mmove)
)

cocurrent 'tabby'

FLIPSTATE=: _1
FLIPTIMER=: 1000 NB. (millisecs) delay before sys_timer_z_''

NB. test=: 3 : 'FLIPSTATE=:_1'
sys_timer_z_=: empty

flipshow=: 3 : 0
  NB. show the (next) flip state
wd'timer 0'
if. 1={.y do. FLIPSTATE=: 1 end.
if. isBool FLIPSTATE do.
  NB.   smoutput 'flipshow ',":FLIPSTATE
  tabenginex FLIPSTATE pick ;:'Redo Undo'
  FLIPSTATE=: -.FLIPSTATE
  sys_timer_z_=: flipshow_tabby_
  wd'timer ',":FLIPTIMER
end.
)

NB. onload 'flipshow 1'