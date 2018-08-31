	NB. tabby - handlers.ijs
'==================== [tabby] handlers.ijs ===================='
0 :0
Friday 31 August 2018  21:14:03
)

coclass 'tabby'

0 :0
tab_close=:                  quit
tab_default=:                dofn
tab_run=:                    start
newc=: nohnd bind 'newc'
quit=: nohnd bind 'quit'
dofn=: nohnd bind 'dofn'
newf=: nohnd bind 'newf'
pickunits=: nohnd bind 'pickunits'
setpreci=: nohnd bind 'setpreci'
)

tab_default=: 3 : 0
NB. ssw LF,LF,'>>> tab_default: handler needed for last action:'
NB. ssw '(sysevent)=:             nohnd bind ''describe_action''(LF,LF)'
ssw '(sysevent)=: define_action'
)

nohnd=: 3 : 0
ssw '>>> NOT IMPLEMENTED: (sysevent) [(y)]'
)

tab_calco_button=:           calcmd
tab_calco_changed=: empty
tab_calco_char=: empty
tab_cappend_button=:         newc
tab_casec_button=: empty
tab_casef_button=: empty
tab_cons_button=:            newc
tab_cons_select=: empty
tab_fappend_button=:         newf
tab_func_button=:            newf
tab_func_select=: empty
tab_g_focus=: empty
tab_g_focuslost=: empty
tab_g_mbldown=:              click bind 1
tab_g_mblup=:                click bind 0
tab_g_resize=: empty
tab_panel_button=:           clickpanel
tab_panel_select=:           clickpanel
tab_preci_select=:           setpreci
tab_resize=: empty
tab_searchc_button=:         fillconsts
tab_searchc_char=: empty
tab_searchf_button=:         fillfuncts
tab_searchf_char=: empty
tab_tabs_button=:            clicktab
tab_tabs_select=:            clicktab
tab_xunit_button=: empty
tab_xunit_select=:           pickunits

tab_searchc_changed=: 3 : 0
ssw '>>> changed: casec=(casec) searchc=[(searchc)] searchc_select=(searchc_select)'
)

tab_searchf_changed=: 3 : 0
ssw '>>> changed: casef=(casef) searchf=[(searchf)] searchf_select=(searchf_select)'
)


tab_g_mmove=: 3 : 0
n=. 16  NB. (count) number of icons in a row
h=. w=. 32 NB. (px) height and width of an icon
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: z + <. X%w
fill_tools TOOLID  NB. hilite hovered tool
 confirm 13 }. TOOLID { TOOLHINT
NB.  confirm sw 'X=(X) Y=(Y) TOOLID=(TOOLID)'
  NB. Don't let hilite stay on forever…
sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

hover_off=: 3 : 0
wd 'timer 0'
fill_tools''
)

tab_close=: window_close

tab_newtt_button=: 3 : 0
DESELECT tabenginex 'newt'
clearunits''
ttinf''
inputfocus''
)

tab_opens_button=: define_action	NB. Open Sample…
tab_opent_button=: define_action	NB. Open…
tab_appet_button=: define_action	NB. Append…

NB. APPEND HANDLERS FOR ALL TAGS in TABU
NB. Where a verb like: newtt was once defined,
NB.  merge it with the full handler name above.