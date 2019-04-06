	NB. tabby - graphic.ijs
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

clear 'tree'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
coclass LOC=.'tree'
clear LOC
coinsert 'jgl2'	NB. use gl2 verbs to paint the window

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
  NB. fill tools with glyphs from 1st col of table: CNB
TIMER_HOVER=: 1000
PEN_WIDTH=: 3
COLOR_HOVER=: 255 200 0	NB. color of hover spot
COLOR_CLICK=: 255 100 0	NB. color of click spot
COLOR_WHITE=: 255 255 255	NB. color of (invisible) circumference
MAX_DISTANCE=: 15		NB. used by verb: closest (13 seems critical)
MAX_DISTANCE=: 100		NB. used by verb: closest (13 seems critical)
NB. FONT=: 'Arial Unicode MS'	NB. best-looking glyphs
NB. FONT=: 'APL385 Unicode'	NB. solid-looking APL glyphs
NB.FONT=: 'Andale Mono'	NB. squared-off glyphs
FONT=: 'Menlo'
'FONTSIZE GCOUNT GWIDTH GDROP DIAMETER CENTER DISP'=: 14 24 20 18 36 6j12 _12j_7
NB. PTLS=: ptls''		NB. topleft points for tool glyphs
NB. PTS=: PTLS + CENTER	NB. est displacement to visual center
NB. WTS=: (#PTS)#1		NB. dummy weights (for now)
sysevent=: ''		NB. clear to avoid garbage sysevent
window_close''
wd TREE
NB. wd 'set g wh _1 64'
wd 'pmove ',": TREEPOS
wd 'pshow'
icp=: _1  NB. outside range of: items
redraw''
)

putsb=: 3 : 0
  NB. show (string/num) y in statusbar
z=. ": ,y
if. 70<#z do. z=. '…',~ 69{.z end.
wd 'psel tre; set sbar text *',z
)

circle=: 4 : 0
  NB. draw circle of DIAMETER centred at (px coords) y
NB. 	ssw '+++ circle y=(y)'
clicked=. x  NB. (bool) x-arg of caller: redraw
ring=. clicked pick COLOR_HOVER ; COLOR_CLICK
NB. ring=. COLOR_WHITE
NB. spot=. clicked pick COLOR_HOVER ; COLOR_CLICK
glsel 'g'
glpen PEN_WIDTH [glrgb ring
NB. glbrush'' [glrgb spot  NB. next ellipse filled with spot color
xy=. +.y
wh=. 2#DIAMETER
radius=. <.DIAMETER%2
glellipse (xy - radius) , wh
)

NB. tre_g_focus=: empty
NB. tre_g_focuslost=: empty
NB. tre_g_mbldbl=: empty	NB. DOUBLECLICK on toolbar
NB. tre_g_resize=: empty

tre_close=: window_close

tre_g_mbldown=: 3 : 0
  NB. mouseDown on toolbar
  NB. NODEID is repeatedly assigned by: tre_g_mmove
	ssw '+++ tre_g_mbldown y=(y) NODEID=(NODEID) NODE=(NODE)'
1 redraw NODEID
)

tre_g_mblup=: 3 : 0
  NB. mouseUp on toolbar: executes the tool
NODE=: 'CLICKED',":NODEID
	ssw '+++ tre_g_mblup y=(y) NODEID=(NODEID) NODE=(NODE)'
NB. (NODE~)''
)

tre_g_mmove=: hover

hover=: 3 : 0
NB. wd 'timer 0'
'X Y'=: 2{.".sysdata  NB. REDUNDANT?
PT=: X j. Y           NB. REDUNDANT?
icp=: closest pjmouse''	NB. tool# closest to cursor
if. _=icp do. signal '(no tool selected)' return. end.
signal 2 pick icp{CNB	NB. confirm what the tool is
redraw icp		NB. hilite the tool glyph
  NB. Dont let hilite stay on forever…
sys_timer_z_=: hover_off_nut_
wd'timer ',":TIMER_HOVER
)

signal=: empty

tre_hover_off=: 3 : 0
wd 'timer 0'
	ssw '+++ tre_hover_off: X=(X) Y=(Y)'
NB. redraw''  NB. redraw with no hilite
)

closest=: 3 : 0
  NB. return index of (first) closest point (y) in PTS
z=. |PTS-y	NB. distances of y from each of PTS
NB. z=. z*WTS	NB. …weighted (based on char width)
ld=. <./z		NB. lowest distance found
if. ld>MAX_DISTANCE do. _ return. end.  NB. force: index error
i=. z i. ld	NB. index of lowest distance
)

  NB. mouse event data extractors
sysndata=:   3 : 'y{ 12{. 0&".sysdata' "0
ptmouse=: sysndata bind 0 1
pjmouse=: 3 : 'j./ ptmouse y'
formxy=:  sysndata bind 2 3
bnleft=:  sysndata bind 4
bnmid=:   sysndata bind 5
dnctrl=:  sysndata bind 6	NB. acts like bnright
dnshift=: sysndata bind 7
  NB. Command key ⌘	gives 1 for dnctrl''
  NB. Option key ⌥		HAS NO EFFECT
  NB. Ctrl key ^		BEHAVES LIKE RIGHTCLICK
bnright=: sysndata bind 8
  NB. 0 0-: sysndata 9 10	--ALWAYS
nwheel=:  sysndata bind 11

clickleft=: 3 : 0
Handler 'clickleft'
icp=: closest pjmouse''	NB. tool# closest to cursor
if. _=icp do. signal '(no tool selected)' return. end.
NB. 1 fill_tools icp		NB. hilite (clicked)
i.0 0
)

redraw=: 0 ddefine
  NB. redraws t-table tree, hilites hotspot id= y
  NB. (bool) x makes choice between 2 circle colors
NB. 	ssw '... redraw x=(x) y=(y)'
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
glbrush'' [glrgb spot  NB. next ellipse filled with spot color
for_i. i.#PTS do.
  gltextxy +. DISP + i{PTS
  gltext brace i+1
end.
glpaint''
)


onload 'start_tree_ NIL'