	NB. tabby - platform_specific.ijs
'==================== [tabby] platform_specific ===================='
0 :0
Tuesday 15 January 2019  01:50:57
-
Bring here all definitions suspected of being platform-specific
)

coclass 'tabby'

  NB. macOS, Macintosh OS X
heldshift=: 	3 : '1=".sysmodifiers'
heldcmnd=: 	3 : '2=".sysmodifiers'
heldshiftcmnd=:	3 : '3=".sysmodifiers'
heldalt=: 	3 : '4=".sysmodifiers'
heldshiftalt=:	3 : '5=".sysmodifiers'
