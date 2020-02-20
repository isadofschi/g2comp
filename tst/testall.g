LoadPackage( "g2comp" );

TestDirectory(
	Concatenation(
	  DirectoriesPackageLibrary("g2comp","tst/tests"),
      DirectoriesPackageLibrary("g2comp","tst/thesis")
	),
   rec(exitGAP := true, testOptions := rec(compareFunction := "uptowhitespace") )
 );

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
