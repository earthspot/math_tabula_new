NB. init

require 'math/cal math/uu'

coclass 'tab'
require 'gl2'		NB. load gl2 definitions in jgl2 locale
coinsert'jgl2'		NB. allows use of gl2 verbs unlocalised

XYWH0=: 8 55 527 450		NB. Factory setting: form position
TRACH=: 0
TRACE=: 0
DEAF=: 0	NB. mousemove msg transient suppress
DEAFEN=: 20	NB. adjustable DEAF-setting

	NB. Selection of fonts for content display...
FONT1=: '"APL385 Unicode" 10'
FONT2=: '"Courier New" 10'
FONT3=: '"Courier" 10'
FONT=: FONT1	NB. the one actually used

NB. ========== MORE NOUNS ==========
BS=: '\'

NEEDS=: '=:',TAB,TAB,'empty'
UNSET=: '<UNSET>'
NB. util

NB. =========================================================
NB. beep=: wd@('beep'"_)
beep=: ]

NB. =========================================================
bit=: 4 : 'y{(>:y){.|. #: x'

NB. =========================================================
bnxy=: 3 : 0
NB. button X,Y for isigraph button# x
NB. multiply by 32 for pixel X,Y
(16|y),(y>:16)
)

NB. =========================================================
cb24=: 3 : 0
NB. convert (r g b)-->24-bit-color
+/y * |.256^i.3
)

NB. =========================================================
contains=: 4 : 0
NB. =1 iff x contains any of wds in: y
any (;:x) e. ;:y
)

NB. =========================================================
convicon=: 3 : 0
NB. convert char-represented pixel to rgb num
z=. 0 16bff0000 16bffff00 16b00ff00 16b0000ff 16b3c90fc 16b8e530f 16b9500fc 16ba9a9a9 16be6e6e6 16bffffff
NB.!!! cdb
z=. z - 16777215
z{~ '=rygbaMv.;' i. y -. LF
)

NB. =========================================================
dtblf=: #~ ([: +./\. [: -. (10 32{a.) e.~ ])

NB. =========================================================
drawico=: 3 : 0
NB. draws icon# y (0..31)
if. y -: '' do. y=. 1 end.
0 drawico y
:
NB. if x=1, draws icon depressed
wd 'psel tab;'
icn=. 'ico',nom=. toupper word1 y ffrom BNS
if. 0>nc <icn do.
  nb '>>> unknown icon: ' ; (brack y) ; icn return.
end.
pp=. ". icn
if. x do. NB. depressed button
  pp=. 33 |. pp
NB.   xx=. f2x }: pp
NB.   xx=. 1 |. _1 |."1 xx
NB.   pp=. LF,~ x2f xx
end.
y pix pp
)

NB. =========================================================
ext=: 4 : 'if. -. DT e. x do. x,DT,y else. x end.'

ffrom=: 4 : 0
NB. analogue of From '{' for use with f-lists
LF taketo (x>0) }. y }.~ x i.~ +/\y=LF
)

NB. =========================================================
inc1=: 3 : 'y{1 _1'

NB. =========================================================
NB. invalg=: wd@('psel tab; setinvalid g'"_)
invalg=: ]

NB. =========================================================
isnumeral=: 3 : 0
NB. y is a (str) valid scalar numeral
if. 2~: 3!:0 y do. 0 return. end. NB. must be 'literal'
a=. 0<#y  NB. not empty
NB. b=. *./y e. n9,DT NB. only contains digits and DT
v=. _". y  NB. critical evaluation
c=. 0=#$v  NB. eval'd no is scalar
d=. -.NaN v  NB. v is valid numeral(s)
f=. -.isInf v  NB. v is not _ or __
NB. i=. *./y e. n9 NB. only contains digits
a *. c *. d *. f
)

NB. =========================================================
isnumeric=: 3 : 0
NB. y evaluates to a number
try. isNo VALUE=: ".y catch. 0 end.
)

NB. =========================================================
isnumvec=: 3 : 0
NB. y is a (str) valid vector numeral 1<# ".y
NB. c/f isnumeral
if. 2~: 3!:0 y do. 0 return. end. NB. must be 'literal'
if. 0=#y do. 0 return. end.  NB. not empty
try. v=. ". y  NB. evaluation as J noun expr
catch. 0 return. NB. syntactically correct
end.
c=. 1<#v  NB. eval'd no is vec, #>1
d=. -.NaN v  NB. v is valid numeral(s)
c *. d
)

NB. =========================================================
isunits=: 3 : 0
NB. Bool: y is valid units, set UNITS
-. '??' -: >{.convert UNITS=: deb y
)

NB. =========================================================
isvalunits=: 3 : 0
NB. Bool: y is value + units, set UNITS
NB. c/f isunits
if. 1<#z=. _". y do. NB. converts to 2 nos or more
  if. (_=VALUE=: {.z) +. (_~:1{z) do. 0 return. end.
else. 0 return.
end.
'y r'=. 2{. QT cut y
RIDER=: dlb r
if. 0=#UNITS=: deb SP dropto y do. UNITS=: '/' end.
-. '??' -: >{.convert UNITS
)

isverb=: 3 = [: 4!:0 <

NB. =========================================================
listfmt=: 3 : 0
f=. [: < LF , dtb
if. 1=#$y do.
  r=. f ;._2 y,LF
else.
  r=. f "1 y
end.
}.; r
)

NB. =========================================================
nr=: 3 : 0
NB. (lit) numerical representation of (num): y
if. 1>|y do.  z=. 21j17 ": y
elseif. 1e10 <: |y do. z=. 21j7 ": y
elseif. do.  z=. ": y
end.
z rplc '_' ; '-'
)

NB. =========================================================
pix=: 4 : 0
NB. draw pixels of nico: y for button#: x -- 0..31
'X Y'=. 32 * bnxy x
glpixels X,Y, 32 32 ,, convicon y
)

NB. =========================================================
NB. work around bug in JQt 26 where sysmodifiers may be empty
sysmods=: 3 : 0
{. 0 ". sysmodifiers,' 1'
)

NB. =========================================================
trunc=: i. {. [
truncl=: i: {. [
truncmax=: 4 : 'if. x<$y do. x{.y else. y end.'
truncn=: 3 : 'if. ''0123456789'' e.~ {:y do. }:y else. y end.'
truncnn=: truncn^:_

NB. =========================================================
win=: 3 : 0
NB. convert path for Windows
y
if. IFWIN32 +. IFWINNT do. y rplc SL ; BS end.
)
NB. evemt

tab_close=: quit
tab_default=: dofn
tab_run=: start

conss=: setshow@(1"_)
tab_cappend_button=: newc
tab_casec_button=: empty
tab_cons_button=: newc
tab_cons_select=: empty
tab_searchc_button=: fillconsts

funcs=: setshow@(2"_)
tab_casef_button=: empty
tab_fappend_button=: newf
tab_func_button=: newf
tab_func_select=: empty
tab_searchf_button=: fillfuncts

tab_g_focus=: empty
tab_g_focuslost=: empty
tab_g_mbldown=: click@(1"_)
tab_g_mblup=: click@(0"_)
tab_g_mmove=: mousemove
tab_tabs_button=: clicktab

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
putsb1 fn NB. gui ctl id into statusbar
if. isverb fn do.
  sess 'dofn: execute verb: ',fn
  fn 128!:2 ''
else.
  confirm z=. '>>> Not found: ',fn
end.
)

NB. =========================================================
Handler=: Handler1

Handler1=: 3 : 0
NB. DIAGNOSTICS FOR HANDLER DEVT
if. -. TRACH do. return. end.
sessnb=. 3 : 'smoutput nb ''Handler1:'' ; y'
EMPTY
select. y
case. 'mousemove' do. NB. no-op
case. 'calcmd' do.
  smoutput llog 'calco panel_select'
case. do.
  sessnb (brack y) ; 'syschild:' ; syschild
end.
)

NB. =========================================================
tab_g_paint=: 3 : 0
0 drawico&>i.32
)

HELP=: 0 : 0
This is a page of info about TABULA.
(...Work In Progress)

++ For CAL-commands, click "query-cog" icon.

++ Typed-in mini-commands:
   (Enter) or: [	move selection down
   ]			move selection up
   .			undo
   ..			redo
   ;			repeat last action
   /text		CAL-command

++ To plot a ttable:
   (a suitable test-ttable sample is "plot_test")
1. Select the item to become the x-axis.
2. Give the item a minimum or maximum value to be plotted
       eg. _10 or 10
3. Click "steps" tool
   or pick menu: File > Plot 0 to (value)
   --The plot window will appear, showing a plot of
     the LAST item in the ttable.
3. Reselect the lines you prefer to plot,
   then click the "replot" icon in the toolbar,
   or pick menu: File > Line Chart [Bar Chart ...]

++ To alter the toolbar buttons, edit: tabtools.ijs
   NB. if an icon is red+blue, it reverses its
       function when Shift is held.
)
NB. main

NB. ========== ADVERBS ==========

NB. ========== CONJUNCTIONS ==========

shift=: 2 : 0
NB. choose handler: u | v depending on shiftkey
NB. use like this: myhnd=: testcurs shift opencurswd
if. 1=sysmods$0 do. v y else. u y end.
)

NB. ========== VERBS ==========

about=: 3 : 0
NB. retrieve fixed-info on 1-char commands
wd 'psel tab; set info text *' , tabengine 'ABOU'
setshow 3
confirm tabengine 'ABTI'
)

NB. =========================================================
add1u=: 3 : 0
Handler 'add1u' NB. tool: add 1 / subtract 1
if. heldshift'' do. calcmd '-1' else. calcmd '+1' end.
)

NB. =========================================================
additems=: 3 : 0
NB. add 2 or more selected items
Handler 'additems'
if. -.setL 1 do. return. end.
NB. tabenginex nb 'plus' ; L0 ; L1
4 tabenginex 'plus' ; panel_select
)

NB. =========================================================
addpc=: 3 : 0
Handler 'addpc' NB. tool: add 1% / subtract 1%
if. heldshift'' do. calcmd '-1%' else. calcmd '+1%' end.
)

NB. =========================================================
appet=: 'Append'&opent

NB. =========================================================
by2pi=: 3 : 0
Handler 'by2pi' NB. tool: * PI / * PI2
NB. !!! unlike other increments, shift is not the reverse...
if. heldshift'' do. calcmd '*PI2' else. calcmd '*PI' end.
)

NB. =========================================================
calcmd=: 3 : 0
Handler 'calcmd' NB. compose tabengine instructions

0 setL 0 NB. ignore response: only want valid global L0
NB. Accept y-arg to emulate entering into: calco
NB. calco -is global: the general input buffer string

if. 0<#y do. calco=: ":y end.
c0=. {. calco=: dltb calco

NB. ---------------------------------------------------------
NB. Whole-calco commands...
select. calco
fcase. '' do. sess 'calcmd: Move sel down'
case. ,'[' do. sess 'calcmd: Move sel down'
  movsel 0 return.
case. ,']' do. sess 'calcmd: Move sel up'
  movsel 1 return.
case. ,'.' do. sess 'calcmd: Undo'
  undo '' return.
case. '..' do. sess 'calcmd: Redo'
  redo '' return.
case. ,';' do. sess 'calcmd: Repeat last'
  tabenginex 'Repe' return.-
end.

NB. ---------------------------------------------------------
NB. c0-identified commands...
select. c0 NB. c0 is SCALAR CHAR
case. '/' do. sess 'calcmd: Engine cmd'
  tabenginex }.calco return.
case. '=' do. sess 'calcmd: Formula'
  tabenginex nb 'fmla' ; L0 ; }.calco return.
end.

NB. ---------------------------------------------------------
NB. Applying only to line 0...
if. 0=L0 do. tabenginex 'titl' ; calco return. end.

NB. ---------------------------------------------------------
NB. ALL ELSE needs an item selected...
if. -.setL 0 do. return. end.

NB. Globals filled by: isunits, isvalunits...
VALUE=: UNDEFINED [ UNITS=: '??' [ RIDER=: ''
if. ']['-: 2{._1|.calco do. sess 'calcmd: units (forced)'
  if. isunits z=. }.}:calco do.
    tabenginex nb 'unit' ; L0 ; UNITS
  else. confirm '>>> bad units:' ; z
  end.
elseif. c0=QT do. sess 'calcmd: label (forced)'
  tabenginex nb 'name' ; L0 ; }.calco
elseif. c0 e. '+-*/^' do. sess 'calcmd: increment'
  increment calco
elseif. isnumeric calco do. sess 'calcmd: numeric'
  tabenginex nb 'valu' ; L0 ; VALUE
elseif. isunits calco do. sess 'calcmd: units'
  tabenginex nb 'unit' ; L0 ; UNITS
  setunits 0
elseif. isvalunits calco do. sess 'calcmd: value+units[+rider]'
  if. 0<#RIDER do.
    tabengine nb 'name' ; L0 ; RIDER
  end.
  setunits 0 [ tabengine nb 'unit' ; L0 ; UNITS
  tabenginex nb 'valu' ; L0 ; VALUE
elseif. isnumvec calco do. sess 'calcmd: plot instruction'
  invalplot'' NB. discard PLOT* caches
  plotx calco rplc '-' ; '_'
NB. -to make '-' stick to its atom & not negate the lot
elseif. do. sess 'calcmd: label (default)'
  tabenginex nb 'name' ; L0 ; calco
end.
)

NB. =========================================================
clearunits=: 3 : 0
NB. clear contents of units combo
wd 'psel tab; set xunit items ""'
)

NB. =========================================================
click=: 3 : 0
NB. execute the isigraph button-handler (CALLBK)
NB. CALLBK is set continuously by handler: mousemove
NB. It gets the handler name associated with the tool
if. y=1 do. NB. mouse down
  1 drawico BNDOWN=: BN
  mousemove'' NB. repaints the toolbar
else. NB. mouse up
  0 drawico BNDOWN NB. not BN in case mouse elsewhere
  mousemove'' NB. repaints the toolbar
  if. BNDOWN=BN do.
NB.     sess 'apply: ',CALLBK
    CALLBK apply''
  end.
NB.   play 'click1'
end.
)

NB. =========================================================
clickpanel=: 3 : 0
Handler 'clickpanel' NB. select a line in: panel
0 setL 0
if. L0>0 do.
  setunits 0  NB. for dropdown: xunit
NB. edit the nominal value of the item...
  setcalco scino tabengine 'VALU' ; L0
elseif. panel_select-:'' do.
  setcalco ''
elseif. L0=0 do.
  selline 0
  setcalco >{.f2b panel NB. 1st line of selection buffer
elseif. do.
  smoutput 'clickpanel: no action defined'
end.
confirm details L0
)

NB. =========================================================
clicktab=: 3 : 0
Handler 'clicktab' NB. shows selected tab
n=. ".tabs_select NB. (int)# of the tab clicked
select. n NB. refill only for these tabs:
case. 1 do. fillconsts''
case. 2 do. fillfuncts''
case. 3 do. ttinf''
end.
setshow n
inputfocus''
)

NB. =========================================================
confirm=: 3 : 0
0 confirm y
:
NB. standard output message: y to end-user
if. isBoxed y do. y=. nb y end.
putsb msg=: y
msg [ maybeep y  NB. can use: speak instead
DEAF=: DEAFEN  NB. suppress mousemove msg
)

NB. =========================================================
convert=: convert_uu_

NB. =========================================================
copal=: 3 : 0
Handler 'copal' NB. toolbar
wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

NB. =========================================================
delit=: 3 : 0
Handler 'delit' NB. delete selected line(s)
invalplot'' NB. discard PLOT* caches
1 tabenginex 'dele' ; panel_select
)

NB. =========================================================
depen=: not_implemented

NB. =========================================================
details=: 3 : 0
NB. compose details of line: y
if. y=0 do. 'To update title: overtype and Enter' return. end.
nb (CO,~":y) ; (tabengine 'FMLA' ; y)
)

NB. =========================================================
divitems=: 3 : 0
Handler 'divitems'
if. -.setL 1 do. return. end.
4 tabenginex 'divi' ; L0 ; L1
)

NB. =========================================================
dupit=: 'dupl'&funline

NB. =========================================================
eduu=: eduuc shift eduuf

NB. =========================================================
eduuc=: 3 : 0
NB. edit UUC.ijs
Handler 'eduuc'
open 'math/uu/uuc'
)

NB. =========================================================
eduuf=: 3 : 0
NB. edit UUF.ijs
Handler 'eduuf'
open 'math/uu/uuf'
)

NB. =========================================================
equal=: 3 : 0
Handler 'equal'
('equl-'&funline)y
)

NB. =========================================================
erasf=: 'orph'&funline

NB. =========================================================
fillconsts=: 3 : 0
Handler 'fillconsts' NB. fill consts pane
set_ucase casec-: ,'0'
wd 'psel tab; set cons items *',x2f uurowsc searchc
)

NB. =========================================================
fillfuncts=: 3 : 0
Handler 'fillfuncts' NB. fill functs pane
set_ucase casef-: ,'0'
wd 'psel tab; set func items *',x2f uurowsf searchf
)

NB. =========================================================
flags=: 3 : 0
NB. literal flags in place of numeric x for tabenginex
if. isNo y do. y return. end.
NB. -c clear calco
NB. -l last line selected
NB. -s clear all selections
#. 'lcs' e. y
)

NB. =========================================================
formu=: 3 : 0
Handler 'formu' NB. fmla --> calco (for editing)
if. -.setL 0 do. return. end.
if. 0=#f=. (tabengine 'FMLA';L0) do.
  confirm '>>> item' ; L0 ; 'has no formula'
else.
  setcalco '=',f
end.
)

NB. =========================================================
funline=: 3 : 0
NB. To gen handler: funline bind '<phrase>'
NB. Cannot use tabenginex raw
NB. because it needs to incorporate item#: L0
'cpyf' funline y NB. -if no x <cmd> is given
:
NB. x is 4-char cmd, with opt trailing flag
NB. y (opt) is an expression to apply
NB. -- y-:'' where no expression needed
Handler 'funline' NB. handler-generator
if. -.setL 0 do. return. end.
tabenginex (4{.x) ; L0 ; y
NB. derived lines have y==<expression>
NB. so unless y-:'' select the last line...
if. '-'={:x do. selline nitems'' end.
)

NB. =========================================================
goodfn=: 3 : 0
z=. 'abcdefghijklmnopqrstuvwxyz'
z=. '0123456789',UL,z,toupper z NB. valid chars
z=. UL (I. -. y e. z)}y
z=. (#~ (+. (1: |. (> </\)))@(UL&~:))z
)

NB. =========================================================
heldalt=: 3 : '3 bit~ sysmods$0'
heldcmnd=: 3 : '2 bit~ sysmods$0'
heldctrl=: 3 : '1 bit~ sysmods$0'
heldshift=: 3 : '0 bit~ sysmods$0'

NB. =========================================================
hidel=: 3 : 0
Handler 'hidel'
if. -.setL 1 do. return. end.
5 tabenginex 'hide' ; panel_select
)

NB. =========================================================
hinf=: ttinf
hint=: [: confirm '=== ' , ]

NB. =========================================================
hlpa=: 3 : 0
Handler 'hlpa' NB. retrieve fixed-info on cal-engine
wd 'psel tab; set info text *' , tabengine 'ABOU'
setshow 3
)

NB. =========================================================
hlpc=: 3 : 0
Handler 'hlpc' NB. retrieve fixed-info on engine commands
wd 'psel tab; set info text *' , tabengine 'QUER'
setshow 3
)

hlpca=: hlpc shift hlpa

NB. =========================================================
hlpt=: 3 : 0
Handler 'hlpt' NB. retrieve fixed-info on TABULA HELP
if. heldshift'' do. lob'' return. end.
wd 'psel tab; set info text *',HELP
setshow 3
)

hold1=: tthld shift thold

NB. =========================================================
hold=: 3 : 0
Handler 'hold' NB. toggle (transient) hold to ALL selected items
if. 0=#panel_select do.
  confirm '>>> No action: needs 1 or more selected lines'
else.
  for_L. ps=. ,". panel_select do.
    panel_select=: ,":L
    hold1''
  end.
  sellines ps
  panel_select=: ,":ps
end.
)

holdcons=: '!' ,~ ]

NB. =========================================================
iedit=: 3 : 0
Handler 'iedit' NB. tool: edit name / formula
if. heldshift'' do. formu'' else. label'' end.
)

NB. =========================================================
ijsstr=: 3 : 0
NB. !!! not yet
return.
NB. Open a new IJS window with: (str)y
cocurrent 'jijs'
newijs'' NB. create a new IJS window
wd 'set e *',,y NB. and fill it with the text in y
n=. {:conl 1
save__n ''
)

NB. =========================================================
increment=: 3 : 0
NB. treat y (from calco) as an incremental spec
NB. serves: calcmd
NB. tabenginex =. smoutput
sess nb 'increment:' ; y
y=. dtb ,y
if. y-:,'+' do. tabenginex nb 'addv' ; L0 ; 1 return. end.
if. y-:,'-' do. tabenginex nb 'subv' ; L0 ; 1 return. end.
'c0 pc yval'=. ({.y) ; (('%'={:y){'vp') ; '%' -.~ }.y
cmd=. pc ,~ > ('+-*/^' i. c0) { ;:'add sub mul div rto'
if. isnumeric yval do.
  tabenginex nb cmd ; L0 ; VALUE
else.
  confirm '>>> bad command:' ; y
end.
)

infor=: showttinf

NB. =========================================================
inputfocus=: 3 : 0
Handler 'inputfocus' NB. give calco the focus
wd 'psel tab; pactive'
select. TABNDX
case. 0 do. wd 'psel tab; setfocus calco'
case. 1 do. wd 'psel tab; setfocus searchc'
case. 2 do. wd 'psel tab; setfocus searchf'
case. 3 do. NB. no-op
end.
EMPTY
)

NB. =========================================================
invalplot=: 3 : 0
NB. Invalidate the PLOT* caches
erase listnameswithprefix 'PLOT'
)

isInf=: _ e. |
iscmd=: 3 : 'tabengine ''QCMD '',y'
iscmd1=: 3 : '{. (y e. ''.:<>\!I'') *. (1=#y)'

NB. =========================================================
label=: 3 : 0
Handler 'label' NB. label --> calco (for editing)
if. -.setL 0 do. return. end.
setcalco QT,(tabengine 'NAME' ; L0)
)

lob=: 3 : 0
Handler 'lob'
load '~user/lobrow.ijs'
)

NB. =========================================================
maybeep=: 3 : 0
NB. decides if message: y needs beep
if. -.isLit y do. return. end.
if. '>>>' -: 3{.y do. beep''
elseif. y contains 'bad incompatible' do. beep''
end.
)

NB. =========================================================
merge=: 3 : 0
Handler 'merge' NB. merge 2 lines
if. -.setL 1 do. return. end.
NB. Shift held: setL swaps L0 L1
tabenginex 'merg' ; L0 ; L1
selline (L0,L1) {~ heldshift''
)

NB. =========================================================
mousemove=: 3 : 0
Handler 'mousemove' NB. tracks mouse
NB. Mouse-hover over: g isigraph -repeatedly updates:
NB.  sysdata -with x,y co-ords in: g, & modkeys
NB. Info in sysdata and BNS (buttons definition) -->
NB.  --BN # of the button under mouse, 0 to 31
NB.  --CALLBK handler to be run if mouse clicked
NB.  also writes a tool hint in status bar
'x y shifton'=. 0 1 7 { z=. ".sysdata
br=. <. y % 32 NB. button row: 0..1
bc=. <. x % 32 NB. button col: 0..16
BN=: (16*br)+bc NB. button number 0..31
if. -. BN e. i.32 do. NB. mouse has left toolbar...
  repaintg'' NB. to pop any buttons back up
  CALLBK=: '' return.
end.
CALLBK=: tolower word1 line=. BN ffrom BNS
z=. dltb > shifton{ 2 $ SL cut words line
if. 0=#z do. z=. nb 'Undefined BNS line:' ; BN end.
NB. suppress putsb-message for DEAF more cycles...
if. DEAF>0 do. DEAF=: DEAF-1 else. putsb z end.
putsb1 ":BN
putsb2 CALLBK
)

NB. =========================================================
movit=: 3 : 0
Handler 'movit' NB. Move selected line (L0) down 1 line
NB. c/f mvitu
if. L0>:MAXLINE do.
  confirm '>>> No action: last line reached'
  return.
end.
invalplot'' NB. discard PLOT* caches
'movd' funline L0
selline L0+1
)

NB. =========================================================
movsel=: 3 : 0
NB. move line selection down /up(y=1)
last=. {:items=. tabengine 'ITMS'
i=. L0 + y{1 _1
if. i>last do. i=. 1 end.
if. i<1 do. i=. last end.
selline i
)

movud=: mvitu shift movit

NB. =========================================================
mulitems=: 3 : 0
Handler 'mulitems'
if. -.setL 1 do. return. end.
NB. tabenginex 'mult' ; L0 ; L1
4 tabenginex 'mult' ; panel_select NB. accepts multiple lines
)

NB. =========================================================
mvitu=: 3 : 0
Handler 'mvitu' NB. Move selected line (L0) up 1 line
NB. c/f movit
if. L0<:1 do.
  confirm '>>> No action: first line reached'
  return.
end.
invalplot'' NB. discard PLOT* caches
'movu' funline L0
selline L0-1
)

needsHnd=: 3 : 'smoutput sysevent,NEEDS'

NB. =========================================================
newc=: 3 : 0
Handler 'newc' NB. make a new Const line
cons newc y NB. cons is selection buffer
:
if. 0=#x-.SP do.
  confirm '>>> No action: select a single line'
else.
  4 tabenginex 'cons' ; holdcons x
end.
)

NB. =========================================================
newf=: 3 : 0
func newf y NB. func is selection buffer
:
Handler 'newf' NB. make a new Funct line
if. 0=#x-.SP do.
  confirm '>>> No action: select a single line'
else.
  4 tabenginex 'func' ; x
end.
)

NB. =========================================================
newkg=: 4&tabenginex@('newu kg'"_)
newlc=: 4&tabenginex@('newu c'"_)
newlm=: 4&tabenginex@('newu m'"_)
newls=: 4&tabenginex@('newu s'"_)
newmo=: not_implemented

NB. =========================================================
newsl=: 3 : 0
Handler 'newsl'
4 tabenginex 'newu /'
)

newst=: 4&tabenginex@('newu *'"_)

NB. =========================================================
newtt=: 3 : 0
Handler 'newtt' NB. New ttable
if. -. preload'' do. return. end.
0 ttinf'' NB. clear the info display
1 tabenginex 'newt'
clearunits''
immexj 'inputfocus_tab_ 0'
)

NB. =========================================================
nitems=: 3 : '+/LF=tabengine''CTBU'''
none=: not_implemented

not_implemented=: 3 : 0
NB. assign to unimplemented handler
'form id control'=. UL cut sysevent
smoutput id,'=:',TAB,'not_implemented'
empty confirm '>>> NOT IMPLEMENTED: ',id
)

NB. =========================================================
opens=: 3 : 0
'$$' opens ''
:
Handler 'opens' NB. Handler generator
NB. load a sample ttable
NB. This is a cut-down version of: opent
if. -. preload'' do. return. end.
1 tabenginex 'open' ; x
clearunits''
ttinf''
immexj 'inputfocus_tab_ 0'
)

NB. =========================================================
opent=: 3 : 0
'Open' opent y
:
NB. x is: 'Open' | 'Append'
Handler 'opent' NB. service handlers: opent, appet
NB. If shift held, open SAMPLE instead...
if. heldshift'' do. opens'' return. end.
if. -. preload'' do. return. end.
cmd=. 4{. lowx=. tolower x
mytitle=. nb 'Choose a ttable to' ; lowx ; '...'
mydir=. TPATH_TTABLES
nom=. wd nb 'mb open' ; (dquote mytitle) ; (dquote mydir)
NB. At present we use filename-only: nom
NB. and assume all ttables reside in folder: mydir
nom=. nom rplc BS ; SL
if. 0=#nom do.
  confirm '>>>' ; x ; '...cancelled'
else.
  1 tabenginex cmd ; fprefix nom
  clearunits''
  ttinf''
  immexj 'inputfocus_tab_ 0'
end.
)

paneL0=: 3 : 'L0=: {. 0 ". panel_select'

NB. =========================================================
pickunits=: 3 : 0
Handler 'pickunits' NB. service the xunit combo
setunits 1
)

NB. =========================================================
play=: 3 : '2!:1 ''afplay '',TPATH_TABULA,wav y'
playerror=: play@('error'"_)
playwarning=: play@('warning'"_)

NB. =========================================================
plot=: 3 : 0
NB. call plotting fn with data returned by: cal
NB. (This fn originally came from: cal)
caller_jwplot_=. coname''
'' plot_jwplot_ y
:
caller_jwplot_=. coname''
x plot_jwplot_ y
inputfocus''
)

plotb=: 3 : 'replot PLOTF=:''bar'''
plotl=: 3 : 'replot PLOTF=:''line'''
plotp=: 3 : 'replot PLOTF=:''pie'''
plots=: 3 : 'replot PLOTF=:''surface'''

NB. =========================================================
plotx=: 3 : 0
NB. generate data for plot from input: y
NB. y is STRING: (y) is numvec
NB. to allow short string arg --> long num vec
NB. e.g. 'i.10000'
if. -.setL 0 do. return. end.
PLOTX=: L0 NB. the item with the x-axis points
PLOT=: tabengine 'PLOT' ; PLOTX ; y
undo'' NB. restore prior ttable values
NB. Y=. (0,PLOTX) -.~ i.#PLOT NB. ALL y-axis item(s)
Y=. {: i.#PLOT   NB. LAST y-axis item only
PLOTY=: Y default 'PLOTY' NB. same as prev -or Y
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY NB. indicate which have been plotted
)

NB. =========================================================
powitems=: 3 : 0
Handler 'powitems'
if. -.setL 1 do. return. end.
4 tabenginex 'powe' ; L0 ; L1
)

NB. =========================================================
preload=: 3 : 0
NB. called by verbs which invalidate old table
NB. heldalt'' skips the DIRTY check...
if. (tabengine 'DIRT') and -.heldalt'' do.
  par=. 'Save current ttable?'
  msg=. 'Ttable: ',tabengine 'TITL'
  msg=. msg,LF,'has unsaved structural changes.'
  msg=. msg,LF,'OK to continue (and lose the changes)?'
  if. wdquery par;msg do.
    confirm '>>> New/load ttable -cancelled'
    0 return.
  end.
end.
invalplot'' NB. discard PLOT* caches
1 return.
)

NB. =========================================================
print=: 3 : 0
NB. Print the ttable
NB. (For now: simply create an IJS window)
z=. tabengine 'TFIL'
z=. z,LF,LF,LF
z=. z,tabengine 'CTBU'
ijsstr z
)

NB. =========================================================
putpanel=: 3 : 0
wd 'psel tab;set panel items *',listfmt y
MAXLINE=: +/LF=y
)

NB. =========================================================
putsb=: 'status'&putsbx
putsb1=: 'sinf1'&putsbx
putsb2=: 'sinf2'&putsbx

putsbx=: 4 : 0
NB. generator for: putsb putsb1 putsb2
wd 'set sbar setlabel ',x,' ',dquote ":,y
)

NB. =========================================================
qs=: 3 : 0
NB. query the current panel selection
smoutput llog 'L0 L1 panel_select'
)

NB. =========================================================
quit=: 3 : 0
Handler 'quit' NB. Orderly shutdown after housekeeping
if. -. preload'' do. return. end.
winpos 1 NB. write out window posn,size
RUNTIME_z_=: 0 default 'RUNTIME_z_'
NB. if. RUNTIME or heldalt'' do. exit'' else. window_close'' end.
if. RUNTIME or heldalt'' do.
  smoutput 'RUNTIME, heldalt: ',":RUNTIME,heldalt''
end.
window_close''
)

redo=: tabenginex@('Redo'"_)

NB. =========================================================
refresh=: 3 : 0
0 refresh y  NB. y is always ignored
:
NB. x (bit-int) sets finishing state of display
x=. flags x NB. flags: lit --> bit-coded int

putpanel tabengine 'CTBU'

if. x bit 0 do. NB. clear panel selections
  sellinex'' NB. c/f selline
else. NB. restore panel selections
  if. L0>0 do. wd nb 'set panel select' ; L0 end.
  if. L1>0 do. wd nb 'set panel select' ; L1 end.
end.
if.-. x bit 1 do. NB. clear calco
  wd 'set calco text'
end.
if. x bit 2 do.  NB. select last line
  selline nitems''         NB. sets L0 for next stmt...
  setunits 0  NB. update units combo
  inputfocus''
end.
)

NB. =========================================================
repaintg=: 3 : 0
NB. refresh the toolbar
invalg''
tab_g_paint''
)

NB. =========================================================
repet=: tabenginex@('Repe'"_)

NB. =========================================================
replot=: 3 : 0
NB. plot existing PLOT again, using selections
Handler 'replot'
if. 0~:nc<'PLOT' do.
  confirm '>>> No action: no plot steps specified yet'
  return.
end.
if. heldshift'' do. NB. plot all items
  PLOTY=: (0,PLOTX) -.~ i.#PLOT
else.NB. Update PLOTY from selections only if any made
  Y=. (0,PLOTX) -.~ ".panel_select
  if. 0<#Y do. PLOTY=: Y end.
end.
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY NB. indicate which have been plotted
)

repos=: 3 : 0
Handler 'repos' NB. reset form pos+size to value in XYWH
if. (y-:0) or (heldshift'') do. XYWH=: XYWH0 end.
wd nb 'psel tab; pmove' ; XYWH
)

restart=: 3 : 0
Handler 'restart' NB. warm-start TABULA, eg after editing UUC or tabtools
start_uu_''
start 1  NB. start detects 0<#y
)

NB. =========================================================
savea=: 3 : 0
Handler 'savea' NB. service the "save ttable as..." ctl
NB. NEEDS...
NB. trial save-name setup in field
mytitle=. 'Save ttable as...'
mydir=. TPATH_TTABLES
nom=. wd nb 'mb save' ; (dquote mytitle) ; (dquote mydir)
if. 0=#nom do.
  confirm '>>> Save As... cancelled'
else.
  1 tabenginex 'save' ; fprefix nom
end.
)

NB. =========================================================
saves=: 3 : 0
NB. save ttable as: SAMPLE
tabenginex 'save $$'
)

NB. =========================================================
savet=: 3 : 0
NB. save ttable under current title
NB. Use savea if title undefined
Handler 'savet'
if. (title'')-:tabengine'TITU' do. savea'' return. end.
tabenginex 'save' ; goodfn title''
)

savex=: 3 : 0
NB. save ttable under existing filename
NB. Use savea if file undefined
if. (ttname'')-:tabengine'TFLU' do. savea'' return. end.
tabenginex 'save' NB. uses: file_cal_ anyway
)

savts=: savet shift saves

scino=: scino_uu_

NB. =========================================================
selline=: 3 : 0
NB. select single line: y
wd 'psel tab; set panel select -1'
panel_select=: ,":L0=: {.y
L1=: 0 NB. to simulate clicking on the item y
wd nb 'psel tab; set panel select' ; L0
)

sellines=: 3 : 0
NB. select multiple lines: y
NB. ASSUMES all item#s are valid.
wd 'psel tab; set panel select -1'
panel_select=: ":y
'L0 L1'=: 2 {. y
NB. ...just a formality: the work is done by:
for_i. y do.
  wd nb 'set panel select' ; i
end.
)

sellinex=: 3 : 0
NB. clear line selections
wd 'psel tab; set panel select -1'
panel_select=: ''
L1=: L0=: 0
)

sess=: 3 : 'if. TRACE do. smoutput y end.'

NB. =========================================================
setL=: 3 : 0
1 setL y
:
NB. set L0 L1 from: panel_select
NB. setL 0 -only L0>0 needed
NB. setL 1 -both L0>0 and L1>0 needed
NB. returns 1 iff condition satisfied
NB. eg: if. -.setL 1 do. return. end.
z=. 0 ". panel_select,' 0 0'
if. (y>:1) *. heldshift'' do.
  'L1 L0'=: 2{.z
else.
  'L0 L1'=: 2{.z
end.
if. x-:0 do. empty'' return. end. NB. suppress validn msg
valid=. (L0>0) *. ((L1>0) +. (y<1))
if. -.valid do.
  confirm '>>> No action: needs'; (>:y); 'or more selected lines'
end.
valid NB. should abort the calling handler if 0
)

NB. =========================================================
set_ucase=: set_ucase_uu_

NB. =========================================================
setcalco=: 3 : 0
NB. set text: y into ctl: calco
wd 'psel tab; set calco text *',calco=: ,":y
)

NB. =========================================================
setpreci=: 3 : 0
Handler 'setpreci' NB. set numeric precision
NB. set significant figures for cal numbers
if. 0=#y do. z=. preci else. z=. ":y end.
wd 'psel tab; set preci select ',z
tabenginex 'prec' ; z
)

NB. =========================================================
setshow=: 3 : 0
NB. show the ctls of tab#: y (int)
wd 'set tabs active ',":TABNDX=: y
)

NB. =========================================================
setunits=: 3 : 0
NB. set (y=0) or change (y=1) units of line L0
NB. y_tab_=: y
NB. sess log 'y L0 L1 xunit xunit_select'
if. -.setL 0 do. return. end.
if. y do. NB. called with y=1: change units
  tabenginex nb 'unit' ; L0 ; xunit
else. NB. called with y=0: set units in combo
  z=. any2f tabengine nb 'UCOM' ; L0
  wd 'psel tab; set xunit items *',utf8 z
  wd 'psel tab; set xunit select 0' NB. -current unit
end.
EMPTY
)

NB. =========================================================
setval=: 3 : 0
Handler 'setval' NB. tool: set value 0 / 1
if. heldshift'' do. Vonep'' else. Vzero'' end.
)

NB. =========================================================
showttinf=: 3 : 0
Handler 'showttinf'
ttinf setshow 3
)

NB. =========================================================
siunt=: 3 : 0
NB. cannot use funline: must call setunits
Handler 'siunt' NB. convert to SI-units
if. -.setL 0 do. return. end.
tabenginex 'cvsi' ; L0 ; y
setunits 0
)

NB. =========================================================
speak=: 3 : 0
NB. decides if message: y needs spoken warning
if. -.isLit y do. return. end.
if. '>>>' -: 3{.y do. playerror''
elseif. y contains 'bad incompatible' do. playerror''
end.
)

NB. =========================================================
start=: 3 : 0
NB. start the app: create form and init: cal
NB. if. +./ 'j7' E. JVERSION do.
NB.   smoutput '>>> TABULA is not yet supported in this JVERSION:'
NB.   smoutput JVERSION
NB.   return.
NB. end.
NB. load :: 0: TPATH_TABULA,'manifest.ijs' NB. sets VERSION

BNS=: BNS charsub~ TAB,SP
RUNTIME_z_=: 0 default 'RUNTIME_z_'
if. coldstart=. 0=#y do.
  sess 'start_tab_: enters...'
else.
  sess 'start_tab_: called by: restart with y=',":y
end.

NB. Load editable scripts for: tab
NB. load TPATH_TABULA,'tabfun.ijs'
NB. load TPATH_TABULA,'tabtools.ijs'

tabengine 'Init'  NB. Start the CAL engine
Handler=: Handler1  NB. or: Handler=: empty
L0=: 1
L1=: 0
sysmodifiers=: ,'0'
searchc=: searchf=: ''
MAXLINE=: 0
if. coldstart do.
  tab_open''
end.
calco=: '' NB. used by: calcmd...
paneL0'' [panel_select=: ,'1'
setpreci 3 NB. set precision in dropdown
setunits 0
winpos'' NB. restore saved window position,size
empty inputfocus''
)

NB. =========================================================
stept=: 3 : 0
Handler 'stept' NB. tool: plot in standard steps
if. -.setL 0 do. return. end.
selline L0
val=. | tabengine 'VALU' ; L0
if. val=0 do.
  confirm '>>> cannot plot zero-to-zero'
  return.
end.
if. heldshift'' do.
  z=. (-|val),(|val),100
else.
  if. val<0 do. z=. val,0,100 else. z=. 0,val,100 end.
end.
calcmd 'steps ',":z
)

NB. =========================================================
stup=: 3 : 0
Handler 'stup' NB. alter startup.ijs to run TABULA
efx=. 'load ''math/tabula'''
z=. freads fi=. jpath '~config/startup.ijs'
if. z-:freads'' do. NB, startup file is absent
  rc=. efx fwrites fi
  confirm 'startup file created' ; (brack rc)
else.
  z fwrites jpath '~config/startup.bak'
  rc=. efx fwrites fi
  confirm 'startup file replaced' ; (brack rc) ; '(old=startup.bak)'
end.
)

NB. =========================================================
subitems=: 3 : 0
Handler 'subitems'
if. -.setL 1 do. return. end.
4 tabenginex 'minu' ; L0 ; L1
)

NB. =========================================================
tabengine=: tabengine_cal_

NB. =========================================================
tabenginex=: 3 : 0
0 tabenginex y
:
NB. send y to cal and act on result c/f: exe
NB. if. 1= x bit 0(eg x=1) -clear panel sel's
NB. if. 1= x bit 1(eg x=2) -clear calco
NB. if. 1= x bit 2(eg x=4) -select last line
if. isBoxed y do. y=. nb y end.
x refresh confirm tabengine INSTR=: ,y
setshow 0
)

tbx=: ijs
thold=: 'holm'&funline
title=: tabengine@('TITL'"_)

NB. =========================================================
traca=: 3 : 0
Handler 'traca' NB. tool: toggle trace(s)
if. heldshift'' do. trach''
elseif. heldalt'' do. traci''
elseif. do. trace''
end.
)

NB. =========================================================
trace=: 3 : 0
NB. set/toggle TRACE in tab (not cal)
NB. set TRACE in cal by direct engine call
NB. or: ']trac _' in calco
if. (y=. {.y) e. 0 1 do.
  TRACE=: y
else.
  TRACE=: -. TRACE
end.
confirm '+++ TRACE=' ; TRACE
)

NB. =========================================================
trach=: 3 : 0
NB. set/toggle TRACH (Handler1)
if. (y=. {.y) e. 0 1 do.
  TRACH=: y
else.
  TRACH=: -. TRACH
end.
confirm '+++ TRACH=' ; TRACH
)

NB. =========================================================
traci=: 3 : 0
NB. toggle TRACI in: cal
NB. echoes the commands received by cal
NB. To toggle TRACE in cal: do direct engine call
NB. or: ']trac _' in calco
smoutput nb 'traci:' ; tabengine 'trai _'
)

NB. =========================================================
ttabl=: 3 : 0
Handler 'ttabl' NB. show Ttable tab and refresh it
tabengine 'reca'
sellinex''
setcalco''
setshow 0
)

NB. =========================================================
ttcont=: 3 : 0
Handler 'ttcont'
if. -:/tabengine each ;:'TFIL TFLU' do.
  confirm '>>> cannot open undefined ttable - save it first'
else.
  open tabengine 'TFIL'
end.
)

NB. =========================================================
tthld=: 'hold'&funline

NB. =========================================================
ttinf=: 3 : 0
Handler 'ttinf' NB. called as a handler
1 ttinf y
:
NB. Put / get ttable info to/from ctl: info
NB. x-:0 -clears ctl: info
NB. x-:1 -gets/shows TTINFO
NB. x otherwise -updates TTINFO from y
NB.  -or from (info) if y is empty.
if. x-:1 do.  NB. -->CALLED AS HANDLER (default x)
  z=. tabengine 'INFO' NB. return info string
  wd 'psel tab; set info text *',z
  confirm 'ttable info retrieved'
elseif. x-:0 do. NB. -->CALLED to clear the display
  wd 'psel tab; set info text ""'
elseif. do.  NB. set ttable info from y or info
  if. 0=#y do. y=. info end.
  tabenginex 'info' ; y
  confirm 'Info: $=' ; ($y) ; 'updated in ttable:' ; ttname''
end.
)

NB. =========================================================
ttname=: tabengine@('TNAM'"_)
undo=: tabenginex@('Undo'"_)
undoredo=: undo shift redo
unhid=: tabenginex@('unhid'"_)

NB. =========================================================
updex=: tabenginex@('exch'"_)
updin=: 2&ttinf
uurowsc=: uurowsc_uu_
uurowsf=: uurowsf_uu_
vv=: ":@|:@,:
wav=: ] , '.wav' #~ [: -. '.' e. ]

NB. =========================================================
wd_probed=: 3 : 0
try.
  wd y
catch.
  sess 'wd: failed with: ',WD=: y
end.
)

wde=: wd_probed

NB. =========================================================
window_close=: 3 : 0
NB. Close the form: tab
NB. SAFE TO CALL EVEN IF WINDOW IS ABSENT
try.
  wd_z_ 'psel tab; pclose;'
catch.
  EMPTY
end.
)

NB. =========================================================
winpos=: 3 : 0
NB. write out (y=1) or read back window pos
posfi=. jpath '~math/tabula/config/posn.ijs'
if. y-:1 do. NB. write out...
  xywh''
  z=. 'XYWH=: ',":XYWH
  z fwrite posfi
else. NB. read back...
  XYWH=: XYWH0
  load :: 0: posfi
  repos''
end.
)

NB. =========================================================
word1=: 3 : 0
NB. leading word in a string
SP taketo y
)

words=: 3 : 0
NB. remaining words in a string
dltb SP takeafter y
)

xywh=: 3 : 0
NB. get current window xywh --> mapped noun
XYWH=: ". wd 'psel tab; qform;'
)

NB. =========================================================
NB. NEEDED FOR MSWIN
NB. Hotkey handlers
NB. =========================================================
N0ctrl=: Vzero
N1ctrl=: Vonep
cctrlshift=: copal
dctrl=: dupit
ectrl=: Lequl
fctrlshift=: formu
gctrlshift=: tthld
hctrlshift=: thold
ictrl=: infor
jctrl=: mvitu
kctrl=: movit
lctrl=: newsl
mctrl=: merge
nctrl=: newtt
nctrlshift=: label
octrl=: opent
octrlshift=: opens
qctrlshift=: quit
rctrlshift=: repet
sctrl=: savex
sctrlshift=: siunt
tctrl=: ttabl
tctrlshift=: trace
yctrl=: redo
zctrl=: undo NB.inactive--masked!
uctrl=: undo
uctrlshift=: redo
NB. --leave zctrlshift to pair with zctrl
NB. show

NB. =========================================================
consts_run=: 3 : 0
try.
  ZZ=: uurowsc searchc	NB. c/f fillconsts
catch.
  ZZ=: ,:UNSET
end.
wde 'set cons font ',FONT
wde 'set cons items *',listfmt ZZ
)

NB. =========================================================
functs_run=: 3 : 0
try.
  ZZ=: uurowsf searchf	NB. c/f fillfuncts
catch.
  ZZ=: ,:UNSET
end.
wde 'setfont func ',FONT
wde 'set func items *',listfmt ZZ
)

NB. =========================================================
inf_run=: 3 : 0
wde 'set info font ',FONT
wde 'set info text *' , tabengine 'INFO'
)

NB. =========================================================
sbar_run=: 3 : 0
putsb 'Click a line and perform some operation on it...'
)

NB. =========================================================
tab_open=: 3 : 0
window_close''	 NB. close any existing window
TABNDX=: 0
wde TABU
wde 'set g wh _1 64'
inf_run''
consts_run''
functs_run''
ttable_run''
sbar_run''
wde 'pshow'
)

NB. =========================================================
ttable_run=: 3 : 0
NB.!!! zuluf unknown
NB. wde 'set xunit items *',zuluf
wde 'set preci items *', o2f ": i.16
wde 'setfont panel ',FONT
wde 'set panel items *',UNSET
)
NB. tabula/tabfun.ijs
NB. Defines semantic fns for menu: Function --and all 1-line uses of: funline
NB.
NB. Semantic fn names are derived from cal-cmds by prefixing with V- or L-
NB. Cmds ending in -v -p simply alter the given item's value
NB. Cmds ending in -l -c create a new item dependent on the given item
NB.
NB. These semantic fns have a script to themselves to be easily extendable.
NB. This script is loaded by: start_tab_ --to replace residually-defined synonyms
NB. -whose names should be put in EXCLUDE_tab_ for tidiness, but it doesn't matter.
NB.
NB. THIS SCRIPT SHOULD NEVER BE MANAGED BY: LOBROW (which will munge: bind)

NB. THE SI- PREFIX MULTIPLIERS

cocurrent 'tab'

Vunsc=: 'unsc'&funline
Vstpu=: 'stpu'&funline
Vstpd=: 'stpd'&funline
Vcent=: 'cent'&funline
Vdeca=: 'deca'&funline
Vdeci=: 'deci'&funline
Vdeka=: 'deka'&funline
Vexaa=: 'exaa'&funline
Vfemt=: 'femt'&funline
Vgiga=: 'giga'&funline
Vhect=: 'hect'&funline
Vkilo=: 'kilo'&funline
Vmega=: 'mega'&funline
Vmicr=: 'micr'&funline
Vmill=: 'mill'&funline
Vnano=: 'nano'&funline
Vpeta=: 'peta'&funline
Vpico=: 'pico'&funline
Vtera=: 'tera'&funline
Vyoct=: 'yoct'&funline
Vyott=: 'yott'&funline
Vzept=: 'zept'&funline
Vzett=: 'zett'&funline

NB. THE VALUE ADJUSTERS

Vabsv=: 'absv'&funline
Vaddp=: 'addp'&funline
Vaddv=: 'addv'&funline
Vcbtv=: 'cbtv'&funline
Vcubv=: 'cubv'&funline
Vdblv=: 'dblv'&funline
Vdivp=: 'divp'&funline
Vdivv=: 'divv'&funline
Vetwv=: 'expv'&funline
Vexpv=: 'expv'&funline
Vextv=: 'extv'&funline
Vhlvv=: 'hlvv'&funline
Vinvv=: 'invv'&funline
Vintv=: 'intv'&funline
Vlnnv=: 'lnnv'&funline	NB. ln of value
Vltnv=: 'ltnv'&funline	NB. log10 of value
Vltwv=: 'ltwv'&funline	NB. log2 of value
Vmulp=: 'mulp'&funline
Vmulv=: 'mulv'&funline
Vnegv=: 'negv'&funline
Vpidv=: 'pidv'&funline
Vpimv=: 'pimv'&funline
Vptdv=: 'ptdv'&funline
Vptmv=: 'ptmv'&funline
Vsqrv=: 'sqrv'&funline
Vsqtv=: 'sqtv'&funline
Vsubp=: 'subp'&funline
Vsubv=: 'subv'&funline
Vvalu=: 'valu'&funline

NB. THE VALUE REPLACERS

Vonen=: 'onen'&funline
Vonep=: 'onep'&funline
Vzero=: 'zero'&funline

NB. THE LINE DERIVERS (c/f value adjusters)
NB. Laddc Laddl Lsubc Lsubl Lequl
NB. 	NEW reqd in cal...
NB. Lmulc Lmull Ldivc Ldivl Labsl Linvl Ldbll Lhlvl
NB. Lintl Lnegl Lsqrl Lsqtl Lcubl Lcbtl Lexpl Lextl Llnnl Lltnl
NB. Lpidl Lpiml Lp2dl Lp2ml
NB.  DECIDE ORDERLY NAMING... cmd suffixes: v-->l, p-->c
NB. --meaning: value-->line, percent-->[per]cent
NB. Trailing '-' gets funline to select the line just created

Labsl=: 'absl-'&funline
Laddc=: 'addc-'&funline	NB. copy line adding v%	[not menu]
Laddl=: 'addl-'&funline	NB. copy line adding v	[not menu]
Lcubl=: 'cubl-'&funline	NB. cubed line
Lcbtl=: 'cbtl-'&funline	NB. cube-rooted line
Ldbll=: 'dbll-'&funline	NB. doubled line
Ldivc=: 'divc-'&funline	NB. copy line by v%	[not menu]
Ldivl=: 'divl-'&funline	NB. copy line by v	[not menu]
Lequl=: 'equl-'&funline	NB. equal line
Lexpl=: 'expl-'&funline	NB. e^line
Lextl=: 'extl-'&funline	NB. 10^line
Letwl=: 'etwl-'&funline	NB. 2^line
Lhlvl=: 'hlvl-'&funline	NB. halved line
Lintl=: 'intl-'&funline	NB. integer line
Linvl=: 'invl-'&funline	NB. inverted line
Llnnl=: 'lnnl-'&funline	NB. ln line
Lltnl=: 'ltnl-'&funline	NB. log10 line
Lltwl=: 'ltnl-'&funline	NB. log2 line
Lmulc=: 'mulc-'&funline	NB. copy line times v%	[not menu]
Lmull=: 'mull-'&funline	NB. copy line times v	[not menu]
Lnegl=: 'negl-'&funline	NB. negated line
Lpidl=: 'pidl-'&funline	NB. line %PI
Lpiml=: 'piml-'&funline	NB. line *PI
Lptdl=: 'ptdl-'&funline	NB. line %PI2
Lptml=: 'ptml-'&funline	NB. line *PI2
Lsqrl=: 'sqrl-'&funline	NB. squared line
Lsqtl=: 'sqtl-'&funline	NB. square-rooted line
Lsubc=: 'subc-'&funline	NB. copy line subbing v%[not menu]
Lsubl=: 'subl-'&funline	NB. copy line subbing v	[not menu]
Lt1dl=: 't1dl-'&funline	NB. line %10
Lt1ml=: 't1ml-'&funline	NB. line *10
Lt2dl=: 't2dl-'&funline	NB. line %100
Lt2ml=: 't2ml-'&funline	NB. line *100
Lt3dl=: 't3dl-'&funline	NB. line %1000
Lt3ml=: 't3ml-'&funline	NB. line *1000
NB. TOOLBAR ICONS
NB. HINTS ON EDITING THIS SCRIPT ...
NB. BNS must contain precisely 32 lines (numbered: 0 to 31).
NB. Specify a new tool by replacing one of these lines.
NB. The first word must be the name of a handler in locale: 'tab'.
NB. The name of the target handler must be all lowercase.
NB. The rest of the line is the hint shown when the cursor hovers.
NB. If there is a slash, the part after / applies when Shift is held.
NB. The handler itself must test for Shift, eg by: if. heldshift'' ...
NB. To each first-word in BNS must correspond an icon, defined below.
NB. Thus: newtt has the icon: icoNEWTT.
NB. To create a new icon, copy an existing one, rename it and edit it.
NB. A toolbar icon MUST HAVE 32 rows, with 32 chars in a row.
NB. Each char specifies a pixel. Common colors are:
NB.  / white  . gray  ; light-gray  = black  r red  b blue  v violet
NB. Add further colors by editing: convicon_tab_

cocurrent 'tab'

BNS=: 0 : 0
newtt		New empty ttable
opent		Open ttable... / Open SAMPLE
savts		Save ttable as Title / Save ttable as SAMPLE
delit		Delete line
undoredo	Undo / Redo
additems	Add all selected items
subitems	Item 1 minus item 2 / Item 2 minus item 1
mulitems	Multiply all selected items
divitems	Divide item 1 by item 2 / Divide item 2 by item 1
powitems	Item 1 ^ item 2 / Item 2 ^ item 1
stept		Plot 0 to (value) / Plot (-value) to (+value)
newsl		New line
equal		New line = selected line
movud		Move line up / Move line down
copal		Copy entire ttable
ttcont		Edit code of ttable as saved
restart		Restart TABULA
repos		Reset window pos+size / Reset original window pos+size
hold		Toggle Hold / Toggle Transient Hold
traca		Toggle gui trace / Toggle handlers trace
iedit		Edit item name / Edit item formula
setval		Set value to 0 / Set value to 1
add1u		Add 1 / Subtract 1
addpc		Add 1% / Subtract 1%
by2pi		Times PI / Times 2*PI
merge		Merge selected lines
replot		Replot selected items only / Replot all items
siunt		Convert to SI Units
eduu		Edit consts / Edit functs
hlpca		Commands for CAL-engine / About CAL-engine
hlpt		Help for TABULA
showttinf	Show ttable info / edit ttable info
)

icoNEWTT=: 0 : 0
////////////////////////////////
..........y..................../
..........y..................../
.....y....y....y.............../
......y...y...y................/
.....==y=yyy=y======.........../
.....=;;yyyyy;;;;;;==........../
.....=;yyyyyyy;;;;;=/=........./
..yyyyyyyyyyyyyyyyy=//=......../
.....=;yyyyyyy;;;;;=///=......./
.....=;;yyyyy;;;;;;=////=....../
.....=;y;yyy;y;;;;;=======...../
.....=y;;;y;;;y;;;;;;;;;;=...../
.....y;;;;y;;;;y;;;;;;;;;=...../
.....=;;;;y;;;;;;;;;;;;;;=...../
.....=;;;;y;;;;;;;;;;;;;;=...../
.....=;;;;y;;;;;;;;;;;;;;=...../
.....=;;;;y;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=====================...../
.............................../
.............................../
.............................../
)

icoOPENT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.....===============.........../
.....=;;;;;;;;;;;;;==........../
.....=;;;;;;;;;;;;;=/=........./
.....=;;;;;;;;;;;;;=//=......../
.....=;;;;;;;;;;;;;=///=......./
.....=;;;;;;;;;;;;;=////=....../
.....=;;;;;;;;;;;;;=======...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;;;;;;;;;bbbbbrrr=...../
.....=;;;;;;;;;;;bbbbbrrr=...../
.....=;;;;;;;;;;;bbbbbrrr=...../
.....=;;;;;;;;;;;bbbbbrrr=...../
.....=====================...../
.............................../
.............................../
.............................../
)

icoEDUU=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.....===============.........../
.....=;;;;;;;;;;;;;==........../
.....=;;;;;;;;;;;;;=/=........./
.....=;;;;;;;;;;;;;=//=......../
.....=;;;;;;;;;;;;;=///=......./
.....=;;;;;;;;;;;;;=////=....../
.....=;;;;;;;;;;;;;=======...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;==;;==;;;==;;==;;=...../
.....=;;==;;==;;;==;;==;;=...../
.....=;;==;;==;;;==;;==;;=...../
.....=;;==;;==;;;==;;==;;=...../
.....=;;==;;==;;;==;;==;;=...../
.....=;;======;;;======;;=...../
.....=;;;====;;;;;====;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=;;;bbbb;;;;rrrrrr;;=...../
.....=;;bbbbbb;;;rrrrrr;;=...../
.....=;;bb;;;;;;;rr;;;;;;=...../
.....=;;bb;;;;;;;rrrrr;;;=...../
.....=;;bb;;;;;;;rrrrr;;;=...../
.....=;;bbbbbb;;;rr;;;;;;=...../
.....=;;;bbbb;;;;rr;;;;;;=...../
.....=;;;;;;;;;;;;;;;;;;;=...../
.....=====================...../
.............................../
.............................../
.............................../
)

icoSAVTS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
........================......./
.......=MMMMMMMMMMMMMMMM=....../
.......=MMMMMMMMMMMM..MM=....../
.......=MMMMMMMMMMMM..MM=....../
.......=MMMMMMMMMMMMMMMM=....../
.......=MMMMbbbbbrrrMMMM=....../
.......=MMMMbbbbbrrrMMMM=....../
.......=MMMMbbbbbrrrMMMM=....../
.......=MMMMbbbbbrrrMMMM=....../
.......=MMMMMMMMMMMMMMMM=....../
.......=MMMMMMMMMMMMMMMM=....../
.......=MMMMM;;;;;;MMMMM=....../
.......=MMMM;;;;;;;;MMMM=....../
.......=MMMM;;;;;;;;MMMM=....../
.......=MMMM;;;;;;;;MMMM=....../
.......=MMMM;;;;;;;;MMMM=....../
.......=MMMM;;;;;;;;MMMM=....../
........================......./
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoDELIT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.....==/...............=/....../
.....====/...........==/......./
.......====/........==/......../
........====/......==/........./
..........===/....=/.........../
...........===/.===/.........../
............======/............/
.............====/............./
............======/............/
...........===/..==/.........../
..........===/....==/........../
.........===/......==/........./
........===/........=/........./
.......===/..........=/......../
......====/...........=/......./
.......==/...................../
.......................=/....../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoUNDOREDO=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
............bbbbrrr............/
..........bbbbbbrrrrr........../
........bbbbbbbbrrrrrrr......../
.......bbbbbbbbbrrrrrrrr......./
......bbbbbbbbbbrrrrrrrrr....../
......bbbbbbbb..=rrrrrrrr....../
.....bbbbbbb......=rrrrrrr...../
.....bbbbbb........=rrrrrr...../
.....bbbbb..........=rrrrr...../
.....bbbbb..........=rrrrr...../
.....bbbb............=rrrr...../
.....bbbb...b....=...=rrrr...../
.....bbbb..bb....==..=rrrr...../
.....bbbb.bbb....=r=.=rrrr...../
......bbbbbbb....=rr=rrrr....../
......bbbbbbb....=rrrrrrr....../
.......bbbbbb....=rrrrr=......./
......bbbbbbb....=rrrrr=......./
.....bbbbbbbb....=rrrrrr=....../
....bbbbbbbbb....=rrrrrrr=...../
...bbbbbbbbbb....==========..../
.............................../
.............................../
.............................../
.............................../
)

icoMOVUD=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
...............=.............../
..............=b=............../
.............=bbb=............./
............=bbbbb=............/
...........=bbbbbbb=.........../
..........=bbbbbbbbb=........../
.............=bbb=............./
.............=bbb=............./
.............=bbb=............./
.............=bbb=............./
.............=bbb=............./
.............=bbb=............./
.............=rrr=............./
.............=rrr=............./
.............=rrr=............./
.............=rrr=............./
.............=rrr=............./
.............=rrr=............./
..........=rrrrrrrrr=........../
...........=rrrrrrr=.........../
............=rrrrr=............/
.............=rrr=............./
..............=r=............../
...............=.............../
.............................../
.............................../
.............................../
.............................../
)

icoCOPAL=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
....========.................../
....=;;;;;;==................../
....=;;;;;;=,=................./
....=;;;;;;=,,=................/
....=;;;;;;=,,,=.............../
....=;;;;;;=,,,,=............../
....=;;;;;;=======............./
....=;;;;;;;;;;;;=............./
....=;;;;;;;;;;;;=............./
....=;;;;;;;;/========........./
....=;;;;;;;;/=;;;;;;==......../
....=;;;;;;;;/=;;;;;;=,=......./
....=;;;;;;;;/=;;;;;;=,,=....../
....=;;;;;;;;/=;;;;;;=,,,=...../
....=;;;;;;;;/=;;;;;;=,,,,=..../
....=;;;;;;;;/=;;;;;;=======.../
....=;;;;;;;;/=;;;;;;;;;;;;=.../
....=;;;;;;;;/=;;;;;;;;;;;;=.../
....=========/=;;;;;;;;;;;;=.../
..............=;;;;;;;;;;;;=.../
..............=;;;;;;;;;;;;=.../
..............=;;;;;;;;;;;;=.../
..............=;;;;;;;;;;;;=.../
..............=;;;;;;;;;;;;=.../
..............=;;;;;;;;;;;;=.../
..............==============.../
.............................../
.............................../
)

icoADDITEMS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............======............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
....==========bbbb==========.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....==========bbbbb=========.../
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............=bbbb=............/
.............======............/
.............................../
.............................../
.............................../
.............................../
)

icoSUBITEMS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
....=======================..../
....=bbbbbbbbbbbrrrrrrrrrr=..../
....=bbbbbbbbbbbrrrrrrrrrr=..../
....=bbbbbbbbbbbrrrrrrrrrr=..../
....=bbbbbbbbbbbrrrrrrrrrr=..../
....=======================..../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoMULITEMS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
........=..............=......./
.......=b=............=b=....../
......=bbb=..........=bbb=...../
.....=bbbbb=........=bbbbb=..../
......=bbbbb=......=bbbbb=...../
.......=bbbbb=....=bbbbb=....../
........=bbbbb=..=bbbbb=......./
.........=bbbbb==bbbbb=......../
..........=bbbbbbbbbb=........./
...........=bbbbbbbb=........../
............=bbbbbb=.........../
............=bbbbbb=.........../
...........=bbbbbbbb=........../
..........=bbbbbbbbbb=........./
.........=bbbbb==bbbbb=......../
........=bbbbb=..=bbbbb=......./
.......=bbbbb=....=bbbbb=....../
......=bbbbb=......=bbbbb=...../
.....=bbbbb=........=bbbbb=..../
......=bbb=..........=bbb=...../
.......=b=............=b=....../
........=..............=......./
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoDIVITEMS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
..............====............./
.............=bbbr=............/
............=bbbbrr=.........../
............=bbbbrr=.........../
............=bbbbrr=.........../
.............=bbbr=............/
..............====............./
.............................../
.............................../
....========================.../
....=bbbbbbbbbbbbrrrrrrrrrr=.../
....=bbbbbbbbbbbbrrrrrrrrrr=.../
....=bbbbbbbbbbbbrrrrrrrrrr=.../
....=bbbbbbbbbbbbrrrrrrrrrr=.../
....========================.../
.............................../
.............................../
..............====............./
.............=bbbr=............/
............=bbbbrr=.........../
............=bbbbrr=.........../
............=bbbbrr=.........../
.............=bbbr=............/
..............====............./
.............................../
.............................../
.............................../
.............................../
)

icoPOWITEMS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
................=............../
...............=b=............./
..............=bbr=............/
.............=bbbrr=.........../
............=bbbbrrr=........../
...........=bbbbbrrrr=........./
..........=bbbbb=rrrrr=......../
.........=bbbbb=.=rrrrr=......./
........=bbbbb=...=rrrrr=....../
.......=bbbbb=.....=rrrrr=...../
........=bbb=.......=rrr=....../
.........=b=.........=r=......./
..........=...........=......../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoREPLOT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
........................b....../
.....==................bbb...../
.....==...............bbb....../
.....==....b.........bbb......./
.....==...bbb.......bbb......../
.....==..bbbbb.....bbb........./
.....==.bbb.bbb...bbb........../
.....==bbb...bbb.bbb.........../
.....=bbb.....bbbbb............/
.....bbb.......bbb............./
....bbb.........b............../
...bbb=.............r........../
....b==..r.........rrr........./
.....==.rrr.......rr.rr......../
.....==rr.rr.....rr...rr......./
.....=rr...rr...rr.....rr....../
.....rr.....rr.rr.......rr...../
....rr=......rrr.............../
....r==.......r................/
.....==......................../
.....==......................../
.....==......................../
.....======================..../
.....======================..../
.............................../
.............................../
.............................../
.............................../
)

icoEQUAL=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
....========================.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....========================.../
.............................../
.............................../
............========.........../
............========.........../
.............................../
.............................../
.........y..========.........../
.........y..========.........../
.........y...................../
....y....y....y................/
.....y...y...y................./
......y.yyy.y................../
....====yyyyy===============.../
....=bbyyyyyyybbbbbbbbbbbbb=.../
..yyyyyyyyyyyyyyyybbbbbbbbb=.../
....=bbyyyyyyybbbbbbbbbbbbb=.../
....=bbbyyyyybbbbbbbbbbbbbb=.../
....===y=yyy=y==============.../
.....y...y...y................./
....y....y....y................/
.........y...................../
.........y...................../
)

icoMERGE=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
....========================.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....=bbbbbbbbbbbbbbbbbbbbbb=.../
....========================.../
.............................../
...............===............./
...............===............./
...............===............./
...............===............./
...............===............./
...............===............./
............=========........../
.............=======.........../
..............=====............/
...............===............./
................=............../
....========================.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....=vvvvvvvvvvvvvvvvvvvvvv=.../
....========================.../
.............................../
.............................../
.............................../
.............................../
)

icoNEWSL=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.........y...................../
.........y...................../
....y....y....y................/
.....y...y...y................./
......y.yyy.y................../
....====yyyyy===============.../
....=bbyyyyyyybbbbbbbbbbbbb=.../
..yyyyyyyyyyyyyyybbbbbbbbbb=.../
....=bbyyyyyyybbbbbbbbbbbbb=.../
....=bbbyyyyybbbbbbbbbbbbbb=.../
....===y=yyy=y==============.../
.....y...y...y................./
....y....y....y................/
.........y...................../
.........y...................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoTTCONT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.....===============.........../
.....=;;;;;;;;;;;;;==........../
.....=;;;;;;;;;;;;;=/=........./
.....=;;;;;;;;;;;;;=//=......../
.....=;;;;;;;;;;;;;=///=......./
.....=;;;;;;;;;;;;;=////=....../
.....=;;;;;;;;;=;;;=======...../
.....=;;;;;;;;;=;;;;;;;;;=...../
.....=;;;;;;;;;=;;;;;;;;;=...../
.....=;=;;;;;=====;;;;;=;=...../
.....=;;=;;=========;;=;;=...../
.....=;;;===//aa///===;;;=...../
.....=;;==///aaaa////==;;=...../
.....=;=////aaaaaa/////=;=...../
.....=//////aaaaaa///////=...../
.....=;=////aaaaaa/////=;=...../
.....=;;==///aaaa////==;;=...../
.....=;;;===//aa///===;;;=...../
.....=;;=;;=========;;=;;=...../
.....=;=;;;;;=====;;;;;=;=...../
.....=;;;;;;;;;=;;;;;;;;;=...../
.....=;;;;;;;;;=;;;;;;;;;=...../
.....=;;;;;;;;;=;;;;;;;;;=...../
.....=====================...../
.............................../
.............................../
.............................../
.............................../
)

icoRESTART=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
............====.............../
.........=========............./
.......======...====.........../
......====........=............/
.....====....................../
.....===......................./
.....==......................../
.....==..............=/......../
.....===.............==/......./
.....====............===/....../
.....====================/...../
......====================/..../
.......==================/...../
.....................===/....../
.....................==/......./
.....................=/......../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoTRACE=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.......=================......./
.......=================......./
.......=================......./
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
..............===............../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoTRACA=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.......=================......./
.......=================......./
.......=================......./
..............===............../
..............===............../
..............===............../
..............===....rr......../
..............===....rr......../
..............===....rr......../
..............===....rr......../
..............===....rr.rr...../
..............===....rrrrrr..../
..............===....rr..rr..../
..............===....rr..rr..../
..............===....rr..rr..../
..............===....rr..rr..../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoTRACH=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.......=================......./
.......=================......./
.......=================......./
..............===............../
..............===............../
..............===............../
..............===....==......../
..............===....==......../
..............===....==......../
..............===....==......../
..............===....==.==...../
..............===....======..../
..............===....==..==..../
..............===....==..==..../
..............===....==..==..../
..............===....==..==..../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoTRACI=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.......=================......./
.......=================......./
.......=================......./
..............===............../
..............===............../
..............===............../
..............===.....==......./
..............===.....==......./
..............===............../
..............===............../
..............===.....==......./
..............===.....==......./
..............===.....==......./
..............===.....==......./
..............===.....==......./
..............===.....==......./
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoHOLD=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........========rrrrrr......../
.........========rrrrrr......../
.........========rrrrrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.........===........rrr......../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoLOB=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........===.................../
.........==============......../
.........==============......../
.........==============......../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoREPOS=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.....==.=.===.=.==............./
.....=...........=............./
.............................../
.....=...........=............./
.............................../
.....=...........=............./
.....=...........=............./
.....=........................./
..........===================../
.....=....=rrrrrrrr=bbbbbbbb=../
..........=rrrrrrrr=bbbbbbbb=../
.....=....=rrrrrrrr=bbbbbbbb=../
.....==.=.=rrrrrrrr=bbbbbbbb=../
..........=rrrrrrrr=bbbbbbbb=../
..........=rrrrrrrr=bbbbbbbb=../
..........===================../
..........=bbbbbbbb=rrrrrrrr=../
..........=bbbbbbbb=rrrrrrrr=../
..........=bbbbbbbb=rrrrrrrr=../
..........=bbbbbbbb=rrrrrrrr=../
..........=bbbbbbbb=rrrrrrrr=../
..........=bbbbbbbb=rrrrrrrr=../
..........===================../
.............................../
.............................../
.............................../
.............................../
)

icoHLPA=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............;//;............../
............;////;............./
............//////............./
............;////;............./
.............;//;............../
.............................../
.............................../
.............////............../
............//////............./
............//////............./
............//===/............./
...........=//===/.=.........../
..........===/===/===........../
.........=============........./
..........===========........../
...........===;/;===.........../
........=====;///;=====......../
........=====/////=====......../
........=====;///;=====......../
...........===;/;===.........../
..........===========........../
.........=============........./
..........===.===.===........../
...........=..===..=.........../
..............===............../
)

icoHLPCA=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
............//////............./
.........////////////;........./
........////......//////......./
......./////.........////....../
......./////.........;////...../
........///...........////...../
......................////...../
.....................////....../
..................;////......../
...............;////.........../
............./////............./
............//////............./
............//////............./
............//===/............./
...........=//===/.=.........../
..........===/===/===........../
.........=============........./
..........===========........../
...........===;/;===.........../
........=====;///;=====......../
........=====/////=====......../
........=====;///;=====......../
...........===;/;===.........../
..........===========........../
.........=============........./
..........===.===.===........../
...........=..===..=.........../
..............===............../
)

icoHLPT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
............//////............./
.........////////////;........./
........////......//////......./
......./////.........////....../
......./////.........;////...../
........///...........////...../
......................////...../
.....................////....../
..................;////......../
...............;////.........../
............./////............./
............//////............./
............//////............./
............//////............./
............//////............./
.............////............../
.............................../
.............................../
.............;//;............../
............;////;............./
............//////............./
............;////;............./
.............;//;............../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoSHOWTTINF=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............;//;............../
............;////;............./
............//////............./
............;////;............./
.............;//;............../
.............................../
.............................../
.............////............../
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
............//////............./
.............////............../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoCOG=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
..............===............../
...........=..===..=.........../
..........===.===.===........../
.........=============........./
..........===========........../
...........===;/;===.........../
........=====;///;=====......../
........=====/////=====......../
........=====;///;=====......../
...........===;/;===.........../
..........===========........../
.........=============........./
..........===.===.===........../
...........=..===..=.........../
..............===............../
)

icoADDPC=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.................=............./
................==............./
.......==......===............./
.......==.....====............./
.......==....=====...==....==../
.......==......===..====..==.../
...==========..===...==..==..../
...==========..===......==...../
.......==......===.....==....../
.......==......===....==..==.../
.......==......===...==..====../
.......==......===..==....==.../
....rrrrrrrr...===............./
....rrrrrrrr...===............./
.............=======.........../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoIEDIT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.....==......==...rrrrrrrrrr.../
.....===.....==...rrrrrrrrrr.../
.....===.....==...rrr........../
.....====....==...rrr........../
.....====....==...rrr........../
.....==.==...==...rrr........../
.....==.==...==...rrrrrrrr...../
.....==..==..==...rrrrrrrr...../
.....==..==..==...rrr........../
.....==...==.==...rrr........../
.....==...==.==...rrr........../
.....==....====...rrr........../
.....==....====...rrr........../
.....==.....===...rrr........../
.....==.....===...rrr........../
.....==......==...rrr........../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoSIUNT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.....=========.....=========.../
....===========....=========.../
....===.....===.......===....../
....===...............===....../
.....===..............===....../
......===.............===....../
.......===............===....../
........===...........===....../
.........===..........===....../
..........===.........===....../
...........===........===....../
............===.......===....../
............===.......===....../
....===.....===.......===....../
....===========....=========.../
.....=========.....=========.../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoSETVAL=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.......======...........r....../
.....==========........rr....../
.....==......==.......rrr....../
.....==......==......rrrr....../
.....==......==.....rrrrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==......==.......rrr....../
.....==========.......rrr....../
.......======.......rrrrrrr..../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoADD1U=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.....................=........./
....................==........./
.........==........===........./
.........==.......====........./
.........==......=====........./
.........==........===........./
.....==========....===........./
.....==========....===........./
.........==........===........./
.........==........===........./
.........==........===........./
.........==........===........./
......rrrrrrrr.....===........./
......rrrrrrrr.....===........./
.................=======......./
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoBY2PI=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
............rrrrrrr............/
...........rrrrrrrrr.........../
...........rr...rrrr.........../
...........rr...rrrr.........../
................rrrr.........../
.==....==.......rrr..=========./
..==..==.......rrr...=========./
...====.......rrr.....==...==../
....==.......rrr......==...==../
...====.....rrr.......==...==../
..==..==...rrr.......===...==../
.==....==.rrr........===...==../
..........rrrrrrrrr............/
..........rrrrrrrrr............/
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoSTEPT=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
......................==rrr..../
......................==rrr..../
......................==rrr..../
......................==rrr..../
..................======rrr..../
..................======rrr..../
..................======rrr..../
..................======rrr..../
..............==========rrr..../
..............==========rrr..../
..............==========rrr..../
..............==========rrr..../
..........==============rrr..../
..........==============rrr..../
..........==============rrr..../
..........==============rrr..../
......==================rrr..../
......==================rrr..../
......==================rrr..../
......==================rrr..../
..======================rrr..../
..======================rrr..../
.............................../
.............................../
.............................../
.............................../
.............................../
)

icoNONE=: 0 : 0
////////////////////////////////
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
.............................../
)
NB. win

TABU=: 0 : 0
pc tab;pn Tabula;
menupop "File";
menu newtt "&New" "Ctrl+N" "Start a new ttable" "new";
menu opens "Open Sample" "Ctrl+Shift+O" "Open a sample ttable" "sample";
menu opent "&Open..." "Ctrl+O" "Open a ttable from user library" "open...";
menu appet "&Append..." "" "Append a ttable from user library" "append...";
menu savex "&Save" "Ctrl+S" "Save current ttable under existing name" "savex";
menu saves "Save As Sample" "" "Save current ttable as default sample" "saves";
menu savet "Save As Title" "" "Save current ttable under title shown" "savet";
menu savea "Save As..." "" "Save current ttable under new name" "save as...";
menusep;
menu stept "Plot 0 to (value)" "" "plot values" "plot";
menu plotl "Line Chart" "" "Specify plot: line" "line";
menu plotb "Bar Chart" "" "Specify plot: bar" "bar";
menu plotp "Pie Chart" "" "Specify plot: pie" "pie";
menu plots "Surface Chart" "" "Specify plot: surface" "surface";
menusep;
menu close "Close" "" "Close current ttable" "close ttable";
menusep;
menu print "Print" "" "Print current ttable" "print ttable";
menusep;
menu quit "&Quit" "Ctrl+Shift+Q" "Quit TABULA" "quit";
menupopz;
menupop "Edit";
menu undo "&Undo" "Ctrl+U" "Undo last action" "undo";
menu redo "&Redo" "Ctrl+Shift+U" "Redo last action" "redo";
menusep;
menu copal "&Copy Ttable" "Ctrl+Shift+C" "copyall" "copy-all";
menusep;
menu label "Edit Item Name" "Ctrl+Shift+N" "Edit name" "name";
menu formu "Edit Formula" "Ctrl+Shift+F" "Edit formula" "formula";
menu erasf "Erase Formula" "" "Erase formula..." "no formula";
menu siunt "Convert to SI Units" "Ctrl+Shift+S" "Convert line to SI units..." "SI units";
menusep;
menu movit "Move Line Down" "Ctrl+K" "Move this line down" "movedown";
menu mvitu "Move Line Up" "Ctrl+J" "Move this line up" "moveup";
menusep;
menu newsl "New Line" "Ctrl+L" "Make a new line" "newline";
menu merge "Merge lines" "Ctrl+M" "Merge lines..." "merge";
menu delit "Delete Line" "" "Delete this line" "delete";
menu dupit "Duplicate Line" "Ctrl+D" "Duplicate this line" "dup";
menusep;
menu updex "Update Exchange Rates" "" "Update currency exchange rates for this ttable" "upd-exch";
menu updin "Update Info" "" "Update info for this ttable" "upd-inf";
rem menusep;
rem menu stup "Startup with TABULA" "" "Fix startup" "stup";
menupopz;
menupop "Command";
menu repet "Repeat" "Ctrl+Shift+R" "Repeat last action" "repeat";
menusep;
menu tthld "Transient Hold" "Ctrl+Shift+G" "Transient hold" "hold";
menu thold "Toggle Hold" "Ctrl+Shift+H" "Toggle hold" "hold!";
menusep;
menu hidel "Hide Line(s)" "" "Hide selected lines" "hide";
menu unhid "Unhide All Lines" "" "Unhide all hidden lines" "unhide";
menusep;
menu ttabl "Show Ttable" "Ctrl+T" "Show ttable display" "ttable";
menu conss "Show Constants List" "" "Show consts tab" "consts";
menu funcs "Show Functions List" "" "Show functs tab" "functs";
menu infor "Show Ttable Info" "Ctrl+I" "Show info tab" "info";
menusep;
menu trace "Toggle TRACE" "Ctrl+Shift+T" "Toggle trace" "trace";
menu trach "Toggle TRACH" "" "Toggle Handler1 trace" "handler";
menu traci "Toggle cal echo" "" "Toggle echo" "traci";
menupopz;
menupop "Value";
menu Vzero "Zero" "Ctrl+0" "Zero the value" "zero";
menu Vonep "One" "Ctrl+1" "Set the value to 1" "+1";
menu Vonen "Minus One" "" "Set the value to -1" "-1";
menusep;
menu Vabsv "Abs" "" "Absolute Value" "abs";
menu Vdblv "Double" "" "Value doubled" "doubled";
menu Vhlvv "Halve" "" "Value halved" "halved";
menu Vintv "Integer" "" "Value integer" "int";
menu Vinvv "Invert" "" "Value inverted" "inverted";
menu Vnegv "Negate" "" "Value negated" "negated";
menusep;
menu Vsqtv "Sq Root" "" "Value sq-rooted" "sqrt";
menu Vsqrv "Square" "" "Value squared" "squared";
menu Vcbtv "Cube Root" "" "Value cube-rooted" "cubed";
menu Vcubv "Cube" "" "Value cubed" "cubed";
menu Vexpv "Exp" "" "e^value" "exp";
menu Vextv "10^" "" "10^value" "exp";
menu Vetwv "2^" "" "2^value" "exp";
menu Vlnnv "Ln" "" "Value natural-log" "ln";
menu Vltnv "Log10" "" "Value log10" "log10";
menu Vltwv "Log2" "" "Value log2" "log2";
menusep;
menu Vpimv "Times-π" "" "Value times π" "*π";
menu Vptmv "Times-2π" "" "Value times 2π" "*2π";
menu Vpidv "By-π" "" "Value divided by π" "/π";
menu Vptdv "By-2π" "" "Value divided by 2π" "/2π";
menupopz;
menupop "Scale";
menu Vunsc "Unscaled"  "" "Unscaled" "unscaled";
menu Vstpu "Step Up"  "" "Step Up" "stepup";
menu Vstpd "Step Down"  "" "Step Down" "stepdown";
menusep;
menu Vdeci "deci-  [/10]"  "" "Divided by 10" "deci";
menu Vcent "centi- [/100]" "" "Divided by 100" "centi";
menu Vmill "milli- [/1000]" "" "Divided by 10^3" "milli";
menu Vmicr "micro- [/10^6]" "" "Divided by 10^6" "micro";
menu Vnano "nano-  [/10^9]"  "" "Divided by 10^9" "nano";
menu Vpico "pico-  [/10^12]"  "" "Divided by 10^12" "pico";
menu Vfemt "femto- [/10^15]" "" "Divided by 10^15" "femto";
menu Vatto "atto-  [/10^18]"  "" "Divided by 10^18" "atto";
menu Vzept "zepto- [/10^21]" "" "Divided by 10^21" "zepto";
menu Vyoct "yocto- [/10^24]" "" "Divided by 10^24" "yocto";
menusep;
menu Vdeca "deca-  [*10]"  "" "Multiplied by 10" "deca";
menu Vhect "hecto- [*100]" "" "Multiplied by 100" "hecto";
menu Vkilo "kilo-  [*1000]" "" "Multiplied by 10^3" "kilo";
menu Vmega "mega-  [*10^6]" "" "Multiplied by 10^6" "mega";
menu Vgiga "giga-  [*10^9]" "" "Multiplied by 10^9" "giga";
menu Vtera "tera-  [*10^12]" "" "Multiplied by 10^12" "tera";
menu Vpeta "peta-  [*10^15]" "" "Multiplied by 10^15" "peta";
menu Vexaa "exa-   [*10^18]"  "" "Multiplied by 10^18" "exa";
menu Vzett "zetta- [*10^21]" "" "Multiplied by 10^21" "zetta";
menu Vyott "yotta- [*10^24]" "" "Multiplied by 10^24" "yotta";
menupopz;
menupop "Function";
menu additems "Add Lines" "" "Add lines" "add";
menu subitems "Subtract Lines" "" "Subtract lines" "subtract";
menu mulitems "Multiply Lines" "" "Multiply lines" "multiply";
menu divitems "Divide Lines" "" "Divide lines" "divide";
menu powitems "Power Lines" "" "Power lines" "power";
menusep;
menu Lequl "Equal Line" "Ctrl+E" "Append equal line" "equal";
menu Labsl "Abs Line" "" "Append abs-value line" "abs";
menu Ldbll "Doubled Line" "" "Append doubled line" "doubled";
menu Lhlvl "Halved Line" "" "Append halved line" "halved";
menu Lintl "Integer Line" "" "Append integer-value line" "int";
menu Linvl "Inverted Line" "" "Append inverted line" "inverted";
menu Lnegl "Negated Line" "" "Append negated line" "negated";
menusep;
menu Lsqtl "Sq Root Line" "" "Append square-rooted line" "sqrt";
menu Lsqrl "Squared Line" "" "Append squared line" "squared";
menu Lcbtl "Cube Root Line" "" "Append cube-rooted line" "cubert";
menu Lcubl "Cubed Line" "" "Append cubed line" "cubed";
menu Lexpl "Exp Line" "" "Append exponential line" "exp";
menu Lextl "10^ Line" "" "Append 10^ line" "exp";
menu Letwl "2^ Line" "" "Append 2^ line" "exp";
menu Llnnl "Ln Line" "" "Append natural-log line" "ln";
menu Lltnl "Log-10 Line" "" "Append log-10 line" "log";
menu Lltwl "Log-2 Line" "" "Append log-10 line" "log";
menusep;
menu Lpiml "Times-π Line" "" "Append line times π" "*π";
menu Lptml "Times-2π Line" "" "Append line times 2π" "*2π";
menu Lpidl "By-π Line" "" "Append line divided by π" "/π";
menu Lptdl "By-2π Line" "" "Append line divided by 2π" "/2π";
menusep;
menu Lt1ml "Times-10 Line" "" "Append line times 10" "*10";
menu Lt2ml "Times-100 Line" "" "Append line times 100" "*100";
menu Lt3ml "Times-1000 Line" "" "Append line times 1000" "*1000";
menu Lt1dl "By-10 Line" "" "Append line divided by 10" "/10";
menu Lt2dl "By-100 Line" "" "Append line divided by 100" "/100";
menu Lt3dl "By-1000 Line" "" "Append line divided by 1000" "/1000";
menupopz;
menupop "Help";
menu hlpt "Help for TABULA" "" "TABULA help" "help";
menu hlpc "Help for 1-char comands" "" "cmds help" "cmds";
menu hinf "Info for this ttable" "" "ttable info" "info";
menupopz;
cc g isigraph;
cc tabs tab;
tabnew T-table;
bin h;
cc preci combobox;
cc calco edit;
cc xunit combobox;
bin z;
cc panel listbox multiple;
tabnew Constants;
cc cons listbox;
bin h;
cc cappend button;cn "Append";
cc searchc edit;
cc casec checkbox;cn "case-sensitive";
bin z;
tabnew Functions;
cc func listbox;
bin h;
cc fappend button;cn "Append";
cc searchf edit;
cc casef checkbox;cn "case-sensitive";
bin z;
tabnew Info;
cc info editm;
bin h;
cc updin button;cn "Update";
bin s1z;
tabend;
cc sbar statusbar;
set sbar addlabel status;
set sbar addlabelp sinf1;
set sbar addlabelp sinf2;
)
NB. zfns

NB. ========== z-LOCALE ==========

cocurrent 'z'

NB. TPATH_TABULA=: 3 : 0 ''
NB. NB. returns directory containing this script
NB. NB. also assigns global: WHEREAMI -the folder in question
NB. NB. plus SEP -the platform-dependent path-separator.
NB. ws=. [: 'Not from script'"_`({ 4!:3@(0&$))@.(0&<:) [: 4!:4 [: < >
NB. WHEREAMI=: '<UNSET>' NB. needed for ws to work with
NB. z=. >ws 'WHEREAMI'
NB. SEP=: '/\' {~ '\' e. z
NB. WHEREAMI=: (>: z i: SEP) {.z
NB. )

TPATH_TABULA=: jpath '~addons/math/tabula'

NB. Load: cal -by looking for sibling folder
NB. load (TPATH_TABULA,'tabula.ijs') rplc ;:'tabula cal'

NB. Permit manual reset of window posn by entering: repos 0
repos=: repos_tab_

NB.!!! for development
NB. start_tab_''
