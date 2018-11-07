	NB. tabby - flip.ijs
'==================== [tabby] flip.ijs ===================='

cocurrent 'tabby'

FLIPSTATE=: 0
FLIPENABLED=: 0
FLIPTIMER=: 1000 NB. (millisecs) delay before sys_timer_z_''

NB. test=: flipdisable
sys_timer_z_=: empty

flipenabled=: 3 : 'FLIPENABLED'

flipshow=: 3 : 0
  NB. show the (next) flip state
wd'timer 0'
if. flipenabled'' do.
  NB.   smoutput 'flipshow ',":FLIPSTATE
  tabenginex FLIPSTATE pick ;:'Undo Redo'
  FLIPSTATE=: -.FLIPSTATE
  sys_timer_z_=: flipshow_tabby_
  wd'timer ',":FLIPTIMER
end.
)

flipdisable=: 3 : 0
  NB. stop the timer & disable
wd'timer 0'
FLIPENABLED=: 0
)

flipstart=: 3 : 0
  NB. kick-off flipping
FLIPENABLED=: 1
flipshow''
)

NB. onload 'flipstart 1'