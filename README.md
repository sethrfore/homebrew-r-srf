# homebrew-r-srf

Custom hombrew r formula. Tcl-tk support is added using the Mac OS system tcl-tk framework (see r.rb formula lines 61-63).  

Operational X11/Xquartz and Mac OS Command Line Tools installations are build requirements. X11/Xquartz is required because the tk.h header file used in [base r tcltk package includes X11 headers](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Tcl_002fTk). Mac OS Command Line Tools must be installed for the appropriate Tcl-tk config files to be available.

In order for cairo support it is necessary to install a version of cairo with X11 headers. Since the Homebrew core cairo formula no longer supports the `--with-x11` option, a custom cairo formula has been made available in this repository that will support R with cairo device capabilities. If this option is desired, reinstall cairo using the formula provided here `brew rm cairo && brew install sethrfore/r-srf/cairo`. This may neccesitate reinstallation of other formulae depnding on cairo. 
