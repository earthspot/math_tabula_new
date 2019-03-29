	NB. tabby - handlers.ijs
'==================== [tabby] handlers.ijs ===================='
0 :0
Friday 29 March 2019  13:26:53
-
===Latest Built Files:
open '~Gituu/uu.ijs'
open '~Gitcal/cal.ijs'
open '~Gitcal/source/CAL_interface.ijs'
open '~Gittab/tabula.ijs'
open 'math/tabula'		NB. existing release
-
===Templates for handlers:
additems_like	>0 selected lines, ignores shift
set1u_like	1 selected line, restores selection
add1u_like	set1u_like but puts v=1 in CAL instruction
child_like	set1u_like but ignores shift
subitems_like	2 selected lines, order significant
)

coclass 'tabby'


child_like=: 4 : 0
  NB. template of choice for menu clicks
tabengine x ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

NB. Handlers for menu: File

tab_newtt_button=: newtt
tab_openn_button=: openssn
tab_opens_button=: openss
tab_opent_button=: 'open'&opentt
tab_appet_button=: 'appe'&opentt
tab_savex_button=: tabenginex bind 'save'
tab_saves_button=: tabenginex bind 'savs'
tab_savet_button=: tabenginex bind 'savt'
NB. tab_savea_button=: savea
NB. tab_stept_button=: stept
NB. tab_plotl_button=: notimp
NB. tab_plotb_button=: notimp
NB. tab_plotp_button=: notimp
NB. tab_plots_button=: notimp
tab_close_button=: tab_close
tab_print_button=: notimp
tab_quit_button=:  quit

NB. Handlers for menu: Edit

tab_undo_button=:  tabenginex bind 'Undo'
tab_redo_button=:  tabenginex bind 'Redo'
NB. tab_copal_button=: copal
NB. tab_label_button=: label
NB. tab_formu_button=: formu
tab_erasf_button=: 'orph'&child_like
tab_siunt_button=: siunt
tab_movet_button=: 'movt'&movtb
tab_moveu_button=: 'movu'&movud
tab_moved_button=: 'movd'&movud
tab_moveb_button=: 'movb'&movtb
NB. tab_newsl_button=: newsl
NB. tab_merge_button=: merge
NB. tab_delit_button=: delit
tab_dupit_button=: equal
tab_updex_button=: tabenginex bind 'exch'

NB. Handlers for menu: Command

tab_repet_button=: tabenginex bind 'Repe'
tab_tthld_button=: 'hold'&hold  NB. transient hold
tab_thold_button=: 'holm'&hold  NB. mandatory hold
tab_hidel_button=: notimp
tab_unhid_button=: notimp
tab_ttabl_button=: clicktab bind 0
tab_conss_button=: clicktab bind 1
tab_funcs_button=: clicktab bind 2
tab_infor_button=: clicktab bind 3

NB. Handlers for menu: Value

tab_Vzero_button=: 'zero'&child_like
tab_Vonep_button=: 'onep'&child_like
tab_Vonen_button=: 'onen'&child_like
tab_Vabsv_button=: 'absv'&child_like
tab_Vdblv_button=: 'dblv'&child_like
tab_Vhlvv_button=: 'hlvv'&child_like
tab_Vintv_button=: 'intv'&child_like
tab_Vinvv_button=: 'invv'&child_like
tab_Vnegv_button=: 'negv'&child_like
tab_Vsqtv_button=: 'sqtv'&child_like
tab_Vsqrv_button=: 'sqrv'&child_like
tab_Vcbtv_button=: 'cbtv'&child_like
tab_Vcubv_button=: 'cubv'&child_like
tab_Vexpv_button=: 'expv'&child_like
tab_Vextv_button=: 'extv'&child_like
tab_Vetwv_button=: 'etwv'&child_like
tab_Vlnnv_button=: 'lnnv'&child_like
tab_Vltnv_button=: 'ltnv'&child_like
tab_Vltwv_button=: 'ltwv'&child_like
tab_Vpimv_button=: 'pimv'&child_like
tab_Vptmv_button=: 'ptmv'&child_like
tab_Vpidv_button=: 'pidv'&child_like
tab_Vptdv_button=: 'ptdv'&child_like

NB. Handlers for menu: Scale

tab_Vunsc_button=: 'unsc'&child_like
tab_Vstpu_button=: 'stpu'&child_like
tab_Vstpd_button=: 'stpd'&child_like
tab_Vdeci_button=: 'deci'&child_like
tab_Vcent_button=: 'cent'&child_like
tab_Vmill_button=: 'mill'&child_like
tab_Vmicr_button=: 'micr'&child_like
tab_Vnano_button=: 'nano'&child_like
tab_Vpico_button=: 'pico'&child_like
tab_Vfemt_button=: 'femt'&child_like
tab_Vatto_button=: 'atto'&child_like
tab_Vzept_button=: 'zept'&child_like
tab_Vyoct_button=: 'yoct'&child_like
tab_Vdeca_button=: 'deca'&child_like
tab_Vhect_button=: 'hect'&child_like
tab_Vkilo_button=: 'kilo'&child_like
tab_Vmega_button=: 'mega'&child_like
tab_Vgiga_button=: 'giga'&child_like
tab_Vtera_button=: 'tera'&child_like
tab_Vpeta_button=: 'peta'&child_like
tab_Vexaa_button=: 'exaa'&child_like
tab_Vzett_button=: 'zett'&child_like
tab_Vyott_button=: 'yott'&child_like

NB. Handlers for menu: Function

tab_Lequl_button=: 'equl'&child_like
tab_Labsl_button=: 'absl'&child_like
tab_Ldbll_button=: 'dbll'&child_like
tab_Lhlvl_button=: 'hlvl'&child_like
tab_Lintl_button=: 'intl'&child_like
tab_Linvl_button=: 'invl'&child_like
tab_Lnegl_button=: 'negl'&child_like
tab_Lsqtl_button=: 'sqtl'&child_like
tab_Lsqrl_button=: 'sqrl'&child_like
tab_Lcbtl_button=: 'cbtl'&child_like
tab_Lcubl_button=: 'cubl'&child_like
tab_Lexpl_button=: 'expl'&child_like
tab_Lextl_button=: 'extl'&child_like
tab_Letwl_button=: 'etwl'&child_like
tab_Llnnl_button=: 'lnnl'&child_like
tab_Lltnl_button=: 'ltnl'&child_like
tab_Lltwl_button=: 'ltwl'&child_like
tab_Lpiml_button=: 'piml'&child_like
tab_Lptml_button=: 'ptml'&child_like
tab_Lpidl_button=: 'pidl'&child_like
tab_Lptdl_button=: 'ptdl'&child_like
tab_Lt1ml_button=: 't1ml'&child_like
tab_Lt2ml_button=: 't2ml'&child_like
tab_Lt3ml_button=: 't3ml'&child_like
tab_Lt1dl_button=: 't1dl'&child_like
tab_Lt2dl_button=: 't2dl'&child_like
tab_Lt3dl_button=: 't3dl'&child_like

NB. Handlers for menu: Help

tab_hinf_button=: showttinf
tab_togi_button=: ide

NB. Handlers for misc controls

tab_calco_button=:           interpretCalco
tab_calco_changed=: empty
tab_calco_char=: empty
tab_cappend_button=:         newc
tab_casec_button=:           fillconsts
tab_casef_button=:           fillfuncts
tab_cons_button=:            newc
 tab_cons_mark=: empty
 tab_cons_mbldbl=:            newc
 tab_cons_mbldown=: empty
tab_cons_select=: empty
tab_fappend_button=:         newf
tab_func_button=:            newf
 tab_func_mark=: empty
 tab_func_mbldbl=:            newf
 tab_func_mbldown=: empty
tab_func_select=: empty
tab_g_focus=: empty
tab_g_focuslost=: empty
tab_g_mbldbl=: empty	NB. DOUBLECLICK on toolbar
tab_g_resize=: empty
tab_preci_select=:           setpreci
tab_unico_select=:           setunico
tab_resize=: empty
tab_searchc_button=:         fillconsts
tab_searchc_changed=:        fillconsts
tab_searchc_char=: empty
tab_searchf_button=:         fillfuncts
tab_searchf_changed=:        fillfuncts
tab_searchf_char=: empty
tab_tabs_button=:            clicktab
tab_tabs_select=:            clicktab
tab_xunit_button=: empty

tab_xunit_select=: 3 : 0
  NB. change units using the combo box: xunit
theItem=. line 0
confirm tabengine 'unit'; theItem ; xunit-.LF
showTtable''
restoreSelection''
setcalcovalue''
restoreFocusToInputField''
)

holdcons=: '=' ,~ ]

newc=: 3 : 0
  NB. append new constant to t-table
  NB. cannot use ddefine here -needs current value of: cons
y newc~ consLine''
:
	x_tabby_=: x
if. 0=#x-.SP do.
  confirm '>>> No action: select a single line'
else.
  activateTabWithId 0
  _ tabenginex 'cons ',holdcons x
end.
)

newf=: 3 : 0
  NB. append new function line(s) to t-table
  NB. cannot use ddefine here -needs current value of: func
y newf~ funcLine''
:
if. 0=#x-.SP do.
  confirm '>>> No action: select a single line'
else.
  activateTabWithId 0
  _ tabenginex 'func ',x
end.
)

consLine=: 3 : 0
  NB. reconstitute UUC line from table, c/f boxcons [main]
'zdesc znits znitv zvalu'=: cuT wd'psel tab; get cons row ',firstwords cons
sw '(zvalu) (znitv) [(znits)] (zdesc)'
)

funcLine=: 3 : 0
  NB. reconstitute UUF line from table, c/f boxfunc [main]
'zdesc znits zfmla'=: cuT wd'psel tab; get func row ',firstwords func
sw '(zfmla) [(znits)] (zdesc)'
)

insertIDs=: 3 : 0
  NB. substitute actual IDs for {A} {B} etc in (string) y
z=. y
z=. z rplc '{ABC}' ; brace allItems''
z=. z rplc '{A}' ; brace firstItem''
z=. z rplc '{B}' ; brace secondItem''
)

tab_g_mmove=: 3 : 0
n=. 16  NB. (count) number of icons in a row
h=. w=. 32 NB. (px) height and width of an icon
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: 32 <. z + <.X%w
fill_tools TOOLID  NB. hilite hovered tool
confirm insertIDs 3 }. TOOLID { TOOLHINT  NB. drop just the tool id
  NB. Don't let hilite stay on forever…
sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

hover_off=: 3 : 0
wd 'timer 0'
fill_tools''  NB. redraw toolbar with no hilite
)

tab_close=: quit  NB. the goAway button, top-left

line=: 3 : 0 "0
  NB. return the y'th selection
z=. ".panel_select
if. _1={.z do. return. end.
if. y=0 do. {.z
elseif. y>1+#z do. {.}.z
elseif. do. {:z
end.
)

firstItem=: line bind 0
secondItem=: line bind 1
allItems=: 3 : 'sort ".panel_select'

tab_panel_select=: 3 : 0
  NB. handles click on row of t-table, or arrow-selection
sllog 'tab_panel_select y panel_select'
updatevaluebar''
confirm details'' [NOCONFIRM=:0
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
TOOL=: dtb 3 }. 13 {. TOOLID{TOOLHINT
NB. There should exist a "tool" for every tool name in TOOLHINT
sllog 'tab_g_mblup TOOLID TOOL'
(TOOL~)''
)

tab_default=: 3 : 0
sllog 'tab_default syschild sysevent'
try. do syschild,''''''  NB. take an informed guess
catch. ssw '>>> tab_default: handler needed: (syschild) for: (sysevent)'
end.
)

tools=: 3 : 'b4x firstwords 3}."1 TOOLHINT'

NB. toolbar pseudo-handlers...

newtt=: 3 : 0
if. -. preload'' do. return. end.
if. heldshift'' do. revtt'' return. end.
tabengine 'newt'
confirm tabengine'MSSG'
showTtable''
setunitsEmpty''
setcalco '' NB. tabengine 'TITU'
restoreFocusToInputField''
)

revtt=: tabenginex bind 'Revt'

copal=: 3 : 0
  NB. Copy entire ttable
wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

undoredo=: 3 : 0
  NB. Undo / Redo -last action
if. heldshift'' do. tabenginex 'Redo'
elseif. heldcmnd'' do. flipshow 1
elseif. do. tabenginex 'Undo'
end.
)

savts=: 'savs savt' ddefine
  NB. Save t-table As SAMPLE / title
tabenginex pickshift 2$ ;:x
)

additems=: additems_like=: 'plus' ddefine
  NB. Add all selected items
tabengine x ; panel_select
confirm tabengine'MSSG'
showTtable''
setSelection _  NB. select the last line
updatevaluebar''
restoreFocusToInputField''
)

mulitems=: 'mult'&additems_like  NB. Multiply all selected items                           

subitems=: subitems_like=: 'minu' ddefine
  NB. item 1 - 2 / item 2 - 1
if. heldshift'' do. tabengine x ; line 1 0
else.               tabengine x ; line 0 1
end.
confirm tabengine'MSSG'
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

divitems=: 'divi'&subitems_like  NB. item 1÷2 / item 2÷1
powitems=: 'powe'&subitems_like  NB. item 1^2 / item 2^1

movud=: 'movu' ddefine
  NB. Move line up / Move line down
theItem=. line 0
if. (heldshift'') or x-:'movd' do.
  tabengine 'movd' ; theItem
  showTtable''
  incSelection 1
else.
  tabengine 'movu' ; theItem
  showTtable''
  incSelection _1
end.
NB. updatevaluebar'' ---doesn't change
restoreFocusToInputField''
)

movtb=: 'movt' ddefine
  NB. Move line to top / Move line to bottom
theItem=. line 0
if. (heldshift'') or x-:'movb' do.
  tabengine 'movb' ; theItem
  showTtable''
  setSelection _
else.
  tabengine 'movt' ; theItem
  showTtable''
  setSelection 1
end.
NB. updatevaluebar'' ---doesn't change
restoreFocusToInputField''
)

newsl=: 3 : 0
  NB. New line
tabengine 'newu *'  NB. CAL needs to be told '*' explicitly
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

equal=: 'equl'&additems_like  NB. New line = selected line
delit=: 'dele'&additems_like  NB. Delete selected lines

delsa=: 3 : 0
  NB. delete saved SAMPLE
tabengine 'delf SAMPLE'       
confirm tabengine'MSSG'
)

hold=: '' ddefine
  NB. Toggle Hold / Toggle Transient Hold
if. 0=#x do. inst=. pickshift ;:'holm hold'
else. inst=. 4{.x
end.
tabengine inst,SP,panel_select
confirm tabengine'MSSG'
showTtable''
restoreSelection''
NB. updatevaluebar'' ---doesn't change
restoreFocusToInputField''
)

iedit=: 3 : 0
  NB. Edit item name / Edit item formula
if. heldshift'' do. formu'' else. label'' end.
)

setv0=: 'zero' ddefine
  NB. Set value to 0
tabengine x ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

siunt=: 'cvsi'&child_like

set1u=: set1u_like=: 'onep onen' ddefine
  NB. Set value to 1 / Set value to -1
inst=. pickshift 2$ ;:x
tabengine inst ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

add1u=: 'add1 sub1'&set1u_like  NB. Add 1 / Subtract 1
addpc=: 'ad1p sb1p'&set1u_like  NB. Add 1% / Subtract 1%
by2pi=: 'pimv ptmv'&set1u_like  NB. times PI / times 2*PI
merge=: 'merg'&subitems_like  NB. Merge selected lines

hlpt=: 3 : 0
  NB. Help for TABULA
if. heldshift'' do.
  textview HELP_cal_ , CAL_cal_
  tabengine 'dash'
else. textview HELP
end.
)

showttinf=: 3 : 0
  NB. Show t-table info / edit t-table info
activateTabWithId 3
(refreshInfo shift updateInfo)''
)

anima=: 3 : 0
  NB. animate ⇧ start animation
tabenginex pickshift ;:'trav tra0'
)
