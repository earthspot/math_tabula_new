	NB. tabby - tools.ijs
NB. These pseudo-handlers are executed by tab_g_mblup
NB. which is triggered by a mouseUp on the toolbar.
NB.
NB. Some tool names are also menu tags, e.g. newtt
NB. In this case a handler will exist: tab_newtt_button
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
