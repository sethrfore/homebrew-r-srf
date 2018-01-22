# homebrew-r-srf

Custom hombrew r formula. Tcl-tk support is added using the Mac OS system tcl-tk framework (see r.rb formula lines 64-66).  

Operational X11/Xquartz and Mac OS Command Line Tools installations are build requirements. X11/Xquartz is required because the tk.h header file used in base r tcltk package includes X11 headers (see https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Tcl_002fTk). Mac OS Command Line Tools must be installed for the appropriate Tcl-tk config files to be available.

Additional compile options are available.
