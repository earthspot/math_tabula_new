'==================== main util.ijs ===================='
NB. IAC Sun 28 Jun 2015  18:43:47

cocurrent 'tab'

absent_z_=: [: +./ 0 > [: nc ;:
all_z_=: *./
and_z_=: *.
any_z_=: +./
begins_z_=: ] -: [ {.~ [: # ]
bit_z_=: 4 : 'y{(>:y){.|. #: x'
brack_z_=: 1 |. '][' , ":
cr=: [: 5!:5 boxopen
crr=: > , '=: ' , cr
c_z_=: ([: ": [) , ' ' , [: ": ]  NB. spacing "comma", c/f nb

	NB. pronoun (y) created with value (x)
	NB. UNLESS name (y) already in-use.
	NB. NOT compatible with the "misc.ijs" version
	NB. which has x<--> swapped.
	NB. Permits MYVAR=: 99 default 'MYVAR'
	NB. as well as:   99 default 'MYVAR'
default_z_=: 0&$: :(4 : 0)
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

extx=: (0 < [: # ]) # ] , [ #~ [: -. '.' e. ]	NB. generates: ijs, txt, ...
firstword=: 3 : 'SP taketo y'
NB. flags - eliminated
heldalt=: 3 : '3 bit~ sysmods$0'
heldcmnd=: 3 : '2 bit~ sysmods$0'
heldctrl=: 3 : '1 bit~ sysmods$0'
heldshift=: 3 : '0 bit~ sysmods$0'
ijs=: '.ijs'&extx
isBoxed_z_=: 32 = 3!:0
isInf=: _ e. |
isLit_z_=: 2 2048 e.~ 3!:0
isNo_z_=: isNum *. isScalar
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
listnameswithprefix_z_=: 0 1 2 3&$: :(] ((] -: ({.~ #))S:0 _ # [)~ a: , [ 4!:1~ [: {. ])
llog_z_=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
NaN=: 1 e. [: ; 128!:5
n9_z_=: '0123456789'
nb_z_=: ([: }:@; (<' ') ,.~ ,.)@:(":&.>)
not_z_=: -.
or_z_=: +.
pathof_z_=: ] {.~ [: >: '/' i:~ ]
parentpathof=: [: pathof [: }: pathof
read=: [: 1!:1 <	NB. read file (y)
write=: [ 1!:2 [: < ]	NB. write x to file (y)
shift=: 2 : 'if. 1=sysmods$0 do. v y else. u y end.'
sllog=: smoutput@llog
sortcharnums=: 3 : '": sort 0 ". y'
txt=: '.txt'&extx
updex=: tabenginex bind 'exch'
words=: 3 : 'dltb SP takeafter y'
NB. word1 - eliminated, now uses: firstword

NB. =========================================================
shortpath=: 3 : 0
	NB. short-path of: y (=file) for message output
	NB. undoes the action of jpath for selected tags
me=. 'shortpath'
for_s. ;:'builtin tabula ptabula utabula user addons proj home' do.
  y [np=. # p=. jpath t=. '~',(>s),'/'
NB. sllog 'me np p t y'
  if. (tolower y) begins (tolower p) do. t, np}.y return. end.
end.
)

NB. =========================================================
sysmods=: 3 : 0
{. 0 ". sysmodifiers,' 1'
)

NB. =========================================================
tab_z_=: 4 : 0
	NB. space strings x and y with TABs to (m) TAB-widths
'm z'=. y  NB. m is # of effective TABs to {:y
t=. 9      NB. # of spaces in a TAB (ADJUST FOR IDE CHARACTERISTICS)
x ,(TAB #~ 1>. m - <.(#x)%t), z
)
