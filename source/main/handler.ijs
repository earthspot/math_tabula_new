'==================== main handler.ijs ===================='
NB. IAC Mon 29 Jun 2015  16:08:37

cocurrent 'tab'

Handler=: empty
NB. Handler=: Handler1

NB. =========================================================
add1u=: 3 : 0
Handler 'add1u'
if. -.setL 0 do. return. end.
if. heldshift'' do. calcmd '+-1' else. calcmd '+1' end.
)

NB. =========================================================
additems=: 3 : 0
Handler 'additems'
if. -.setL 1 do. return. end.
LASTLINE tabenginex 'plus' ; sortcharnums panelselect''
)

NB. =========================================================
addpc=: 3 : 0
Handler 'addpc'
if. -.setL 0 do. return. end.
if. heldshift'' do. calcmd '+-1%' else. calcmd '+1%' end.
)

NB. =========================================================
appet=: 'Append'&opent

NB. =========================================================
by2pi=: 3 : 0
Handler 'by2pi'
if. -.setL 0 do. return. end.
if. heldshift'' do. calcmd '*PI2' else. calcmd '*PI' end.
)

NB. =========================================================
calcmd=: 3 : 0
Handler 'calcmd' NB. compose tabengine instructions
if. 0=#y do. sess_calcmd 'calcmd called with empty y: use calco'
else. sess_calcmd 'calcmd called directly: calco gets (y)'
  calco=: y
end.
0 setL 0
confirm''		NB. clear status bar
	NB. First - work on "raw" calco
c0=. {. calco=: dltb ":calco0=: calco
if. 0=#calco do. calco=: ,'[' end.  NB. MAYBE CHANGE THIS
select. calco
case. ,'[' do. sess_calcmd 'Move sel down'
  movsel 0 return.
case. ,']' do. sess_calcmd 'Move sel up'
  movsel 1 return.
case. ,'.' do. sess_calcmd 'Undo'
  undo'' return.
case. '..' do. sess_calcmd 'Redo'
  redo'' return.
case. ,';' do. sess_calcmd 'Repeat last'
  tabenginex 'Repe' return.
end.
select. c0
case. 'J' do. sess_calcmd 'run j code in loc cal'
  confirm tabengine 'JXDO' ; }.calco return.
case. 'j' do. sess_calcmd 'run j code in loc tab'
  confirm do }.calco return.
case. '/' do. sess_calcmd 'Engine cmd'
  tabenginex }.calco return.
case. '=' do. sess_calcmd 'Formula'
  tabenginex 'fmla' ; L0 ; }.calco return.
case. '@' do. sess_calcmd 'load numbered SAMPLE'
  (}.calco) opens '' return.  NB. opens SAMPLEn
end.
if. 0=L0 do. tabenginex 'titl' ; calco return. end.
if. -.setL 0 do. return. end.
	NB. Next - identify special constructs...
c0=. {. calco=: calcofix calco
VALUE=: UNDEFINED [ UNITS=: '??' [ RIDER=: ''
if. ']['-: 2{._1|.calco do. sess_calcmd 'units (forced)'
  if. isunits z=. }.}:calco do.
    tabenginex 'unit' ; L0 ; UNITS
  else. confirm 15 message z  NB. '>>> bad units:' ; z
  end.
elseif. c0=QT do. sess_calcmd 'label (forced): ' c }.calco
  tabenginex 'name' ; L0 ; }.calco
elseif. c0 e. '+*/^' do. sess_calcmd 'increment: ',calco
  increment calco
elseif. isnumeric calco do. sess_calcmd 'numeric: VALUE=' c VALUE
  tabenginex 'valu' ; L0 ; VALUE
elseif. isunits calco do. sess_calcmd 'units: UNITS=' c UNITS
  tabenginex 'unit' ; L0 ; UNITS
  setunits 0
elseif. isvalunits calco do. sess_calcmd llog 'VALUE UNITS RIDER'
  if. 0<#RIDER do.
    tabengine 'name' ; L0 ; RIDER
  end.
  setunits 0 [ tabengine 'unit' ; L0 ; UNITS
  tabenginex 'valu' ; L0 ; VALUE
elseif. isnumvec calco do. sess_calcmd 'plot instruction: ',calco
  invalplot''
  plotx calco rplc '-' ; '_'
elseif. do. sess_calcmd 'unrecognised input: ',calco0
  confirm 23 message calco0
end.
)

calcofix=: 3 : 0
	NB. launder input (y) -usually: calco
invld=. '_.'"_
NB. ysx=. 4 : 'y[sess_calcmd ''calcofix:'';x;y'
ysx=. ]
'y0 yy'=. ({. ; }.)y=. dltb y
if. (PC = {:y) and (all (y-.PC) e. n9,DT) do.  NB. 3.2% --> 3.2 %
  0 ysx (y rplc PC ; SP,PC)
elseif. (1=+/y='E') and (all (y-.'E') e. n9,DT,HY) do.  NB. -1.2E-5 --> _1.2e_5
  1 ysx 'Ee-_'charsub y
elseif. (1=+/y=CM) and (all (y-.CM) e. n9) do.  NB. 2,5 --> 2.5
  2 ysx ',.'charsub y
elseif. (1=+/y=SL) and (all (y-.SL) e. n9) do.  NB. 3/5 --> 3%5
  3 ysx (SL,PC)charsub y
elseif. (y0 e. n9,DT,'(') and (all y e. n9,'()+-*/%.') do.  NB. eval expr
  4 ysx ": (". :: invld) y
elseif. y0='$' do.  NB. $95.6 --> 95.6 [USD]
  5 ysx yy,' usd'
elseif. y0 begins '£' do.
  6 ysx yy,' gbp'
elseif. do. y
end.
)

NB. =========================================================
copal=: 3 : 0
Handler 'copal' NB. toolbar
wd 'psel tab; clipcopy *',tabengine 'CTBU'
)

NB. =========================================================
delit=: 3 : 0
Handler 'delit' NB. delete selected line(s)
invalplot'' NB. discard PLOT* caches
LASTLINE tabenginex 'dele' ; panelselect''
)

NB. =========================================================
divitems=: 3 : 0
Handler 'divitems'
if. -.setL 1 do. return. end.
LASTLINE tabenginex 'divi' ; L0 ; L1
)

NB. =========================================================
dupit=: 'dupl'&funline

NB. =========================================================
eduu=: eduuc shift eduuf

NB. =========================================================
eduuc=: 3 : 0
Handler 'eduuc'
tedit 'math/uu/uuc'
)

NB. =========================================================
eduuf=: 3 : 0
Handler 'eduuf'
tedit 'math/uu/uuf'
)

NB. =========================================================
equal=: 3 : 0
Handler 'equal'
('equl-'&funline)y
)

NB. =========================================================
erasf=: 'orph'&funline

NB. =========================================================
hidel=: 3 : 0
Handler 'hidel'
if. -.setL 1 do. return. end.
(DESELECT+LASTLINE) tabenginex 'hide' ; panelselect''
)

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
wd 'psel tab; set info text *',HELP
setshow 3
)

NB. =========================================================
hold=: 3 : 0
Handler 'hold'
if. 0=#panelselect'' do.
  confirm 3 message 1  NB. '>>> No action: needs 1 or more selected lines'
else.
  for_L. ps=. ,". panelselect'' do.
    panel_select=: ,":L
    hold1''
  end.
  sellines ps
  panel_select=: ,":ps
end.
)

hold1=: tthld shift thold

holdcons=: HOLD ,~ ]

NB. =========================================================
iedit=: 3 : 0
Handler 'iedit' NB. tool: edit name / formula
if. heldshift'' do. formu'' else. label'' end.
)

NB. =========================================================
label=: 3 : 0
Handler 'label' NB. label --> calco (for editing)
if. -.setL 0 do. return. end.
setcalco QT,(tabengine 'NAME' ; L0)
)

NB. lob - eliminated

NB. =========================================================
merge=: 3 : 0
Handler 'merge' NB. merge 2 lines
if. -.setL 1 do. return. end.
NB. Shift held: setL swaps L0 L1
tabenginex 'merg' ; L0 ; L1
selline (L0,L1) {~ heldshift''
)

NB. =========================================================
movit=: 3 : 0
Handler 'movit' NB. Move selected line (L0) down 1 line
NB. c/f mvitu
if. L0>:MAXLINE do.
  confirm 6 message'' NB. '>>> No action: last line reached'
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
LASTLINE tabenginex 'mult' ; sortcharnums panelselect'' NB. accepts multiple lines
)

NB. =========================================================
mvitu=: 3 : 0
Handler 'mvitu' NB. Move selected line (L0) up 1 line
NB. c/f movit
if. L0<:1 do.
  confirm 5 message'' NB. '>>> No action: first line reached'
  return.
end.
invalplot'' NB. discard PLOT* caches
'movu' funline L0
selline L0-1
)


NB. =========================================================
newc=: 3 : 0
Handler 'newc' NB. make a new Const line
cons newc y NB. cons is selection buffer
:
if. 0=#x-.SP do. confirm 7 message'' NB. '>>> No action: select a single line'
else. LASTLINE tabenginex 'cons' ; holdcons x
end.
)

NB. =========================================================
newf=: 3 : 0
func newf y NB. func is selection buffer
:
Handler 'newf' NB. make a new Funct line
if. 0=#x-.SP do. confirm 7 message'' NB. '>>> No action: select a single line'
else. LASTLINE tabenginex 'func' ; x
end.
)

NB. newkg - eliminated
NB. newlc - eliminated
NB. newlm - eliminated
NB. newls - eliminated
NB. newmo - eliminated

newsl=: 4&tabenginex bind 'newu /'

NB. newst - eliminated

NB. =========================================================
newtt=: 3 : 0
Handler 'newtt' NB. New ttable
if. -. preload'' do. return. end.
DESELECT tabenginex 'newt'
clearunits''
setpreci 3
0 ttinf''
inputfocus''
)

NB. =========================================================
pickunits=: 3 : 0
Handler 'pickunits' NB. service the xunit combo
setunits 1
)

NB. =========================================================
powitems=: 3 : 0
Handler 'powitems'
if. -.setL 1 do. return. end.
LASTLINE tabenginex 'powe' ; L0 ; L1
)

NB. =========================================================
savea=: 3 : 0
Handler 'savea' NB. service the "save ttable as..." ctl
mytitle=. 'Save t-table as...'
mydir=. TPATH_TTABLES
nom=. wd 'mb save' c (dquote mytitle) c (dquote mydir)
if. 0=#nom do.
  confirm 11 message'' NB. '>>> Save As... cancelled'
else.
  LASTLINE tabenginex 'sava' ; filename nom
end.
)

saves=: 3 : 'tabenginex ''savs'''  NB. save copy as SAMPLE

savet=: 3 : 0
NB. save ttable under current title
Handler 'savet'
tabenginex 'sava' ; goodfn ttitle''
)

savex=: 3 : 0
Handler 'savet' NB. save under existing name
NB. but check it isn't a "forbidden" name
if. saveok'' do. tabenginex 'save'
else. savea''
end.
)

savts=: savet shift saves

NB. =========================================================
updin=: 2&ttinf  NB. "Update" button handler