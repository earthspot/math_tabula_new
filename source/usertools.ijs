	NB. tabby - user.ijs
'==================== [tabby] user.ijs ===================='
0 :0
Saturday 12 January 2019  16:09:03
)

coclass 'tabby'

  NB. path to this script, for redefining user tools in-session
USERSCRIPT_z_=: jpath '~Gittab/source/user.ijs'

usertool=: 3 : 0
  NB. common to all user-definable tools
ssw '+++ usertool: sysmodifiers=(sysmodifiers)'
if. heldshift'' do. open USERSCRIPT_z_ return. end.
)

black=: 3 : 0
usertool''
if. 'empty'-: 5!:5<'sllog' do. sllog=: sllog1=: smoutput@llog
else. sllog=: empty
end.
smoutput '>>> black: sllog is: ',5!:5<'sllog'
)

red=: 3 : 0
usertool''
smoutput '============================='
)

green=: 3 : 0
usertool''
tabenginex 'tran'
)

blue=: 3 : 0
usertool''
if. heldcmnd'' do. smoutput'>>> blue: cmnd' return. end.
smoutput '>>> blue: not implemented'
)