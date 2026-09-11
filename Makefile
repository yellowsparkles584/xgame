CC = winegcc
CFLAGS = --cc-cmd="x86_64-w64-mingw32-gcc-win32" -b x86_64-w64-mingw32
x86_64_CC = x86_64-w64-mingw32-gcc-win32
x86_64_CFLAGS = -g -O2 -Isrc -Iinclude -I/usr/include/wine/wine/windows -I/usr/include/wine/wine/msvcrt -I/usr/include/wine \
  -L/usr/lib/x86_64-linux-gnu/wine/x86_64-windows -D_UCRT -D__WINESRC__ -D__WINE_PE_BUILD -Wall -fno-strict-aliasing -Wempty-body -Wignored-qualifiers \
  -Winit-self -Wno-packed-not-aligned -Wshift-overflow=2 -Wtype-limits -Wunused-but-set-parameter -Wvla -Wwrite-strings -Wpointer-arith -Wlogical-op \
  -ffunction-sections -Wno-misleading-indentation -Wformat-overflow -Wnonnull -mlong-double-64 -mcx16 -mcmodel=small -gdwarf-4 -Wdeclaration-after-statement \
  -Wstrict-prototypes -Wabsolute-value
WIDL = widl
WIDLFLAGS = -m64 -Iinclude -D__WINESRC__

.PHONY: all clean
all: xgameruntime.dll
clean:
	rm include/xaccessibility.h include/xappcapture.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h include/xgameactivation.h \
  include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntimefeature.h include/xgamesave.h include/xgamestreaming.h \
  include/xgameui.h include/xnetworking.h include/xpackage.h include/xpersistentlocalstorage.h include/xstore.h include/xsystem.h include/xuser.h src/main.o \
  src/xaccessibility.o src/xappcapture.o src/xdisplay.o src/xerror.o src/xgame.o src/xgameactivation.o src/xgameevent.o src/xgameinvite.o src/xgameprotocol.o \
  src/xgameruntimefeature.o src/xgamesave.o src/xgamestreaming.o src/xgameui.o src/xnetworking.o src/xpackage.o src/xpersistentlocalstorage.o src/xstore.o \
  src/xsystem.o src/xsystemanalytics.o src/xthreading.o src/xuser.o xgameruntime.dll
include/xaccessibility.h: include/xaccessibility.idl include/xgameruntimetypes.h include/xspeechsynthesizer.h
	$(WIDL) -o $@ include/xaccessibility.idl $(WIDLFLAGS)
include/xappcapture.h: include/xappcapture.idl include/xasync.h include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xappcapture.idl $(WIDLFLAGS)
include/xasyncprovider.h: include/xasync.h include/xasyncprovider.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xasyncprovider.idl $(WIDLFLAGS)
include/xdisplay.h: include/xasync.h include/xdisplay.idl include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xdisplay.idl $(WIDLFLAGS)
include/xerror.h: include/xerror.idl
	$(WIDL) -o $@ include/xerror.idl $(WIDLFLAGS)
include/xgame.h: include/xasync.h include/xgame.idl include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xgame.idl $(WIDLFLAGS)
include/xgameactivation.h: include/xgameactivation.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xgameactivation.idl $(WIDLFLAGS)
include/xgameevent.h: include/xasync.h include/xgameevent.idl include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xgameevent.idl $(WIDLFLAGS)
include/xgameinvite.h: include/xgameinvite.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xgameinvite.idl $(WIDLFLAGS)
include/xgameprotocol.h: include/xgameprotocol.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xgameprotocol.idl $(WIDLFLAGS)
include/xgameruntimefeature.h: include/xgameruntimefeature.idl
	$(WIDL) -o $@ include/xgameruntimefeature.idl $(WIDLFLAGS)
include/xgamesave.h: include/xasync.h include/xgamesave.idl include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xgamesave.idl $(WIDLFLAGS)
include/xgamestreaming.h: include/xgameruntimetypes.h include/xgamestreaming.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xgamestreaming.idl $(WIDLFLAGS)
include/xgameui.h: include/xasync.h include/xgameui.idl include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xgameui.idl $(WIDLFLAGS)
include/xnetworking.h: include/xasync.h include/xnetworking.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xnetworking.idl $(WIDLFLAGS)
include/xpackage.h: include/xasync.h include/xgameruntimetypes.h include/xpackage.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xpackage.idl $(WIDLFLAGS)
include/xpersistentlocalstorage.h: include/xasync.h include/xgameruntimetypes.h include/xpackage.idl include/xpersistentlocalstorage.idl include/xtaskqueue.h
	$(WIDL) -o $@ include/xpersistentlocalstorage.idl $(WIDLFLAGS)
include/xstore.h: include/xasync.h include/xstore.idl include/xtaskqueue.h include/xuser.idl
	$(WIDL) -o $@ include/xstore.idl $(WIDLFLAGS)
include/xsystem.h: include/xgameruntimetypes.h include/xsystem.idl
	$(WIDL) -o $@ include/xsystem.idl $(WIDLFLAGS)
include/xuser.h: include/xuser.idl include/xasync.h include/xtaskqueue.h
	$(WIDL) -o $@ include/xuser.idl $(WIDLFLAGS)
src/main.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/main.c src/private.h
	$(x86_64_CC) -c -o $@ src/main.c $(x86_64_CFLAGS)
src/xaccessibility.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xaccessibility.c
	$(x86_64_CC) -c -o $@ src/xaccessibility.c $(x86_64_CFLAGS)
src/xappcapture.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xappcapture.c
	$(x86_64_CC) -c -o $@ src/xappcapture.c $(x86_64_CFLAGS)
src/xdisplay.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xdisplay.c
	$(x86_64_CC) -c -o $@ src/xdisplay.c $(x86_64_CFLAGS)
src/xerror.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xerror.c
	$(x86_64_CC) -c -o $@ src/xerror.c $(x86_64_CFLAGS)
src/xgame.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgame.c
	$(x86_64_CC) -c -o $@ src/xgame.c $(x86_64_CFLAGS)
src/xgameactivation.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgameactivation.c
	$(x86_64_CC) -c -o $@ src/xgameactivation.c $(x86_64_CFLAGS)
src/xgameevent.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgameevent.c
	$(x86_64_CC) -c -o $@ src/xgameevent.c $(x86_64_CFLAGS)
src/xgameinvite.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgameinvite.c
	$(x86_64_CC) -c -o $@ src/xgameinvite.c $(x86_64_CFLAGS)
src/xgameprotocol.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgameprotocol.c
	$(x86_64_CC) -c -o $@ src/xgameprotocol.c $(x86_64_CFLAGS)
src/xgameruntimefeature.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgameruntimefeature.c
	$(x86_64_CC) -c -o $@ src/xgameruntimefeature.c $(x86_64_CFLAGS)
src/xgamesave.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgamesave.c
	$(x86_64_CC) -c -o $@ src/xgamesave.c $(x86_64_CFLAGS)
src/xgamestreaming.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgamestreaming.c
	$(x86_64_CC) -c -o $@ src/xgamestreaming.c $(x86_64_CFLAGS)
src/xgameui.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xgameui.c
	$(x86_64_CC) -c -o $@ src/xgameui.c $(x86_64_CFLAGS)
src/xnetworking.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xnetworking.c
	$(x86_64_CC) -c -o $@ src/xnetworking.c $(x86_64_CFLAGS)
src/xpackage.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xpackage.c
	$(x86_64_CC) -c -o $@ src/xpackage.c $(x86_64_CFLAGS)
src/xpersistentlocalstorage.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xpersistentlocalstorage.c
	$(x86_64_CC) -c -o $@ src/xpersistentlocalstorage.c $(x86_64_CFLAGS)
src/xstore.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xstore.c
	$(x86_64_CC) -c -o $@ src/xstore.c $(x86_64_CFLAGS)
src/xsystem.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xsystem.c
	$(x86_64_CC) -c -o $@ src/xsystem.c $(x86_64_CFLAGS)
src/xsystemanalytics.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xsystemanalytics.c
	$(x86_64_CC) -c -o $@ src/xsystemanalytics.c $(x86_64_CFLAGS)
src/xthreading.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xthreading.c
	$(x86_64_CC) -c -o $@ src/xthreading.c $(x86_64_CFLAGS)
src/xuser.o: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h include/xgame.h \
  include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/private.h src/xuser.c
	$(x86_64_CC) -c -o $@ src/xuser.c $(x86_64_CFLAGS)
xgameruntime.dll: include/xaccessibility.h include/xappcapture.h include/xasync.h include/xasyncprovider.h include/xdisplay.h include/xerror.h \
  include/xgame.h include/xgameactivation.h include/xgameerr.h include/xgameevent.h include/xgameinvite.h include/xgameprotocol.h include/xgameruntime.h \
  include/xgameruntimefeature.h include/xgameruntimetypes.h include/xgamesave.h include/xgamestreaming.h include/xgameui.h include/xnetworking.h \
  include/xpackage.h include/xpersistentlocalstorage.h include/xspeechsynthesizer.h include/xstore.h include/xsystem.h include/xtaskqueue.h include/xuser.h \
  src/main.o src/xaccessibility.o src/xappcapture.o src/xdisplay.o src/xerror.o src/xgame.o src/xgameactivation.o src/xgameevent.o src/xgameinvite.o \
  src/xgameprotocol.o src/xgameruntime.spec src/xgameruntimefeature.o src/xgamesave.o src/xgamestreaming.o src/xgameui.o src/xnetworking.o src/xpackage.o \
  src/xpersistentlocalstorage.o src/xstore.o src/xsystem.o src/xsystemanalytics.o src/xthreading.o src/xuser.o
	$(CC) -o $@ -Wl,--wine-builtin -shared src/main.o src/xaccessibility.o src/xappcapture.o src/xdisplay.o src/xerror.o src/xgame.o src/xgameactivation.o \
  src/xgameevent.o src/xgameinvite.o src/xgameprotocol.o src/xgameruntime.spec src/xgameruntimefeature.o src/xgamesave.o src/xgamestreaming.o src/xgameui.o \
  src/xnetworking.o src/xpackage.o src/xpersistentlocalstorage.o src/xstore.o src/xsystem.o src/xsystemanalytics.o src/xthreading.o src/xuser.o -lcombase \
  -lkernel32 -lntdll -lucrtbase -lwinecrt0 $(CFLAGS)
