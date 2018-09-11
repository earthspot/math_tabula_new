	NB. tabby - plot.ijs
'==================== [tabby] plot.ijs ===================='
0 :0
Tuesday 11 September 2018  00:11:15
-
copied raw from math/tabula
)

coclass 'tabby'

invalplot=: erase&listnameswithprefix bind 'PLOT'
plotb=: 3 : 'replot PLOTF=:''bar'''
plotl=: 3 : 'replot PLOTF=:''line'''
plotp=: 3 : 'replot PLOTF=:''pie'''
plots=: 3 : 'replot PLOTF=:''surface'''

plotx=: 3 : 0
smoutput sw 'plotx: y=(y)'
if. -.setL 0 do. return. end.
PLOTX=: L0
PLOT=: tabengine 'PLOT' ; PLOTX ; y
undo''
Y=. {: i.#PLOT
PLOTY=: Y default 'PLOTY'
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY
)

