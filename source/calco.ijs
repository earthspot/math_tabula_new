	NB. tabby - calco.ijs
'==================== [tabby] main ===================='
0 :0
Monday 25 February 2019  03:09:57
-
replaces interpretCalco
old interpretCalco --> interpretCalco0
-
We need an extended isNumeric which accepts blind decimals and sci#s
)

coclass 'tabby'

blink=: empty

theItem=: 1  NB. dev testing only

register=: 3 : 0
  NB. for use in calco_ verbs only
  NB. reports the last calco_* verb to be entered
NB. ssw '+++ register: (y)'
VEX=: y
)

make_daisychain=: 3 : 0
  NB. makes the daisychain for: interpretCalco
  NB. NOTE: daisychained verbs are all MONADIC
d=: 'calco_' nl 3
promote 'calco_singlet'
promote 'calco_yesno'
promote 'calco_title'
promote 'calco_sample'
]z=. (; d,each <' ::'),'calcoErr'
daisychain=: 13 : ('(',z,')y')
smoutput crr'daisychain'
i.0 0
)

interpretCalco=: 3 : 0
  NB. act on what's in the (calco) input field
if. 0=#y do. y=. dltb calco else. y=. dltb y end.
msg=. empty
NB. msg=. ssw
blink 0	NB. turn blink-1 OFF to start with
VEX=: '<UNSET>'
theUnit=: >tabengine 'UNIT' ; theItem=: line 0
msg '+++ interpretCalco: theItem=(theItem) theUnit=(theUnit) y=[(y)]'
z=. daisychain y
msg '--- interpretCalco: EXITS, VEX=(VEX)'
z return.
)

noSelection=: 3 : 'theItem<0'

promote=: 3 : 0
  NB. assume y is an element of global: z
d=: ~. d ,~ boxopen y
)

calcoErr=: 3 : 0
msg=. ssw
msg '>>> calcoErr: none chime: y=[(y)]'
sw'(y) [???]'
)

calco_misc=: 3 : 0
register'calco_misc'
blink 'blue'
  NB. picks up miscellaneous forms
if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞' else. infinity=. 'infinity' end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0  NB. force error if has not already return.ed
)

0 :0
calco_general=: 3 : 0
register'calco_general'
blink'white'
NB. assert. 0 	NB. FOR THE PRESENT: DOES NOTHING <<<<<<<<<<<<<<<<<<
msg '... calco_general: y=(y)'
)

calco_number=: 3 : 0
register'calco_jnumber'
  NB. handle a valid numeral (not just j-valid)
blink'white'
assert. -. noSelection''
assert. isNumeric y  NB. the most general
tabenginex 'valu' ; theItem ; ". j4sci y
)

isNumeric0J=: (3 : 0) :: 0:
  NB. =1 iff '0',y is NumericJ, scalar, positive
if. '-+' e.~ {.y do. y=. }.y end.
  NB. ---preceding sign can defeat the conversion
assert. isNumericJ '0',y
)

j4sci=: 3 : 0
  NB. convert lit sci syntax to j-scientific
if. DT={.y do. y=. '0',y end.
y rplc '-.' ; '_0.' ; '-' ; '_' ; 'E' ; 'e'
)
0 :0
j4sci '1.23E5'
j4sci '1.23E-5'
j4sci '-1.23E-5'
j4sci '-1.23'
j4sci '1.23'
j4sci '.23'
j4sci '-.23'
)

isNumeric=: (3 : 0) :: 0:
  NB. =1 iff isNumericJ or a valid scientific number
if. (isNumericJ y)and(-. 'E' e. y) do. 1 return. end.
assert. isNumericJ p=. 'e' taketo z
assert. isNumericJ q=. 'e' takeafter z
assert. isScalar n=. ". j4sci z
1 return.
)

calco_blindDecimal=: 3 : 0
register'calco_blindDecimal'
  NB. handle a decimal starting with dot
blink'white'
assert. -. noSelection''
assert. 1= +/ DT = y
assert. isNumeric z=. '0',y
tabenginex 'valu' ; theItem ; ".z
)

calco_singlet=: 3 : 0
register'calco_singlet'
blink'white'
assert. 1=#y
assert. -. noSelection''
NB. msg '... calco_singlet: y=(y)'
if. isDigit y do. tabenginex 'valu' ; theItem ; y return. end.
select. y
case. ,'-' do. tabenginex 'negv' ; theItem return.
case. ,'*' do. tabenginex 'sign' ; theItem return.
fcase. ,'/' do.
case. ,'%' do. tabenginex 'invv' ; theItem return.
end.
)

calco_yesno=: 3 : 0
register'calco_yesno'
blink'white'
assert. -. noSelection''
NB. msg '... calco_yesno: y=(y)'
select. tolower y
fcase. 'yes' do.
fcase. 'on' do.
fcase. 'true' do.
fcase. 'high' do.
case. 'hi' do. tabenginex 'onep' ; theItem return.
fcase. 'no' do.
fcase. 'off' do.
fcase. 'false' do.
fcase. 'low' do.
case. 'lo' do. tabenginex 'zero' ; theItem return.
case. do. assert 0
end.
)

calco_title=: 3 : 0
register'calco_title'
blink'white'
assert. 0=theItem  NB. only handles {0}
tabenginex 'titl' ; dtlf calco
)

calco_prefix1=: 3 : 0
register'calco_prefix1'
  NB. handle ALL lines prefixed by one of these bytes
blink'white'
assert. 1<#y  NB. Must not be a single char…
select. {.y
case.  QT do. tabenginex 'name' ; theItem ; }.y dropfinal QT
case. '=' do. tabenginex 'fmla' ; theItem ; }.y
case. '[' do. tabenginex 'unit' ; theItem ; }.y dropfinal ']'
case. '+' do. tabenginex 'addv' ; theItem ; }.y
case. '*' do. tabenginex 'mulv' ; theItem ; }.y
fcase.'/' do.
case. '%' do. tabenginex 'divv' ; theItem ; }.y
case. '^' do. tabenginex 'rtov' ; theItem ; }.y
case. do. assert 0
end.
)

NB. REWRITE…

calco_qty=: 3 : 0
register'calco_qty'
  NB. handle a "qty" -- a valid number followed by units
blink'white'
assert. -. noSelection''
qty=. tabengine 'UUUU' ; y
smoutput llog 'calco_qty y qty'
tabenginex 'vunn' ; theItem ; qty
)

calco_sample=: 3 : 0
register'calco_sample'
blink'white'
  NB. Act on miscellaneous forms of y
if. '$$'-:y do. openss'' return.
elseif. (y-:,'$') do. openss'$' return.
end.
'y0 y1'=. y
assert. '$'=y0
if. y1 e. '0123456789' do. openss y1 return.
else. assert. 0 end.
)

make_daisychain''

0 :0
onload LF -.~ 0 :0
smoutput interpretCalco '12° 15'' 04"'
)