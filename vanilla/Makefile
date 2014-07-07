#######################################################################
#                                                                     #
#                            OCamlSpotter                             #
#                                                                     #
#                             Jun FURUSE                              #
#                                                                     #
#   Copyright 2008-2012 Jun Furuse. All rights reserved.              #
#   This file is distributed under the terms of the GNU Library       #
#   General Public License, with the special exception on linking     #
#   described in file LICENSE.                                        #
#                                                                     #
#######################################################################

# @nomaddo modified

# Various commands and dir
##########################
CAMLRUN= ocamlrun
OCAMLC   = ocamlc $(COMPOPT)
OCAMLOPT = ocamlopt $(COMPOPT)
OCAMLDEP = ocamldep
OCAMLLEX = ocamllex
OCAMLYACC= ocamlyacc
OCAMLLIB =
OCAMLLIBX =
OCAMLBIN = $(BINDIR)

# Compilation
#############
OCAMLSRCDIR=..
INCLUDES_DEP=-I +compiler-libs

COMPOPT=-I +compiler-libs -bin-annot -g
COMPILER-LIBS-OPT=ocamlcommon.cmxa ocamloptcomp.cmxa

MODULES=
OPTMODULES=optcompile optmain

OBJS=		$(addsuffix .cmo, $(MODULES))
OPTOBJS=	$(addsuffix .cmo, $(OPTMODULES))

XOBJS=		$(addsuffix .cmx, $(MODULES))
XOPTOBJS=	$(addsuffix .cmx, $(OPTMODULES))

mycamlopt:$(XOPTOBJS)
	$(OCAMLOPT) $(COMPILER-LIBS-OPT) $(XOPTOBJS) -o mycamlopt

beforedepend:: optmain.ml


# generic rules :
#################

.SUFFIXES: .mll .mly .ml .mli .cmo .cmi .cmx

.ml.cmo:
	$(OCAMLC) $(OCAMLPP) $(COMPFLAGS) -c $<

.mli.cmi:
	$(OCAMLC) $(OCAMLPP) $(COMPFLAGS) -c $<

.ml.cmx:
	$(OCAMLOPT) $(OCAMLPP) $(COMPFLAGS) -c $<

.mll.ml:
	$(OCAMLLEX) $<

.mly.ml:
	$(OCAMLYACC) -v $<

.mly.mli:
	$(OCAMLYACC) -v $<

beforedepend::

depend: beforedepend
	ocamldep $(INCLUDES) *.mli *.ml > .depend

clean::
	rm -f *.cm* *.annot *.o mycamlopt

include .depend
