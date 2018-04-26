'==================== qt main.ijs ===================='

NB. =========================================================
NB. beep=: wd@('beep'"_)
beep=: ]

NB. ========== VERBS ==========

about=: 3 : 0
NB. retrieve fixed-info on 1-char commands
wd 'psel tab; set info text *' , tabengine 'ABOU'
setshow 3
confirm tabengine 'ABTI'
)


NB. =========================================================
clearunits=: 3 : 0
NB. clear contents of units combo
wd 'psel tab; set xunit items ""'
)

NB. =========================================================
click=: 3 : 0
if. y=1 do.		NB. mouseDown
  1 drawico BNDOWN=: BN
else.			NB. mouseUp
  drawallico''		NB. paranoid restore
  mousemove''		NB. update BN...
  if. BNDOWN=BN do.	NB. if mouse is still over same button
    CALLBK apply''
  end.
  BNDOWN=: _
end.
inputfocus''
)

NB. =========================================================
clickpanel=: 3 : 0
Handler 'clickpanel'
sess_clickpanel 'panel_select=' c panel_select
0 setL 0
sess_clickpanel 'L0=' c L0
if. L0>0 do.
  sess_clickpanel 'if. L0>0'
  setunits 0
  setcalco scino tabengine 'VALU' ; L0
elseif. panel_select-:'' do.
  sess_clickpanel 'if. panel_select-:'''''
  setcalco ''
elseif. L0=0 do.
  sess_clickpanel 'if. L0=0'
  selline 0
  setcalco panel -. LF
elseif. do.
  sess_clickpanel 'no action defined for clicking here'
end.
confirm details L0
)

NB. =========================================================
clicktab=: 3 : 0
Handler 'clicktab'
n=. ".tabs_select
select. n
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
if. isBoxed y do. y=. b2o y end.
putsb :: 0: msg=: y
empty msg [ maybeep y
)

NB. =========================================================
NB. depen - eliminated

NB. =========================================================
details=: 3 : 0
	NB. what to confirm when line is clicked
if. y=0 do. 21 message'' return. end.
if. 0=#(tabengine 'FMLA' ; y) do.
  16 message y ; (tabengine 'VALU' ; y)
else.
  16 message y ; (tabengine 'FMLA' ; y)
end.
)

NB. =========================================================
dirty=: tabengine bind 'DIRT'  NB. unsaved changes

NB. =========================================================
fillconsts=: 3 : 0
Handler 'fillconsts'
set_ucase casec-: ,'0'
z=. x2f uurowsc searchc
z=. 'SELECTION:',LF,z	NB. wd feature workaround
wd 'psel tab; set cons items *',z
)

NB. =========================================================
fillfuncts=: 3 : 0
Handler 'fillfuncts'
set_ucase casef-: ,'0'
z=. x2f uurowsf searchf
z=. 'SELECTION:',LF,z	NB. wd feature workaround
NB. z=. (LF,SOH)charsub z	NB. (alt) wd feature workaround
wd 'psel tab; set func items *',z
)

NB. =========================================================
formu=: 3 : 0
Handler 'formu'
if. -.setL 0 do. return. end.
if. 0=#f=. (tabengine 'FMLA';L0) do.
  confirm 2 message L0  NB. '>>> item' ; L0 ; 'has no formula'
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
hinf=: showinf

NB. =========================================================
hold=: 3 : 0
Handler 'hold'
if. 0=#panelselect'' do.
  confirm 3 message 1  NB. '>>> No action: needs 1 or more selected lines'
else.
  for_L. ps=. ,". panelselect'' do.	NB. IAC Mon 11 May 2015  20:47:59
    panel_select=: ,":L
    hold1''
  end.
  sellines ps
  panel_select=: ,":ps
end.
)

NB. =========================================================
	NB. ijsstr - prototyped in new script: [qt] ijsstr.ijs
	NB. which overrides this placeholder verb
ijsstr=: empty

NB. =========================================================
increment=: 3 : 0
NB. treat y (from calco) as an incremental spec
NB. serves: calcmd
sess_calcmd 'increment:' c y
y=. dtb ,y
if. y-:,'+' do. tabenginex 'addv' ; L0 ; 1 return. end.
if. y-:,'-' do. tabenginex 'subv' ; L0 ; 1 return. end.
'c0 pc yval'=. ({.y) ; (('%'={:y){'vp') ; '%' -.~ }.y
cmd=. pc ,~ > ('+-*/^' i. c0) { ;:'add sub mul div rto'
if. isnumeric yval do.
  tabenginex cmd ; L0 ; VALUE
else. confirm 4 message y  NB. '>>> bad command:' ; y
end.
)

infor=: showinf

NB. =========================================================
inputfocus=: 3 : 0
Handler 'inputfocus'
select. TABNDX
case. 0 do. iwd 'psel tab; pactive; setfocus calco'
case. 1 do. iwd 'psel tab; pactive; setfocus searchc'
case. 2 do. iwd 'psel tab; pactive; setfocus searchf'
case. 3 do. iwd 'psel tab; pactive; setfocus info'
end.
i.0 0
)

iscmd=:  [: tabengine 'QCMD' ; ]
iscmd1=: 3 : '{. (y e. ''.:<>\!I'') *. (1=#y)'
iwd=: [: immexj 'wd' , quote

NB. =========================================================
maybeep=: 3 : 0
NB. decides if message: y needs beep
if. -.isLit y do. return. end.
if. '>>>' -: 3{.y do. beep''
elseif. y contains 'bad incompatible' do. beep''
end.
)

NB. =========================================================
mousemove=: 3 : 0
Handler 'mousemove'
vb=. (i.32) e.~ ]  NB. button# is valid
'x y shifton'=. 0 1 7 { z=. ".sysdata
br=. <. y % 32
bc=. <. x % 32
BN=: (16*br)+bc
if. (-.vb BN) or ((vb BNDOWN) and (BN~:BNDOWN)) do.
  BNDOWN=: _
  repaintg''
  CALLBK=: 'empty' return.
end.
CALLBK=: tolower firstword line=. BN ffrom BNS
hint=. dltb > shifton{ 2 $ SL cut words line
if. 0=#hint do. hint=. 'Undefined BNS line:' c BN end.
if. TRACH do. hint=.hint,~'[',(":BN),';',CALLBK,']',SP,SP end.
idle 'Go'  NB. schedule a delayed: (confirm'') to clear hint
confirm hint
NB. putsb1 BN
NB. putsb2 CALLBK
)

needsHnd=: 3 : 'smoutput sysevent,NEEDS'

NB. =========================================================
nitems=:  [: +/ LF = (tabengine bind 'CTBU')
NB. none - eliminated
NB. not_implemented - removed


NB. =========================================================
opens=: ''&$: :(4 : 0)
Handler 'opens'
if. -. preload'' do. return. end.
FIRSTLINE tabenginex 'open' ; x
clearunits''
setpreci sig''  NB. loading a t-table might alter it
ttinf''
inputfocus''
)

NB. =========================================================
opent=: 'Open'&$: :(4 : 0)
Handler 'opent'
if. heldshift'' do. opens'' return. end.
if. -. preload'' do. return. end.
cmd=. 4{. lowx=. tolower x
mytitle=. 'Choose a t-table to' c lowx c '...'
mydir=. TPATH_TTABLES
nom=. wd 'mb open' c (dquote mytitle) c (dquote mydir)
nom=. nom rplc BS ; SL
nom=. nom -. CRLF		NB. why does it get these?
if. 0=#nom do.
  confirm 8 message x NB. '>>>' ; x ; '-cancelled'
else.
  TPATH_TTABLES_z_=: pathof nom
	NB. ...now the home location for tabula-user/
	NB. Will remain like this for the rest of the session
	NB. unless we have a way to re-initialize it
	NB. Loc: cal originally sets it.
	NB. Scope here for a new cal-cmd??
  1 tabenginex cmd ; nom
  clearunits''
  setpreci sig''  NB. loading a t-table might alter it
  ttinf''
  inputfocus''
end.
)

NB. =========================================================
paneL0=: 3 : 'L0=: {. 0 ". panel_select'

NB. =========================================================
play=: 3 : '2!:1 ''afplay '',TPATH_TABULA,wav y'
playerror=: play@('error'"_)
playwarning=: play@('warning'"_)

NB. =========================================================
NB. plot=: 3 : 0
NB. NB. call plotting fn with data returned by: cal
NB. NB. (This fn originally came from: cal)
NB. NB. Close any existing plot window...
NB. try. pclose_jzplot_'' catch. end.
NB. caller_jwplot_=. coname''
NB. '' plot_jwplot_ y
NB. inputfocus''
NB. :
NB. NB. Close any existing plot window...
NB. try. pclose_jzplot_'' catch. end.
NB. caller_jwplot_=. coname''
NB. x plot_jwplot_ y
NB. inputfocus''
NB. )

NB. plot - call plotting fn with data returned by: cal
NB. (This fn originally resided in cal)
plot=: ''&$: : (4 : 0)
idle 'Quit'  NB. stop the idle event stream: plot hates it
  NB. PROBLEM: when (/if) to re-start the idle event stream??
  NB. Close any existing plot window...
try. pclose_jzplot_'' catch. end.
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
smoutput 'plotx: y=' c y
if. -.setL 0 do. return. end.
PLOTX=: L0
PLOT=: tabengine 'PLOT' ; PLOTX ; y
undo''
Y=. {: i.#PLOT
PLOTY=: Y default 'PLOTY'
PLOTF=: 'line' default 'PLOTF'
PLOTF plot (PLOTX{PLOT) ; (PLOTY{PLOT)
NB. sellines PLOTY	------- just a pain when re-plotting
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
if.-. LF e. y do. y=. y,LF end.
wd 'psel tab;set panel items *', y
MAXLINE=: +/LF=y
)

NB. =========================================================
putsb=: 'status'&putsbx
NB. putsb1, putsb2 - eliminated

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
Handler 'quit'
if. -. preload'' do. return. end.
idle 'Quit'	NB. stop the "idle" event stream
winpos 'Quit'
window_close''
if. -.IDE do. exit'' end.
)

redo=: tabenginex@('Redo'"_)

NB. =========================================================
refresh=: 0&$: :(4 :0)
	NB. refresh the t-table display
if. 0=#x do.   NB. create the x-args used by tabenginex
   DESELECT=: 2b0001	NB. 1
  KEEPCALCO=: 2b0010	NB. 2
   LASTLINE=: 2b0100	NB. 4
  FIRSTLINE=: 2b1000	NB. 8
  return.
end.
settitle shortpath tabengine 'TFIL'
NB. alternative? settitle tabengine 'TNAM'
putpanel tabengine 'CTBU'
winpos 'Here'
if. x bit 0 do.		NB. DESELECT (=2b0001)
  sellinex''
else.
  if. L0>0 do. wd 'set panel select' c L0 end.
  if. L1>0 do. wd 'set panel select' c L1 end.
end.
if. x bit 1 do.		NB. KEEPCALCO (=2b0010)
else. wd 'psel tab; set calco text'
end.
if. x bit 2 do.		NB. LASTLINE  (=2b0100)
  selline nitems''
  setunits 0
  inputfocus''
end.
if. x bit 3 do.		NB. FIRSTLINE  (=2b1000)
  selline 1
  setunits 0
  inputfocus''
end.
)

NB. =========================================================
repaintg=: drawallico

NB. =========================================================
repet=: tabenginex@('Repe'"_)

NB. =========================================================
replot=: 3 : 0
NB. plot existing PLOT again, using selections
Handler 'replot'
if. 0~:nc<'PLOT' do.
  confirm 12 message'' NB. no plot steps specified yet
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

NB. =========================================================
repos=: winpos&heldshift

NB. =========================================================
restart=: 3 : 0
Handler 'restart'
if. -. heldshift'' do. debug''	NB. order reversed
else.
  startuu''
  start 1
end.
)

NB. =========================================================
selline=: 3 : 0
wd 'psel tab; set panel select -1'
panel_select=: ,":L0=: {.y
L1=: 0
wd 'psel tab; set panel select' c L0
)

sellines=: 3 : 0
wd 'psel tab; set panel select -1'
panel_select=: ":y
'L0 L1'=: 2 {. y
for_i. y do.
  wd 'set panel select' c i
end.
)

sellinex=: 3 : 0
wd 'psel tab; set panel select -1'
panel_select=: ''
L1=: L0=: 0
)

NB. =========================================================

NB. =========================================================
setcalco=: 3 : 0
NB. set text: y into ctl: calco
wd 'psel tab; set calco text *',calco=: ,":y
)

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
if. x-:0 do. empty'' return. end.
valid=. (L0>0) *. ((L1>0) +. (y<1))
if. -.valid do.
  confirm 3 message >:y NB. needs (>:y) or more selected lines
end.
valid  NB. should abort the calling handler if 0
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
NB. pick a tab-subwindow to show
wd 'psel tab; set tabs active ',":TABNDX=: y
)

NB. =========================================================
settitle=: 3 : 0
Handler 'settitle'	NB. set window title to (y)
wd 'psel tab; pn *', (0 message y ; UNSAVED#~dirty'')
)

NB. =========================================================
setunits=: 3 : 0
NB. set (y=0) or change (y=1) units of line L0
NB. y_tab_=: y
NB. sess log 'y L0 L1 xunit xunit_select'
if. -.setL 0 do. return. end.
if. y do.
  tabenginex 'unit' ; L0 ; xunit
else.
  z=. a2f tabengine 'UCOM' ; L0
  wd 'psel tab; set xunit items *',utf8 z
  wd 'psel tab; set xunit select 0'
end.
EMPTY
)

NB. =========================================================
setval=: 3 : 0
Handler 'setval' NB. tool: set value 0 / 1
if. heldshift'' do. Vonep'' else. Vzero'' end.
)

NB. =========================================================
showinf=: 3 : 0
Handler 'showinf'
ttinf''
setshow 3  NB. the Info tab
inputfocus''
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
NB. speak - eliminated

NB. start - now in start.ijs

NB. =========================================================
step0=: 0&stept
step1=: 1&stept
step2=: 2&stept

stept=: 4 : 0
Handler 'stept' NB. tool: plot in standard steps
if. -.setL 0 do. return. end.
selline L0
val=. | tabengine 'VALU' ; L0
if. val=0 do.
  confirm 13 message'' NB. '>>> cannot plot zero-to-zero'
  return.
end.
select. x
case. 0 do.
  if. val<0 do. z=. val,0,100 else. z=. 0,val,100 end.
case. 1 do.
  if. val<0 do. z=. val,_1,100 else. z=. 1,val,100 end.
case. 2 do.
  z=. (-|val),(|val),100
end.
calcmd 'steps ',":z
)

NB. =========================================================
NB. stup - eliminated

NB. =========================================================
subitems=: 3 : 0
Handler 'subitems'
if. -.setL 1 do. return. end.
LASTLINE tabenginex 'minu' ; L0 ; L1
)

NB. =========================================================
tabengine=: tabengine_cal_

NB. =========================================================
	NB. cmd (y) -->CAL-engine--> show its reply
	NB. Use this verb tabenginex for all lowcase cmds
	NB.  -these reply ONLY with error/confirm message
	NB. Use tabengine for upcase cmds
	NB.  -these return requested STATE VARIABLES
	NB. ALL communication with CAL-engine MUST go via
	NB.  tabengine (operationally a 'z'-locale word)
	NB. THERE MUST BE NO located jwds to 'cal' herein.
	NB. This allows the TABULA topend to be tested
	NB.  with a dummy CAL-engine.
tabenginex=: 0&$: :(4 : 0) "1
confirm tabengine INSTR_z_=: ,y
x refresh''
setshow 0
)

NB. =========================================================
tbx=: ijs

	NB. tedit - prototyped in new script: [qt] ijsstr.ijs
	NB. which overrides this placeholder verb
tedit=: empty

NB. =========================================================
thold=: 'holm'&funline
NB. title - eliminated (now: ttitle)

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
confirm 19 message TRACE NB. '+++ TRACE=' ; TRACE
)

NB. =========================================================
trach=: 3 : 0
NB. set/toggle TRACH (Handler1)
if. (y=. {.y) e. 0 1 do.
  TRACH=: y
else.
  TRACH=: -. TRACH
end.
NB. if. TRACH do. Handler=: Handler1 else. Handler=: empty end.
confirm 20 message TRACH NB. '+++ TRACH=' ; TRACH
)

NB. =========================================================
traci=: 3 : 'smoutput ''traci:'' c tabengine ''trai _'''

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
  confirm 14 message'' NB. '>>> cannot open "undefined" t-table - save it first'
else. tedit tabengine 'TFIL'
end.
)

NB. =========================================================
tthld=: 'hold'&funline

NB. =========================================================
  NB. 0&ttinf'' -clears info panel (for a new t-table)
  NB. 1&ttinf'' (default: ttinf'') -gets info from CAL
  NB. 2&ttinf y -updates t-table from (y) if y is not empty
  NB. 2&ttinf'' -updates t-table from panel cache (info)
ttinf=: 1&$: : (4 : 0)
Handler 'ttinf' NB. Put / get info to/from info panel
select. x
case. 0 do. 		NB. clear info panel
  wd 'psel tab; set info text'
  NB. -but don't tell CAL to clear its info!
case. 1 do. 		NB. get and show info seen by CAL
  z=. tabengine 'INFO'
  wd 'psel tab; set info text *',z
  confirm 18 message'' NB. info retrieved
case. 2 do. 		NB. send updated info (y) to CAL
  NB. If y is '' then fill y from panel contents (info)
  if. 0=#y do. y=. info end.
  tabenginex 'info' ; y
  confirm 17 message ($y) ; ttname'' NB. info updated
case. do.
  smoutput '>>> ttinf: unknown x-arg: ',":x
end.
)

NB. =========================================================
ttnames=: tabengine bind 'TNMS' 
ttname=: tabengine bind 'TNAM' 
ttpath=: tabengine bind 'TFIL' 
ttitle=: tabengine bind 'TITL'

NB. =========================================================
undo=: tabenginex bind 'Undo'
undoredo=: undo shift redo
unhid=: tabenginex bind 'unhid'
updex=: tabenginex bind 'exch'

NB. =========================================================
NB. updin - moved to [main] handler.ijs

NB. =========================================================
vv=: ":@|:@,:
wav=: ] , '.wav' #~ [: -. '.' e. ]

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
