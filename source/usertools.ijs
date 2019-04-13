	NB. tabby - user.ijs
'==================== [tabby] user.ijs ===================='
0 :0
Wednesday 10 April 2019  23:57:49
-
THIS IS THE DEFAULT DEFN OF USERTOOLS RESIDING IN /source/
IT IS OVERRIDDEN BY AN ALTERNATIVE SCRIPT loaded by: start
USERTOOLS is a path global created by: start
)

coclass 'tabby'

usertool=: 3 : 0
  NB. common to all user-definable tools
ssw '+++ usertool: sysmodifiers=(sysmodifiers)'
if. heldshift'' do. open :: 0: USERTOOLS return. end.
if. heldcmnd'' do. ide 1 return. end.
)

black=: 3 : 0
usertool''
if. heldnone'' do.
  confirm '>>> black: not implemented'
end.
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