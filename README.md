# CBB (Check Book Balancer)

[CBB](https://sourceforge.net/projects/cbb/) was an early 2000s era
"Check Book Balancer" program, written in TCL/Tk (with some additional
tools in perl).  Its main advantage is that it uses simple TSV
(Table Separated Values) files to record data, which makes it easy
to use with git for revision history and backups.

The last stable release was [0.8.1 in January
2000](https://sourceforge.net/projects/cbb/files/cbb-0.8%20%28stable%29/).
There was a beta release of [0.9.5 in August 2001](https://sourceforge.net/projects/cbb/files/cbb-0.9%20%28beta%29/cbb-0.9.5/)
accompanied by a move to a new hosting site (which has since disappeared).
But the beta release was never finished as far as I can tell, and does not
seem to have been adopted.

It was packaged in Debian Stable until about 2004, which is when I
started using it. (Specifically it was included up to Debian 3.0 /
Woody, but not included in Debian 3.1 / Sarge [due to being removed
because the Debian package was
orphaned](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=249610&pow_referer=#15).)

Due to TCL/Tk being fairly backwards compatible it still works with
TCL/Tk 8, although with some UI bugs (eg, selection from a list
will sometimes default to the end of the list, and sometimes the
tooltips system gets confused and throws an uninitialised warning).
Because of the increasing UI bugs in later TCL/Tk versions I have
never tried to get it running on TCL/Tk 9 (from 2024).
([TCL 8.3.0 was released
in 2000](https://wiki.tcl-lang.org/page/Tcl+chronology), which is probably
the last version the original developer plausibly tested CBB with; although
the CBB README suggest TCL 7.4 as a version to install with.)

I would suggest *not* starting using CBB in 2026, but I have been
using it since 2003, and both have a couple of decades of existing data and
tools built arond the (simple) file format.

[Starting in 2009](https://ewen.mcneill.gen.nz/blog/entry/2009-12-09-cbb/)
I have managed to get it running on macOS (then on Mac OS X 10.6).

This Homebrew Formula simply exists to record the install steps in a way
that makes it easier to install on a new system.

The diff used was originally derived from Debian Woody, and forward ported
to macOS.

## How do I install these formulae?

`brew install naosnz/cbb/cbb`

Or as individual commands:

```shell
brew tap naosnz/cbb
brew trust naosnz/cbb
brew install cbb
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "naosnz/cbb"
trust "naosnz/cbb"
brew "<formula>"
```

## Licensing

CBB is available under a GPL v2 license (see 
[SourceForge summary](https://sourceforge.net/projects/cbb/)).

These Homebrew Formula to facilitate installing it is available under
a MIT License; see the [LICENSE](LICENSE) file for the text of the
MIT License.
