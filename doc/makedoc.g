# This file builds the documentation using GAPDoc
# The files needed to produce the documentation are
# main.xml
# g2comp.bib
# manual.css
# makedoc.g

path := Directory("./");;
main := "main.xml";;
files := [
		"../lib/G2Comp.gd", "../lib/G2Comp.gi",
		"../lib/pi1.gd", "../lib/pi1.gi",
		"../lib/random_attaching_maps.gd", "../lib/random_attaching_maps.gi",
		"../lib/additional_functions.gd", "../lib/additional_functions.gi"
];;
bookname := "G2Comp";;
doc := ComposedDocument("GAPDoc", path, main, files, true);;

MakeGAPDocDoc( path, main, files, bookname);

