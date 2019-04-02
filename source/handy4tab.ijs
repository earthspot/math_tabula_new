	NB. handy4tab.ijs
'==================== [tabby] handy4tab ===================='
cocurrent 'z'

DIRIAC=: 0 : 0
>>> The 'diriac' verb & its 'temp' options:
  0 diriac ''      NB. boxed list of temp scripts (badly sorted)
  3 diriac ''      NB. all temp numbers in-use
 _6 diriac ''      NB. latest 6 temp numbers in-use
  0 diriac '~user/*.ijs'   NB. boxed list of 'filename.ijs'
  1 diriac '~user/*.ijs'   NB. boxed list of filenames only
  2 diriac '~proj/gl*.ijs' NB. boxed list of 'gl' suffixes ONLY
)

and=: *.
any=: +./
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
cuT=: <;._2  NB. fret is {:y (c/f Cut)
ddefine=: 1 : 'm&$: : (4 : 0)'

default=: 0&$: :(4 : 0)
	NB. pronoun (y) created with value (x)
	NB. UNLESS name (y) already in-use.
	NB. NOT compatible with the "misc.ijs" version
	NB. which has x<--> swapped.
	NB. Permits MYVAR=: 99 default 'MYVAR'
	NB. as well as:   99 default 'MYVAR'
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

diriac=: 0&$: :(4 : 0)
	NB. Extract filenames from directory
	NB. returns filenames|nos matching template: y
	NB. eg: diriac '~proj/lif/CAB_*.lif'
	NB. empty y --> '~temp/*.ijs'
	NB. x is param defining the nature of output
how=. 30	NB. temp file containing SAMPLE CALLS
if. y-:'?' do. sst how elseif. y-:'??' do. ot how end.
if. 0=#y do. y=. '~temp/*.ijs' end.	NB. directory: temp (by default)
if. x<0 do. x {. sortd ~. 3 diriac y return. end.
z=. {."1 (1!:0 jpath y)
if. x-:0 do. z return. end.		NB. boxed fn.ext's
fo=. [: > [: {. DT cut ]
z=. fo each z
if. x-:1 do. z return. end.		NB. boxed filenames only
fprefix=. '*' -.~ ([: >: '/' i:~ ]) }. ] {.~ '.' i.~ ]
 NB. smoutput 'diriac: fprefix=',brack fprefix y
n=. #fprefix y
z=. n }. each z
if. x-:2 do. z return. end.		NB. boxed suffixes corresp to '*'
 NB. x-:3 assumed henceforward ...
sort ~. ,> 0 ".each z -.each < a. -. '1234567890'
)

dtlf=: #~ ([: +./\. (10{a.)&~:)
edit=: [: open [: , [: > whichscript_z_
fw=: firstwords=: (' ' taketo ])"1  NB. take 1st word in each row of (cmx) y
ijs=: '.ijs'&extx
isBool=: isBools *. isScalar
isEmpty=: 0 = [: */ $
tmp=: [: jpath '~temp/' , ijs@":
lasttemp=: 3 : 'tmp >./3 diriac tmp ''*'''
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
log=: [: ": ;: ,. [: ".&.> ;:
max=: $:/ :>.
min=: $:/ :<.
o2f=: 3 : 'LF(I. y=SP)}y'
or=: +.
pathof=: ] {.~ [: >: '/' i:~ ]
pc=: '%' ,~ [: ": [: <. 0.5 + 100 * 88350 %~ ]
sllog=: smoutput@llog
sortd=: \:~ :\:
sq=: *: :[:
sqrt=: %: :[:
square=: *: :[:
st=: [: 1!:1 [: < tmp  NB. the contents of temp (y)
sst=: smoutput@st
ssw=: smoutput&sw
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
temp=: lasttemp`tmp@.(*@#@])
to=: [ + [: i. [: >: -~
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)
