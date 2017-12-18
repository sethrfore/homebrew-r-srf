# homebrew-r-srf

Custom hombrew r formula. Customizations add additional r capabilities for Mac OS. Tcl-tk support is added using the Mac OS system tcl-tk framework (formula lines 63-65). Mac OS Command Line Tools must be installed for the appropriate Tcl-tk config files to be available.

Customizations also allow additional r capabilities for Mac OS by adding the following dependencies (formula lines 25-31):

  - depends_on :tex
  - depends_on "texinfo"
  - depends_on "libtiff"
  - depends_on :x11
  - depends_on "cairo"
  - depends_on "icu4c"
  - depends_on "pango"
  
If these capabilities are not desired or their corresponding dependecies are not installed, either install them or run `brew edit sethrfore/r-srf/r` and comment/delete lines 25-31 as desired.
