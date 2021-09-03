BIN := dmenu-term
PROJECT := dmenu-term
VERSION := 1.2.0

PREFIX ?= /usr
LIB_DIR = $(DESTDIR)$(PREFIX)/lib
BIN_DIR = $(DESTDIR)$(PREFIX)/bin
SHARE_DIR = $(DESTDIR)$(PREFIX)/share

.PHONY: clean
clean:
	rm -rf dist

.PHONY: install
install:
	install -Dm755 -t "$(BIN_DIR)/" $(BIN)
	ln -s $(BIN) "$(BIN_DIR)/$(BIN)-wl"
	install -Dm644 -t "$(SHARE_DIR)/licenses/$(PROJECT)/" LICENSE
	install -Dm644 -t "$(SHARE_DIR)/doc/$(PROJECT)/" README.md

.PHONY: dist
dist: clean
	mkdir -p dist
	git archive -o "dist/$(PROJECT)-$(VERSION).tar.gz" --format tar.gz --prefix "$(PROJECT)-$(VERSION)/" "$(VERSION)"
	gpg --detach-sign --armor "dist/$(PROJECT)-$(VERSION).tar.gz"
	rm -f "dist/$(PROJECT)-$(VERSION).tar.gz"
