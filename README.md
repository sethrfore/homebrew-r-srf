# homebrew-r-srf

Custom hombrew r formula. Tcl-Tk support is added by default using the Mac OS system Tcl-Tk framework (see r.rb formula lines 61-63). The formula also provides optional support for the following dependencies: Cairo, IUC, Java, LibTIFF, OpenBLAS, Pango and TexInfo. 

Operational X11/Xquartz and macOS Command Line Tools installations are build requirements. X11/Xquartz is required because the tk.h header file used in [base r tcltk package includes X11 headers](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Tcl_002fTk). 

macOS Command Line Tools must be installed for the appropriate Tcl-Tk config files to be available. 

# macOS 10.14 (‘Mojave’) Xcode/CLTs 10 users
For macOS 10.14 (‘Mojave’)and Xcode/CLTs 10 users, an additional step is needed to install the headers in the appropriate locations. From the Terminal run:

`sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /`

# macOS 10.15 (‘Catalina’) Xcode/CLTs 11 users
For macOS 10.15 (‘Catalina’) and Xcode/CLTs 11 users, the installer package referenced above is no longer available and other steps are required to obtain Tcl-Tk functionality. As of now, I haven't found a seamless way to incorporate Tcl-Tk that does not require editing some system files. There is an R formula available in the dev-tcltk branch of this repo that provides Tcl-Tk functionality but requires some manual file editing prior to installation. See the formula code for instructions. For background and details on current Catalina/Tcl-Tk issues see [this](https://github.com/sethrfore/homebrew-r-srf/issues/17) and [this](https://github.com/sethrfore/homebrew-r-srf/issues/16). 

Consult the [R-dev installation manual](https://cran.r-project.org/doc/manuals/r-devel/R-admin.html#macOS) for more detailed information.

In order for cairo support it is necessary to install a version of cairo with X11 headers. Since the Homebrew core cairo formula no longer supports the `--with-x11` option, a custom cairo formula has been made available in this repository that will support R with cairo device capabilities. If this option is desired and you have a previously installed Homebrew version of cairo, reinstall  using the formula provided here `brew rm cairo && brew install -s sethrfore/r-srf/cairo`. Otherwise `brew install -s sethrfore/r-srf/cairo` should be sufficient. This may neccesitate reinstallation of other formulae depnding on cairo. 

# Installation

When all system dependecies addressed in the previous section have been met, this modified R formula can be installed as follows.

Add the repository to your homebrew

`brew tap sethrfore/homebrew-r-srf`

Check available installation options

`brew info sethrfore/r-srf/r`

Compile the modified R formula from source with desired options

`brew install -s sethrfore/r-srf/r --with-cairo --with-libtiff`

Note: If necessary, remove previous R and cairo installations prior to compiling the modified R formula. Once installed, the compiled dependencies can be checked by invoking R and running `capabilities()`.

# Note for R Developers

I am open to suggestions on how to improve the functionality of this formula. I am not a programming expert and welcome any tested solutions that enhance the functionality of this formula, specifically with reference to issues related to changes in recent Xcode and CLT deployments. 
