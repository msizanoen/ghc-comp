# -----------------------------------------------------------------------------
# A Sample build.mk
#
# Uncomment one of the following BuildFlavour settings to get the desired
# overall build type.

# -------- Build profiles -----------------------------------------------------
# Uncomment one of these to select a build profile below:

# Full build with max optimisation and everything enabled (very slow build)
#BuildFlavour = perf

# As above but build GHC using the LLVM backend
#BuildFlavour = perf-llvm

# Perf build configured for a cross-compiler (using the LLVM backend)
#BuildFlavour = perf-cross

# Perf build configured for a cross-compiler (using the NCG backend)
#BuildFlavour = perf-cross-ncg

# Fast build with optimised libraries, no profiling (RECOMMENDED):
BuildFlavour = quick

# Fast build with optimised libraries, no profiling, with LLVM:
#BuildFlavour = quick-llvm

# Fast build configured for a cross compiler (using the LLVM backend)
#BuildFlavour = quick-cross

# Fast build configured for a cross compiler (using the NCG backend)
#BuildFlavour = quick-cross-ncg

# Even faster build.  NOT RECOMMENDED: the libraries will be
# completely unoptimised, so any code built with this compiler
# (including stage2) will run very slowly, and many GHC tests
# will fail with this profile (see Trac #12141):
#BuildFlavour = quickest

# Profile the stage2 compiler:
#BuildFlavour = prof

# Profile the stage2 compiler (LLVM backend):
#BuildFlavour = prof-llvm

# A development build, working on the stage 1 compiler:
#BuildFlavour = devel1

# A development build, working on the stage 2 compiler:
#BuildFlavour = devel2

# A build with max optimisation that still builds the stage2 compiler
# quickly. Compiled code will be the same as with "perf". Programs
# will compile more slowly.
#BuildFlavour = bench

# As above but build GHC using the LLVM backend
#BuildFlavour = bench-llvm

# Bench build configured for a cross-compiler (using the LLVM backend)
#BuildFlavour = bench-cross

# Bench build configured for a cross-compiler (using the NCG backend)
#BuildFlavour = bench-cross-ncg

# Use the same settings as validate.
#BuildFlavour = validate

ifneq "$(BuildFlavour)" ""
include mk/flavours/$(BuildFlavour).mk
endif

# -------- Miscellaneous variables --------------------------------------------

# Set to V = 0 to get prettier build output.
# Please use V=1 (the default) when reporting GHC bugs.
V=0

# Should all enabled warnings (see mk/warnings.mk) be turned into errors while
# building stage 2?
#WERROR=-Werror

# After stage 1 and the libraries have been built, you can uncomment this line:
#stage=2

# Then stage 1 will not be touched by the build system, until
# you comment the line again.  This is a useful trick for when you're
# working on stage 2 and want to freeze stage 1 and the libraries for
# a while.

# Enable these if you would like DWARF debugging symbols for your libraries.
# This is necessary, for instance, to get DWARF stack traces out of programs
# built by the produced compiler. You must also pass --enable-dwarf-unwind to
# `configure` to enable the runtime system's builtin unwinding support.
#GhcLibHcOpts += -g3
#GhcRtsHcOpts += -g3

# Build the "extra" packages (see ./packages). This enables more tests. See:
# https://ghc.haskell.org/trac/ghc/wiki/Building/RunningTests/Running#AdditionalPackages
BUILD_EXTRA_PKGS=NO

# Uncomment the following line to enable building DPH
#BUILD_DPH=YES

# Uncomment the following to force `integer-gmp` to use the in-tree GMP 6.1.2
# (other sometimes useful configure-options: `--with-gmp-{includes,libraries}`)
libraries/integer-gmp_CONFIGURE_OPTS += --configure-option=--with-intree-gmp

# Enable pretty hyperlinked sources
HADDOCK_DOCS = NO
#EXTRA_HADDOCK_OPTS += --quickjump --hyperlinked-source

# Don't strip debug and other unneeded symbols from libraries and executables.
STRIP_CMD = arm-linux-gnueabihf-strip
