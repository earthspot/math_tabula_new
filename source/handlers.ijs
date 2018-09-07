	NB. tabby - handlers.ijs
'==================== [tabby] handlers.ijs ===================='
0 :0
Saturday 1 September 2018  18:04:43
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

tab_newtt_button=: newtt

tab_panel_select=: 3 : 0
  NB. handles click on row of t-table, or arrow-selection
sllog 'tab_panel_select panel_select syschild'
sllog 'sysparent syshandler sysevent'
for_row. >cutopen panel do.
z=. '{' takeafter row -. '@'
]lineNo=. ". '}' taketo z
]z=. dlb '}' takeafter z
]i=. {. I. '  ' E. z  NB. where qty ends
qty=. i{.z
com=. dlb i}. z
sval=. ' ' taketo qty
unit=. ' ' takeafter qty
sllog 'tab_panel_select lineNo sval unit com'
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
TOOL=: dtb 3 }. 13 {. TOOLID{TOOLHINT
NB. There should exist a "tool" for every tool name in TOOLHINT
sllog 'tab_g_mblup TOOLID TOOL'
try. (TOOL~)''
catch.
  if. tabengine 'QCMD ',TOOL do. 
end.
restoreFocusToInputField''
)

tab_default=: 3 : 0
instr=. instr4event sysevent
sllog 'tab_default instr sysevent syschild sysparent syshandler'
)

instr4event=: 3 : 'UL taketo UL takeafter y'
tools=: 3 : 'b4x firstwords 3}."1 TOOLHINT'

selectedLines=: 3 : 0
1 3  NB. TEST ONLY <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
NB. need to set L0 L1 also set of lines L012 (for add)
)

L0=: 1
L1=: 3

NB. toolbar pseudo-handlers...

0 :0
STRATEGY
Develop a working scheme for one or two *standard* handlers.
Once debugged, propagate to other handlers labelled: LIKE add1u
-
Don't define compound ancillaries yet like:
   ctsw=: [: confirm [: tabengine sw
-
heldshift gives better-looking code than (conjunction) shift.
)

savts=: savt shift savs  NB. Save ttable as Title / Save ttable as SAMPLE   
savt=: 3 : 0  NB. Save ttable as Title
  confirm tabengine 'savt'
)
savs=: 3 : 0  NB. Save ttable as SAMPLE
  confirm tabengine 'savs'
)

copal=: 3 : 0  NB. Copy entire ttable
wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

undoredo=: undo shift redo
undo=: 3 : 0
  confirm tabengine 'Undo'
)
redo=: 3 : 0
  confirm tabengine 'Redo'
)

additems=: 3 : 0  NB. Add all selected items
  confirm tabengine 'xxxx'
)

subitems=: 3 : 0  NB. Item 1 minus item 2 / Item 2 minus item 1
  confirm tabengine 'xxxx'
)

mulitems=: 3 : 0  NB. Multiply all selected items                           
  confirm tabengine 'xxxx'
)

divitems=: 3 : 0  NB. Divide item 1 by item 2 / Divide item 2 by item 1
  confirm tabengine 'xxxx'
)

powitems=: 3 : 0  NB. Item 1 ^ item 2 / Item 2 ^ item 1
  confirm tabengine 'xxxx'
)

stept=: 3 : 0  NB. Plot 0 to (value) / Plot (-value) to (+value)
  confirm tabengine 'xxxx'
)

replot=: 3 : 0  NB. Replot selected items only / Replot all items
  confirm tabengine 'xxxx'
)

movud=: 3 : 0  NB. Move line up / Move line down
  confirm tabengine 'xxxx'
)

movtb=: 3 : 0  NB. Move line to top / Move line to bottom
  confirm tabengine 'xxxx'
)

newsl=: 3 : 0  NB. New line
  confirm tabengine 'xxxx'
)

equal=: 3 : 0  NB. New line = selected line
  confirm tabengine 'xxxx'
)

repos=: 3 : 0  NB. Reset window pos+size / Reset original window pos+size
  confirm tabengine 'xxxx'
)

delit=: 3 : 0  NB. Delete line
  confirm tabengine 'xxxx'
)

hold=: 3 : 0  NB. Toggle Hold / Toggle Transient Hold
  confirm tabengine 'xxxx'
)

traca=: 3 : 0  NB. Toggle TRACE (action-verbs) / Toggle TRACI (Handler1)
  confirm tabengine 'xxxx'
)

iedit=: 3 : 0  NB. Edit item name / Edit item formula
  confirm tabengine 'xxxx'
)

setv0=: 3 : 0  NB. Set value to 0
  confirm tabengine sw 'zero (L0)'
)

set1u=: onep shift onen
onep=: 3 : 0  NB. Set value to 1
  confirm tabengine sw 'onep (L0)'
)
onen=: 3 : 0  NB. Set value to -1
  confirm tabengine sw 'onen (L0)'
)

add1u=: 3 : 0  NB. Add 1 / Subtract 1
if. heldshift'' do. confirm tabengine sw 'subv (L0) 1'
else.               confirm tabengine sw 'addv (L0) 1'
end.
)

addpc=: 3 : 0
if. heldshift'' do. confirm tabengine sw 'subp (L0) 1'
else.               confirm tabengine sw 'addp (L0) 1'
end.
)

by2pi=: 3 : 0
if. heldshift'' do. confirm tabengine sw 'ptmv (L0)'
else.               confirm tabengine sw 'pimv (L0)'
end.
)

siunt=: 3 : 0  NB. Convert to SI Units
  confirm tabengine sw 'cvsi (L0)'
)

merge=: 3 : 0  NB. Merge selected lines
  confirm tabengine 'xxxx'
)

hlpt=: 3 : 0  NB. Help for TABULA
  confirm tabengine 'xxxx'
)

showttinf=: 3 : 0  NB. Show ttable info / edit ttable info
  confirm tabengine 'xxxx'
)
