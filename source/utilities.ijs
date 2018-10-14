	NB. tabby - utilities.ijs
'==================== [tabby] utilities ===================='

cocurrent 'tabby'

dtlf=: #~ ([: +./\. (10{a.)&~:)  NB. delete trailing LF's
shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $
isNaN=: 128!:5

NB. numeral_i=: (4 : 0) :: _.
NB.   NB. extracts numeral (x) from (lit|num) y
NB.   NB. ignores non-numeric words in y
NB.   NB. returns (_) if there is no numeral (x)
NB. x{ (-. 128!:5 z) # z=. _.". ":y
NB. )

DN=. _  NB. the default number returned (NOTE: =. is transient!)
NB. numeral_i=: ([ ([ { [: (([: -. isNaN) # ]) ]) 0 0 ,~ _. ". [: ": ]) :: _
numeral_i=: ([ ([ { [: (([: -. isNaN) # ]) ]) _. ". [: ": ]) :: DN

n0=: firstnum=: 0&numeral_i
secondnum=: 1&numeral_i
first2nums=: 0 1&numeral_i

test_numeral_i=: 3 : 0
  NB. assertion test
DN=. y
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

test_numeral_i DN