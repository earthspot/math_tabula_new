'==================== [qt] sesses.ijs ===================='
NB. New source script
NB. IAC Sat 4 Jul 2015  19:28:11
NB. cf: sesses in cal

cocurrent 'tab'

  NB. Ordinary settings:	sss''
  NB. ALL ACTIVE		sss 1
  NB. ALL SILENT		sss 0
sss=: 3 : 0
cocurrent 'tab'
sess=: 3 : 'if. TRACE do. smoutput y end.'  NB. general use
sesi=: 3 : 'if. TRACI do. smoutput y end.'  NB. CAL interface
sllog=: sess@llog
select. y
NB. ------------------------------
case. '' do.	NB. recommended /ordinary
sess=: 3 : 'if. TRACE do. smoutput y end.'
sess_calcmd=: empty 	NB. calcmd, increment [main] handler.ijs
sess_clickpanel=: empty NB. clickpanel [qt] main.ijs
sess_dofn=: empty  	NB. dofn [qt] event.ijs
sess_idle=: empty  	NB. idle [qt] idle.ijs
trace 1			NB. controls: sess
trach 0			NB. controls Handler1, mousemove
NB. ------------------------------
case. 1 do.	NB. ALL ACTIVE (indep of TRACE/TRACI)
sess_calcmd=: smoutput 	NB. calcmd, increment [main] handler.ijs
sess_clickpanel=: smoutput NB. clickpanel [qt] main.ijs
sess_dofn=: smoutput  	NB. dofn [qt] event.ijs
sess_idle=: smoutput  	NB. idle [qt] idle.ijs
trace 0			NB. controls: sess
trach 0			NB. controls Handler1, mousemove
NB. ------------------------------
case. 0 do.	NB. ALL SILENT
sess=: empty
sess_calcmd=: empty 	NB. calcmd, increment [main] handler.ijs
sess_clickpanel=: empty NB. clickpanel [qt] main.ijs
sess_dofn=: empty  	NB. dofn [qt] event.ijs
sess_idle=: empty  	NB. idle [qt] idle.ijs
trace 0			NB. controls: sess
trach 0			NB. controls Handler1, mousemove
NB. ------------------------------
case. '?'  do.
  smoutput >crr each ;:'TRACE TRACEH'
  smoutput SSS
NB. ------------------------------
case.   do.
  smoutput '>>> unsupported y: ',":y
  smoutput '    try instead...',LF,'  sss ''?'''
end.
i.0 0
)

sss_z_=: sss

sm SSS=: 0 : 0
NB. set these to: smoutput -for a rough'n'ready trace
sess_tab_=: 3 : 'if. TRACE do. smoutput y end.'  NB. general use
sess_tab_=: smoutput
sess_tab_=: empty
sess_calcmd_tab_=: sess 	NB. calcmd, increment [main] handler.ijs
sess_calcmd_tab_=: empty 	NB. calcmd, increment [main] handler.ijs
sess_clickpanel_tab_=: smoutput NB. clickpanel [qt] main.ijs
sess_clickpanel_tab_=: empty    NB. clickpanel [qt] main.ijs
sess_dofn_tab_=: smoutput  	NB. dofn [qt] event.ijs
sess_dofn_tab_=: empty  	NB. dofn [qt] event.ijs
sess_idle_tab_=: smoutput  	NB. idle [qt] idle.ijs
sess_idle_tab_=: empty  	NB. idle [qt] idle.ijs
trace 1			NB. controls: sess
trach 0			NB. controls Handler1, mousemove
)
