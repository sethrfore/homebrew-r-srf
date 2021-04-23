# Customizable R formula for Homebrew

Custom hombrew r formula. Tcl-Tk support is added by default using the Mac OS system Tcl-Tk framework (see r.rb formula lines 61-63). The formula also provides optional support for the following dependencies: Cairo, IUC, Java, LibTIFF, OpenBLAS, Pango and TexInfo. 

Operational X11/Xquartz and macOS Command Line Tools installations are build requirements. X11/Xquartz is required because the tk.h header file used in [base r tcltk package includes X11 headers](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Tcl_002fTk). 

On macOS, Xcode must be installed for the appropriate Tcl-Tk config files to be available. 

# Cairo X11
In order for cairo support it is necessary to install a version of cairo with X11 headers. Since the Homebrew core cairo formula no longer supports the `--with-x11` option, a custom cairo formula has been made available in this repository that will support R with cairo device capabilities. If this option is desired and you have a previously installed Homebrew version of cairo, reinstall  using the formula provided here `brew rm cairo && brew install -s sethrfore/r-srf/cairo-x11`. Otherwise `brew install -s sethrfore/r-srf/cairo-x11` should be sufficient. This may neccesitate reinstallation of other formulae depending on cairo. 

# Tcl-Tk X11
An X11 tcl-tk build can be installed via the tcl-tk-x11 formula available [here](https://github.com/sethrfore/homebrew-extras). To install, do as follows:

`brew tap sethrfore/homebrew-r-srf`

`brew install sethrfore/r-srf/tcl-tk-x11`

# Installation

When all system dependecies addressed in the previous section have been met, this modified R formula can be installed as follows.

Add the repository to your homebrew

`brew tap sethrfore/homebrew-r-srf`

Check available installation options

`brew info sethrfore/r-srf/r`

Compile the modified R formula from source with desired options

`brew install -s sethrfore/r-srf/r --with-cairo-x11 --with-tcl-tk-x11`

Note: If necessary, remove previous R and cairo installations prior to compiling the modified R formula. Once installed, the compiled dependencies can be checked by invoking R and running `capabilities()`.

# R/X11 support deprectation notice

While I won't be immediately deprecating X11 supported R builds, I am currently unlikely to continue maintaining them at some point in the furture. For those affected by this, please refer and post any comments to this [discussion thread](https://github.com/sethrfore/homebrew-r-srf/discussions/40). All notices pertaining changes to R/X11 support will be posted here or in the relevant discussion. If you have any thoughts, suggestions or concerns surrounding how/when this process will take place, I highly recommend contributing to the discussion. 

# Note for R Developers

I am open to suggestions on how to improve the functionality of this formula. I am not a programming expert and welcome any tested solutions that enhance the functionality of this formula, specifically with reference to issues related to changes in recent Xcode and CLT deployments.
