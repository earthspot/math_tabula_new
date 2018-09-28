	NB. tabby - handlers.ijs
'==================== [tabby] handlers.ijs ===================='
0 :0
Wednesday 19 September 2018  00:05:15
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
setv0_like	set1u_like but ignores shift
subitems_like	2 selected lines, order significant
undoredo_like	ignores line selection
)

coclass 'tabby'

childlike=: setv0_like

tab_newtt_button=: newtt
tab_opens_button=: openss
tab_opent_button=: 'open'&opentt
tab_appet_button=: 'appe'&opentt
tab_savex_button=: 'save'&undoredo_like
tab_saves_button=: 'savs'&undoredo_like
tab_savet_button=: 'savt'&undoredo_like
NB. tab_savea_button=: savea
NB. tab_stept_button=: stept
NB. tab_plotl_button=: notimp
NB. tab_plotb_button=: notimp
NB. tab_plotp_button=: notimp
NB. tab_plots_button=: notimp
tab_close_button=: tab_close
tab_print_button=: notimp
tab_quit_button=:  window_close
tab_undo_button=:  'Undo'&undoredo_like
tab_redo_button=:  'Redo'&undoredo_like
NB. tab_copal_button=: copal
NB. tab_label_button=: label
NB. tab_formu_button=: formu
tab_erasf_button=: 'orph'&childlike
tab_siunt_button=: siunt
tab_movet_button=: 'movt'&movtb
tab_moveu_button=: 'movu'&movud
tab_moved_button=: 'movd'&movud
tab_moveb_button=: 'movb'&movtb
NB. tab_newsl_button=: newsl
NB. tab_merge_button=: merge
NB. tab_delit_button=: delit
tab_dupit_button=: equal
tab_updex_button=: 'exch'&undoredo_like
NB. tab_updin_button=: updin
tab_repet_button=: 'Repe'&undoredo_like
tab_tthld_button=: 'hold'&hold  NB. transient hold
tab_thold_button=: 'holm'&hold  NB. mandatory hold
tab_hidel_button=: notimp
tab_unhid_button=: notimp
tab_ttabl_button=: clicktab bind 0
tab_conss_button=: clicktab bind 1
tab_funcs_button=: clicktab bind 2
tab_infor_button=: clicktab bind 3

NB. tab_additems_button=: notimp
NB. tab_subitems_button=: notimp
NB. tab_mulitems_button=: notimp
NB. tab_divitems_button=: notimp
NB. tab_powitems_button=: notimp

NB. tab_hlpt_button=: hlpt
tab_hinf_button=: updateInfo

tab_Vzero_button=: 'zero'&childlike
tab_Vonep_button=: 'onep'&childlike
tab_Vonen_button=: 'onen'&childlike
tab_Vabsv_button=: 'absv'&childlike
tab_Vdblv_button=: 'dblv'&childlike
tab_Vhlvv_button=: 'hlvv'&childlike
tab_Vintv_button=: 'intv'&childlike
tab_Vinvv_button=: 'invv'&childlike
tab_Vnegv_button=: 'negv'&childlike
tab_Vsqtv_button=: 'sqtv'&childlike
tab_Vsqrv_button=: 'sqrv'&childlike
tab_Vcbtv_button=: 'cbtv'&childlike
tab_Vcubv_button=: 'cubv'&childlike
tab_Vexpv_button=: 'expv'&childlike
tab_Vextv_button=: 'extv'&childlike
tab_Vetwv_button=: 'etwv'&childlike
tab_Vlnnv_button=: 'lnnv'&childlike
tab_Vltnv_button=: 'ltnv'&childlike
tab_Vltwv_button=: 'ltwv'&childlike
tab_Vpimv_button=: 'pimv'&childlike
tab_Vptmv_button=: 'ptmv'&childlike
tab_Vpidv_button=: 'pidv'&childlike
tab_Vptdv_button=: 'ptdv'&childlike
tab_Vunsc_button=: 'unsc'&childlike
tab_Vstpu_button=: 'stpu'&childlike
tab_Vstpd_button=: 'stpd'&childlike
tab_Vdeci_button=: 'deci'&childlike
tab_Vcent_button=: 'cent'&childlike
tab_Vmill_button=: 'mill'&childlike
tab_Vmicr_button=: 'micr'&childlike
tab_Vnano_button=: 'nano'&childlike
tab_Vpico_button=: 'pico'&childlike
tab_Vfemt_button=: 'femt'&childlike
tab_Vatto_button=: 'atto'&childlike
tab_Vzept_button=: 'zept'&childlike
tab_Vyoct_button=: 'yoct'&childlike
tab_Vdeca_button=: 'deca'&childlike
tab_Vhect_button=: 'hect'&childlike
tab_Vkilo_button=: 'kilo'&childlike
tab_Vmega_button=: 'mega'&childlike
tab_Vgiga_button=: 'giga'&childlike
tab_Vtera_button=: 'tera'&childlike
tab_Vpeta_button=: 'peta'&childlike
tab_Vexaa_button=: 'exaa'&childlike
tab_Vzett_button=: 'zett'&childlike
tab_Vyott_button=: 'yott'&childlike

tab_Lequl_button=: 'equl'&childlike
tab_Labsl_button=: 'absl'&childlike
tab_Ldbll_button=: 'dbll'&childlike
tab_Lhlvl_button=: 'hlvl'&childlike
tab_Lintl_button=: 'intl'&childlike
tab_Linvl_button=: 'invl'&childlike
tab_Lnegl_button=: 'negl'&childlike
tab_Lsqtl_button=: 'sqtl'&childlike
tab_Lsqrl_button=: 'sqrl'&childlike
tab_Lcbtl_button=: 'cbtl'&childlike
tab_Lcubl_button=: 'cubl'&childlike
tab_Lexpl_button=: 'expl'&childlike
tab_Lextl_button=: 'extl'&childlike
tab_Letwl_button=: 'etwl'&childlike
tab_Llnnl_button=: 'lnnl'&childlike
tab_Lltnl_button=: 'ltnl'&childlike
tab_Lltwl_button=: 'ltwl'&childlike
tab_Lpiml_button=: 'piml'&childlike
tab_Lptml_button=: 'ptml'&childlike
tab_Lpidl_button=: 'pidl'&childlike
tab_Lptdl_button=: 'ptdl'&childlike
tab_Lt1ml_button=: 't1ml'&childlike
tab_Lt2ml_button=: 't2ml'&childlike
tab_Lt3ml_button=: 't3ml'&childlike
tab_Lt1dl_button=: 't1dl'&childlike
tab_Lt2dl_button=: 't2dl'&childlike
tab_Lt3dl_button=: 't3dl'&childlike

NB. >>> WE NOW HAVE A doubleclick event for the toolbar...
tab_g_mbldbl=: empty

tab_calco_button=:           calcmd
tab_calco_changed=: empty
tab_calco_char=: empty
tab_cappend_button=:         newc
tab_casec_button=:           fillconsts
tab_casef_button=:           fillfuncts
tab_cons_button=:            newc
tab_cons_select=: empty
tab_fappend_button=:         newf
tab_func_button=:            newf
tab_func_select=: empty
tab_g_focus=: empty
tab_g_focuslost=: empty
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
confirm tabengine 'unit'; theItem ; xunit
showTtable''
restoreSelection''
setcalcovalue''
restoreFocusToInputField''
)

holdcons=: '=' ,~ ]

newc=: 3 : 0
cons newc y
:
if. 0=#x-.SP do.
  confirm '>>> No action: select a single line'
else.
  tabengine 'cons ',holdcons x
  showTtable''
  activateTabWithId 0
  setSelection _
  restoreFocusToInputField''
end.
)

newf=: 3 : 0
func newf y
:
if. 0=#x-.SP do.
  confirm '>>> No action: select a single line'
else.
  tabengine 'func ',x
  showTtable''
  activateTabWithId 0
  setSelection _
  restoreFocusToInputField''
end.
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
TOOLID=: z + <. X%w
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

tab_close=: window_close

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
selectValidItem''
sllog 'tab_panel_select y panel_select'
updatevaluebar''
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

newtt=: 'newt'&undoredo_like

copal=: 3 : 0
  NB. Copy entire ttable
wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

undoredo=: undoredo_like=: 'Undo Redo' ddefine
  NB. Undo / Redo -last action
confirm tabengine pickshift 2$ ;:x
showTtable''
updatevaluebar''
restoreFocusToInputField''
)

savts=: 'savt savs'&undoredo_like

additems=: additems_like=: 'plus' ddefine
  NB. Add all selected items
confirm tabengine x ; panel_select
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

mulitems=: 'mult'&additems_like  NB. Multiply all selected items                           

subitems=: subitems_like=: 'minu' ddefine
  NB. item 1 - 2 / item 2 - 1
if. heldshift'' do. confirm tabengine x ; line 1 0
else.               confirm tabengine x ; line 0 1
end.
showTtable''
setSelection _
restoreFocusToInputField''
)

divitems=: 'divi'&subitems_like  NB. item 1÷2 / item 2÷1
powitems=: 'powe'&subitems_like  NB. item 1^2 / item 2^1

movud=: 'movu' ddefine
  NB. Move line up / Move line down
theItem=. line 0
if. (heldshift'') or x-:'movd' do.
  confirm tabengine 'movd' ; theItem
  showTtable''
  incSelection 1
else.
  confirm tabengine 'movu' ; theItem
  showTtable''
  incSelection _1
end.
restoreFocusToInputField''
)

movtb=: 'movt' ddefine
  NB. Move line to top / Move line to bottom
theItem=. line 0
if. (heldshift'') or x-:'movb' do.
  confirm tabengine 'movb' ; theItem
  showTtable''
  setSelection _
else.
  confirm tabengine 'movt' ; theItem
  showTtable''
  setSelection 1
end.
restoreFocusToInputField''
)

newsl=: 3 : 0
  NB. New line
confirm tabengine 'newu /'  NB. CAL needs to be told '/' explicitly
showTtable''
setSelection _
restoreFocusToInputField''
)

equal=: 'equl'&additems_like  NB. New line = selected line
delit=: 'dele'&additems_like  NB. Delete selected lines

hold=: '' ddefine
  NB. Toggle Hold / Toggle Transient Hold
if. 0=#x do. inst=. pickshift ;:'holm hold'
else. inst=. 4{.x
end.
confirm tabengine inst,SP,panel_select
showTtable''
restoreSelection''
restoreFocusToInputField''
)

iedit=: 3 : 0
  NB. Edit item name / Edit item formula
if. heldshift'' do. formu'' else. label'' end.
)

setv0=: setv0_like=: 'zero' ddefine
  NB. Set value to 0
theItem=. line 0
confirm tabengine x ; theItem
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

siunt=: 'cvsi'&setv0_like

set1u=: set1u_like=: 'onep onen' ddefine
  NB. Set value to 1 / Set value to -1
theItem=. line 0
inst=. pickshift 2$ ;:x
confirm tabengine inst ; theItem
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

add1u=: add1u_like=: 'addv subv' ddefine
  NB. Add 1 to / Subtract 1 from single item
theItem=. line 0
inst=. pickshift 2$ ;:x
confirm tabengine inst ; theItem ; 1
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

addpc=: 'addp subp'&add1u_like  NB. Add 1% / Subtract 1%
by2pi=: 'pimv ptmv'&set1u_like  NB. times PI / times 2*PI
merge=: 'merg'&subitems_like  NB. Merge selected lines

black=: 3 : 0
  NB. user-defined tool
if. 'empty'-: 5!:5<'sllog' do. sllog=: sllog1=: smoutput@llog
else. sllog=: empty
end.
smoutput '>>> black: sllog is: ',5!:5<'sllog'
)

red=: 3 : 0
  NB. user-defined tool
smoutput '============================='
)

green=: 3 : 0
  NB. user-defined tool
smoutput ' '
NB. smoutput ('Undo'"_) shift ('Redo'"_)''
NB. smoutput (heldshift'') pick ;:'Undo Redo'
NB. smoutput sw 'heldshift=(heldshift _) heldalt=(heldalt _) sysmodifiers=(sysmodifiers)'
)

blue=: 3 : 0
  NB. user-defined tool
smoutput '>>> blue: not implemented'
)

hlpt=: 3 : 0
  NB. Help for TABULA
textview HELP
)

showttinf=: 3 : 0
  NB. Show t-table info / edit t-table info
activateTabWithId 3
(refreshInfo shift updateInfo)''
)