#
#
# +) the "target"
TARGET = df
#
# +) CPATH
#
#CPATH=/home/neon/etc/Sourcery-G++/2010q1-188/bin
CPATH=/home/neon/etc/CodeSourcery/2010q1-188/bin
AS=$(CPATH)/arm-none-eabi-as
AR=$(CPATH)/arm-none-eabi-ar
CC=$(CPATH)/arm-none-eabi-gcc
OD=$(CPATH)/arm-none-eabi-objdump
LD=$(CPATH)/arm-none-eabi-ld
#
# +) CFLAGS
#
CFLAGS  = -mcpu=cortex-m3 -mthumb -g3 -Wall
#
# +) ASFLAGS
#
ASFLAGS  = -g3
ASFLAGS += -mthumb -mcpu=cortex-m3
ASFLAGS += -aml=$(TARGET).lst
#
# +) LS
#
LS = linker-script.ld
#
# +) LDFLAGS
#
LDFLAGS  = -Map=$(TARGET).map --cref
LDFLAGS += -T $(LS) 
#
# +) TARGET
#
#TARGET = voodoo

$(TARGET).axf : $(TARGET).o
	$(LD) $(LDFLAGS) -o $@ $< 

 
$(TARGET).o : $(TARGET).s
	$(AS) $(ASFLAGS) -o $@ $< 

clean:
	/bin/rm *.o *.axf



#DDD_COOP_TASKS = /home/neon/etc/DDD-COOP-TASKS
#DDD_SYSLOG = /home/neon/etc/DDD-SYSLOG

#INCLUDES = -I $(DDD_SYSLOG)


#OBJS  = startup-00.o
#OBJS += isr.o
#OBJS += $(DDD_SYSLOG)/syslog.o
#OBJS += syscalls.o
#OBJS += init-uC.o
#OBJS += $(DDD_COOP_TASKS)/coop-tasks.o
#OBJS += graspforth.o
#
#
#OBJS += main.o
#OBJS += tasks.o
#OBJS += console-task.o
##OBJS += forth.o


#
## where do I keep StellarisWare ???
#STELLARISWARE=/home/neon/etc/TI/Luminary/StellarisWare/9453
#
#LIB_LM3S6965  = $(STELLARISWARE)/lm3s6965-API/liblm3s6965.o
#LIB_LM3S6965 += $(STELLARISWARE)/driverlib/gcc-cm3/libdriver-cm3.a
#
#LINKER_SCRIPT = linker-script.ld
#
#
#
#LDFLAGS  = -T $(LINKER_SCRIPT)
#LDFLAGS += --entry ResetISR 
#LDFLAGS += --gc-sctions
#LDFLAGS += -Wl,-Map $(TARGET).map
#LDFLAGS += -Wl,-nostdlib
#LDFLAGS += -Wl,--cref
#LDFLAGS += -Wl,--stats
#
#
#
#$(TARGET).axf : $(OBJS)
#	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIB_LM3S6965) -o $@
#
#startup-00.o : startup-00.c
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#isr.o : isr.c
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#main.o :  main.c
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#syslog.o : syslog.c
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#syscalls.o : syscalls.c
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#init-uC.o : init-uC.c
#	$(CC) $(CFLAGS) -o $@ -c $< -I $(STELLARISWARE)/lm3s6965-API
##                                      -----------------------------
##                                                  |
##   this should be a directory, not a file --------+
#
#tasks.o : tasks.c
#	$(CC) $(CFLAGS) -o $@ -c $< -I $(DDD_COOP_TASKS) 
#
#console-task.o : console-task.c
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#graspforth.o : graspforth.c lm3s6965.h
#	$(CC) $(CFLAGS) -w -DLM3S6965 -o $@ -c $<
##	$(CC) $(CFLAGS) -O3 -funroll-loops -w -DLM3S6965 -o $@ -c $<
##                            ------------- --
##                                 |         |
##                  notes ---------+         +---- notes
#arm-forth.o : arm-forth.s
#	$(CC) $(CFLAGS) -o $@ -c $<
#
#help:
#	@echo "OBJS = $(OBJS)"
#	@echo "CC = $(CC)"
#	@echo "CFLAGS = $(CFLAGS)"
#	@echo "LINKER_SCRIPT = $(LINKER_SCRIPT)"
#
#
##    `-funroll-loops'
##         Unroll loops whose number of iterations can be determined at
##         compile time or upon entry to the loop.  `-funroll-loops' implies
##         `-frerun-cse-after-loop'.  This option makes code larger, and may
##         or may not make it run faster.
##    `-w'
##         Suppress all warnings, including those which GNU CPP issues by
##         default.
##     Because of the way graspforth is written many,many,many warnings are generated
##     "graspforth.c:325: warning: initialization makes integer from pointer without a cast"
##     The -w will supress this
##
##
##    `-O3'
##         Optimize yet more.  `-O3' turns on all optimizations specified by
##         `-O2' and also turns on the `-finline-functions',
##         `-funswitch-loops', `-fpredictive-commoning',
##         `-fgcse-after-reload', `-ftree-vectorize' and `-fipa-cp-clone'
##         options.
