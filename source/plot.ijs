@@ 'NOT INCLUDED'
	NB. tabby - plot.ijs
'==================== [tabby] plot.ijs ===================='
0 :0
Tuesday 11 September 2018  00:11:15
-
TO REINSTATE...
…use corresp CAL instrs:
PLOT rzz  r plotz~ zz              \gen plot data with x-axis (is r the x-axis item#)
plot rzz  r plotx~ zz              \setup plot with x-axis  (setup==gen/show??)
pl0v r    r plotv~ 0               \setup plot 0 to v	(is r the x-axis item# giving v?)
pl1v r    r plotv~ 1               \setup plot 1 to v	(")
plvv r    r plotv~ _               \setup plot -v to v	(")
rplt rrr  replot rrr               \re-plot with items
…none of these use: plotl
-
plotx is (still) in this script, but CAL expects it inside _cal_
INSIDE _cal_
	plot - a (gatekeeper) vector to plot_z_, the gateway to Plot
	plotDisabled - boolean used by plot_cal_
	plotl - for use in UUF: calls pd (low-level) to show line graph
…and that is all for now.
NEEDED in _cal_
	plotz
	plotx - presumably the plotx below??
	plotv
	replot
++ [proverb] is EXISTING handler name in TABU below…
--These set parameters for the actual plot…
File > Plot 0 to (value) [stept]	-suggest tabengine'pl0v r'
?File > Plot 1 to (value) [stept?]	-suggest tabengine'pl1v r'
?File > Plot (-value) to (value) [?]	-suggest tabengine'plvv r'
--These call replot to show/update the Plot window…
File > Line Chart [plotl]		-suggest plotl (but how? As-is?)
File > Bar Chart [plotb]		-suggest plotb: a variant of plotl
File > Pie Chart [plotp]		-suggest plotp: a variant of plotl
File > Surface Chart [plots]		-suggest plots: a variant of plotl
STRATEGY
	get File > Line Chart [plotl] working first
	then tool: replot
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
PLOTX=: firstItem''
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
theItem=. line 0
setSelection theItem
val=. | tabengine 'VALU' ; theItem
if. val=0 do.
  confirm '>>> cannot plot zero-to-zero'
  return.
end.
if. heldshift'' do.
  z=. (-|val),(|val),100
else.
  if. val<0 do. z=. val,0,100 else. z=. 0,val,100 end.
end.
smoutput '??? what to do with: steps ',":z
)


