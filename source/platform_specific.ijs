	NB. tabby - platform_specific.ijs
'==================== [tabby] platform_specific ===================='
0 :0
Monday 4 March 2019  16:00:44
-
Bring here all definitions suspected of being platform-specific
)

coclass 'tabby'

  NB. macOS, Macintosh OS X
heldnone=: 	3 : '0=".sysmodifiers'
heldshift=: 	3 : '1=".sysmodifiers'
heldcmnd=: 	3 : '2=".sysmodifiers'
heldshiftcmnd=:	3 : '3=".sysmodifiers'
heldalt=: 	3 : '4=".sysmodifiers'
heldshiftalt=:	3 : '5=".sysmodifiers'
