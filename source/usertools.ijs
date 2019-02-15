	NB. tabby - user.ijs
'==================== [tabby] user.ijs ===================='
0 :0
Friday 15 February 2019  19:40:30
-
THIS IS THE DEFAULT DEFN OF USERTOOLS RESIDING IN /source/
IT IS OVERRIDDEN BY AN ALTERNATIVE SCRIPT loaded by: start
USERTOOLS_z_ path specified in: header.ijs
)

coclass 'tabby'

usertool=: 3 : 0
  NB. common to all user-definable tools
ssw '+++ usertool: sysmodifiers=(sysmodifiers)'
if. heldshift'' do. open USERTOOLS_z_ return. end.
if. heldcmnd'' do. ide 1 return. end.
)

black=: 3 : 0
usertool''
confirm '>>> black: not implemented'
)

red=: 3 : 0
usertool''
confirm '>>> red: not implemented'
)

green=: 3 : 0
usertool''
confirm '>>> green: not implemented'
)

blue=: 3 : 0
usertool''
confirm '>>> blue: not implemented'
)