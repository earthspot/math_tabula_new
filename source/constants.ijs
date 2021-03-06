	NB. tabby - constants.ijs
'==================== [tabby] constants ===================='

cocurrent 'tabby'

ABOUT=: 0 : 0
TABULA: scientific calculator
-works with SI units.
)

  NB. Fill SI conformance level combobox (unico) - does not change
CONTENT_UNICO=: }: 0 : 0
 m/kg/s^2
 m/(kg s²)
 m kg⁻¹ s⁻²
 m·kg⁻¹·s⁻²
)

HELP=: 0 : 0
Help for TABULA (when getting started)…

++ To plot a ttable:
   (…a suitable test-ttable sample is "plot_test")
1. Select the item to become the x-axis.
2. Give the item a minimum or maximum value to be plotted
       eg. _10 or 10
3. Click "steps" tool
   or pick menu: File > Plot 0 to (value)
   --The plot window will appear, showing a plot of
     the LAST item in the ttable.
4. Reselect the lines you prefer to plot,
   then click the "replot" icon in the toolbar,
   or pick menu: File > Line Chart [Bar Chart ...]
)

BS=: '\'
CM=: ','
CO=: ':'
DT=: '.'
COLOR_HOVER=: 255 200 0
COLOR_CLICK=: 255 100 0
COLOR_WHITE=: 255 255 255
COLOR_CLICK=: COLOR_WHITE
DESELECT=: 1
DG=: '°'
DIAMETER=: 25
DQ=: '"'
IDE=: 1  NB. just to make sure it is there
ITEMS=: i.0  NB. cache of valid item ids after last tabengine call
NOCONFIRM_MAX=: 20  NB. suppress: confirm for this number of calls
PEN_WIDTH=: 3
PMOVES=: 0  NB. =1 to use new: 'pmoves' wd-feature (j807 onwards)
QT=: ''''
SC=: ';'
SL=: '/'
TABNDX=: 0
TIMER_HOVER=: 1000 NB. (millisecs) delay before sys_timer_z_''
UNSET=: '<UNSET>'
XYWH=: 1500 22 536 450

  NB. create empty wd-caches in case they are referred-to in code
calco                              =: UNSET
calco_select                       =: '0 0'
casec                              =: ,'0'
casef                              =: ,'0'
cons                               =: UNSET
cons_select                        =: '_1'
func                               =: UNSET
func_select                        =: '_1'
info                               =: UNSET
info_scroll                        =: ,'0'
info_select                        =: '0 0'
panel                              =: UNSET
panel_select                       =: '_1'
preci                              =: ,'0'
preci_select                       =: '_1'
searchc                            =: ''
searchc_select                     =: '0 0'
searchf                            =: ''
searchf_select                     =: '0 0'
syschild                           =: UNSET
sysdata                            =: UNSET
sysdefault                         =: UNSET
sysevent                           =: UNSET
sysfocus                           =: UNSET
syshandler                         =: UNSET
syshwndc                           =: UNSET
syshwndp                           =: UNSET
syslastfocus                       =: UNSET
syslocalec                         =: UNSET
syslocalep                         =: UNSET
sysmodifiers                       =: ,'0'
sysparent                          =: UNSET
systype                            =: UNSET
tabs                               =: UNSET
tabs_select                        =: '_1'
unico                              =: UNSET
unico_select                       =: '_1'
xunit                              =: UNSET
xunit_select                       =: '_1'