	NB. tabby - tools.ijs
NB. These pseudo-handlers are executed by tab_g_mblup
NB. which is triggered by a mouseUp on the toolbar.
NB.
NB. Some tool names are also menu tags, e.g. newtt
NB. In this case a handler will exist: tab_newtt_button
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
