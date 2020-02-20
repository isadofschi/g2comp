LoadPackage( "AutoDoc" );
LoadPackage("G2Comp");
AutoDoc( rec( scaffold := true,
              autodoc  := rec( files := [ "doc/chapters.autodoc" ])
));
QUIT;

