	NB. tabby - main.ijs
'==================== [tabby] main ===================='
0 :0
Thursday 20 September 2018  08:46:58
)

coclass 'tabby'

  NB. These are probably platform-specific
heldshift=: 	3 : '1=".sysmodifiers'
heldcmnd=: 	3 : '2=".sysmodifiers'
heldshiftcmnd=:	3 : '3=".sysmodifiers'
heldalt=: 	3 : '4=".sysmodifiers'
heldshiftalt=:	3 : '5=".sysmodifiers'

pickshift=: 3 : 0
  NB. return (0 pick y) or 1 pick y)
  NB. accept single-entry y
(heldshift'') pick 2$boxopen y
)

showTtable=: 3 : 0
t=. tabengine'CTBU'
if. LF e. t do. wd 'psel tab; set panel items *',t
else.           wd 'psel tab; set panel items ',dquote t
end.
ITEMS=: tabengine'ITMS'
)

restoreSelection=: 3 : 0
  NB. make panel show (panel_select) again
  NB. but if no valid item selected, select line {1} 
theItem=. line 0  NB. …from panel_select
if. -.isValidItem theItem do. setSelection 1
else. wd 'psel tab; set panel select ',panel_select
end.
)

curb=: 3 : 0
  NB. limit id y to 1 2 … (last line)
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
  NB. serves: start
window_close''
wd TABU
wd 'psel tab'
wd 'set g wh _1 64'
refreshInfo''
t=. ,:UNSET
wd 'set cons font ',FIXFONT
wd 'set cons items *',x2f t
wd 'set func font ',FIXFONT
wd 'set func items *',x2f t
wd 'set preci items *', o2f ": i.16
wd 'set unico items *',CONTENT_UNICO
wd 'set panel font ',FIXFONT
wd 'set panel items *',UNSET
NB. confirm 'Click a line and perform some operation on it...'
if. PMOVES do.
  wd :: 0: 'pmoves ' , ":XYWH  NB. activate remembering window position
else.
  wd 'pmove ' , ":XYWH
end.
wd 'pshow'
fill_tools ''
)

window_close=: 3 : 0
wd :: 0: 'psel tab; pclose;'
)

fill_tools=: 0 ddefine
  NB. redraws toolbar, hilites tool id= y
  NB. (bool) x makes choice between 2 circle colors
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
  NB. draw circle of DIAMETER centred at (px coords) y
clicked=. x  NB. (bool) x-arg of caller: fill_tools
ring=. clicked pick COLOR_HOVER ; COLOR_CLICK
NB. ring=. COLOR_WHITE
NB. spot=. clicked pick COLOR_HOVER ; COLOR_CLICK
glsel 'g'
glpen PEN_WIDTH [glrgb ring
NB. glbrush'' [glrgb spot  NB. next ellipse filled with spot color
xy=. y
wh=. 2#DIAMETER
radius=. <.DIAMETER%2
glellipse (xy - radius) , wh
)

set_ucase=: 3 : 0
  NB. dummy placeholder replaced by set_ucase_uu_
ssw '>>> set_ucase: dummy placeholder, y=(y)'
)

putsb=: 3 : 0
  NB. show (string/num) y in statusbar
wd 'psel tab; set sbar text *',":,y
)

clicktab=: 3 : 0
if. 0=#y do. n=. ".tabs_select
else. n=. y
end.
select. n
NB. case. 0 just drops thru
case. 1 do. fillconsts''
case. 2 do. fillfuncts''
case. 3 do. refreshInfo''
end.
activateTabWithId n
restoreFocusToInputField''
)

fillconsts=: 3 : 0
  NB. get filtered UUC via CAL
inst=. (".casec) pick ;:'WUUC VUUC'
TEXT=: tabengine inst ; searchc
wd 'psel tab; set cons items *',listboxSafe TEXT
)

fillfuncts=: 3 : 0
  NB. get filtered UUF via CAL
inst=. (".casef) pick ;:'WUUF VUUF'
TEXT=: tabengine inst ; searchf
wd 'psel tab; set func items *',listboxSafe TEXT
)

listboxSafe=: 3 : 0
  NB. LF-sep text: (y) in a form Qt listbox won't munge
DQ,~ DQ, y rplc LF ; DQ,SP,DQ
)

finalLF=: ] , LF #~ LF ~: {:  NB. ensure {:y is LF

decrementToZero=: 0 >. [: <: default
  NB. …decrement (integer name) y~ to 0 but not negative
  NB. Creates pronoun (y) if absent

isErrorMessage=: [: +./ '>>>' E. ,

confirm=: 3 : 0
NOCONFIRM=: decrementToZero'NOCONFIRM'
if. isErrorMessage y do. putsb y [NOCONFIRM=: NOCONFIRM_MAX
elseif. NOCONFIRM=0 do. putsb y
end.
i.0 0
)

activateTabWithId=: 3 : 0
updateInfo''  NB. else Info panel contents will be lost
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
  NB. return CAL text for the Info panel
wd 'set info text *' , tabengine 'INFO'
)

supplyInfo=: 3 : 0
  NB.  supply text y to CAL as the new Info
tabengine 'info ',y
confirm sw '+++ supplyInfo: ($y) bytes registered'
)

updin=: updateInfo=: 3 : 0
  NB.  notify CAL of the current contents of "info" cache
tabengine 'info ',info
confirm sw '+++ updateInfo: ($y) bytes registered from "info" tab'
)

setpreci=: 3 : 0
  NB. i is combobox index to select -as string, not int.
if. 0=#y do. i=. preci_select else. i=. ":y end.
wd 'psel tab; set preci select ',i
tabengine 'ssig ',i
showTtable''
restoreSelection''
restoreFocusToInputField''
)

setunico=: 3 : 0
  NB. i is combobox index to select -as string, not int.
if. 0=#y do. i=. unico_select else. i=. ":y end.
wd 'psel tab; set unico select ',i
tabengine 'ssic ',i
showTtable''
setunits''
restoreSelection''
restoreFocusToInputField''
)

setunits=: 3 : 0
  NB. set change-units combo (xunit) to reflect panel selection
]theItem=. line 0
if. 1>theItem do. setunitsEmpty'' return. end.
]z=. tabengine 'UCMU' ; theItem	NB. UCOM vs UCMU
]z=. ~. z ,~ tabengine 'UNIS' ; theItem  NB. include equiv SI units in the list
]z=. ~. z ,~ tabengine 'UNIT' ; theItem  NB. include existing units in the list
	z_tabby_=: z
wd 'psel tab; set xunit items *',utf8 f4b z
wd 'psel tab; set xunit select 0'
)

setunitsEmpty=: wd bind 'psel tab; set xunit items *'

setcalco=: 3 : 0
wd 'psel tab; set calco text *',calco=:,":y
)

setcalcovalue=: 3 : 0
  NB. update calco field to reflect (panel_select)
select. theItem=. line 0
case. _1 do. setcalco ''
case.  0 do. setcalco panel -. LF
case.    do. setcalco tabengine 'VALF' ; theItem
end.
)

details=: 3 : 0
  NB. return (string) details of selected line
  NB. assume (panel_select) is up-to-date
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
  NB. ==1 if {.y is a valid line # (=item)
ITEMS e.~ {.y
)

selectValidItem=: 3 : 0
  NB. accept (y)<>'' as a click on that item
if. isValidItem y do. setSelection y end.
)

updatevaluebar=: 3 : 0
  NB. update the value bar to reflect (panel_select)
  NB. these verbs handle all cases of (panel_select) themselves
setunits''
setcalcovalue''
NB. confirm details'' ---NO! overwrites: confirm tabengine'MSSG'
)

formu=: 3 : 0
  NB. edit item formula within calco field
if. 1>theItem=. line 0 do. i.0 0 return. end.
if. 0=#f=.tabengine 'FMLA' ; theItem do.
  confirm '>>> item {(theItem)} has no formula'
else.
  setcalco '=',f
end.
)

label=: 3 : 0
  NB. edit item label within calco field
if. 0<theItem=. line 0 do.
  setcalco QT,(tabengine 'NAME' ; theItem)
end.
)

tabenginex=: '' ddefine
  NB. serves: interpretCalco, newc, newf, also toolbar tools
  NB. x== line number to select (if specified), _1 to clear
tabengine y
confirm tabengine'MSSG'
showTtable''
if. 0=#x     do. restoreSelection''  NB. (selects {1} by default)
elseif. x=_1 do. clearSelection''
elseif.      do. setSelection x      NB. select {x}, or last line if x=_
end.
updatevaluebar''
restoreFocusToInputField''
)

dropfinal=: 4 : 'if. y-: {:x do. }:x else. x end.'  NB. drop {:x if = y

interpretCalco=: 3 : 0
  NB. interpret the user-input command string: y
  NB. If y is empty then ASSUME called as a wd-handler
  NB. In which case interpret contents of TABU wd-cache: calco
if. 0=#y do. y=. dltb calco else. y=. dltb y end.
'y0 y1'=. 2{.y
  NB. Act on miscellaneous forms of y
  NB. No line needs to be selected for these…
if. '$$'-:y 		do. openss''			return. end.
if. (y-:'$')or(y-:,'$') 	do. openss'$'			return. end.
if. ('$'=y0)and y1 e. '0123456789' do. openss y1		return. end.
if. 0=theItem=.line 0 	do. tabenginex 'titl' ; dtlf calco 	return. end.
if. -.isValidItem theItem	do. confirm '>>> no line selected' 	return. end.
  NB. From now on, needs a valid line selection…
  NB. "single-char"
if. isDigit y do. tabenginex 'valu' ; theItem ; y return. end.
select. y
case. ,'-' do. tabenginex 'negv' ; theItem 	return.
case. ,'*' do. tabenginex 'sign' ; theItem 	return.
fcase. ,'/' do.
case. ,'%' do. tabenginex 'invv' ; theItem 	return.
end.
if. 1=#y	do. confirm '>>> single char unhandled: ',brack y 	return. end.
  NB. "command-char" prefixes...
select. {.y
case. '!' do. tabenginex }.y      NB. general CAL-instruction
case. ';' do. 'tabby'&locDo }.y   NB. execute J phrase in _tabby_
case. ':' do. 'cal'&locDo }.y     NB. execute J phrase in _cal_
case.  QT do. tabenginex 'name' ; theItem ; }.y dropfinal QT
case. '=' do. tabenginex 'fmla' ; theItem ; }.y
case. '[' do. tabenginex 'unit' ; theItem ; }.y dropfinal ']'
case. '+' do. tabenginex 'addv' ; theItem ; }.y
case. '-' do. tabenginex 'subv' ; theItem ; }.y
case. '*' do. tabenginex 'mulv' ; theItem ; }.y
fcase.'/' do.
case. '%' do. tabenginex 'divv' ; theItem ; }.y
case. '^' do. tabenginex 'rtov' ; theItem ; }.y
case.     do. theItem interpretQty y
end.
)

locDo=: 4 : 0
cocurrent x
do y
)

isDigit=: (3 : 0) :: 0:
  NB. =1 if y is a single digit
{. (1=#y) and (".y) e. i.10
)

interpretQty=: 4 : 0
  NB. treat y as a qty to go into item {x} --if compatible
if. isNumeric y do. tabenginex 'valu' ; x ; y return. end.
qty=. tabengine 'UUUU' ; y
smoutput llog 'interpretQty x y qty'
tabenginex 'vunn' ; x ; qty
)
