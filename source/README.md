Source downloaded from:

https://sourceforge.net/projects/cbb/files/cbb-0.8%20%28stable%29/0.8.1/

on 2026-09-22.

Also matches the orig.tar.gz from the last Debian packaging of CBB:

https://archive.debian.org/debian/pool/main/c/cbb/cbb_0.8.1.orig.tar.gz

which is what is used as the "upstream" download location since it allows
direct downloads.

But given the age of the source, also archiving the original source package
in this git repo to increase the chances of reproducing the Formula build.

(Unfortunately it appears Homebrew Formula cannot reference local files,
only URLs; eventually we could probably reference the public repo hosting
this Formula git repo if necessary.)


The original Debian diff is from:

https://archive.debian.org/debian/pool/main/c/cbb/cbb_0.8.1-4.diff.gz

and the "de-debianised" version has had the debian/* directory removed,
and a couple of other changes made as described in:

https://ewen.mcneill.gen.nz/blog/entry/2009-12-09-cbb/

But the diff here has been minimised to avoid changes to the configure
script (which are the bulk of the size of the original diff I came up
with in 2009).

The `tkEntrySetCursor` implementation in `bindings.tcl` is from:

Additional implementations from Marco A. P. Cabral

http://www.dma.im.ufrj.br/~mcabral/cbb.html

but it appears that page was (a) never archived, and (b) is now
long gone, so I have only my 2009 notes remaining.
