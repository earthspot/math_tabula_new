	NB. tabby - handlers.ijs
'==================== [tabby] handlers.ijs ===================='
0 :0
Wednesday 12 September 2018  17:22:44
-
Templates for handlers:
additems_like	>0 selected lines, ignores shift
set1u_like	1 selected line, restores selection
add1u_like	set1u_like but puts v=1 in CAL instruction
setv0_like	set1u_like but ignores shift
subitems_like	2 selected lines, order significant
undoredo_like	ignores line selection
)

coclass 'tabby'

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
confirm tabengine 'unit '; L0 ; xunit
showTtable''
restoreSelection''
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

tab_g_mmove=: 3 : 0
n=. 16  NB. (count) number of icons in a row
h=. w=. 32 NB. (px) height and width of an icon
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: z + <. X%w
fill_tools TOOLID  NB. hilite hovered tool
NB. confirm 13 }. TOOLID { TOOLHINT
confirm 3 }. TOOLID { TOOLHINT  NB. drop just the tool id
  NB. Don't let hilite stay on forever…
sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

hover_off=: 3 : 0
wd 'timer 0'
fill_tools''  NB. redraw toolbar with no hilite
)

tab_close=: window_close

tab_newtt_button=: newtt

tab_panel_select=: 3 : 0
  NB. handles click on row of t-table, or arrow-selection
sllog 'tab_panel_select panel_select'
L0=: 0{ ".panel_select
try. L1=: 1{ ".panel_select
catch. L1=: L0
end.
if. L0>0 do.
  setunits''
  setcalco scino tabengine 'VALU' ; L0
elseif. panel_select-:'_1' do.
  setcalco ''
elseif. L0=0 do.
  setcalco panel -. LF
elseif. do.
  smoutput '>>> tab_panel_select: no action defined'
end.
confirm details L0
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
restoreFocusToInputField''
)

tab_default=: 3 : 0
instr=. instr4event sysevent
sllog 'tab_default instr sysevent syschild sysparent syshandler'
)

instr4event=: 3 : 'UL taketo UL takeafter y'
tools=: 3 : 'b4x firstwords 3}."1 TOOLHINT'

NB. toolbar pseudo-handlers...

0 :0
STRATEGY
Develop a working scheme for one or two *standard* handlers.
Once debugged, propagate to other handlers labelled: LIKE add1u
)

NB. newtt=: newtt_like=: 'newt' ddefine
NB. confirm tabengine x
NB. showTtable''
NB. restoreFocusToInputField''
NB. )

newtt=: 'newt'&undoredo_like

copal=: 3 : 0
  NB. Copy entire ttable
wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

undoredo=: undoredo_like=: 'Undo Redo' ddefine
  NB. Undo / Redo -last action
confirm tabengine pickshift 2$ ;:x
showTtable''
restoreFocusToInputField''
)

savts=: 'savt savs'&undoredo_like

additems=: additems_like=: 'plus' ddefine
  NB. Add all selected items
confirm tabengine x,SP,panel_select
showTtable''
setSelection _
restoreFocusToInputField''
)

mulitems=: 'mult'&additems_like  NB. Multiply all selected items                           

subitems=: subitems_like=: 'minu' ddefine
  NB. item 1 - 2 / item 2 - 1
if. heldshift'' do. confirm tabengine x ; L1 ; L0
else.               confirm tabengine x ; L0 ; L1
end.
showTtable''
setSelection _
restoreFocusToInputField''
)

divitems=: 'divi'&subitems_like  NB. item 1÷2 / item 2÷1
powitems=: 'powe'&subitems_like  NB. item 1^2 / item 2^1

movud=: 3 : 0
  NB. Move line up / Move line down
if. heldshift'' do.
  confirm tabengine 'movd' ; L0
  showTtable''
  incSelection 1
else.
  confirm tabengine 'movu' ; L0
  showTtable''
  incSelection _1
end.
restoreFocusToInputField''
)

movtb=: 3 : 0
  NB. Move line to top / Move line to bottom
if. heldshift'' do.
  confirm tabengine 'movb' ; L0
  showTtable''
  setSelection _
else.
  confirm tabengine 'movt' ; L0
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

hold=: 3 : 0
  NB. Toggle Hold / Toggle Transient Hold
inst=. pickshift ;:'holm hold'
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
confirm tabengine x ; L0
showTtable''
restoreSelection''
restoreFocusToInputField''
)

siunt=: 'cvsi'&setv0_like

set1u=: set1u_like=: 'onep onen' ddefine
  NB. Set value to 1 / Set value to -1
inst=. pickshift 2$ ;:x
confirm tabengine inst ; L0
showTtable''
restoreSelection''
restoreFocusToInputField''
)

add1u=: add1u_like=: 'addv subv' ddefine
  NB. Add 1 to / Subtract 1 from single item
inst=. pickshift 2$ ;:x
confirm tabengine inst ; L0 ; 1
showTtable''
restoreSelection''
restoreFocusToInputField''
)

NB. add1u=: 'add1 sub1'&set1u_like
addpc=: 'addp subp'&add1u_like  NB. Add 1% / Subtract 1%
by2pi=: 'pimv ptmv'&set1u_like  NB. times PI / times 2*PI
merge=: 'merg'&subitems_like  NB. Merge selected lines

black=: 3 : 0
  NB. user-defined tool
smoutput '>>> black: not implemented'
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
  NB. Show ttable info / edit ttable info
ttinf''
activateTabWithId 3
)
