#############################################################################
##  
##  additional_functions.gd   	 G2Comp Package		     Iván Sadofschi Costa
##
#! @Chapter G2Comp
#! @Section Additional functions

#! @Arguments P
#! @Description Returns the length of the presentation <A>P</A>.
DeclareGlobalFunction("PresentationLength");

DeclareGlobalFunction("ElementsUpToAutomorphism");

DeclareGlobalFunction("HomomorphismWithProperty");

DeclareGlobalFunction("NontrivialHomomorphism");

#! @Arguments H,G
#! @Description Returns <K>true</K> if there is an epimorphism from the FpGroup <A>H</A> to the finite group <A>G</A>. Otherwise returns <K>false</K>.
DeclareGlobalFunction("Epimorphism");

