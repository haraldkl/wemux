INSTALL=install

PREFIX?=/usr/local
DATAROOTDIR?=$(PREFIX)/share

BINDIR?=$(PREFIX)/bin
SYSCONFDIR?=$(PREFIX)/etc
MANDIR?=$(PREFIX)/man
DOCDIR?=$(DATAROOTDIR)/doc/wemux

%: %.in
	sed   's,$$(DOCDIR),$(DOCDIR),g' '$<'     | \
	  sed 's,$$(MANDIR),$(MANDIR),g'          | \
	  sed 's,$$(SYSCONFDIR),$(SYSCONFDIR),g'  \
	  > '$@'

install: wemux man/wemux.1
	$(INSTALL) -Dm 755 wemux $(DESTDIR)$(BINDIR)/
	$(INSTALL) -Dm 644 man/wemux.1 $(DESTDIR)$(MANDIR)/man1/
	$(INSTALL) -Dm 644 wemux.conf.example $(DESTDIR)$(DOCDIR)/

uninstall:
	rm $(DESTDIR)$(BINDIR)/wemux
	rm $(DESTDIR)$(MANDIR)/man1/wemux.1
	rm $(DESTDIR)$(DOCDIR)/wemux.conf.example

.PHONY: uninstall
