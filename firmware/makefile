### Makefile to build 16segment.hex using avr-gcc on Linux
#
# Tested on Debian 8.6 "Jessie"
#
# To install development environment:
#   # apt-get install avr-libc binutils-avr gcc-avr avrdude
#   # apt-get install make
#
# Invocation:
#   $ make all
#
# Generated Hexfile in $(OBJ_DIR), e.g. build_linux
#
# Have fun!


# MCU name
MCU = atmega32


# Target file name (without extension).
PROG = 16segment

# Format of target file, see avr-objcopy -O option.
FORMAT = ihex

# Optimization level, can be [0, 1, 2, 3, s]. 0 turns off optimization.
# (Note: 3 is not always the best optimization level. See avr-libc FAQ.)
OPT = s


# List C source files here.
SRCDIR = .

SRC = main.c

# Directory for dependency auto-generation
# see http://make.mad-scientist.net/papers/advanced-auto-dependency-generation
DEPDIR = .d
$(shell mkdir -p $(DEPDIR) >/dev/null)
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.Td
POSTCOMPILE = mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d


# Directory where object files are created.
OBJDIR = build_linux
$(shell mkdir -p $(OBJDIR) >/dev/null)


# We want to build TARGET in OBJDIR
TARGET = $(addprefix $(OBJDIR)/, $(PROG))

# Additional directories
AVR_INCLUDE_DIR = /usr/lib/avr/include/avr
AVR_LIB_DIR = /usr/lib/avr/lib/avr5

# List any extra directories to look for include files here.
#     Each directory must be seperated by a space.
EXTRAINCDIRS = $(AVR_INCLUDE_DIR)


# Optional compiler flags.
#  -g:        generate debugging information (for GDB, or for COFF conversion)
#  -O*:       optimization level
#  -f...:     tuning, see gcc manual and avr-libc documentation
#  -Wall...:  warning level
#  -Wa,...:   tell GCC to pass this to the assembler.
#    -ahlms:  create assembler listing

DEBUG_LEVEL=-gdwarf-2
WARNINGS=-Wall -Wextra -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-align -Wsign-compare \
		-Waggregate-return -Wstrict-prototypes -Wunused

CFLAGS = -mmcu=$(MCU) -D GCC_MEGA_AVR -I. -I$(EXTRAINCDIR)  \
$(DEBUG_LEVEL) -O$(OPT) \
-fsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections \
$(WARNINGS) \
-c -x c -DDEBUG \
-g2 -B$(AVR_LIB_DIR) -std=gnu99


# General linker flags
LDFLAGS = -Wl,--start-group -Wl,-lm  -Wl,--end-group -Wl,--gc-sections -mmcu=atmega32 -B$(AVR_LIB_DIR) 

# Optional linker flags.
#  -Wl,...:   tell GCC to pass this to linker.
#  -Map:      create map file
#  --cref:    add cross reference to  map file
LDFLAGS += -Wl,-Map=$(TARGET).map,--cref


# Additional libraries

# Minimalistic printf version
#LDFLAGS += -Wl,-u,vfprintf -lprintf_min

# Floating point printf version (requires -lm below)
#LDFLAGS += -Wl,-u,vfprintf -lprintf_flt

# -lm = math library
LDFLAGS += -lm


# Toolchain
CC = avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size


REMOVE = rm -f
COPY = cp

HEXSIZE = $(SIZE) --target=$(FORMAT) $(TARGET).hex
ELFSIZE = $(SIZE) -A $(TARGET).elf


# Define all object files.
OBJ = $(SRC:.c=.o) $(ASRC:.S=.o)

# Define all listing files.
LST = $(ASRC:.S=.lst) $(SRC:.c=.lst)


# Default target.
all: $(TARGET).hex

# Create object directory
.PHONY: $(OBJDIR)
$(OBJDIR):
	+@[ -d $@ ] || mkdir -p $@

# Compile: create object files from C source files. 
%.o : %.c
$(OBJDIR)/%.o : %.c $(DEPDIR)/%.d
	$(CC) -c $(CFLAGS) $(DEPFLAGS) $< -o $@
	$(POSTCOMPILE)

# Link: create ELF output file from object files. 
$(TARGET).elf: $(addprefix $(OBJDIR)/, $(OBJ))
	$(CC) $^ --output $@ $(LDFLAGS) 

# Create final output files (.hex, .eep) from ELF output file.
$(OBJDIR)/%.hex: $(OBJDIR)/%.elf
	$(OBJCOPY) -O $(FORMAT) -R .eeprom $< $@

$(OBJDIR)/%.eep: $(OBJDIR)/%.elf
	-$(OBJCOPY) -j .eeprom --set-section-flags=.eeprom="alloc,load" \
	--change-section-lma .eeprom=0 -O $(FORMAT) $< $@

# Create extended listing file from ELF output file.
$(OBJDIR)/%.lss: $(OBJDIR)/%.elf
	$(OBJDUMP) -h -S $< > $@

# Create a symbol table from ELF output file.
$(OBJDIR)/%.sym: $(OBJDIR)/%.elf
	avr-nm -n $< > $@

# Clean up
clean:
	rm -rf $(OBJDIR)


# Include dependencies (must be last recipe!)
$(DEPDIR)/%.d: ;
.PRECIOUS: $(DEPDIR)/%.d

-include $(patsubst %,$(DEPDIR)/%.d,$(basename $(SRC)))
