	NB. tabby - constants.ijs
'==================== [tabby] constants ===================='

cocurrent 'tabby'

0 :0
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
27 user?     User function (red)
28 user?     User function (green)
29 merge     Merge selected lines
30 hlpt      Help for TABULA
31 showttinf Show ttable info / edit ttable info
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
TIMER_HOVER=: 1000 NB. (millisecs) delay before sys_timer_z_''
UNSET=: '<UNSET>'
XYWH=: 1500 22 536 450
