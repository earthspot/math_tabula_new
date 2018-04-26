NB. test tabula addon

NB. +++++++++++++++++++++++++++++++++++++
NB. THIS IS NOT A SOURCE FILE
NB. IAC Tue 30 Jun 2015  05:19:40
NB. +++++++++++++++++++++++++++++++++++++

T1=: jpath '~/temp/tabula1.ijs'
T2=: jpath '~/temp/tabula2.ijs'


a=. freads '~.Tabula/release/main.ijs'
a=. a, freads '~.Tabula/release/qt.ijs'
b=. decomment_jp_ freads '~addons/math/tabula/tabula.ijs'

NB. a fwrites '~/temp/tabula1.ijs'
NB. b fwrites '~/temp/tabula2.ijs'

NB. =========================================================
lister=: 3 : 0
; y ,each LF
)

NB. =========================================================
chopdefs=: 3 : 0
r=. <;._2 y,LF
m=. (1 e. '=: 3 : ' E. ])&>r
lister each (1,}.m) <;.1 r
)


NB. =========================================================
testcompare=: 3 : 0
'a b'=. chopdefs each y
ra=. a -. b
rb=. b -. a
(;ra ,each LF) fwrites T1
(;rb ,each LF) fwrites T2
meld T1;T2
)

testcompare a;b
