	NB. tabby - calcmd.ijs
'==================== [tabby] calcmd.ijs ===================='
0 :0
Friday 21 September 2018  21:47:22
-
TABULA input line interpreter
Withdraw the single-char command set
-
>>> REALLY NEEDS A DAISYCHAIN !!
)

tabenginex=: 3 : 0
  NB. serves verb: calcmd below
  NB. BE SHY of using it elsewhere in handlers
confirm tabengine y
showTtable''
NB. restoreSelection''
tab_panel_select 1
restoreFocusToInputField''
)

calcmd=: 3 : 0
  NB. interpret the user-input command string: y
sess=. empty  NB. for distribution
sess=. ssw  NB. while under development
  NB. arg: y is the string to be interpreted.
  NB. If y is empty then ASSUME I'm being called as a wd-handler
  NB. In that case interpret contents of TABU wd-cache: calco
if. 0=#y do. y=. dltb calco end.
theItem=. line 0
c0=. {.y
yy=. dlb }.y
select. c0
case. '/' do. sess 'calcmd: Engine cmd'
  tabenginex yy return.
case. '$' do. sess 'calcmd: load numbered sample: (yy)'
  tabenginex 'open ',yy return.
end.
if. '_1'-: panel_select do. confirm '>>> Select a line to work with' return. end.
  NB. If title line selected then accept y as new title
if. (0<#y) *. (0-:theItem) do.
  tabenginex 'titl' ; y
  return.
end.
VALUE=: UNDEFINED [ UNITS=: '??' [ RIDER=: ''
if. ']['-: 2{._1|.y do. sess 'calcmd: units (forced)'
  if. isunits z=. y -. '][' do.
    tabenginex 'unit' ; theItem ; z  NB. >>>> BUT isunits changes UNITS
  else. confirm '>>> bad units:' ; z
  end.
elseif. c0='=' do. sess 'calcmd: Formula (yy)'
  tabenginex 'fmla' ; theItem ; yy
elseif. c0=QT do. sess 'calcmd: label (forced)'
  tabenginex 'name' ; theItem ; yy
elseif. c0 e. '+-*/^' do. sess 'calcmd: increment (yy)'
  increment yy
elseif. isnumeric y do. sess 'calcmd: numeric'
  tabenginex 'valu' ; theItem ; y
elseif. isunits y do. sess 'calcmd: units'
  tabenginex 'unit' ; theItem ; UNITS
  setunits''
elseif. isvalunits y do. sess 'calcmd: value+units[+rider]'
  if. 0<#RIDER do.
    tabengine 'name' ; theItem ; RIDER
  end.
  setunits'' [ tabengine 'unit' ; theItem ; UNITS
  tabenginex 'valu' ; theItem ; VALUE
elseif. isnumvec y do. sess 'calcmd: plot instruction'
  invalplot''
  plotx y rplc '-' ; '_'
elseif. do. sess 'calcmd: label (default)'
  tabenginex 'name' ; theItem ; y
end.
)

isnumeric=: 3 : 0
-. any (128!:5) _.". y
)

isunits=: 3 : 0
-. '0 *' -: tabengine 'uuuu 1 ',UNITS=: deb y
)

isvalunits=: 3 : 0
if. 1<#z=. _". y do.
  if. (_=VALUE=: {.z) +. (_~:1{z) do. 0 return. end.
else. 0 return.
end.
'y r'=. 2{. QT cut y
RIDER=: dlb r
if. 0=#UNITS=: deb SP dropto y do. UNITS=: '/' end.
isunits UNITS
)

