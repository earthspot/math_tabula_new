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
wd 'psel tab; set panel items *',tabengine'CTBU'
ITEMS=: tabengine'ITMS'
)

restoreSelection=: 3 : 0
wd 'psel tab; set panel select ',panel_select
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

tab_open=: 3 : 0
  NB. serves: start
window_close''
wd TABU
wd 'psel tab'
wd 'pmove ' , ":XYWH
wd 'set g wh _1 64'
wd 'set info text *' , tabengine 'INFO'
NB. try.
NB.   t=. uurowsc searchc
NB.   assert. 2=#$t	NB. therefore must use x2f with wd 'set…'
NB. catch.
  t=. ,:UNSET
NB. end.
wd 'set cons font fixfont'
wd 'set cons items *',x2f t
NB. try.
NB.   t=. uurowsf searchf
NB. catch.
NB.   t=. ,:UNSET
NB. end.
wd 'set func font fixfont'
wd 'set func items *',x2f t
wd 'set preci items *', o2f ": i.16
wd 'set unico items *',CONTENT_UNICO
wd 'set panel font fixfont'
wd 'set panel items *',UNSET
confirm 'Click a line and perform some operation on it...'
wd 'pmoves 1384 23 536 450'  NB. activate remembering window position
wd 'pshow'
fill_tools ''
)

window_close=: 3 : 0
wd :: EMPTY 'psel tab; pclose;'
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
wd 'psel tab; set sbar setlabel status ',dquote ":,y
)

clicktab=: 3 : 0
if. 0=#y do. n=. ".tabs_select
else. n=. y
end.
select. n
NB. case. 0 just drops thru
case. 1 do. fillconsts''
case. 2 do. fillfuncts''
case. 3 do. ttinf''
end.
activateTabWithId n
restoreFocusToInputField''
)

fillconsts=: 3 : 0
  NB. get filtered UUC via CAL
inst=. (".casec) pick ;:'WUUC VUUC'
wd 'psel tab; set cons items *',TEXT=: LF,~ tabengine inst ; searchc
)

fillfuncts=: 3 : 0
  NB. get filtered UUF via CAL
inst=. (".casef) pick ;:'WUUF VUUF'
wd 'psel tab; set func items *',TEXT=: LF,~ tabengine inst ; searchf
)

confirm=: 0 ddefine
putsb CONTENT_CONFIRM=: y
i.0 0 return.
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

ttinf=: 1 ddefine  NB. modified from: ~Gittab/tabula.ijs
if. x-:1 do.
  z=. tabengine 'INFO'
  wd 'psel tab; set info text *',z
  confirm 't-table info retrieved'
elseif. x-:0 do.
  wd 'psel tab; set info text ""'
elseif. do.
  if. 0=#y do. y=. info end.  NB. ==cached content of info field
  tabengine 'info ',y
  nom=. '_ 'charsub tabengine'TNAM'
  confirm sw 'Info: $=($y) updated in t-table: (nom)'
end.
)

setpreci=: 3 : 0
  NB. i is combobox index to select -as string, not int.
if. 0=#y do. i=. preci_select else. i=. ":y end.
wd 'psel tab; set preci select ',i
tabengine 'prec ',i
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
restoreSelection''
restoreFocusToInputField''
)

setunits=: 3 : 0
  NB. set change-units combo (xunit) to reflect panel selection
theItem=. line 0
if. 1>theItem do. wd 'psel tab; set xunit items *' return. end.
z=. tabengine 'UCOM' ; theItem
z=. ~. z ,~ tabengine 'UNIS' ; theItem  NB. include equiv SI units in the list
z=. ~. z ,~ tabengine 'UNIT' ; theItem  NB. include existing units in the list
wd 'psel tab; set xunit items *',utf8 f4b z
wd 'psel tab; set xunit select 0'
)

scino=: ":  NB. DUMMY ONLY <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

setcalco=: 3 : 0
wd 'psel tab; set calco text *',calco=:,":y
)

setcalcovalue=: 3 : 0
  NB. update calco field to reflect (panel_select)
if. 0<theItem=. line 0 do.
  setcalco scino tabengine 'VALU' ; theItem
else.
  setcalco panel -. LF
end.
)

details=: 3 : 0
  NB. (string) details of selected line
selectValidItem''
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

selectValidItem=: 3 : 0
  NB. accept (y)<>'' as a click on that item
if. ITEMS e.~ {.y do.  NB. provided {y} is valid item...
  setSelection y
end.
)

updatevaluebar=: 3 : 0
  NB. update the value bar to reflect (panel_select)
setunits''  NB. handles all cases itself
setcalcovalue''  NB. handles all cases itself
confirm details''
)
