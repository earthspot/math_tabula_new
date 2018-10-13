0 :0
Saturday 13 October 2018  03:02:24
-
TABULA: scientific units calculator
-simplified architecture
)

clear 'tabby'
coclass LOC=.'tabby'
clear LOC
BLOC=: <,LOC
coinsert 'jgl2'

AABUILT=: '2018-10-13  03:05:45'

'==================== [tabby] constants ===================='

cocurrent 'tabby'

sysmodifiers=: ,'0'



CONTENT_UNICO=: }: 0 : 0
 m/kg/s^2
 m/(kg s²)
 m kg⁻¹ s⁻²
 m·kg⁻¹·s⁻²
)

HELP=: 0 : 0
Help for TABULA (when getting started)…

++ To plot a ttable:
   (…a suitable test-ttable sample is "plot_test")
1. Select the item to become the x-axis.
2. Give the item a minimum or maximum value to be plotted
       eg. _10 or 10
3. Click "steps" tool
   or pick menu: File > Plot 0 to (value)
   --The plot window will appear, showing a plot of
     the LAST item in the ttable.
4. Reselect the lines you prefer to plot,
   then click the "replot" icon in the toolbar,
   or pick menu: File > Line Chart [Bar Chart ...]
)

BS=: '\'
COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DESELECT=: 1
DIAMETER=: 30
DQ=: '"'
ITEMS=: i.0
NOCONFIRM_MAX=: 10
PEN_WIDTH=: 3
PNG=: temp 'tabula-toolbar.png'
SL=: '/'
TABNDX=: 0
TIMER_HOVER=: 1000
UNSET=: '<UNSET>'
XYWH=: 1500 22 536 450


UNDEFINED_z_=: _.
INVALID_z_=: _.j_.



calco                              =: UNSET
calco_select                       =: '0 0'
casec                              =: ,'0'
casef                              =: ,'0'
cons                               =: UNSET
cons_select                        =: '_1'
func                               =: UNSET
func_select                        =: '_1'
info                               =: UNSET
info_scroll                        =: ,'0'
info_select                        =: '0 0'
panel                              =: UNSET
panel_select                       =: '_1'
preci                              =: ,'0'
preci_select                       =: '_1'
searchc                            =: ''
searchc_select                     =: '0 0'
searchf                            =: ''
searchf_select                     =: '0 0'
syschild                           =: UNSET
sysdata                            =: UNSET
sysdefault                         =: UNSET
sysevent                           =: UNSET
sysfocus                           =: UNSET
syshandler                         =: UNSET
syshwndc                           =: UNSET
syshwndp                           =: UNSET
syslastfocus                       =: UNSET
syslocalec                         =: UNSET
syslocalep                         =: UNSET
sysmodifiers                       =: UNSET
sysparent                          =: UNSET
systype                            =: UNSET
tabs                               =: UNSET
tabs_select                        =: '_1'
unico                              =: UNSET
unico_select                       =: '_1'
xunit                              =: UNSET
xunit_select                       =: '_1'

'==================== [tabby] forms ===================='
0 :0
Monday 24 September 2018  03:56:40
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
menu delsa "Delete Saved Sample" "" "Delete saved default sample" "delete sample";
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
menu movet "Move Line to Top" "Ctrl+Shift+J" "Move line to top" "movetop";
menu moveu "Move Line Up" "Ctrl+J" "Move line up" "moveup";
menu moved "Move Line Down" "Ctrl+K" "Move line down" "movedown";
menu moveb "Move Line to Bottom" "Ctrl+Shift+K" "Move line to bottom" "movebottom";
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
menu hinf "Info for this ttable" "" "ttable info" "info";
menupopz;
cc g isidraw;
cc tabs tab;
tabnew T-table;
bin h;
maxwh 40 30; cc preci combobox;
maxwh 100 30; cc unico combobox;
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
cc sbar static; cn "(status unset)";
)

'==================== [tabby] tools ===================='

cocurrent 'tabby'

TOOLHINT=: >cutopen 0 : 0
0  newtt     New empty ttable
1  opent     Open ttable... / Open SAMPLE
2  savts     Save ttable as Title / Save ttable as SAMPLE
3  copal     Copy entire ttable
4  undoredo  Undo / Redo
5  additems  Add {ABC}
6  subitems  {A} minus {B} / {B} minus {A}
7  mulitems  Multiply {ABC}
8  divitems  Divide {A} by {B} / Divide {B} by {A}
9  powitems  {A} ^ {B} / {B} ^ {A}
10 stept     Plot 0 to {A} / Plot -{A} to {A}
11 replot    Replot {ABC} only / Replot all items
12 movud     Move {A} up / Move {A} down
13 movtb     Move {A} to top / Move {A} to bottom
14 newsl     New line
15 equal     New line = {A}
16 hlpt      Help for TABULA / Help for CAL
17 showttinf Show ttable info / edit ttable info
18 hold      Toggle Hold on {A} / Toggle Transient Hold on {A}
19 siunt     Convert {A} to SI Units
20 iedit     Edit name of {A} / Edit formula of {A}
21 setv0     Set {A} to 0
22 set1u     Set {A} to 1 / Set {A} to -1
23 add1u     Add 1 to {A} / Subtract 1 from {A}
24 addpc     Add 1% to {A} / Subtract 1% from {A}
25 by2pi     {A} times PI / {A} times 2*PI
26 black     User function
27 red       User function
28 green     User function
29 blue      User function
30 delit     Delete {A}
31 merge     Merge {ABC}
)

'==================== [tabby] handlers.ijs ===================='
0 :0
Wednesday 19 September 2018  00:05:15
-
===Latest Built Files:
open '~Gituu/uu.ijs'
open '~Gitcal/cal.ijs'
open '~Gitcal/source/CAL_interface.ijs'
open '~Gittab/tabula.ijs'
open 'math/tabula'
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
tab_close_button=: tab_close
tab_print_button=: notimp
tab_quit_button=:  window_close
tab_undo_button=:  'Undo'&undoredo_like
tab_redo_button=:  'Redo'&undoredo_like
tab_erasf_button=: 'orph'&childlike
tab_siunt_button=: siunt
tab_movet_button=: 'movt'&movtb
tab_moveu_button=: 'movu'&movud
tab_moved_button=: 'movd'&movud
tab_moveb_button=: 'movb'&movtb
tab_dupit_button=: equal
tab_updex_button=: 'exch'&undoredo_like
tab_repet_button=: 'Repe'&undoredo_like
tab_tthld_button=: 'hold'&hold
tab_thold_button=: 'holm'&hold
tab_hidel_button=: notimp
tab_unhid_button=: notimp
tab_ttabl_button=: clicktab bind 0
tab_conss_button=: clicktab bind 1
tab_funcs_button=: clicktab bind 2
tab_infor_button=: clicktab bind 3
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
tab_g_mbldbl=: empty

tab_calco_button=:           interpretCalco
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

z=. y
z=. z rplc '{ABC}' ; brace allItems''
z=. z rplc '{A}' ; brace firstItem''
z=. z rplc '{B}' ; brace secondItem''
)

tab_g_mmove=: 3 : 0
n=. 16
h=. w=. 32
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: z + <. X%w
fill_tools TOOLID
confirm insertIDs 3 }. TOOLID { TOOLHINT

sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

hover_off=: 3 : 0
wd 'timer 0'
fill_tools''
)

tab_close=: window_close

line=: 3 : 0 "0

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

sllog 'tab_panel_select y panel_select'
updatevaluebar''
confirm details'' [NOCONFIRM=:0
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
TOOL=: dtb 3 }. 13 {. TOOLID{TOOLHINT
sllog 'tab_g_mblup TOOLID TOOL'
(TOOL~)''
)

tab_default=: 3 : 0
sllog 'tab_default syschild sysevent'
try. do syschild,''''''
catch. ssw '>>> tab_default: handler needed: (syschild) for: (sysevent)'
end.
)

tools=: 3 : 'b4x firstwords 3}."1 TOOLHINT'
newtt=: 'newt'&undoredo_like

copal=: 3 : 0

wd 'psel tab; clipcopy *',tabengine 'CTBU'
)
undoredo=: undoredo_like=: 'Undo Redo' ddefine

tabenginex pickshift 2$ ;:x
)

savts=: 'savt savs'&undoredo_like

additems=: additems_like=: 'plus' ddefine

tabengine x ; panel_select
confirm tabengine'MSSG'
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

mulitems=: 'mult'&additems_like

subitems=: subitems_like=: 'minu' ddefine

if. heldshift'' do. tabengine x ; line 1 0
else.               tabengine x ; line 0 1
end.
confirm tabengine'MSSG'
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

divitems=: 'divi'&subitems_like
powitems=: 'powe'&subitems_like

movud=: 'movu' ddefine

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
restoreFocusToInputField''
)

movtb=: 'movt' ddefine

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
restoreFocusToInputField''
)

newsl=: 3 : 0

tabengine 'newu /'
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

equal=: 'equl'&additems_like
delit=: 'dele'&additems_like

delsa=: 3 : 0

tabengine 'delf SAMPLE'       
confirm tabengine'MSSG'
)

hold=: '' ddefine

if. 0=#x do. inst=. pickshift ;:'holm hold'
else. inst=. 4{.x
end.
tabengine inst,SP,panel_select
confirm tabengine'MSSG'
showTtable''
restoreSelection''
restoreFocusToInputField''
)

iedit=: 3 : 0

if. heldshift'' do. formu'' else. label'' end.
)

setv0=: setv0_like=: 'zero' ddefine

tabengine x ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

siunt=: 'cvsi'&setv0_like

set1u=: set1u_like=: 'onep onen' ddefine

inst=. pickshift 2$ ;:x
tabengine inst ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)
add1u=: 'add1 sub1'&set1u_like
addpc=: 'ad1p sb1p'&set1u_like
by2pi=: 'pimv ptmv'&set1u_like
merge=: 'merg'&subitems_like

black=: 3 : 0

if. 'empty'-: 5!:5<'sllog' do. sllog=: sllog1=: smoutput@llog
else. sllog=: empty
end.
smoutput '>>> black: sllog is: ',5!:5<'sllog'
)

red=: 3 : 0

smoutput '============================='
)

green=: 3 : 0

smoutput ' '
)

blue=: 3 : 0

smoutput '>>> blue: not implemented'
)

hlpt=: 3 : 0

if. heldshift'' do. textview HELP_cal_ , CAL_cal_
else. textview HELP
end.
)

showttinf=: 3 : 0

activateTabWithId 3
(refreshInfo shift updateInfo)''
)

'==================== [tabby] open.ijs ===================='
0 :0
Tuesday 18 September 2018  09:17:14
-
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
)

coclass 'tabby'

hasChanged=: 3 : 0

if. (tabengine 'DIRT') and -.heldalt'' do.
  prompt=. 'Save current ttable?'
  ask=. 'Ttable: ',tabengine 'TITL'
  ask=. ask,LF,'has unsaved structural changes.'
  ask=. ask,LF,'OK to continue (and lose the changes)?'
  if. wdquery prompt;ask do.
    confirm '>>> New/load ttable -cancelled'
    1 return.end.end.
0 return.
)

openss=: 3 : 0

tabengine'open $$'
showTtable''
setFormTitle''
tab_panel_select 1
)

launder=: 3 : 0

'\/'charsub y -. CRLF
)

pathof=: ] {.~ [: >: SL i:~ ]

setFormTitle=: 3 : 0

wd 'psel tab; pn ',tabengine 'TFIT'

)

opentt=: 'open' ddefine




if. hasChanged'' do. return. end.
inst=. 4{.x
invalplot''
title=. sw 'Choose a ttable to (x)…'

path=. launder wd sw 'mb open "(title)" *',TPATH_TTABLES
if. 0=#path do. confirm sw '>>> (x)...cancelled' return. end.
TPATH_TTABLES=: pathof path
confirm tabengine inst,SP,path
showTtable''
setFormTitle''
tab_panel_select 1
)


opent=: 3 : 0

if. heldshift'' do. openss'' else. opentt'' end.
)

savea=: 3 : 0

title=. 'Save ttable as…'
nom=. wd sw 'mb save "(title)" *',TPATH_TTABLES
if. 0=#nom do.
  confirm '>>> Save As... cancelled'
else.
  smoutput '+++ savea: nom=',nom
  tabenginex 'sava' ; ijs nom
end.
)

'==================== [tabby] plot.ijs ===================='
0 :0
Tuesday 11 September 2018  00:11:15
-
copied raw from math/tabula-------UNFINISHED
)

coclass 'tabby'

invalplot=: erase&listnameswithprefix bind 'PLOT'
plotb=: 3 : 'replot PLOTF=:''bar'''
plotl=: 3 : 'replot PLOTF=:''line'''
plotp=: 3 : 'replot PLOTF=:''pie'''
plots=: 3 : 'replot PLOTF=:''surface'''

plotx=: 3 : 0
smoutput sw 'plotx: y=(y)'
PLOTX=: firstItem''
PLOT=: tabengine 'PLOT' ; PLOTX ; y
undo''
Y=. {: i.#PLOT
PLOTY=: Y default 'PLOTY'
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY
)

replot=: 3 : 0
if. 0~:nc<'PLOT' do.
  confirm '>>> No action: no plot steps specified yet'
  return.
end.
if. heldshift'' do.
  PLOTY=: (0,PLOTX) -.~ i.#PLOT
else.
  Y=. (0,PLOTX) -.~ ".panel_select
  if. 0<#Y do. PLOTY=: Y end.
end.
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
sellines PLOTY
)

stept=: 3 : 0
theItem=. line 0
setSelection theItem
val=. | tabengine 'VALU' ; theItem
if. val=0 do.
  confirm '>>> cannot plot zero-to-zero'
  return.
end.
if. heldshift'' do.
  z=. (-|val),(|val),100
else.
  if. val<0 do. z=. val,0,100 else. z=. 0,val,100 end.
end.
smoutput '??? what to do with: steps ',":z
)



'==================== [tabby] utilities ===================='

cocurrent 'tabby'

shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $
isNaN=: 128!:5
numeral_i=: [ ([ { [: (([: -. isNaN) # ]) ]) 0 0 ,~ _. ". [: ": ]

n0=: firstnum=: 0&numeral_i
secondnum=: 1&numeral_i
first2nums=: 0 1&numeral_i


smoutput firstnum _55.12 66 77
smoutput secondnum _55.12 66 77
smoutput firstnum '_55.12 66 77'
smoutput secondnum '_55.12 66 77'
smoutput firstnum 'xx _55.12 66 77'
smoutput secondnum 'xx _55.12 66 77'
smoutput firstnum '_55.12 xx 66 77'
smoutput secondnum '_55.12 xx 66 77'
smoutput first2nums 'xx _55.12 xx 66 77'
smoutput first2nums '_55.12 xx 66 77'
smoutput firstnum ,'1'
smoutput firstnum '1'
smoutput -.firstnum 'x'
smoutput -.firstnum 'xx'
smoutput -.firstnum ''
smoutput -.secondnum '1'
smoutput -.secondnum '_55.12 xx'
smoutput first2nums 'xx _55.12 xx 66 77'
smoutput first2nums '_55.12 xx 66 77'

'==================== [tabby] main ===================='
0 :0
Thursday 20 September 2018  08:46:58
)

coclass 'tabby'


heldshift=: 	3 : '1=".sysmodifiers'
heldcmnd=: 	3 : '2=".sysmodifiers'
heldshiftcmnd=:	3 : '3=".sysmodifiers'
heldalt=: 	3 : '4=".sysmodifiers'
heldshiftalt=:	3 : '5=".sysmodifiers'

pickshift=: 3 : 0


(heldshift'') pick 2$boxopen y
)

showTtable=: 3 : 0
wd 'psel tab; set panel items *',tabengine'CTBU'
ITEMS=: tabengine'ITMS'
)

restoreSelection=: 3 : 0


theItem=. line 0
if. -.isValidItem theItem do. setSelection 1
else. wd 'psel tab; set panel select ',panel_select
end.
)

curb=: 3 : 0

($ITEMS) min y max 1
)

setSelection=: 3 : 0
theItem=. curb y
panel_select=: SP ,~ ":theItem
wd 'psel tab; set panel select ',":theItem
)

incSelection=: 3 : 0
theItem=. curb y+firstItem''
panel_select=: SP ,~ ":theItem
wd 'psel tab; set panel select ',":theItem
)

tab_open=: 3 : 0

window_close''
wd TABU
wd 'psel tab'
wd 'pmove ' , ":XYWH
wd 'set g wh _1 64'
refreshInfo''
t=. ,:UNSET
wd 'set cons font fixfont'
wd 'set cons items *',x2f t
wd 'set func font fixfont'
wd 'set func items *',x2f t
wd 'set preci items *', o2f ": i.16
wd 'set unico items *',CONTENT_UNICO
wd 'set panel font fixfont'
wd 'set panel items *',UNSET
wd 'pmoves 1384 23 536 450'
wd 'pshow'
fill_tools ''
)

window_close=: 3 : 0
wd :: EMPTY 'psel tab; pclose;'
)

fill_tools=: 0 ddefine


try. wd 'psel tab'
catch. i.0 0 return. end.
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

set_ucase=: 3 : 0

ssw '>>> set_ucase: dummy placeholder, y=(y)'
)

putsb=: 3 : 0

wd 'psel tab; set sbar text *',":,y
)

clicktab=: 3 : 0
if. 0=#y do. n=. ".tabs_select
else. n=. y
end.
select. n
case. 1 do. fillconsts''
case. 2 do. fillfuncts''
case. 3 do. refreshInfo''
end.
activateTabWithId n
restoreFocusToInputField''
)

fillconsts=: 3 : 0

inst=. (".casec) pick ;:'WUUC VUUC'
TEXT=: tabengine inst ; searchc
wd 'psel tab; set cons items *',listboxSafe TEXT
)

fillfuncts=: 3 : 0

inst=. (".casef) pick ;:'WUUF VUUF'
TEXT=: tabengine inst ; searchf
wd 'psel tab; set func items *',listboxSafe TEXT
)

listboxSafe=: 3 : 0

DQ,~ DQ, y rplc LF ; DQ,SP,DQ
)

finalLF=: ] , LF #~ LF ~: {:

decrementToZero=: 0 >. [: <: default



isErrorMessage=: [: +./ '>>>' E. ,

confirm=: 3 : 0
NOCONFIRM=: decrementToZero'NOCONFIRM'
if. isErrorMessage y do. putsb y [NOCONFIRM=: NOCONFIRM_MAX
elseif. NOCONFIRM=0 do. putsb y
end.
i.0 0
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
i.0 0
)

refreshInfo=: 3 : 0

wd 'set info text *' , tabengine 'INFO'
)

supplyInfo=: 3 : 0

tabengine 'info ',y
confirm sw '+++ supplyInfo: ($y) bytes registered'
)

updin=: updateInfo=: 3 : 0

tabengine 'info ',info
confirm sw '+++ updateInfo: ($y) bytes registered from "info" tab'
)

setpreci=: 3 : 0

if. 0=#y do. i=. preci_select else. i=. ":y end.
wd 'psel tab; set preci select ',i
tabengine 'ssig ',i
showTtable''
restoreSelection''
restoreFocusToInputField''
)

setunico=: 3 : 0

if. 0=#y do. i=. unico_select else. i=. ":y end.
wd 'psel tab; set unico select ',i
tabengine 'ssic ',i
showTtable''
restoreSelection''
restoreFocusToInputField''
)

setunits=: 3 : 0

theItem=. line 0
if. 1>theItem do. wd 'psel tab; set xunit items *' return. end.
z=. tabengine 'UCOM' ; theItem
z=. ~. z ,~ tabengine 'UNIS' ; theItem
z=. ~. z ,~ tabengine 'UNIT' ; theItem
wd 'psel tab; set xunit items *',utf8 f4b z
wd 'psel tab; set xunit select 0'
)

scino=: ":

setcalco=: 3 : 0
wd 'psel tab; set calco text *',calco=:,":y
)

setcalcovalue=: 3 : 0

if. 0<theItem=. line 0 do.
  setcalco scino tabengine 'VALU' ; theItem
else.
  setcalco panel -. LF
end.
)

details=: 3 : 0


if. _1=theItem=.line 0 do. ''
elseif. 0=theItem do. 'To update title: overtype it in value-bar and press Enter'
elseif. do.
  if. 0=#formula=. tabengine 'FMLA' ; theItem do.
    value=. tabengine 'VALU' ; theItem
    sw'(brace theItem) value = (value)'
  else.
    sw'(brace theItem) formula: (formula)'
  end.
end.
)

isValidItem=: 3 : 0

ITEMS e.~ {.y
)

selectValidItem=: 3 : 0

if. isValidItem y do. setSelection y end.
)

updatevaluebar=: 3 : 0


setunits''
setcalcovalue''
)

formu=: 3 : 0

if. 1>theItem=. line 0 do. i.0 0 return. end.
if. 0=#f=.tabengine 'FMLA' ; theItem do.
  confirm '>>> item {(theItem)} has no formula'
else.
  setcalco '=',f
end.
)

label=: 3 : 0

if. 0<theItem=. line 0 do.
  setcalco QT,(tabengine 'NAME' ; theItem)
end.
)

tabenginex=: 3 : 0

tabengine y
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

interpretCalco=: 3 : 0



if. 0=#y do. y=. dltb calco else. y=. dltb y end.

if. '$$'-:y 		do. tabenginex 'samp' 		return. end.
if. 0=theItem=.line 0 	do. tabenginex 'titl' ; calco 	return. end.
if. -.isValidItem theItem	do. confirm '>>> no line selected' 	return. end.
if. -.isNaN ny=. _.". y 	do. tabenginex 'valu' ; theItem ; y 	return. end.

select. {.y
case. '/' do. tabenginex }.y
case. '$' do. tabenginex 'open' ; }.y
case.  QT do. tabenginex 'name' ; theItem ; }.y
case. '=' do. tabenginex 'fmla' ; theItem ; }.y
case. '+' do. tabenginex 'addv' ; theItem ; }.y
case. '-' do. tabenginex 'subv' ; theItem ; }.y
case. '*' do. tabenginex 'mulv' ; theItem ; }.y
case. '/' do. tabenginex 'divv' ; theItem ; }.y
case. '^' do. tabenginex 'rtov' ; theItem ; }.y
case.     do. theItem interpretQuantity y
end.
)

interpretQuantity=: 4 : 0

]qty=. tabengine 'UUUU' ; y
sllog 'interpretQuantity y qty'
tabenginex 'vunn' ; x ; qty
)

'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
sllog=: smoutput@llog
wd 'timer 0'
load '~Gitcal/cal.ijs'

tabengine=: tabengine_cal_
 sesi_z_=: smoutput
tt_z_=: tabengine_z_=: tabengine

if. y-:0 do. tabengine 'Inic'
else.        tabengine 'Init'
end.
TPATH_TTABLES=: tabengine'TPTT'
tab_open''
setpreci 3
setunico 1
setSelection 1
updatevaluebar''
restoreFocusToInputField''
)

start''
