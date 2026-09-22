# Formula to package CBB (Check Book Balancer) for Hombrew
#
# https://sourceforge.net/projects/cbb/
#
# Source is downloaded from the Debian archive as the last archive still
# online with a simple download URL.
#
# We need to specify the full TCL/Tk wish8.6 in order to run against
# TCL/Tk 8.6; otherwise it will find the TCL/Tk 9 "wish" in the path instead.
#
# Written by Ewen McNeill <ewen@naos.co.nz>, 2026-09-21
# Updated by Ewen McNeill <ewen@naos.co.nz>, 2026-09-21
#
class Cbb < Formula
  desc "CBB (Check Book Balancer) in TCL/Tk"
  homepage "https://sourceforge.net/projects/cbb/"
  url "https://archive.debian.org/debian/pool/main/c/cbb/cbb_0.8.1.orig.tar.gz"
  sha256 "5e6b6e5bc8c64c21690041f4d05529f032d014b258ec17a6768d46aef7a90b21"
  license "GPL-2.0-only"

  uses_from_macos "perl"
  depends_on "tcl-tk@8" => :build

  # Local patches for CBB, derived from the Debian 3.0 / Woody patches
  patch do
    file "source/macos-cbb-0.8.1-4.diff"
  end

  def install
    # The configure needs to find wish / wish8.6 on the path otherwise it
    # will not resolve to the full path in the cbb top level script.
    # (there is a --with-wish, but it seems to only work with a program
    # name, not with a full path, for some reason.)
    #
    # To achieve this, we mark the tcl-tk@8 package as a build dependency,
    # which seems to result in it being on the PATH at build time, and
    # explicitly specify wish8.6 to ensure we get TCL/Tk 8.6 (instead of
    # TCL/Tk 9 which is on the default path).
    #
    system "./configure", "--prefix=#{prefix}",
                          "--with-wish=wish8.6"
    system "make"

    # NOTE the installer uses some perl scripts to do the installation, which
    # (since they are from 2000!) assume that @INC contains "."; this is
    # no longer the case since perl 5.26, so we have to reinject "." into
    # the include path.
    #
    # https://perldoc.perl.org/perl5260delta#Removal-of-the-current-directory-(%22.%22)-from-@INC
    #
    # (for some reason PERL_USE_UNSAFE_INC alone does not seem to work,
    # hence using brute force to override PERL5LIB too)
    #
    ENV["PERL_USE_UNSAFE_INC"] = "true"
    ENV["PERL5LIB"] = "."
    system "make", "install"
  end

  test do
    # Placeholder as it is unclear how to test this in isolation
    system "true"
  end
end
