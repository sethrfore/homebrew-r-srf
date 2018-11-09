# homebrew-r-srf

Custom hombrew r formula. Tcl-tk support is added by default using the Mac OS system tcl-tk framework (see r.rb formula lines 61-63). The formula also provides optional support for the following dependencies: Cairo, IUC, Java, LibTIFF, OpenBLAS, Pango and TexInfo. 

Operational X11/Xquartz and Mac OS Command Line Tools installations are build requirements. X11/Xquartz is required because the tk.h header file used in [base r tcltk package includes X11 headers](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Tcl_002fTk). Mac OS Command Line Tools must be installed for the appropriate Tcl-tk config files to be available.

In order for cairo support it is necessary to install a version of cairo with X11 headers. Since the Homebrew core cairo formula no longer supports the `--with-x11` option, a custom cairo formula has been made available in this repository that will support R with cairo device capabilities. If this option is desired and you have a previously installed Homebrew version of cairo, reinstall  using the formula provided here `brew rm cairo && brew install -s sethrfore/r-srf/cairo`. Otherwise `brew install -s sethrfore/r-srf/cairo` should be sufficient. This may neccesitate reinstallation of other formulae depnding on cairo. 

# Installation

This modified R formula can be installed as follows.

Add the repository to your homebrew

`brew tap sethrfore/homebrew-r-srf`

Check available installation options

`brew info sethrfore/r-srf/r`

Compile the modified R formula from source with desired options

`brew install -s sethrfore/r-srf/r --with-cairo --with-libtiff`

Note: If necessary, remove previous R and cairo installations prior to compiling the modified R formula. Once installed, the compiled dependencies can be checked by invoking R and running `capabilities()`.
