	NB. tabby - utilities.ijs
'==================== [tabby] utilities ===================='

cocurrent 'tabby'

imgview=: 3 : 0
  NB. show the image at path: (y)
  NB. e.g. imgview temp 'breakback.jpg' (only works for .jpg)
wd :: 0: 'psel form; pclose'
a=: readimg_jqtide_ nom=. y
wd 'pc form closeok; pn ',nom
wd 'cc g isidraw'
wd 'set g minwh ', ":(|.$a)
wd 'pshow'
glsel 'g'
glpixels 0 0 , (|.$a), ,a
)

jpgview=: 3 : 0
z=. jpath '~Resources/',y,'.jpg'
NB. smoutput '+++ jpgview: path=',z
imgview z
)

sampleview=: 3 : 0
  NB. cycles round available $*.jpg in Resources of T
NSAMPLE=: >: _1 default 'NSAMPLE'
if. -. NSAMPLE e. i.8 do. NSAMPLE=: 0 end.
jpgview '$',":NSAMPLE
)

dtlf=: #~ ([: +./\. (10{a.)&~:)  NB. delete trailing LF's
shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $
isNaN=: 128!:5
isNumericJ=: (3 : '-.any isNaN _.". y') :: 0:

NB. numeral_i=: (4 : 0) :: _.
NB.   NB. extracts numeral (x) from (lit|num) y
NB.   NB. ignores non-numeric words in y
NB.   NB. returns (_) if there is no numeral (x)
NB. x{ (-. 128!:5 z) # z=. _.". ":y
NB. )

NB. numeral_i=: ([ ([ { [: (([: -. isNaN) # ]) ]) 0 0 ,~ _. ". [: ": ]) :: _
numeral_i=: ([ ([ { [: (([: -. isNaN) # ]) ]) _. ". [: ": ]) :: _:

n0=: firstnum=: 0&numeral_i
secondnum=: 1&numeral_i
first2nums=: 0 1&numeral_i

test_numeral_i=: 3 : 0
  NB. assertion test
DN=. _
list0=: '_55.12 66 77'
list1=: '_55.12 xx 66 77'
list2=: 'xx _55.12 66 77'
list3=: 'xx _55.12 xx 66 77'
a0=: _55.12 [a1=: 66 [a2=: 77 [a3=: _55.12 66
NB. foo=. smoutput
NB. foo=. smoutput&(-:/)
foo=. assert&(-:/)
foo a0 ; 0 numeral_i list1
foo 66 ; 1 numeral_i list1
foo 77 ; 2 numeral_i list1
foo DN ; 3 numeral_i list1
foo DN ; 4 numeral_i list1
foo DN ; 5 numeral_i list1
foo DN ; 99 numeral_i list1
foo a0 ; firstnum ".list0
foo a1 ; secondnum ".list0
foo a0 ; firstnum list0
foo a1 ; secondnum list0
foo a0 ; firstnum list2
foo a1 ; secondnum list2
foo a0 ; firstnum list1
foo a1 ; secondnum list1
foo a3 ; first2nums list3
foo a3 ; first2nums list1
foo 1  ; firstnum ,'1'
foo 1  ; firstnum '1'
foo DN ; firstnum 'x'
foo DN ; firstnum 'xx'
foo DN ; firstnum ''
foo DN ; secondnum ''
foo DN ; secondnum '1'
foo DN ; secondnum '_55.12 xx'
foo a3 ; first2nums list3
foo a3 ; first2nums list1
)

onload 'test_numeral_i 0'

onload 'imgview temp ''breakback.jpg'''
onload 'imgview temp ''toucan.jpg'''