0 :0
TABULA: scientific units conversion package
simplified architecture
)

require '~Gituu/uu.ijs'
require '~Gitcal/cal.ijs'

clear 'tabby'
coclass 'tabby'
coinsert 'jgl2'

AABUILT=: '2018-09-02  17:24:57'
AABUILT=: '2018-09-02  17:25:32'

AABUILT=: '2018-09-02  17:49:35'
AABUILT=: '2018-09-02  17:53:42'
AABUILT=: '2018-09-02  17:55:48'
AABUILT=: '2018-09-02  17:57:58'
AABUILT=: '2018-09-02  18:00:11'
AABUILT=: '2018-09-02  18:02:31'
AABUILT=: '2018-09-02  18:08:21'
AABUILT=: '2018-09-02  18:11:50'
AABUILT=: '2018-09-02  18:13:23'
AABUILT=: '2018-09-02  18:14:32'
AABUILT=: '2018-09-02  18:19:06'

'==================== [tabby] constants ===================='

cocurrent 'tabby'

sysmodifiers=: ,'0'


CONTENT_TTABLE=: 0 : 0
Pseudogravity by rotation
  ┌    {1}        0.017 Hz      Frequency; hertz=
┌ │ ┌  {2}        0.338 km      r:radius of circuit
│ ├ └> {3}        2.126 km      circumference
├ └>   {4}        0.035 km/s    v:rotational speed
└>┌    {5}        3.710 m/(s²)  c:centripetal acceleration
  │ ┌  {6}            0 /       i:selector (1 or 2)
  │ ├  {7}        9.810 m/(s²)  g:earth gravity unit=
  │ ├  {8}        3.710 m/(s²)  a:mars gravity unit=
  ├ └> {9}        9.810 *       target pseudogravity
  └>   {10}       0.378 *       Set "U" to force equal
)

CONTENT_CONSTANTS=: 0 : 0
dummy content for Constants tab
Second line
line 3 --
)

CONTENT_FUNCTIONS=: 0 : 0
dummy content for Functions tab
Second line
line 3 --
)

TABENGINE_RESPONSE_Init=: 0 : 0
dummy tabengine Init confirmation
)

TABENGINE_RESPONSE_INFO=: 0 : 0
dummy tabengine INFO content
)

TABENGINE_RESPONSE_NOT_IMPLEMENTED=: 0 : 0
dummy tabengine NOT IMPLEMENTED--
)

COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DESELECT=: 1
DIAMETER=: 30
NAME_TTABLE=: 'SAMPLE'
PEN_WIDTH=: 3
PNG=: temp 'tabula-toolbar.png'
TABNDX=: 0
TIMER_HOVER=: 1000
UNSET=: '<UNSET>'
XYWH=: 1500 22 536 450

'==================== [tabby] forms ===================='
0 :0
Friday 31 August 2018  21:52:55
)

coclass 'tabby'

TABU=: 0 : 0
pc tab;pn Tabby;
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
menu tthld "Toggle Transient Hold" "Ctrl+Shift+G" "Transient hold" "hold";
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
cc g isidraw;
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

'==================== [tabby] tools ===================='

cocurrent 'tabby'

0 :0
	EXTRACTED FROM TOOLHINT
	-trash if not needed
15 ttcont    Edit code of ttable as saved                         
16 restart   Show Term window / Restart TABULA    
28 eduu      Edit consts / Edit functs
29 hlpca     Commands for CAL-engine / About CAL-engine                        
)

TOOLHINT=: >cutopen 0 : 0
0  newtt     New empty ttable
1  opent     Open ttable... / Open SAMPLE
2  savts     Save ttable as Title / Save ttable as SAMPLE
3  copal     Copy entire ttable
4  undoredo  Undo / Redo
5  additems  Add all selected items
6  subitems  Item 1 minus item 2 / Item 2 minus item 1
7  mulitems  Multiply all selected items
8  divitems  Divide item 1 by item 2 / Divide item 2 by item 1
9  powitems  Item 1 ^ item 2 / Item 2 ^ item 1
10 stept     Plot 0 to (value) / Plot (-value) to (+value)
11 replot    Replot selected items only / Replot all items
12 movud     Move line up / Move line down
13 movtb     Move line to top / Move line to bottom
14 newsl     New line
15 equal     New line = selected line
16 repos     Reset window pos+size / Reset original window pos+size
17 delit     Delete line
18 hold      Toggle Hold / Toggle Transient Hold
19 traca     Toggle TRACE (action-verbs) / Toggle TRACI (Handler1)
20 iedit     Edit item name / Edit item formula
21 setv0     Set value to 0
22 set1u     Set value to 1 / Set value to -1
23 add1u     Add 1 / Subtract 1
24 addpc     Add 1% / Subtract 1%
25 by2pi     Times PI / Times 2*PI
26 siunt     Convert to SI Units
27 red       User function
28 green     User function
29 merge     Merge selected lines
30 hlpt      Help for TABULA
31 showttinf Show ttable info / edit ttable info
)

green=: 3 : 0
smoutput ' '
)

red=: 3 : 0
smoutput '============================='
)

setv0=: tab_Vzero_button

set1u=: tab_Vonep_button shift tab_Vonen_button

'==================== [tabby] handlers.ijs ===================='
0 :0
Saturday 1 September 2018  18:04:43
)

coclass 'tabby'

tab_default=: 3 : 0
sllog 'tab_default syschild sysparent syshandler sysevent'
)
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
n=. 16
h=. w=. 32
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: z + <. X%w
fill_tools TOOLID
 confirm 13 }. TOOLID { TOOLHINT

sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

hover_off=: 3 : 0
wd 'timer 0'
fill_tools''
)

tab_close=: window_close

tab_newtt_button=: newtt

tab_panel_select=: 3 : 0

sllog 'tab_panel_select panel_select syschild sysparent syshandler sysevent'
for_row. >cutopen panel do.
z=. '{' takeafter row -. '@'
]lineNo=. ". '}' taketo z
]z=. dlb '}' takeafter z
]i=. {. I. '  ' E. z
qty=. i{.z
com=. dlb i}. z
sval=. ' ' taketo qty
unit=. ' ' takeafter qty
sllog 'tab_panel_select lineNo sval unit com'
end.
)

tab_panel_button=: tab_panel_select

tab_g_mbldown=: 3 : 0


1 fill_tools TOOLID
restoreFocusToInputField''
)

tab_g_mblup=: 3 : 0


if. -. TOOLID e. i.32 do.
  smoutput '>>> tab_g_mblup: BAD TOOLID: ',":TOOLID
  return.
end.
tool=. dtb 3 }. 13 {. TOOLID{TOOLHINT
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

'==================== [tabby] utilities ===================='

cocurrent 'tabby'

shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'

'==================== [tabby] main ===================='
0 :0
Friday 31 August 2018  21:14:03
)

coclass 'tabby'

showTtable=: 3 : 0
wd 'psel tab; set panel items *',tabengine'CTBU'
restoreFocusToInputField''
)

newtt=: 3 : 0
tabengine'newt'
showTtable''
)

opent=: opentt shift opens

opentt=: 3 : 0

tabengine'open 3'
showTtable''
)

opens=: 3 : 0

tabengine'open $$'
showTtable''
)

tab_open=: 3 : 0

window_close''
wd TABU
wd 'psel tab'
wd 'pmove ' , ":XYWH
wd 'set g wh _1 64'
wd 'set info text *' , tabengine 'INFO'
  t=. ,:UNSET
wd 'set cons font fixfont'
wd 'set cons items *',x2f t
wd 'set func font fixfont'
wd 'set func items *',x2f t
wd 'set preci items *', o2f ": i.16
wd 'set panel font fixfont'
wd 'set panel items *',UNSET
confirm 'Click a line and perform some operation on it...'
wd 'pshow'
fill_tools ''
)

window_close=: 3 : 0
wd :: EMPTY 'psel tab; pclose;'
)

fill_tools=: 0 ddefine


glsel 'g'
a=. readimg_jqtide_ PNG
glpixels 0 0 , (|.$a), ,a
if. {. y e. i.32 do.
  x circle (512 | 16 + 32*y) , (16 + 32*y>15)
end.
glpaint''
)

circle=: 4 : 0

clicked=. x
ring=. clicked pick COLOR_HOVER ; COLOR_CLICK
glsel 'g'
glpen PEN_WIDTH [glrgb ring
xy=. y
wh=. 2#DIAMETER
radius=. <.DIAMETER%2
glellipse (xy - radius) , wh
)

tabengine=: 3 : 0

select. 4{.y
case. 'Init' do. TABENGINE_RESPONSE_Init
case. 'INFO' do. TABENGINE_RESPONSE_INFO
case.        do. TABENGINE_RESPONSE_NOT_IMPLEMENTED,y
end.
)

set_ucase=: 3 : 0

ssw '>>> set_ucase: dummy placeholder, y=(y)'
)

calcmd=: 3 : 0

ssw '>>> calcmd: not implemented, calco=[(calco)]'
)

putsb=: 3 : 0
wd 'psel tab; set sbar setlabel status ',dquote ":,y
)
clicktab=: 3 : 0
n=. ".tabs_select
select. n
case. 1 do. fillconsts''
case. 2 do. fillfuncts''
case. 3 do. ttinf''
end.
activateTabWithId n
restoreFocusToInputField''
)

fillttable=: 3 : 0
wd 'psel tab; set panel items *',CONTENT_TTABLE,date''
)

fillconsts=: 3 : 0
set_ucase casec-: ,'0'
wd 'psel tab; set cons items *',CONTENT_CONSTANTS,date''
)

fillfuncts=: 3 : 0
set_ucase casef-: ,'0'
wd 'psel tab; set func items *',CONTENT_FUNCTIONS,date''
)

confirm=: 0 ddefine
putsb CONTENT_CONFIRM=: y
y return.
)

activateTabWithId=: 3 : 0
wd 'psel tab; set tabs active ',":TABNDX=: y
)

restoreFocusToInputField=: 3 : 0
wd 'psel tab; pactive'
select. TABNDX
case. 0 do. wd 'psel tab; setfocus calco'
case. 1 do. wd 'psel tab; setfocus searchc'
case. 2 do. wd 'psel tab; setfocus searchf'
case. 3 do. wd 'psel tab; setfocus info'
end.
empty''
)

ttinf=: 1 ddefine
if. x-:1 do.
  z=. tabengine 'INFO'
  wd 'psel tab; set info text *',z
  confirm 'ttable info retrieved'
elseif. x-:0 do.
  wd 'psel tab; set info text ""'
elseif. do.
  if. 0=#y do. y=. info end.
  tabenginex 'info' ; y
  confirm sw 'Info: $=($y) updated in t-table: (NAME_TTABLE)'
end.
)

'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
wd 'timer 0'
tabengine=: tabengine_cal_
tt_z_=: tabengine_z_=: tabengine

tab_open''
tabengine'Init'
wd 'psel tab; set panel items *',tabengine'CTBU'
)

start''
