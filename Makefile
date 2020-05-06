# Compilateurs
OCC = ocamlopt -unsafe-string
OCL = ocamllex
OCY = ocamlyacc

# Fichiers compilés, à produire pour fabriquer l'exécutable
OBJS = htmllex.cmx htmlast.cmx htmlparse.cmx htmlsem.cmx htmlloop.cmx

htmlloop: $(OBJS)
	$(OCC) -o $@ $(OBJS)

# Les cibles auxiliaires
# (note: une cible avec  « :: » peut être étendue par la suite)
clean::
	/bin/rm -f *~ *.cmo *.cmx *.o *.cmi *.cmt *.cmti \
                   htmlparse.ml htmlparse.mli htmllex.ml htmlloop

# Les dépendances
htmlloop.cmx: htmlast.cmi htmlparse.cmi htmllex.cmi

htmllex.cmx: htmlparse.cmi

htmlparse.cmi: htmlast.cmi

htmlparse.cmx: htmlast.cmi

htmlsem.cmx: htmlast.cmi

htmlparse.mli: htmlparse.ml

htmlast.cmi: htmlast.cmx

htmllex.cmi: htmllex.cmx

# Générations de fichiers compilés selon leurs extensions (suffixes) :
# .ext1.ext2 : comment passer de foo.ext1 à foo.ext2
.ml.cmx:
	$(OCC) -c $<

.mli.cmi:
	$(OCC) -c $<

.mll.ml:
	$(OCL) $<

.mly.ml:
	$(OCY) $<

# Déclaration de suffixes :
#  - d'abord, on supprime les suffixes connus de make (.c, .o, etc.)
.SUFFIXES:

# - ensuite, on déclare nos suffixes
.SUFFIXES: .ml .mli .mly .mll .cmx .cmi


