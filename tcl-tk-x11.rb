class TclTkX11 < Formula
  desc "Tool Command Language"
  homepage "https://www.tcl-lang.org"
  url "https://downloads.sourceforge.net/project/tcl/Tcl/8.6.10/tcl8.6.10-src.tar.gz"
  mirror "https://ftp.osuosl.org/pub/blfs/conglomeration/tcl/tcl8.6.10-src.tar.gz"
  sha256 "5196dbf6638e3df8d5c87b5815c8c2b758496eb6f0e41446596c9a4e638d87ed"
  license "TCL"

  ## Original formula credited to https://github.com/agiliopadua/homebrew-extras

  keg_only "avoid conflics with mac and homebrew tcl-tk installations"

  depends_on "libx11"

  resource "tk" do
    url "https://downloads.sourceforge.net/project/tcl/Tcl/8.6.10/tk8.6.10-src.tar.gz"
    mirror "https://fossies.org/linux/misc/tk8.6.10-src.tar.gz"
    sha256 "63df418a859d0a463347f95ded5cd88a3dd3aaa1ceecaeee362194bc30f3e386"
  end

  resource "critcl" do
    url "https://github.com/andreas-kupries/critcl/archive/3.1.18.tar.gz"
    sha256 "6fb0263cc8dfb787ab162ae130570c19f665a03229b8a046ec1c11809c2ff70e"
  end

  resource "tcllib" do
    url "https://downloads.sourceforge.net/project/tcllib/tcllib/1.20/tcllib-1.20.tar.xz"
    sha256 "199e8ec7ee26220e8463bc84dd55c44965fc8ef4d4ac6e4684b2b1c03b1bd5b9"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --mandir=#{man}
      --enable-threads
      --enable-64bit
    ]

    cd "unix" do
      system "./configure", *args
      system "make"
      system "make", "install"
      system "make", "install-private-headers"
      ln_s bin/"tclsh#{version.to_f}", bin/"tclsh"
    end

    # Let tk find our new tclsh
    ENV.prepend_path "PATH", bin

    resource("tk").stage do
      cd "unix" do
        system "./configure", *args, "--with-x", "--with-tcl=#{lib}"
        system "make"
        system "make", "install"
        system "make", "install-private-headers"
        ln_s bin/"wish#{version.to_f}", bin/"wish"
      end
    end

    resource("critcl").stage do
      system bin/"tclsh", "build.tcl", "install"
    end

    resource("tcllib").stage do
      system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
      system "make", "install"
      ENV["SDKROOT"] = MacOS.sdk_path
      system "make", "critcl"
      cp_r "modules/tcllibc", "#{lib}/"
      ln_s "#{lib}/tcllibc/macosx-x86_64-clang", "#{lib}/tcllibc/macosx-x86_64"
    end
  end

  test do
    assert_equal "honk", pipe_output("#{bin}/tclsh", "puts honk\n").chomp
  end
end
