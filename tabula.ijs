0 :0
Tuesday 2 April 2019  17:37:29
-
TABULA: scientific units calculator
-simplified architecture
)
coclass LOC=.'tabby'
clear LOC
coinsert 'jgl2'
onload_z_=: empty
startonload_z_=: start_tabby_

fixfont=: 3 : 0

'"Menlo" 14'
)
FORM_POSITION=: _2
PNG=: jpath '~Gittab/tabula-toolbar.png'



]USERTOOLS_z_=: jpath '~Gittab/usertools.ijs'

AABUILT=: '2019-04-03  12:54:29'
AABUILT=: '2019-04-04  09:22:51'
AABUILT=: '2019-04-05  05:08:59'
AABUILT=: '2019-04-05  05:40:05'
AABUILT=: '2019-04-05  16:36:46'
AABUILT=: '2019-04-05  16:42:20'
AABUILT=: '2019-04-05  19:27:17'

'==================== [tabby] constants ===================='

cocurrent 'tabby'

ABOUT=: 0 : 0
TABULA: scientific calculator
-works with SI units.
)

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
CM=: ','
CO=: ':'
DT=: '.'
COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DESELECT=: 1
DG=: '°'
DIAMETER=: 25
DQ=: '"'
IDE=: 1
ITEMS=: i.0
NOCONFIRM_MAX=: 20
PEN_WIDTH=: 3
PMOVES=: 0
QT=: ''''
SC=: ';'
SL=: '/'
TABNDX=: 0
TIMER_HOVER=: 1000
UNSET=: '<UNSET>'
XYWH=: 1500 22 536 450


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

'==================== [tabby] utilities ===================='

cocurrent 'tabby'

imgview=: 3 : 0


wd :: 0: 'psel form; pclose'
a=: readimg_jqtide_ nom=. y
wd 'pc form closeok; pn ',nom
wd 'cc g isidraw'
wd 'set g minwh ', ":(|.$a)
wd 'pshow'
glsel 'g'
glpixels 0 0 , (|.$a), ,a
)

jpgview=: 3 : 0
z=. jpath '~Resources/',y,'.jpg'
imgview z
)

sampleview=: 3 : 0

NSAMPLE=: >: _1 default 'NSAMPLE'
if. -. NSAMPLE e. i.8 do. NSAMPLE=: 0 end.
jpgview '$',":NSAMPLE
)

dtlf=: #~ ([: +./\. (10{a.)&~:)
shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $
isNaN=: 128!:5
isNumericJ=: (3 : '-.any isNaN _.". y') :: 0:
numeral_i=: ([ ([ { [: (([: -. isNaN) # ]) ]) _. ". [: ": ]) :: _:

n0=: firstnum=: 0&numeral_i
secondnum=: 1&numeral_i
first2nums=: 0 1&numeral_i

test_numeral_i=: 3 : 0

DN=. _
list0=: '_55.12 66 77'
list1=: '_55.12 xx 66 77'
list2=: 'xx _55.12 66 77'
list3=: 'xx _55.12 xx 66 77'
a0=: _55.12 [a1=: 66 [a2=: 77 [a3=: _55.12 66
foo=. assert&(-:/)
foo a0 ; 0 numeral_i list1
foo 66 ; 1 numeral_i list1
foo 77 ; 2 numeral_i list1
foo DN ; 3 numeral_i list1
foo DN ; 4 numeral_i list1
foo DN ; 5 numeral_i list1
foo DN ; 99 numeral_i list1
foo a0 ; firstnum ".list0
foo a1 ; secondnum ".list0
foo a0 ; firstnum list0
foo a1 ; secondnum list0
foo a0 ; firstnum list2
foo a1 ; secondnum list2
foo a0 ; firstnum list1
foo a1 ; secondnum list1
foo a3 ; first2nums list3
foo a3 ; first2nums list1
foo 1  ; firstnum ,'1'
foo 1  ; firstnum '1'
foo DN ; firstnum 'x'
foo DN ; firstnum 'xx'
foo DN ; firstnum ''
foo DN ; secondnum ''
foo DN ; secondnum '1'
foo DN ; secondnum '_55.12 xx'
foo a3 ; first2nums list3
foo a3 ; first2nums list1
)

'==================== [tabby] handy4tab ===================='
cocurrent 'z'

and=: *.
any=: +./
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
cuT=: <;._2
ddefine=: 1 : 'm&$: : (4 : 0)'

default=: 0&$: :(4 : 0)






if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

diriac=: 0&$: :(4 : 0)





sortd=. \:~ :\:
if. y-:'?' do. sst how elseif. y-:'??' do. ot how end.
if. 0=#y do. y=. '~temp/*.ijs' end.
if. x<0 do. x {. sortd ~. 3 diriac y return. end.
z=. {."1 (1!:0 jpath y)
if. x-:0 do. z return. end.
fo=. [: > [: {. DT cut ]
z=. fo each z
if. x-:1 do. z return. end.
fprefix=. '*' -.~ ([: >: '/' i:~ ]) }. ] {.~ '.' i.~ ]

n=. #fprefix y
z=. n }. each z
if. x-:2 do. z return. end.

sort ~. ,> 0 ".each z -.each < a. -. '1234567890'
)

platform=: 3 : 0

if. y-: 1 do. z=. 'IFJHS';'IFQT'
else. z=. 'IF' nl_z_ 0
end.
('=:',~"1 >z),. ": vv ". ','sfy z
)




s=. 3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0
m=. < '(' ; ')'
smresolve=: ((0;s;m) ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
ssw=: smoutput&sw

dtlf=: #~ ([: +./\. (10{a.)&~:)
edit=: [: open [: , [: > whichscript_z_
extx=: (0 < [: # ]) # ] , [ #~ [: -. '.' e. ]
fname=: ([: >: '/' i:~ ]) }. ] {.~ '.' i:~ ]
fw=: firstwords=: (' ' taketo ])"1
ijs=: '.ijs'&extx
isBool=: isBools *. isScalar
isBools=: [: all 0 1 e.~ ]
isEmpty=: 0 = [: */ $
isScalar=: [: {. 0 = [: $ $
tmp=: [: jpath '~temp/' , ijs@":
lasttemp=: 3 : 'tmp >./3 diriac tmp ''*'''
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
log=: [: ": ;: ,. [: ".&.> ;:
max=: $:/ :>.
min=: $:/ :<.
o2f=: 3 : 'LF(I. y=SP)}y'
or=: +.
ot=: empty
paren=: 1 |. ')(' , ":
pathof=: ] {.~ [: >: '/' i:~ ]
pc=: '%' ,~ [: ": [: <. 0.5 + 100 * 88350 %~ ]
sllog=: smoutput@llog
sortd=: \:~ :\:
sq=: *: :[:
sqrt=: %: :[:
square=: *: :[:
st=: [: 1!:1 [: < tmp
sst=: smoutput@st
temp=: lasttemp`tmp@.(*@#@])
to=: [ + [: i. [: >: -~
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)

'==================== [tabby] forms ===================='
0 :0
Wednesday 6 March 2019  09:22:44
)

coclass 'tabby'

TABU=: 0 : 0
pc tab;pn Tabby;
menupop "File";
menu newtt "&New" "Ctrl+N" "Start a new t-table" "new";
menu opent "&Open..." "Ctrl+O" "Open a t-table from user library" "open...";
menu appet "&Append..." "" "Append a t-table from user library" "append...";
menu savex "&Save" "Ctrl+S" "Save current t-table under existing name" "savex";
menu savea "Save As..." "" "Save current t-table under new name" "save as...";
menu savet "Save As Title" "" "Save current t-table under title shown" "savet";
menusep;
menu opens "Open SAMPLE" "Ctrl+Shift+O" "Open SAMPLE t-table" "sample";
menu openn "Open Sample 0-9" "" "Open a numbered sample t-table" "sample";
menu saves "Save As Sample" "" "Save current t-table as default sample" "saves";
menu delsa "Delete Saved Sample" "" "Delete saved default sample" "delete sample";
menusep;
menu stept "Plot 0 to (value)" "" "plot values" "plot";
menu stepu "Plot 1 to (value)" "" "plot values" "plot";
menu stepm "Plot -(value) to (value)" "" "plot values" "plot";
menu plotl "Line Chart" "" "Specify plot: line" "line";
menu plotb "Bar Chart" "" "Specify plot: bar" "bar";
menu plotp "Pie Chart" "" "Specify plot: pie" "pie";
menu plots "Surface Chart" "" "Specify plot: surface" "surface";
menusep;
menu close "Close" "" "Close current t-table" "close t-table";
menu revtt "&Revert changes" "" "Revert changes to t-table" "revert";
menusep;
menu print "Print" "" "Print current t-table" "print t-table";
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
menu updex "Update Exchange Rates" "" "Update currency exchange rates for this t-table" "upd-exch";
menu updin "Update Notes" "" "Update Notes for this t-table" "upd-inf";
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
menu ttabl "Show Ttable" "Ctrl+T" "Show t-table display" "t-table";
menu conss "Show Constants List" "" "Show consts tab" "consts";
menu funcs "Show Functions List" "" "Show functs tab" "functs";
menu infor "Show Ttable Notes" "Ctrl+I" "Show Notes tab" "info";
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
menu hinf "Notes for this t-table" "" "t-table Notes" "info";
menu togi "Toggle J IDE" "" "toggle IDE" "IDE";
menupopz;
bin v;
 bin hs;
  maxwh 511 63; minwh 511 63; cc g isidraw;
 bin sz;
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
cc cons table;
bin h;
cc cappend button;cn "Append";
cc searchc edit;
cc casec checkbox;cn "case-sensitive";
bin z;
tabnew Functions;
cc func table;
bin h;
cc fappend button;cn "Append";
cc searchf edit;
cc casef checkbox;cn "case-sensitive";
bin z;
tabnew Notes;
cc info editm;
bin h;
cc updin button;cn "Update";
bin s1z;
tabend;
cc sbar static; cn "(status unset)";
bin z;
)

0 :0
wd 'psel tab; pmove ',": XYWH
form _1
form _2
)

form=: 3 : 0





'Ws Hs'=. 2 3{".wd'psel tab; qscreen'
Hd=. 70
'X Y W H'=. ".wd'qform'
if. y<0 do.
  'W H'=. 536 450
  wd 'pmove _1 _1 ',": W,H
end.
'X0 Y0'=. 1 23
'X1 Y1'=. (Ws - W),(Hs - H+Hd)
select. |y
case. 1 do. 'X Y'=. X0,Y0
case. 2 do. 'X Y'=. X1,Y0
case. 3 do. 'X Y'=. X0,Y1
case. 4 do. 'X Y'=. X1,Y1
case. 5 do. wd 'pcenter' return.
end.
wd 'pmove ',": X,Y,W,H
)

'==================== [tabby] graphic ===================='
0 :0
Thursday 4 April 2019  09:11:06
-
TO DO
circle - draw it round item number
animate a mouseclick
draw a selection bar
fetch boxed array of current t-table, plus arrows
add scrollbar, displace the image
write caption
draw arrows
(CENTER not used)
-
  wd'psel tre; qform'
  sminfo_z_=: wdinfo_z_=: echo_z_
-
PTS -a list of points at which {1} {2} … drawn
redraw should draw the quantities & names
click -sets the line selection
-
We need a scrollbar
Set node spacing wider to make a smallish t-table still need scrolling
Change arrow color when hovering in its col.
Draw orange-circle around the line number {1} {2} …
click to change the line number itself.
tre_hover_off -should redraw without the orange circle.
Click on value -superimpose a roving edit to change it.
Allow multi selections
Move selection OR line up/down with toolbar and arrows
Allow drag'n'drop.
Write out a pdf of screen
)

clear 'tree'
coclass LOC=.'tree'
clear LOC
coinsert 'jgl2'

ITEMS=: 1 + i.5
PTS=: 100j50 100j100 100j150 100j200 100j250

NODEID=: 1
NODE=: ''

TREEPOS=: 1380 500 530 550

TREE=: 0 : 0
pc tre;pn T-Table Tree;
cc g isidraw;
cc sbar static; cn "(status unset)";
)

window_close=: 3 : 'wd :: 0: ''psel tre; pclose;'''

start=: 3 : 0

TIMER_HOVER=: 1000
PEN_WIDTH=: 3
COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
MAX_DISTANCE=: 15
MAX_DISTANCE=: 100
FONT=: 'Menlo'
'FONTSIZE GCOUNT GWIDTH GDROP DIAMETER CENTER DISP'=: 14 24 20 18 36 6j12 _12j_7
sysevent=: ''
window_close''
wd TREE
wd 'pmove ',": TREEPOS
wd 'pshow'
icp=: _1
redraw''
)


putsb=: 3 : 0

wd 'psel tre; set sbar text *',":,y
)

circle=: 4 : 0

clicked=. x
ring=. clicked pick COLOR_HOVER ; COLOR_CLICK
glsel 'g'
glpen PEN_WIDTH [glrgb ring
xy=. +.y
wh=. 2#DIAMETER
radius=. <.DIAMETER%2
glellipse (xy - radius) , wh
)
tre_close=: window_close

tre_g_mbldown=: 3 : 0


	ssw '+++ tre_g_mbldown y=(y) NODEID=(NODEID) NODE=(NODE)'
1 redraw NODEID
)

tre_g_mblup=: 3 : 0

NODE=: 'CLICKED',":NODEID
	ssw '+++ tre_g_mblup y=(y) NODEID=(NODEID) NODE=(NODE)'
)

tre_g_mmove=: hover

hover=: 3 : 0
'X Y'=: 2{.".sysdata
PT=: X j. Y
icp=: closest pjmouse''
if. _=icp do. signal '(no tool selected)' return. end.
signal 2 pick icp{CNB
redraw icp

sys_timer_z_=: hover_off_nut_
wd'timer ',":TIMER_HOVER
)

signal=: empty

tre_hover_off=: 3 : 0
wd 'timer 0'
	ssw '+++ tre_hover_off: X=(X) Y=(Y)'
)

closest=: 3 : 0

z=. |PTS-y
ld=. <./z
if. ld>MAX_DISTANCE do. _ return. end.
i=. z i. ld
)


sysndata=:   3 : 'y{ 12{. 0&".sysdata' "0
ptmouse=: sysndata bind 0 1
pjmouse=: 3 : 'j./ ptmouse y'
formxy=:  sysndata bind 2 3
bnleft=:  sysndata bind 4
bnmid=:   sysndata bind 5
dnctrl=:  sysndata bind 6
dnshift=: sysndata bind 7



bnright=: sysndata bind 8

nwheel=:  sysndata bind 11

clickleft=: 3 : 0
Handler 'clickleft'
icp=: closest pjmouse''
if. _=icp do. signal '(no tool selected)' return. end.
i.0 0
)

redraw=: 0 ddefine


CTB=: tabengine_cal_'CTBB'
putsb sw 'x=(x) y=(y) X=(X) Y=(Y) PT=(PT) icp=(icp) NODEID=(NODEID) NODE=(NODE)'
wd 'psel tre'
blank=. COLOR_WHITE
spot=. x pick COLOR_HOVER ; COLOR_CLICK
glsel 'g'
glclear''
if. icp e. ITEMS-1 do. x circle icp{PTS end.
glfont sw '"(FONT)" (FONTSIZE)'
glrgb blank
glpen 1
glbrush'' [glrgb spot
for_i. i.#PTS do.
  gltextxy +. DISP + i{PTS
  gltext brace i+1
end.
glpaint''
)


onload 'start_tree_ NIL'

'==================== [tabby] tools ===================='

cocurrent 'tabby'

TOOLHINT=: >cutopen 0 : 0
0  newtt     New empty t-table ⇧ Revert changes to t-table
1  opent     Open SAMPLE ⇧ Open t-table… ⌘ Open SAMPLEn ⇧⌘ ttbrowse
2  savts     Save t-table as SAMPLE ⇧ Save t-table as Title
3  copal     Copy entire t-table
4  undoredo  Undo ⇧ Redo ⌘ Animated Undo<-->Redo
5  additems  Add {ABC}
6  subitems  {A} minus {B} ⇧ {B} minus {A}
7  mulitems  Multiply {ABC}
8  divitems  Divide {A} by {B} ⇧ Divide {B} by {A}
9  powitems  {A} ^ {B} ⇧ {B} ^ {A}
10 stept     Plot 0 to {A} ⇧ Plot -{A} to {A}
11 replot    Replot {ABC} only ⇧ Replot all items
12 movud     Move {A} up ⇧ Move {A} down
13 movtb     Move {A} to top ⇧ Move {A} to bottom
14 newsl     New line
15 equal     New line = {A}
16 hlpt      Help for TABULA ⇧ Help for CAL
17 showttinf Show t-table info ⇧ edit t-table info
18 hold      Toggle Hold on {A} ⇧ Toggle Transient Hold on {A}
19 siunt     Convert {A} to SI Units
20 iedit     Edit name of {A} ⇧ Edit formula of {A}
21 setv0     Set {A} to 0 ⇧ Animation Step
22 set1u     Set {A} to 1 ⇧ Set {A} to -1
23 add1u     Add 1 to {A} ⇧ Subtract 1 from {A}
24 addpc     Add 1% to {A} ⇧ Subtract 1% from {A}
25 by2pi     {A} times PI ⇧ {A} times 2*PI
26 anima     Animate ⇧ Start animation
27 red       User function
28 green     User function
29 blue      User function
30 delit     Delete {A}
31 merge     Merge {ABC}
32 empty     No operation
)

'==================== [tabby] calco ===================='
0 :0
Saturday 30 March 2019  20:22:29
-
replaces interpretCalco
old interpretCalco --> interpretCalco0
-
We need an extended isNumeric which accepts blind decimals and sci#s
)

coclass 'tabby'

blink=: empty

theItem=: 1

register=: 3 : 0


VEX=: y
)

make_daisychain=: 3 : 0


d=: 'calco_' nl 3
promote 'calco_singlet'
promote 'calco_yesno'
promote 'calco_title'
promote 'calco_sample'
]z=. (; d,each <' ::'),'calcoErr'
daisychain=: 13 : ('(',z,')y')
i.0 0
)

interpretCalco=: 3 : 0

if. 0=#y do. y=. dltb calco else. y=. dltb y end.
blink 0
VEX=: '<UNSET>'
theUnit=: >tabengine 'UNIT' ; theItem=: line 0
msg '+++ interpretCalco: theItem=(theItem) theUnit=(theUnit) y=[(y)]'
z=. daisychain y
msg '--- interpretCalco: EXITS, VEX=(VEX)'
z return.
)

noSelection=: 3 : 'theItem<0'

promote=: 3 : 0

d=: ~. d ,~ boxopen y
)

calcoErr=: 3 : 0
msg '>>> calcoErr: none chime: y=[(y)]'
sw'(y) [???]'
)

calco_misc=: 3 : 0
register'calco_misc'
blink 'blue'

if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞' else. infinity=. 'infinity' end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0
)

calco_deg=: 3 : 0
register'calco_deg'
blink'white'
assert. -. noSelection''
assert. theUnit -: 'deg'
tabenginex 'valu' ; theItem ; ". y rplc 'deg' ; '' ; DG ; ''
)

calco_dms=: 3 : 0
register'calco_dms'
blink'white'
assert. -. noSelection''
assert. theUnit -: 'dms'
tabenginex 'valu' ; theItem ; chaldean cut_dms y
)

chaldean=: 3 : 0

'd m s'=. y
d+(m%60)+s%3600
)

cut_dms=: 3 : 0

z=. y -. SP,DQ
d=. ". DG taketo z
z=. DG takeafter z
m=. ". QT taketo z
s=. ". QT takeafter z
d;m;s
)

calco_number=: 3 : 0
register'calco_number'

blink'white'
assert. -. noSelection''
assert. isNumeric y
tabenginex 'valu' ; theItem ; ". j4sci y
)

calco_force=: 3 : 0
register'calco_force'

blink'white'
assert. -. noSelection''
assert. '[' e. y
assert. 0< # un=. dltb ']'taketo '['takeafter y
assert. 0< # nn=. dltb '['taketo y
assert. isNumeric nn
r=. tabengine 'unit' ; theItem ; un
if. -.isErrorMessage r do.
  tabenginex 'valu' ; theItem ; ". j4sci nn
else. confirm r
end.
)

isNumeric0J=: (3 : 0) :: 0:

if. '-+' e.~ {.y do. y=. }.y end.

assert. isNumericJ '0',y
)

j4sci=: 3 : 0

if. DT={.y do. y=. '0',y end.
y rplc '-.' ; '_0.' ; '-' ; '_' ; 'E' ; 'e'
)
0 :0
j4sci '1.23E5'
j4sci '1.23E-5'
j4sci '-1.23E-5'
j4sci '-1.23'
j4sci '1.23'
j4sci '.23'
j4sci '-.23'
)

isNumeric=: (3 : 0) :: 0:

if. (isNumericJ y)and(-. 'E' e. y) do. 1 return. end.
assert. isNumericJ p=. 'e' taketo z
assert. isNumericJ q=. 'e' takeafter z
assert. isScalar n=. ". j4sci z
1 return.
)

calco_blindDecimal=: 3 : 0
register'calco_blindDecimal'

blink'white'
assert. -. noSelection''
assert. 1= +/ DT = y
assert. isNumeric z=. '0',y
tabenginex 'valu' ; theItem ; ".z
)

calco_singlet=: 3 : 0
register'calco_singlet'
blink'white'
assert. 1=#y
assert. -. noSelection''
if. isDigit y do. tabenginex 'valu' ; theItem ; y return. end.
select. y
case. ,'-' do. tabenginex 'negv' ; theItem return.
case. ,'*' do. tabenginex 'sign' ; theItem return.
fcase. ,'/' do.
case. ,'%' do. tabenginex 'invv' ; theItem return.
end.
)

calco_yesno=: 3 : 0
register'calco_yesno'
blink'white'
assert. -. noSelection''
select. tolower y
fcase. 'yes' do.
fcase. 'on' do.
fcase. 'true' do.
fcase. 'high' do.
case. 'hi' do. tabenginex 'onep' ; theItem return.
fcase. 'no' do.
fcase. 'off' do.
fcase. 'false' do.
fcase. 'low' do.
case. 'lo' do. tabenginex 'zero' ; theItem return.
case. do. assert 0
end.
)

calco_title=: 3 : 0
register'calco_title'
blink'white'
assert. 0=theItem
tabenginex 'titl' ; dtlf calco
)

calco_prefix1=: 3 : 0
register'calco_prefix1'

blink'white'
assert. 1<#y
select. {.y
case.  QT do. tabenginex 'name' ; theItem ; }.y dropfinal QT
case. '=' do. tabenginex 'fmla' ; theItem ; }.y
case. '[' do. tabenginex 'unit' ; theItem ; }.y dropfinal ']'
case. '+' do. tabenginex 'addv' ; theItem ; }.y
case. '*' do. tabenginex 'mulv' ; theItem ; }.y
fcase.'/' do.
case. '%' do. tabenginex 'divv' ; theItem ; }.y
case. '^' do. tabenginex 'rtov' ; theItem ; }.y
case. do. assert 0
end.
)

calco_do=: 3 : 0
register'calco_do'

blink'white'
assert. 1<#y
select. {.y
case.  SC do. 'tabby' doinloc }.y
case.  CO do. 'cal' doinloc }.y
case.  CM do. 'uu' doinloc }.y
case.  '$'do. tabenginex }.y
case.  '\'do. putsb ": tabengine }.y
case. do. assert 0
end.
)

doinloc=: 4 : 0

lo=. <":x
putsb ,>do__lo y
)
calco_qty=: 3 : 0
register'calco_qty'

blink'white'
assert. -. noSelection''
qty=. tabengine 'UUUU' ; y
smoutput llog 'calco_qty y qty'
tabenginex 'vunn' ; theItem ; qty
)

calco_sample=: 3 : 0
register'calco_sample'
blink'white'

if. '$$'-:y do. openss'' return.
elseif. (y-:,'$') do. openss'$' return.
end.
'y0 y1'=. y
assert. '$'=y0
if. y1 e. '0123456789' do. openss y1 return.
else. assert. 0 end.
)

make_daisychain''

0 :0
onload LF -.~ 0 :0
smoutput interpretCalco '12° 15'' 04"'
)

'==================== [tabby] handlers.ijs ===================='
0 :0
Friday 29 March 2019  13:26:53
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
child_like	set1u_like but ignores shift
subitems_like	2 selected lines, order significant
)

coclass 'tabby'

selected=: 3 : 0

b=. y= # 0-.~ ".panel_select
if. -.b do. confirm sw '>>> must select precisely (y) line',(1<{.y)#'s'
else. confirm ''
end.
b return.
)

selectedAtLeast=: 3 : 0

b=. y<: # 0-.~ ".panel_select
if. -.b do. confirm sw '>>> must select (y) or more lines'
else. confirm ''
end.
b return.
)

child_like=: 4 : 0

if. -.selected 1 do. return. end.
tabengine x ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)
tab_newtt_button=: newtt
tab_openn_button=: openssn
tab_opens_button=: openss
tab_opent_button=: 'open'&opentt
tab_appet_button=: 'appe'&opentt
tab_savex_button=: tabenginex bind 'save'
tab_saves_button=: tabenginex bind 'savs'
tab_savet_button=: tabenginex bind 'savt'
tab_close_button=: tab_close
tab_print_button=: notimp
tab_quit_button=:  quit
tab_undo_button=:  tabenginex bind 'Undo'
tab_redo_button=:  tabenginex bind 'Redo'
tab_erasf_button=: 'orph'&child_like
tab_siunt_button=: siunt
tab_movet_button=: 'movt'&movtb
tab_moveu_button=: 'movu'&movud
tab_moved_button=: 'movd'&movud
tab_moveb_button=: 'movb'&movtb
tab_dupit_button=: equal
tab_updex_button=: tabenginex bind 'exch'
tab_repet_button=: tabenginex bind 'Repe'
tab_tthld_button=: 'hold'&hold
tab_thold_button=: 'holm'&hold
tab_hidel_button=: notimp
tab_unhid_button=: notimp
tab_ttabl_button=: clicktab bind 0
tab_conss_button=: clicktab bind 1
tab_funcs_button=: clicktab bind 2
tab_infor_button=: clicktab bind 3
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
tab_hinf_button=: showttinf
tab_togi_button=: ide
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
tab_g_mbldbl=: empty
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
confirm tabengine 'unit'; theItem ; xunit-.LF
showTtable''
restoreSelection''
setcalcovalue''
restoreFocusToInputField''
)

holdcons=: '=' ,~ ]

newc=: 3 : 0


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

'zdesc znits znitv zvalu'=: cuT wd'psel tab; get cons row ',firstwords cons
sw '(zvalu) (znitv) [(znits)] (zdesc)'
)

funcLine=: 3 : 0

'zdesc znits zfmla'=: cuT wd'psel tab; get func row ',firstwords func
sw '(zfmla) [(znits)] (zdesc)'
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
TOOLID=: 32 <. z + <.X%w
fill_tools TOOLID
confirm insertIDs 3 }. TOOLID { TOOLHINT

sys_timer_z_=: hover_off_tabby_
wd'timer ',":TIMER_HOVER
)

hover_off=: 3 : 0
wd 'timer 0'
fill_tools''
)

tab_close=: quit

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
newtt=: 3 : 0
if. -. preload'' do. return. end.
if. heldshift'' do. revtt'' return. end.
tabengine 'newt'
confirm tabengine'MSSG'
showTtable''
setunitsEmpty''
setcalco ''
restoreFocusToInputField''
)

revtt=: tabenginex bind 'Revt'

copal=: 3 : 0

wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

undoredo=: 3 : 0

if. heldshift'' do. tabenginex 'Redo'
elseif. heldcmnd'' do. flipshow 1
elseif. do. tabenginex 'Undo'
end.
)

savts=: 'savs savt' ddefine

tabenginex pickshift 2$ ;:x
)

additems=: additems_like=: 'plus' ddefine

if. -.selectedAtLeast 1 do. return. end.
tabengine x ; panel_select
confirm tabengine'MSSG'
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

mulitems=: 'mult'&additems_like

subitems=: subitems_like=: 'minu' ddefine

if. -.selected 2 do. return. end.
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

tabengine 'newu *'
showTtable''
setSelection _
updatevaluebar''
restoreFocusToInputField''
)

equal=: 'equl'&child_like
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

setv0=: 'zero' ddefine

tabengine x ; theItem=. line 0
confirm tabengine'MSSG'
showTtable''
restoreSelection''
updatevaluebar''
restoreFocusToInputField''
)

siunt=: 'cvsi'&child_like

set1u=: set1u_like=: 'onep onen' ddefine

if. -.selected 1 do. return. end.
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

hlpt=: 3 : 0

if. heldshift'' do.
  textview HELP_cal_ , CAL_cal_
  tabengine 'dash'
else. textview HELP
end.
)

showttinf=: 3 : 0

activateTabWithId 3
(refreshInfo shift updateInfo)''
)

anima=: 3 : 0

tabenginex pickshift ;:'trav tra0'
)

'==================== [tabby] flip.ijs ===================='
0 :0
Friday 30 November 2018  09:27:43
-
Performs Undo/Redo after pause until one of these occurs…
  FLIPSTATE takes some other value than 0 or 1 (e.g. _1)
  something else assigns: sys_timer_z_ (e.g. tab_g_mmove)
)

cocurrent 'tabby'

FLIPSTATE=: _1
FLIPTIMER=: 1000
sys_timer_z_=: empty

flipshow=: 3 : 0

wd'timer 0'
if. 1={.y do. FLIPSTATE=: 1 end.
if. isBool FLIPSTATE do.

  tabenginex FLIPSTATE pick ;:'Redo Undo'
  FLIPSTATE=: -.FLIPSTATE
  sys_timer_z_=: flipshow_tabby_
  wd'timer ',":FLIPTIMER
end.
)

'==================== [tabby] open.ijs ===================='
0 :0
Tuesday 18 September 2018  09:17:14
-
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
)

coclass 'tabby'

SAMPFORM=: 0 : 0
pc ssn;pn Samples;
cc samps listbox;
pshow;
)

SAMPLES=: 0 : 0
0  angle sine and cosine
1  Church Clock
2  Asteroid Impact
3  Pseudogravity by rotation
4  inversion test
5  Cost of alcohol
6  temperature scales
7  indicator flag
8  untitled
9  untitled
)

openssn=: 3 : 0

if. -. preload'' do. return. end.
ssn_close''
wd SAMPFORM
wd 'set samps items *',SAMPLES
)

ssn_default=: 3 : 0
ssw '>>> tab_default: handler needed: (syschild) for: (sysevent)'
)

ssn_close=: 3 : 0
wd :: empty 'psel ssn; pclose;'
)

ssn_samps_select=: 3 : 0
n=. 1{.samps
ssw '+++ ssn_samps_select n=(n)'
ssn_close''
openss ".n
)

openss=: 3 : 0

if. -. preload'' do. return. end.
if. 0=#y do. y=. '$$' end.
tabengine'open ',":y
showTtable''
setSelection 1
tab_panel_select''
restoreFocusToInputField''
)

launder=: 3 : 0

'\/'charsub y -. CRLF
)

pathof=: ] {.~ [: >: SL i:~ ]

setFormTitle=: 3 : 0

flag=. (tabengine'DIRT')#brack'UNSAVED'
fname=. tabengine 'TFIT'
title=. sw '(flag) TABULA (fname)'
wd 'psel tab; pn ',title

)

opentt=: 'open' ddefine



if. (x-:'open') do.
  if. -.preload'' do. return. end.
end.
TPTT=: 'TPTT' default~ tabengine 'TPTT'
inst=. 4{.x
invalplot''
title=. sw 'Choose a ttable to (x)…'

path=. launder wd sw 'mb open "(title)" *',TPTT
if. 0=#path do. confirm sw '>>> (x) ...cancelled' return. end.
TPTT=: pathof path
confirm tabengine inst,SP,path
showTtable''
setSelection 1
tab_panel_select''
restoreFocusToInputField''
)

opent=: 3 : 0

if. heldshiftcmnd'' do. start_ttb_''
elseif. heldshift'' do. opentt''
elseif. heldcmnd''  do. openssn''
elseif.             do. openss''
end.
)

savea=: 3 : 0


TPTT=: 'TPTT' default~ tabengine 'TPTT'
title=. 'Save ttable as…'
nom=. wd sw 'mb save "(title)" *',TPTT
if. 0=#nom do.
  confirm '>>> Save As... cancelled'
else.
  smoutput '+++ savea: nom=',nom
  tabenginex 'sava' ; ijs nom
end.
)

'==================== [tabby] main ===================='
0 :0
Friday 15 February 2019  04:10:56
-
open '~Gitcal/source/CAL_interface.ijs'
open '~Gituu/source/uu_interface.ijs'
uu_interface.ijs
)

coclass 'tabby'


pickshift=: 3 : 0


(heldshift'') pick 2$boxopen y
)

showTtable=: 3 : 0
t=. tabengine'CTBU'
if. LF e. t do. wd 'psel tab; set panel items *',t
else.           wd 'psel tab; set panel items ',dquote t
end.
refreshInfo''
setFormTitle''
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

clearSelection=: 3 : 0
theItem=. _1
panel_select=: SP ,~ ":theItem
wd 'psel tab; set panel select ',":theItem
)

tab_open=: 3 : 0

window_close''
wd TABU
wd 'psel tab'
wd 'set g wh _1 64'
refreshInfo''
t=. ,:UNSET
wd 'set func font "Menlo" 10'
wd 'set panel font ',fixfont''
wd 'set calco font ',fixfont''

wd 'set preci items *', o2f ": i.16
wd 'set unico items *',CONTENT_UNICO
wd 'set panel items *',UNSET
if. PMOVES do.
  wd :: 0: 'pmoves ' , ":XYWH
else.
  form FORM_POSITION
end.
wd 'pshow'
fill_tools ''
)

window_close=: 3 : 0
wd :: 0: 'psel tab; pclose;'
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
BOXED=. boxcons x4f TTEXT=. tabengine inst ; searchc
wd 'psel tab'
wd 'set cons shape ',":SHAPE=. $BOXED
wd 'set cons protect ',": , SHAPE$ 0 1 1 1
wd 'set cons hdr *Label Units Val Units'
wd 'set cons data *', ; SP ,each dquote each BOXED
wd 'set cons font ".SF NS Text" 12'
wd 'set cons resizecol'
)

fillfuncts=: 3 : 0

inst=. (".casef) pick ;:'WUUF VUUF'
BOXED=. boxfunc x4f TEXT=. tabengine inst ; searchf
wd 'psel tab'
wd 'set func shape ',":SHAPE=. $BOXED
wd 'set func protect ',": , SHAPE$ 0 1 1
wd 'set func hdr *Label Units Formula'
wd 'set func data *', ; SP ,each dquote each BOXED
wd 'set func font ".SF NS Text" 12'
wd 'set func resizecol'
)

boxcons=: 3 : 0 "1

'y zdesc'=. 2{. ']'cut y
zdesc=. dltb zdesc -.TAB
'y znits'=. 2{. '['cut y
zvalu=. (i=. y i. SP){.y=. deb y-.TAB
znitv=. }.i}.y
zdesc; znits; zvalu; znitv
)

boxfunc=: 3 : 0 "1

'y zdesc'=. 2{. ']'cut y
zdesc=. dltb zdesc -.TAB
'y znits'=. 2{. '['cut y
zfmla=. deb y-.TAB
zdesc; znits; zfmla
)

0 :0
listboxSafe=: 3 : 0

DQ,~ DQ, y rplc LF ; DQ,SP,DQ
)

finalLF=: ] , LF #~ LF ~: {:

decrementToZero=: 0 >. [: <: default



isErrorMessage=: [: +./ '>>>' E. ,

confirm=: 3 : 0




NOCONFIRM=: decrementToZero'NOCONFIRM'
if. 0=#y do.
  putsb ''
  NOCONFIRM=: 0
elseif. isErrorMessage y do.
  wd'beep'
  putsb y
  NOCONFIRM=: NOCONFIRM_MAX
elseif. NOCONFIRM=0 do. putsb y
end.
i.0 0
)

activateTabWithId=: 3 : 0
updateInfo''
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

wd 'psel tab; set info text *' , tabengine 'INFO'
)

supplyInfo=: 3 : 0

tabengine 'info ',y
setFormTitle''
confirm sw '+++ supplyInfo: ($y) bytes registered'
)

updin=: updateInfo=: 3 : 0

tabengine 'info ',info
setFormTitle''
confirm sw '+++ updateInfo: ($info) bytes registered from "info" tab'
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
setunits''
restoreSelection''
restoreFocusToInputField''
)

setunits=: 3 : 0

]theItem=. line 0
if. 1>theItem do. setunitsEmpty'' return. end.
]z=. tabengine 'UCMU' ; theItem
]z=. ~. z ,~ tabengine 'UNIS' ; theItem
]z=. ~. z ,~ tabengine 'UNIT' ; theItem
]z=. utf8 f4b z
	z_tabby_=: z
if. '*' -: {.z do.
  wd 'psel tab; set xunit items "*" "!"'
elseif. '!' -: {.z do.
  wd 'psel tab; set xunit items "!" "*"'
elseif. do.
  wd 'psel tab; set xunit items *',z
end.
wd 'psel tab; set xunit select 0'
)

setunitsEmpty=: wd bind 'psel tab; set xunit items *'

setcalco=: 3 : 0
wd 'psel tab; set calco text *',calco=:,":y
)

setcalcovalue=: 3 : 0

select. theItem=. line 0
case. _1 do. setcalco ''
case.  0 do. setcalco panel -. LF
case.    do. setcalco tabengine 'VALF' ; theItem
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

tabenginex=: '' ddefine


]mmm=. ,tabengine y
mssg=. tabengine'MSSG'
showTtable''
confirm mssg
if. 0=#x     do. restoreSelection''
elseif. x=_1 do. clearSelection''
elseif.      do. setSelection x
end.
updatevaluebar''
restoreFocusToInputField''
)

dropfinal=: 4 : 'if. y-: {:x do. }:x else. x end.'

cle=: 3 : 0

if. heldshift'' do. setcalco'' end.
)

interpretCalco0=: 3 : 0




if. 0=#y do. y=. dltb calco else. y=. dltb y end.
'y0 y1'=. 2{.y


if. '$$'-:y 		do. openss''			return. end.
if. (y-:'$')or(y-:,'$') 	do. openss'$'			return. end.
if. ('$'=y0)and y1 e. '0123456789' do. openss y1		return. end.

select. {.y
case. ',' do. cle smoutput }.y [wd 'ide show'	return.
case. '!' do. tabenginex }.y			return.
case. ';' do. 'tabby'&locDo }.y		return.
case. ':' do. 'cal'&locDo }.y		return.
end.
if. 0=theItem=.line 0 	do. tabenginex 'titl' ; dtlf calco 	return. end.
if. -.isValidItem theItem	do. confirm '>>> no line selected' 	return. end.


if. isDigit y do. tabenginex 'valu' ; theItem ; y		return. end.
select. y
case. ,'-' do. tabenginex 'negv' ; theItem 	return.
case. ,'*' do. tabenginex 'sign' ; theItem 	return.
fcase. ,'/' do.
case. ,'%' do. tabenginex 'invv' ; theItem 	return.
end.
if. 1=#y	do. confirm '>>> single char unhandled: ',brack y 	return. end.

select. {.y
case.  QT do. tabenginex 'name' ; theItem ; }.y dropfinal QT
case. '=' do. tabenginex 'fmla' ; theItem ; }.y
case. '[' do. tabenginex 'unit' ; theItem ; }.y dropfinal ']'
case. '+' do. tabenginex 'addv' ; theItem ; }.y
case. '*' do. tabenginex 'mulv' ; theItem ; }.y
fcase.'/' do.
case. '%' do. tabenginex 'divv' ; theItem ; }.y
case. '^' do. tabenginex 'rtov' ; theItem ; }.y
case.     do. theItem interpretQty y
end.
i.0 0
)

locDo=: 4 : 0
cocurrent x
do y
)

isDigit=: (3 : 0) :: 0:

{. (1=#y) and (".y) e. i.10
)

interpretQty=: 4 : 0

if. isNumeric y do. tabenginex 'valu' ; x ; ".y return. end.
qty=. tabengine 'UUUU' ; y
tabenginex 'vunn' ; x ; qty
)
replot=: 3 : 0

tabengine 'rplt' ; panel_select
)

stept=: 3 : 0

if. heldshift'' do. stepm'' return. end.
tabengine 'pl0v' ; panel_select
)

stepu=: 3 : 0

tabengine 'pl1v' ; panel_select
)

stepm=: 3 : 0

tabengine 'plvv' ; panel_select
)

plotb=: 3 : 0

tabengine 'plob' ; panel_select
)

plotl=: 3 : 0

tabengine 'plol' ; panel_select
)

plotp=: 3 : 0

tabengine 'plop' ; panel_select
)

plots=: 3 : 0

tabengine 'plos' ; panel_select
)
pushme=: empty
popme=: empty

trace=: 3 : 0



if. y do.
  msg=: smoutput&sw
  sllog=: smoutput&llog
else.
  msg=: empty
  sllog=: empty
end.
i.0 0
)

'==================== [tabby] user.ijs ===================='
0 :0
Friday 15 February 2019  19:40:30
-
THIS IS THE DEFAULT DEFN OF USERTOOLS RESIDING IN /source/
IT IS OVERRIDDEN BY AN ALTERNATIVE SCRIPT loaded by: start
USERTOOLS_z_ path specified in: header.ijs
)

coclass 'tabby'

usertool=: 3 : 0

ssw '+++ usertool: sysmodifiers=(sysmodifiers)'
if. heldshift'' do. open USERTOOLS_z_ return. end.
if. heldcmnd'' do. ide 1 return. end.
)

black=: 3 : 0
usertool''
if. heldnone'' do.
  confirm '>>> black: not implemented'
end.
)

red=: 3 : 0
usertool''
confirm '>>> red: not implemented'
)

green=: 3 : 0
usertool''
confirm '>>> green: not implemented'
)

blue=: 3 : 0
usertool''
confirm '>>> blue: not implemented'
)

'==================== [quit] main ===================='
0 :0
Saturday 12 January 2019  07:46:33
-
Adapted from TABULA[OLD]
CONTAINS IN-LINE ERROR/CONFIRMATION MESSAGES
--replace if MESSAGE table provided in due course.
-
if. -. preload'' do. return. end.
…In TABULA[OLD], called at top of: newtt opens opent quit
)

coclass 'tabby'

invalplot=: 3 : 0

tabengine 'plox'
)

inval_nuterm=: 3 : 0

try. nuterm_close_nut_'' catch. end.
)

preload=: 3 : 0


if. tabengine'DIRT' do.
  par=. 'Save current t-table?'
  mg=. 'The t-table: ', tabengine'TITL'	
  mg=. mg,LF, '-has significant unsaved changes'	
  mg=. mg,LF, '-which will be lost if you continue.' 	
  mg=. mg,LF,LF, '(To rescue this t-table, press No)'	
  mg=. mg,LF,LF,LF, 'OK to continue?'	
  if. wdquery par;mg do.
    confirm '>>> User cancelled: New/Load t-table'	
    0 return.
  end.
end.
invalplot''
1 return.
)

quit=: 3 : 0

if. -. preload'' do. return. end.
window_close''
if. IDE do. return. end.

exit''
)

'==================== [tabby] platform_specific ===================='
0 :0
Monday 4 March 2019  16:00:44
-
Bring here all definitions suspected of being platform-specific
)

coclass 'tabby'


heldnone=: 	3 : '0=".sysmodifiers'
heldshift=: 	3 : '1=".sysmodifiers'
heldcmnd=: 	3 : '2=".sysmodifiers'
heldshiftcmnd=:	3 : '3=".sysmodifiers'
heldalt=: 	3 : '4=".sysmodifiers'
heldshiftalt=:	3 : '5=".sysmodifiers'

'==================== [tabby] start ===================='

cocurrent 'tabby'

start=: 3 : 0
trace 0
wd 'timer 0'
load :: 0: USERTOOLS_z_
load 'math/cal'

tabengine=: tabengine_cal_
tx_z_=: tabenginex_tabby_

start_cal_ '$$'
tab_open''
setpreci 3
setunico 1
setSelection 1
updatevaluebar''
restoreFocusToInputField''
)

startonload''
