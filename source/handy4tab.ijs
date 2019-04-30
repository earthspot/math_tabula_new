	NB. handy4tab.ijs
'==================== [tabby] handy4tab ===================='
cocurrent 'z'

ddefine=: 1 : 'm&$: : (4 : 0)'

ide=: 3 : 0
select. y
  case. 0 do. wd 'ide hide' [IDE_z_=: y
  case. 1 do. wd 'ide show' [IDE_z_=: y
  case.   do. ide -.IDE_z_	NB. toggle status
end.
)

and=: *.
any=: +./
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
cuT=: <;._2  NB. fret is {:y (c/f Cut)

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
sortd=. \:~ :\:
NB. how=. 30	NB. temp file containing SAMPLE CALLS
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

f4b=: }.@((<10{a.) ;@,. ])

platform=: 3 : 0
  NB. list the IF* booleans and their values
if. y-: 1 do. z=. 'IFJHS';'IFQT'
else. z=. 'IF' nl_z_ 0
end.
('=:',~"1 >z),. ": vv ". ','sfy z
)

  NB. Swift-style string substitution. Use like this:
  NB. ssw '>> The result of (x) is (y) with FLAG=(FLAG)'
  NB. sw returns a resolved string, ssw smoutputs a resolved message
s=. 3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0
m=. < '(' ; ')'
smresolve=: ((0;s;m) ;: ucp)"1
NB. smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
NB. …as J delivers it back
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
ssw=: smoutput&sw

dtlf=: #~ ([: +./\. (10{a.)&~:)
edit=: [: open [: , [: > whichscript_z_
extx=: (0 < [: # ]) # ] , [ #~ [: -. '.' e. ]	NB. …tacit
fname=: ([: >: '/' i:~ ]) }. ] {.~ '.' i:~ ]
fw=: firstwords=: (' ' taketo ])"1  NB. take 1st word in each row of (cmx) y
ijs=: '.ijs'&extx
isBool=: isBools *. isScalar
isBools=: [: all 0 1 e.~ ]
isEmpty=: 0 = [: */ $
isScalar=: [: {. 0 = [: $ $
tmp=: [: jpath '~temp/' , ijs@":
lasttemp=: 3 : 'tmp >./3 diriac tmp ''*'''
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
log=: [: ": ;: ,. [: ".&.> ;:
max=: $:/ :>.
min=: $:/ :<.
o2f=: 3 : 'LF(I. y=SP)}y'
or=: +.
paren=: 1 |. ')(' , ":
pc=: '%' ,~ [: ": [: <. 0.5 + 100 * 88350 %~ ]

sl=: 4 : 0
  NB. RELIABLE path catenator
  NB. IAC Thursday 30 August 2018  16:42:51
SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

sllog=: smoutput@llog
sortd=: \:~ :\:
sq=: *: :[:
sqrt=: %: :[:
square=: *: :[:
st=: [: 1!:1 [: < tmp  NB. the contents of temp (y)
sst=: smoutput@st
temp=: lasttemp`tmp@.(*@#@])
to=: [ + [: i. [: >: -~
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)
