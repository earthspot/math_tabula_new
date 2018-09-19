	NB. tabby - utilities.ijs
'==================== [tabby] utilities ===================='

cocurrent 'tabby'

shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $
isNaN=: 128!:5

NB. numeral_i=: 4 : 0
NB.   NB. extracts numeral (x) from (lit|num) y
NB.   NB. ignores non-numeric words in y
NB. x{ (-. 128!:5 z) # z=. 0 0 ,~ _.". ":y
NB. )

numeral_i=: [ ([ { [: (([: -. isNaN) # ]) ]) 0 0 ,~ _. ". [: ": ]

n0=: firstnum=: 0&numeral_i
secondnum=: 1&numeral_i
first2nums=: 0 1&numeral_i


smoutput firstnum _55.12 66 77
smoutput secondnum _55.12 66 77
smoutput firstnum '_55.12 66 77'
smoutput secondnum '_55.12 66 77'
smoutput firstnum 'xx _55.12 66 77'
smoutput secondnum 'xx _55.12 66 77'
smoutput firstnum '_55.12 xx 66 77'
smoutput secondnum '_55.12 xx 66 77'
smoutput first2nums 'xx _55.12 xx 66 77'
smoutput first2nums '_55.12 xx 66 77'
smoutput firstnum ,'1'
smoutput firstnum '1'
smoutput -.firstnum 'x'
smoutput -.firstnum 'xx'
smoutput -.firstnum ''
smoutput -.secondnum '1'
smoutput -.secondnum '_55.12 xx'
smoutput first2nums 'xx _55.12 xx 66 77'
smoutput first2nums '_55.12 xx 66 77'
