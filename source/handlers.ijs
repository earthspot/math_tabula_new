	NB. tabby - handlers.ijs
'==================== [tabby] handlers.ijs ===================='
0 :0
Saturday 1 September 2018  18:04:43
)

coclass 'tabby'

tab_default=: 3 : 0
sllog 'tab_default syschild sysparent syshandler sysevent'
)

NB. >>> WE NOW HAVE A doubleclick event for the toolbar...
tab_g_mbldbl=: empty

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
tab_g_resize=: empty
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
fill_tools''  NB. redraw toolbar with no hilite
)

tab_close=: window_close

tab_newtt_button=: 3 : 0
DESELECT tabenginex 'newt'
clearunits''
ttinf''
restoreFocusToInputField''
)

tab_panel_select=: 3 : 0
  NB. handles click on row of t-table, or arrow-selection
sllog 'tab_panel_select syschild sysparent syshandler sysevent'
for_row. >cutopen panel do.
z=. '{' takeafter row
]line=. ". '}' taketo z
]z=. dlb '}' takeafter z
]i=. {. I. '  ' E. z  NB. where qty ends
qty=. i{.z
com=. dlb i}. z
sval=. ' ' taketo qty
unit=. ' ' takeafter qty
smoutput line ; sval ; unit ; com
end.
)

tab_panel_button=: tab_panel_select  NB. IS IT EVER TRIGGERED?

tab_g_mbldown=: 3 : 0
  NB. mouseDown on toolbar
  NB. TOOLID is repeatedly assigned by: tab_g_mmove
1 fill_tools TOOLID
restoreFocusToInputField''
)

tab_g_mblup=: 3 : 0
  NB. mouseUp on toolbar: executes the tool
  NB. TOOLID is repeatedly assigned by: tab_g_mmove
if. -. TOOLID e. i.32 do.
  smoutput '>>> tab_g_mblup: BAD TOOLID: ',":TOOLID
  return.
end.
tool=. dtb 3 }. 13 {. TOOLID{TOOLHINT
NB. This verb should execute the FULL HANDLER NAME for: action.
NB. This should avoid superfluous levels of indirection.
NB. Perhaps if handler name doesn't exist, execute a name=tag verb,
NB. e.g. set1u
if. -.absent tool do. (tool~)'' return. end.
sllog 'tab_g_mblup TOOLID tool'
restoreFocusToInputField''
)

tab_Vzero_button=: 3 : 0
smoutput '+++ tab_Vzero_button: ENTERED'
smoutput '--- tab_Vzero_button: EXITS'
)

tab_Vonep_button=: 3 : 0
smoutput '+++ tab_Vonep_button: ENTERED'
smoutput '--- tab_Vonep_button: EXITS'
)

tab_Vonen_button=: 3 : 0
smoutput '+++ tab_Vonen_button: ENTERED'
smoutput '--- tab_Vonen_button: EXITS'
)
