VERSION		= 0.1

BINDIR		= /usr/bin
SBINDIR		= /usr/sbin
MAN1DIR		= /usr/share/man/man1

COPT		= -g
CFLAGS		= -Wall -D_GNU_SOURCE $(COPT) -Wformat-truncation=0
IMGDELTA	= imgdelta
IMGDELTA_SRCS	= imgdelta.c \
		  tracing.c \
		  util.c
IMGDELTA_OBJS	= $(IMGDELTA_SRCS:.c=.o)
LINK		= -L.

LIB		= libwormhole.a
LIB_SRCS	= \
LIB_OBJS	= $(LIB_SRCS:.c=.o)

_MAN1PAGES	= 

all: $(IMGDELTA)

clean:
	rm -f $(IMGDELTA)
	rm -f *.o *.a

install: $(IMGDELTA)
	@case "$(DESTDIR)" in \
	""|/*) ;; \
	*) echo "DESTDIR is a relative path, no workie" >&2; exit 2;; \
	esac
	install -m 755 -d $(DESTDIR)$(BINDIR)
	install -m 555 -s $(IMGDELTA) $(DESTDIR)$(BINDIR)
ifneq ($(MAN1PAGES),)
	install -m 755 -d $(DESTDIR)$(MAN1DIR)
	install -m 444 $(MAN1PAGES) $(DESTDIR)$(MAN1DIR)
endif

$(IMGDELTA): $(IMGDELTA_OBJS)
	$(CC) $(CFLAGS) -o $@ $(IMGDELTA_OBJS)

ifeq ($(wildcard .depend), .depend)
include .depend
endif

depend:
	gcc $(CFLAGS) -MM *.c >.depend

dist:
	mkdir imgdelta-$(VERSION)
	cp $$(git ls-files) imgdelta-$(VERSION)
	tar cvjf imgdelta-$(VERSION).tar.bz2 imgdelta-$(VERSION)/
	rm -rf imgdelta-$(VERSION)

