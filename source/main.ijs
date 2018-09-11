	NB. tabby - main.ijs
'==================== [tabby] main ===================='
0 :0
Friday 31 August 2018  21:14:03
)

coclass 'tabby'

showTtable=: 3 : 0
wd 'psel tab; set panel items *',tabengine'CTBU'
restoreSelection y
restoreFocusToInputField''
)

restoreSelection=: 3 : 0
  NB. DOES NOT WORK: wd 'set…' only actions 1st index#
if. y=0 do. i.0 0 return. end.
for_i. ".panel_select do.
  wd 'psel tab; set panel select ',":i
end.
)

newtt=: 3 : 0
tabengine'newt'
showTtable''
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
  NB. redraws toolbar, hilites tool id= y
  NB. (bool) x controls hilite color
glsel 'g'
NB. glclear''
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

NB. tabengine=: 3 : 0
NB.   NB. dummy simulator replaced by tabengine_cal_
NB. select. 4{.y
NB. case. 'Init' do. TABENGINE_RESPONSE_Init
NB. case. 'INFO' do. TABENGINE_RESPONSE_INFO
NB. case.        do. TABENGINE_RESPONSE_NOT_IMPLEMENTED,y
NB. end.
NB. )

set_ucase=: 3 : 0
  NB. dummy placeholder replaced by set_ucase_uu_
ssw '>>> set_ucase: dummy placeholder, y=(y)'
)

calcmd=: 3 : 0
  NB. dummy placeholder --will use formatIN_uu_
ssw '>>> calcmd: not implemented, calco=[(calco)]'
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
  NB. Expand to interrogate CAL for (filtered) list
set_ucase casec-: ,'0'
NB. wd 'psel tab; set cons items *',x2f uurowsc searchc
wd 'psel tab; set cons items *',CONTENT_CONSTANTS,date''
)

fillfuncts=: 3 : 0
  NB. Expand to interrogate CAL for (filtered) list
set_ucase casef-: ,'0'
NB. wd 'psel tab; set func items *',x2f uurowsf searchf
wd 'psel tab; set func items *',CONTENT_FUNCTIONS,date''
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
empty''
)

ttinf=: 1 ddefine  NB. modified from: ~Gittab/tabula.ijs
if. x-:1 do.
  z=. tabengine 'INFO'
  wd 'psel tab; set info text *',z
  confirm 'ttable info retrieved'
elseif. x-:0 do.
  wd 'psel tab; set info text ""'
elseif. do.
  if. 0=#y do. y=. info end.
  tabenginex 'info' ; y
  confirm sw 'Info: $=($y) updated in t-table: (NAME_TTABLE)'
end.
)