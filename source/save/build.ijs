NB. save - build

NB. AD=: jpath '~Addons/math/tabula/'
NB. ad=: jpath '~addons/math/tabula/'

f=. 3 : 0
load '~TabulaDev/',y,'/build.ijs'  NB. build proj (y)
fread '~Release/',y,'.ijs'  NB. read back the result
)

t=. ;f each ;: 'main qt'
NB. IAC Sat 27 Jun 2015  23:43:34
t fwritenew jpath '~Release/tabula.ijs'

NB. IAC Sat 27 Jun 2015  23:43:34
NB. t fwritenew AD,'tabula.ijs'
NB. t fwritenew ad,'tabula.ijs'
NB.
NB. (AD,'manifest.ijs') fcopynew '~Tabula/save/manifest.ijs'
