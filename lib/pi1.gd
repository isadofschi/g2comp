#############################################################################
##  
##  pi1.gd      	 G2Comp Package		     Iván Sadofschi Costa
##

LoadPackage("HAP");
#! @Chapter G2Comp
#! @Section Fundamental group

DeclareGlobalFunction("WordOfEdgePath");
DeclareGlobalFunction("PrecomputePi1");

#! @BeginGroup
#! @Description Returns the fundamental group of a connected complex <A>K</A>. Optionally, to compute the fundamental group a specific spanning tree <A>T</A> may be provided. Returns <A>fail</A> if <A>K</A> is not connected.
#! @Arguments K
DeclareOperation("FundamentalGroup",[IsG2Complex]);
#! @Arguments K,T
DeclareOperation("FundamentalGroup",[IsG2Complex,IsList]); 
#! @EndGroup

#! @Arguments K
#! @Description Returns the fundamental group of a connected complex <A>K</A>, computed using a random spanning tree of <A>K</A>. Returns <A>fail</A> if <A>K</A> is not connected.
DeclareOperation("Pi1RandomSpanningTree",[IsG2Complex]);

#! @Arguments K
#! @Description Returns the fundamental group of <A>K/K^0</A>.
DeclareOperation("Pi1XModX0",[IsG2Complex]);

#! @Arguments K,c
#! @Description Returns the element of the fundamental group of <A>K</A> representing the class of the closed edge path <A>c</A>.
DeclareOperation("ElementOfPi1FromClosedEdgePath",[IsG2Complex, IsClosedEdgePath]);


#! @Section Homotopy properties
#! @Arguments K
#! @Description Returns <K>true</K> if <A>K</A> is empty, <K>false</K> otherwise.
DeclareOperation("IsEmptyComplex",[IsG2Complex]);
#! @Arguments K
#! @Description Returns the Euler Characteristic of $K$.
DeclareAttribute("EulerCharacteristic", IsG2Complex);
#! @Arguments K
#! @Description Returns <K>true</K> if <A>K</A> is connected, <K>false</K> otherwise.
DeclareAttribute("IsConnected",IsG2Complex);
#! @Arguments K
#! @Description Returns <K>true</K> if <A>K</A> is acyclic, <K>false</K> otherwise.
DeclareOperation("IsAcyclic",[IsG2Complex]);
#! @Arguments K
#! @Description If it returns <K>true</K>, then <A>K</A> is aspherical. It may return <K>fail</K>. Uses the function <C>IsAspherical</C> from the package <Package>HAP</Package>.
DeclareProperty("IsAsphericalComplex",IsG2Complex);
#! @Arguments K
#! @Description If it returns <K>true</K>, then <A>K</A> is contractible. It may return <K>fail</K>.
# The optional argument <A>time_limit</A> allows to set a time limit for the computation of the fundamental group.
DeclareOperation("IsContractible",[IsG2Complex]);

