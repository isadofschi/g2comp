#############################################################################
##  
##  pi1.gi	     	 G2Comp Package		     Iván Sadofschi Costa
##

InstallGlobalFunction( WordOfEdgePath, function(r,E,L,gen)
    local w,e;
	w:=Identity(L);
	for e in r do
		w:=w*gen[PositionSorted(E,e!.edge)]^(e!.sign);
	od;
	return w;
end);

InstallGlobalFunction( PrecomputePi1, function(K,T)
    # T should be an spanning tree
	# if T=[]  we compute pi1(K/K^0)
	local E,F,gen,rel,L,f,r,e;
	E:=EdgesOfComplex(K);
	F:=FacesOfComplex(K);
	L:=FreeGroup(Size(E));
	gen:=GeneratorsOfGroup(L);
	rel:=[];
	for e in T do
		Add(rel, gen[PositionSorted(E,e)]);
	od;
	for f in F do
		r:=List(f!.attaching_map);
		Add(rel, WordOfEdgePath(r,E,L,gen) );
	od;
	return [L, rel];
end);

InstallMethod(FundamentalGroup,
"for G2Complex and spanning tree",
[IsG2Complex,IsList],
function(K,T)
	# Pi1(K,T) computes the fundamental group of K using the spanning tree T	
	local A;
	if not IsSpanningTreeOfComplex(K,T) then
		Print("Error, T is not a spanning tree");
		return fail;
	fi;
	A:=PrecomputePi1(K,T);
	return A[1]/A[2];
end);

InstallMethod(FundamentalGroup,
"for G2Complex",
[IsG2Complex],
function(K)
	# Pi1(K) computes the fundamental group of K
	return FundamentalGroup(K,SpanningTreeOfComplex(K));
end);


InstallMethod(
Pi1RandomSpanningTree,
"for G2Complex",
[IsG2Complex],
function(K)
	local A,T;
	T:=RandomSpanningTreeOfComplex(K);
	if T=fail then # K is not connected
		return fail;
	fi;
	A:=PrecomputePi1(K,T);
	return [A[1]/A[2],T];
end);

InstallMethod( Pi1XModX0,
"for G2Complex",
[IsG2Complex],
function(X)
	# The fundamental group of X/X^0
	local A;
	A:=PrecomputePi1(X,[]);
	return A[1]/A[2];
end);

InstallMethod(ElementOfPi1FromClosedEdgePath,
"for G2Complex, closed edge path",
[IsG2Complex, IsClosedEdgePath],
function(K,c)
	local E,Pi,gen;
	E:=EdgesOfComplex(K);
	Pi:=FundamentalGroup(K);
	gen:=GeneratorsOfGroup(Pi);
	return WordOfEdgePath(c,E,Pi,gen);
end);

InstallMethod( IsEmptyComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	return VerticesOfComplex(K)=[];
end);

InstallMethod( IsConnected,
"for G2Complex",
[IsG2Complex],
function(K)
	return SpanningTreeOfComplex(K) <> fail;
end);


InstallMethod(IsAcyclic,
"for G2Complex",
[IsG2Complex],
function(K)
	local pi1;
	if not EulerCharacteristic(K)=1 then
		return false;
	fi;
	pi1:=FundamentalGroup(K);
	if pi1=fail then # K is not connected
		return false;
	fi;
	if not AbelianInvariants(pi1)=[] then
		return false;
	fi;
	return true;
end);

InstallMethod( IsAsphericalComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	# Using Package HAP
	local A;
	A:=PrecomputePi1(K,[]);
	return IsAspherical(A[1],A[2]);
end);

InstallMethod(EulerCharacteristic,
"for G2Complex",
[IsG2Complex],
function(K)
	return Size(VerticesOfComplex(K))-Size(EdgesOfComplex(K))+Size(FacesOfComplex(K));
end);

if GAPInfo.KernelInfo.BUILD_VERSION<"4.11" then
	DisableAttributeValueStoring(EulerCharacteristic);
	DisableAttributeValueStoring(IsConnected);
fi;

