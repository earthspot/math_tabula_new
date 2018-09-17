	NB. tabby - plot.ijs
'==================== [tabby] plot.ijs ===================='
0 :0
Tuesday 11 September 2018  00:11:15
-
copied raw from math/tabula-------UNFINISHED
)

coclass 'tabby'

invalplot=: erase&listnameswithprefix bind 'PLOT'
plotb=: 3 : 'replot PLOTF=:''bar'''
plotl=: 3 : 'replot PLOTF=:''line'''
plotp=: 3 : 'replot PLOTF=:''pie'''
plots=: 3 : 'replot PLOTF=:''surface'''

plotx=: 3 : 0
smoutput sw 'plotx: y=(y)'
NB. if. -.setL 0 do. return. end.
PLOTX=: L0
PLOT=: tabengine 'PLOT' ; PLOTX ; y
undo''
Y=. {: i.#PLOT
PLOTY=: Y default 'PLOTY'
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY
)

replot=: 3 : 0
if. 0~:nc<'PLOT' do.
  confirm '>>> No action: no plot steps specified yet'
  return.
end.
if. heldshift'' do.
  PLOTY=: (0,PLOTX) -.~ i.#PLOT
else.
  Y=. (0,PLOTX) -.~ ".panel_select
  if. 0<#Y do. PLOTY=: Y end.
end.
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY
)

stept=: 3 : 0
NB. if. -.setL 0 do. return. end.
selline L0
val=. | tabengine 'VALU' ; L0
if. val=0 do.
  confirm '>>> cannot plot zero-to-zero'
  return.
end.
if. heldshift'' do.
  z=. (-|val),(|val),100
else.
  if. val<0 do. z=. val,0,100 else. z=. 0,val,100 end.
end.
calcmd 'steps ',":z
)


