'==================== qt help.ijs ===================='
NB. IAC Sun 28 Jun 2015  04:52:40

HELP=: 0 : 0
Help for TABULA (when getting started)…

++ To plot a t-table:
   (…a suitable t-table sample is "plot_test")
1. Select the item to become the x-axis.
2. Give the item a minimum or maximum value to be plotted
       eg. _10 or 10
3. Click "steps" tool
   or pick menu: File > Plot 0 to (value)
   --The plot window will appear, showing a plot of
     the LAST item in the t-table.
4. Reselect the lines you prefer to plot,
   then click the "replot" icon in the toolbar,
   or pick menu: File > Line Chart [Bar Chart ...]

++ Typed-in mini-commands:
   [               move selection down (or just: Enter)
   ]               move selection up
   .               undo
   ..              redo
   ;               repeat last action
   @               load SAMPLE
   @0              Load builtin SAMPLE0
   @1              Load builtin SAMPLE1 etc.

++ Other "calco" commands (diagnostics only):
   j $TABU         run J expression in locale 'tab'
   J $CAPT         run J expression in locale 'cal'
   /newu km        enter a direct CAL-command
   /VERS           -e.g. the version# of the CAL-engine
++ To view all CAL-engine commands, click "query-cog" icon.
)