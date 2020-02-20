#############################################################################
##  
##  pi1.gd      	 G2Comp Package		     Iván Sadofschi Costa
##

LoadPackage("HAP");

DeclareGlobalFunction("WordOfEdgePath");
DeclareGlobalFunction("PrecomputePi1");
DeclareOperation("FundamentalGroup",[IsG2Complex]);
DeclareOperation("FundamentalGroup",[IsG2Complex,IsList]); 
DeclareOperation("Pi1RandomSpanningTree",[IsG2Complex]);

DeclareOperation("Pi1XModX0",[IsG2Complex]);

DeclareOperation("ElementOfPi1FromClosedEdgePath",[IsG2Complex, IsClosedEdgePath]);

DeclareOperation("IsEmptyComplex",[IsG2Complex]);
DeclareAttribute("EulerCharacteristic", IsG2Complex);
DeclareAttribute("IsConnected",IsG2Complex);
DeclareOperation("IsAcyclic",[IsG2Complex]);
DeclareProperty("IsAsphericalComplex",IsG2Complex);
DeclareOperation("IsContractible",[IsG2Complex]);

