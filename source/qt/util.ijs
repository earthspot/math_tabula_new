'==================== qt util.ijs ===================='

NB. =========================================================
bnxy=: 3 : 0
NB. button X,Y for isigraph button# x
NB. multiply by 32 for pixel X,Y
(16|y),(y>:16)
)

NB. =========================================================
cb24=: 3 : 0
NB. convert (r g b)-->24-bit-color
+/y * |.256^i.3
)

NB. =========================================================
contains=: 4 : 0
NB. =1 iff x contains any of wds in: y
any (;:x) e. ;:y
)

NB. =========================================================
convicon=: 3 : 0
NB. convert char-represented pixel to rgb num
z=. 0 16bff0000 16bffff00 16b00ff00 16b0000ff 16b3c90fc 16b8e530f 16b9500fc 16ba9a9a9 16be6e6e6 16bffffff
z=. z - IF64 * 16777215
z{~ '=rygbaMv.;' i. y -. LF
)

NB. =========================================================
dtblf=: #~ ([: +./\. [: -. (10 32{a.) e.~ ])

NB. =========================================================
ext=: 4 : 'if. -. DT e. x do. x,DT,y else. x end.'

ffrom=: 4 : 0
NB. analogue of From '{' for use with f-lists
LF taketo (x>0) }. y }.~ x i.~ +/\y=LF
)

NB. =========================================================
inc1=: 3 : 'y{1 _1'

NB. =========================================================
NB. invalg=: wd@('psel tab; setinvalid g'"_)
invalg=: ]

NB. =========================================================
isnumeral=: 3 : 0
NB. y is a (str) valid scalar numeral
if. 2~: 3!:0 y do. 0 return. end. NB. must be 'literal'
a=. 0<#y  NB. not empty
NB. b=. *./y e. n9,DT NB. only contains digits and DT
v=. _". y  NB. critical evaluation
c=. 0=#$v  NB. eval'd no is scalar
d=. -.NaN v  NB. v is valid numeral(s)
f=. -.isInf v  NB. v is not _ or __
NB. i=. *./y e. n9 NB. only contains digits
a *. c *. d *. f
)

NB. =========================================================
isnumeric=: 3 : 0"1
	NB. 1= string (y) is valid (J) (real) numeral or numeric expr
VALUE=: UNDEFINED
try. isNo VALUE=: ".y
catch.
  VALUE=: UNDEFINED
  try. isNo VALUE=: -.".y  NB. try as more conventional numeral
  catch. 0
  end.
end.
)

NB. UNDEFINED has now been added to [main] consts.ijs
NB. IAC Sun 28 Jun 2015  04:28:23

NB. =========================================================
isnumvec=: 3 : 0
NB. y is a (str) valid vector numeral 1<# ".y
NB. c/f isnumeral
if. 2~: 3!:0 y do. 0 return. end. NB. must be 'literal'
if. 0=#y do. 0 return. end.  NB. not empty
try. v=. ". y  NB. evaluation as J noun expr
catch. 0 return. NB. syntactically correct
end.
c=. 1<#v  NB. eval'd no is vec, #>1
d=. -.NaN v  NB. v is valid numeral/s
c *. d
)

NB. =========================================================
isunits=: 3 : 0
NB. Bool: y is valid units, set UNITS
-. '??' -: >{.convert UNITS=: deb y
)

NB. =========================================================
isvalunits=: 3 : 0
NB. Bool: y is value + units, set UNITS
NB. c/f isunits
if. 1<#z=. _". y do. NB. converts to 2 nos or more
  if. (_=VALUE=: {.z) +. (_~:1{z) do. 0 return. end.
else. 0 return.
end.
'y r'=. 2{. QT cut y
RIDER=: dlb r
if. 0=#UNITS=: deb SP dropto y do. UNITS=: '/' end.
-. '??' -: >{.convert UNITS
)

NB. =========================================================
isverb=: 3 = [: 4!:0 <

NB. =========================================================
NB. listfmt - eliminated
NB. nr - eliminated

NB. =========================================================
panelselect=: 3 : 'panel_select'

NB. =========================================================
pix=: 4 : 0
NB. draw pixels of icon: y for button#: x -- 0..31
'X Y'=. 32 * bnxy x
glpixels X,Y, 32 32 ,, convicon y
glpaint''   NB. needed for isidraw
)

NB. =========================================================
NB. show tab events
NB. all except g
showtabevents=: 3 : 0
if. -. 'tab_g' -: 5 {. sysevent do.
  smoutput sysevent
end.
)

NB. =========================================================
trunc=: i. {. [
truncl=: i: {. [
truncmax=: 4 : 'if. x<$y do. x{.y else. y end.'
truncn=: 3 : 'if. ''0123456789'' e.~ {:y do. }:y else. y end.'
truncnn=: truncn^:_

NB. =========================================================
win=: 3 : 0
NB. convert path for Windows
if. IFWIN32 +. IFWINNT do. y rplc SL ; BS else. y end.
)
