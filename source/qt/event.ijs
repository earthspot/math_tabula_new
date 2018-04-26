'==================== qt event.ijs ===================='
NB. IAC Sun 28 Jun 2015  04:01:06

tab_close=: quit
tab_default=: dofn
tab_run=: start

conss=: setshow bind 1
tab_cappend_button=: newc
tab_casec_button=: empty
tab_cons_button=: newc
tab_cons_select=: empty
tab_searchc_button=: fillconsts

funcs=: setshow bind 2
tab_casef_button=: empty
tab_fappend_button=: newf
tab_func_button=: newf
tab_func_select=: empty
tab_searchf_button=: fillfuncts

tab_g_focus=: empty
tab_g_focuslost=: empty
tab_g_mbldown=: click bind 1
tab_g_mblup=: click bind 0
tab_g_mmove=: mousemove
tab_tabs_button=: clicktab

NB. Absent handler is invoked, but seems to be redundant anyway.
NB. IAC Mon 29 Jun 2015  16:32:20
tab_tabs_select=: empty

tab_calco_button=: calcmd
tab_panel_button=: clickpanel
tab_panel_select=: clickpanel
tab_preci_select=: setpreci
tab_xunit_button=: empty
tab_xunit_select=: pickunits

NB. =========================================================
dofn=: 3 : 0
Handler 'dofn' NB. service toolbar click
if. syschild-: ,'g' do. return. end. NB. not for toolbar
fn=. syschild NB. name of event-posting ctl, eg 'opent'
if. n9 e.~ {.fn do. fn=. 'N',fn end. NB. to allow: Ctrl+9 etc
if. isverb fn do.
  sess_dofn 'dofn: execute verb: ',fn
  fn 128!:2 ''
else.
  sess_dofn 'dofn: absent handler: ' , fn , ' sysevent: ' , sysevent
  confirm z=. '>>>dofn: Not found: ',fn , ' sysevent: ' , sysevent
end.
)

NB. =========================================================
NB. Handler=: Handler1	NB. suggest setup in: start.ijs
NB. Handler=: empty	NB. suggest setup in: start.ijs

Handler1=: 3 : 0
NB. DIAGNOSTICS FOR HANDLER DEVT
if. -. TRACH do. return. end.
select. y
case. 'mousemove' do. NB. no-op
case. 'calcmd' do.
  smoutput llog 'calco panel_select'
case. do.
  smoutput llog 'syschild'
end.
)

NB. =========================================================
tab_g_paint=: 3 : 0
0 drawico&>i.32
)
