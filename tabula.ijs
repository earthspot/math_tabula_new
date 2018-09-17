0 :0
Thursday 6 September 2018  18:09:10
-
TABULA: scientific units calculator - simplified architecture
)

clear 'tabby'
coclass LOC=.'tabby'
clear LOC
BLOC=: <,LOC
coinsert 'jgl2'

AABUILT=: '2018-09-12  03:19:38'
AABUILT=: '2018-09-12  05:18:15'
AABUILT=: '2018-09-12  05:21:35'
AABUILT=: '2018-09-12  05:29:12'
AABUILT=: '2018-09-12  05:32:41'
AABUILT=: '2018-09-12  05:41:10'
AABUILT=: '2018-09-12  05:49:03'
AABUILT=: '2018-09-12  05:50:10'
AABUILT=: '2018-09-12  06:11:58'
AABUILT=: '2018-09-12  16:39:23'
AABUILT=: '2018-09-12  17:52:46'
AABUILT=: '2018-09-15  11:57:14'
AABUILT=: '2018-09-16  23:23:25'
AABUILT=: '2018-09-16  23:53:51'
AABUILT=: '2018-09-17  00:01:36'
AABUILT=: '2018-09-17  00:04:37'
AABUILT=: '2018-09-17  00:24:49'
AABUILT=: '2018-09-17  01:57:42'
AABUILT=: '2018-09-17  03:27:38'
AABUILT=: '2018-09-17  13:05:28'
AABUILT=: '2018-09-17  13:13:20'
AABUILT=: '2018-09-17  15:19:57'
AABUILT=: '2018-09-17  15:22:45'
AABUILT=: '2018-09-17  15:23:14'
AABUILT=: '2018-09-17  15:23:36'
AABUILT=: '2018-09-17  15:23:54'
AABUILT=: '2018-09-17  15:24:05'
AABUILT=: '2018-09-17  15:24:32'
AABUILT=: '2018-09-17  15:25:05'
AABUILT=: '2018-09-17  15:25:12'
AABUILT=: '2018-09-17  15:25:48'
AABUILT=: '2018-09-17  15:26:20'
AABUILT=: '2018-09-17  15:27:12'
AABUILT=: '2018-09-17  15:28:00'
AABUILT=: '2018-09-17  15:28:44'
AABUILT=: '2018-09-17  15:28:59'
AABUILT=: '2018-09-17  15:30:57'

'==================== [tabby] constants ===================='

cocurrent 'tabby'

sysmodifiers=: ,'0'



CONTENT_UNICO=: 0 : 0
 m^3/kg/s^2
 m³/(kg s²)
 m³ kg⁻¹ s⁻²
 m³·kg⁻¹·s⁻²
)

CONTENT_UNICO=: 0 : 0
 m/kg/s^2
 m/(kg s²)
 m kg⁻¹ s⁻²
 m·kg⁻¹·s⁻²
)

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

TABENGINE_RESPONSE_Init=: 0 : 0
dummy tabengine Init confirmation
)

TABENGINE_RESPONSE_INFO=: 0 : 0
dummy tabengine INFO content
)

TABENGINE_RESPONSE_NOT_IMPLEMENTED=: 0 : 0
dummy tabengine NOT IMPLEMENTED--
)

BS=: '\'
COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DESELECT=: 1
DIAMETER=: 30
ITEMS=: i.0
L0=: 0
L1=: 1
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
16 hlpt      Help for TABULA
17 showttinf Show ttable info / edit ttable info
18 hold      Toggle Hold / Toggle Transient Hold
19 siunt     Convert to SI Units
20 iedit     Edit item name / Edit item formula
21 setv0     Set value to 0
22 set1u     Set value to 1 / Set value to -1
23 add1u     Add 1 / Subtract 1
24 addpc     Add 1% / Subtract 1%
25 by2pi     Times PI / Times 2*PI
26 black     User function
27 red       User function
28 green     User function
29 blue      User function
30 delit     Delete line
31 merge     Merge selected lines
)

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

childlike=: setv0_like

tab_newtt_button=: notimp
tab_opens_button=: openss
tab_opent_button=: opent
tab_appet_button=: notimp
tab_savex_button=: notimp
tab_saves_button=: notimp
tab_savet_button=: notimp
tab_savea_button=: notimp
tab_stept_button=: notimp
tab_plotl_button=: notimp
tab_plotb_button=: notimp
tab_plotp_button=: notimp
tab_plots_button=: notimp
tab_close_button=: notimp
tab_print_button=: notimp
tab_quit_button=:  window_close
tab_undo_button=:  'Undo'&undoredo_like
tab_redo_button=:  'Redo'&undoredo_like
tab_copal_button=: notimp
tab_label_button=: notimp
tab_formu_button=: notimp
tab_erasf_button=: notimp
tab_siunt_button=: notimp
tab_movit_button=: notimp
tab_mvitu_button=: notimp
tab_newsl_button=: notimp
tab_merge_button=: notimp
tab_delit_button=: notimp
tab_dupit_button=: notimp
tab_updex_button=: notimp
tab_updin_button=: notimp
tab_menu_button=: notimp
tab_repet_button=: notimp
tab_tthld_button=: notimp
tab_thold_button=: notimp
tab_hidel_button=: notimp
tab_unhid_button=: notimp
tab_ttabl_button=: notimp
tab_conss_button=: notimp
tab_funcs_button=: notimp
tab_infor_button=: notimp
tab_trace_button=: notimp
tab_trach_button=: notimp
tab_traci_button=: notimp

tab_additems_button=: notimp
tab_subitems_button=: notimp
tab_mulitems_button=: notimp
tab_divitems_button=: notimp
tab_powitems_button=: notimp

tab_hlpt_button=: notimp
tab_hlpc_button=: notimp
tab_hinf_button=: notimp

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
n=. 16
h=. w=. 32
'X Y'=. 2{.".sysdata
z=. n* Y>h
TOOLID=: z + <. X%w
fill_tools TOOLID
confirm 3 }. TOOLID { TOOLHINT

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

if. 0<#y do.
  setSelection y
  panel_select=: SP ,~ ":y
end.
sllog 'tab_panel_select panel_select y'
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
restoreFocusToInputField''
)

tab_default=: 3 : 0
sllog 'tab_default sysevent syschild'
)
tools=: 3 : 'b4x firstwords 3}."1 TOOLHINT'
0 :0
STRATEGY
Develop a working scheme for one or two *standard* handlers.
Once debugged, propagate to other handlers labelled: LIKE add1u
)

newtt=: 'newt'&undoredo_like

copal=: 3 : 0

wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

undoredo=: undoredo_like=: 'Undo Redo' ddefine

confirm tabengine pickshift 2$ ;:x
showTtable''
restoreFocusToInputField''
)

savts=: 'savt savs'&undoredo_like

additems=: additems_like=: 'plus' ddefine

confirm tabengine x,SP,panel_select
showTtable''
setSelection _
restoreFocusToInputField''
)

mulitems=: 'mult'&additems_like

subitems=: subitems_like=: 'minu' ddefine

if. heldshift'' do. confirm tabengine x ; L1 ; L0
else.               confirm tabengine x ; L0 ; L1
end.
showTtable''
setSelection _
restoreFocusToInputField''
)

divitems=: 'divi'&subitems_like
powitems=: 'powe'&subitems_like

movud=: 3 : 0

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

confirm tabengine 'newu /'
showTtable''
setSelection _
restoreFocusToInputField''
)

equal=: 'equl'&additems_like
delit=: 'dele'&additems_like

hold=: 3 : 0

inst=. pickshift ;:'holm hold'
confirm tabengine inst,SP,panel_select
showTtable''
restoreSelection''
restoreFocusToInputField''
)

iedit=: 3 : 0

if. heldshift'' do. formu'' else. label'' end.
)

setv0=: setv0_like=: 'zero' ddefine

confirm tabengine x ; L0
showTtable''
restoreSelection''
restoreFocusToInputField''
)

siunt=: 'cvsi'&setv0_like

set1u=: set1u_like=: 'onep onen' ddefine

inst=. pickshift 2$ ;:x
confirm tabengine inst ; L0
showTtable''
restoreSelection''
restoreFocusToInputField''
)

add1u=: add1u_like=: 'addv subv' ddefine

inst=. pickshift 2$ ;:x
confirm tabengine inst ; L0 ; 1
showTtable''
restoreSelection''
restoreFocusToInputField''
)
addpc=: 'addp subp'&add1u_like
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

textview HELP
)

showttinf=: 3 : 0

ttinf''
activateTabWithId 3
)

'==================== [tabby] open.ijs ===================='
0 :0
Tuesday 11 September 2018  01:47:13
-
CONTAINS IN-LINE MESSAGES --replace if MESSAGE table provided
-

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
    1 return.
  end.
end.
0 return.
)

openss=: 3 : 0

tabengine'open $$'
showTtable''
tab_panel_select 1
)

launder=: 3 : 0

'\/'charsub y -. CRLF
)

pathof=: ] {.~ [: >: SL i:~ ]

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
tab_panel_select 1
)
opent=: 3 : 0
if. heldshift'' do. openss'' else. opentt'' end.
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
PLOTX=: L0
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



'==================== [tabby] utilities ===================='

cocurrent 'tabby'

shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $
numeral_i=: [ ([ { [: (([: -. 128!:5) # ]) ]) 0 0 ,~ _. ". [: ": ]

n0=: firstnum=: 0&numeral_i
secondnum=: 1&numeral_i
first2nums=: 0 1&numeral_i

0 :0
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
smoutput firstnum 'x'
smoutput firstnum 'xx'
smoutput firstnum ''
smoutput secondnum '1'
smoutput secondnum '_55.12 xx'
smoutput first2nums 'xx _55.12 xx 66 77'
smoutput first2nums '_55.12 xx 66 77'

'==================== [tabby] main ===================='
0 :0
Friday 31 August 2018  21:14:03
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
wd 'psel tab; set panel select ',panel_select
)

curb=: 3 : 0

($ITEMS) min y max 1
)

setSelection=: 3 : 0
wd 'psel tab; set panel select ',":curb y
)

incSelection=: 3 : 0
wd 'psel tab; set panel select ',":curb L0=:L0+y
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
wd 'set unico items *',CONTENT_UNICO
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

set_ucase=: 3 : 0

ssw '>>> set_ucase: dummy placeholder, y=(y)'
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

fillconsts=: 3 : 0

set_ucase casec-: ,'0'
wd 'psel tab; set cons items *',LF,~TEXT=:tabengine 'VUUC ',searchc
)

fillfuncts=: 3 : 0

set_ucase casef-: ,'0'
wd 'psel tab; set func items *',LF,~TEXT=:tabengine'VUUF ',searchf
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
i.0 0
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
  tabengine 'info ',y
  nom=. '_ 'charsub tabengine'TNAM'
  confirm sw 'Info: $=($y) updated in t-table: (nom)'
end.
)

setpreci=: 3 : 0

if. 0=#y do. i=. preci_select else. i=. ":y end.
wd 'psel tab; set preci select ',i
tabengine 'prec ',i
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
z=. tabengine 'UCOM' ; L0
z=. ~. z ,~ tabengine 'UNIS' ; L0
z=. ~. z ,~ tabengine 'UNIT' ; L0
wd 'psel tab; set xunit items *',utf8 f4b z
wd 'psel tab; set xunit select 0'
)

scino=: ":

setcalco=: 3 : 0
wd 'psel tab; set calco text *',calco=:,":y
)

details=: 3 : 0

if. y=0 do. 'To update title: overtype it and press Enter'
else. (brace y),SP,tabengine 'FMLA ',":y
end.
)

'==================== [tabby] calcmd.ijs ===================='
0 :0
Sunday 16 September 2018  23:09:34
-
TABULA input line interpreter
Withdraw the single-char command set
-
>>> REALLY NEEDS A DAISYCHAIN !!
)

tabenginex=: 3 : 0

confirm tabengine y
showTtable''
restoreSelection''
restoreFocusToInputField''
)

calcmd=: 3 : 0

sess=. empty
sess=. ssw



if. 0=#y do. y=. dltb calco end.
c0=. {.y
yy=. dlb }.y
select. c0
case. '/' do. sess 'calcmd: Engine cmd'
  tabenginex yy return.
case. '$' do. sess 'calcmd: load numbered sample: (yy)'
  tabenginex 'open ',yy return.
end.
if. '_1'-: panel_select do. confirm '>>> Select a line to work with' return. end.

if. (0<#y) *. (0-:L0) do.
  tabenginex 'titl' ; y
  return.
end.
VALUE=: UNDEFINED [ UNITS=: '??' [ RIDER=: ''
if. ']['-: 2{._1|.y do. sess 'calcmd: units (forced)'
  if. isunits z=. y -. '][' do.
    tabenginex 'unit' ; L0 ; z
  else. confirm '>>> bad units:' ; z
  end.
elseif. c0='=' do. sess 'calcmd: Formula (yy)'
  tabenginex 'fmla' ; L0 ; yy
elseif. c0=QT do. sess 'calcmd: label (forced)'
  tabenginex 'name' ; L0 ; yy
elseif. c0 e. '+-*/^' do. sess 'calcmd: increment (yy)'
  increment yy
elseif. isnumeric y do. sess 'calcmd: numeric'
  tabenginex 'valu' ; L0 ; y
elseif. isunits y do. sess 'calcmd: units'
  tabenginex 'unit' ; L0 ; UNITS
  setunits''
elseif. isvalunits y do. sess 'calcmd: value+units[+rider]'
  if. 0<#RIDER do.
    tabengine 'name' ; L0 ; RIDER
  end.
  setunits'' [ tabengine 'unit' ; L0 ; UNITS
  tabenginex 'valu' ; L0 ; VALUE
elseif. isnumvec y do. sess 'calcmd: plot instruction'
  invalplot''
  plotx y rplc '-' ; '_'
elseif. do. sess 'calcmd: label (default)'
  tabenginex 'name' ; L0 ; y
end.
)

isnumeric=: 3 : 0
-. any (128!:5) _.". y
)

isunits=: 3 : 0
-. '0 *' -: tabengine 'uuuu 1 ',UNITS=: deb y
)

isvalunits=: 3 : 0
if. 1<#z=. _". y do.
  if. (_=VALUE=: {.z) +. (_~:1{z) do. 0 return. end.
else. 0 return.
end.
'y r'=. 2{. QT cut y
RIDER=: dlb r
if. 0=#UNITS=: deb SP dropto y do. UNITS=: '/' end.
isunits UNITS
)


'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
sllog=: smoutput@llog
wd 'timer 0'
require '~Gitcal/cal.ijs'

tabengine=: tabengine_cal_
 sesi_z_=: smoutput
tt_z_=: tabengine_z_=: tabengine f.
tabengine'Init'
TPATH_TTABLES=: tabengine'TPTT'
tab_open''
setpreci 3
setunico 1
tab_panel_select 1
)

start''
