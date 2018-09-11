	NB. tabby - utilities.ijs
'==================== [tabby] utilities ===================='

cocurrent 'tabby'

shift=: 2 : 'if. 1=".sysmodifiers do. v y else. u y end.'
isEmpty=: 0 = [: */ $