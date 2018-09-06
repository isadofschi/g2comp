#############################################################################
##  
##  pi1.gi	     	 G2Comp Package		     Iván Sadofschi Costa
##

InstallGlobalFunction( WordOfEdgePath, function(r,E,L,gen)
        local w,e;
	w:=Identity(L);
	for e in r do
		w:=w*gen[Position(E,e[1])]^e[2];
	od;
	return w;
end);

InstallGlobalFunction( PrecomputePi1, function(K,T)
        # T should be an spanning tree
	# if T=[]  we compute pi1(K/K^0)
	local E,F,gen,rel,L,f,r,e;
	E:=K[3];F:=K[4];
	L:=FreeGroup(Size(E));
	gen:=GeneratorsOfGroup(L);
	rel:=[];
	for e in T do
		Add(rel, gen[Position(E,e)]);
	od;
	for f in F do
		r:=f[4];
		Add(rel, WordOfEdgePath(r,E,L,gen) );
	od;
	return [L, rel];
end);

InstallGlobalFunction( Pi1 , function(K) 
	local A,T;
	T:=SpanningTreeOfComplex(K);
	if T=fail then # K is not connected
		return fail;
	fi;
	A:=PrecomputePi1(K,T);
	return A[1]/A[2];
end);

InstallGlobalFunction( Pi1RandomSpanningTree, function(K)
	local A,T;
	T:=RandomSpanningTreeOfComplex(K);
	if T=fail then # K is not connected
		return fail;
	fi;
	A:=PrecomputePi1(K,T);
	return [A[1]/A[2],T];
end);

InstallGlobalFunction( Pi1XModX0, function(X)
	# The fundamental group of X/X^0
	local A;
	A:=PrecomputePi1(X,[]);
	return A[1]/A[2];
end);

InstallGlobalFunction(ElementOfPi1FromClosedEdgePath, function(K,c)
	local E,Pi,gen;
	E:=K[3];
	Pi:=Pi1(K);
	gen:=GeneratorsOfGroup(Pi);
	return WordOfEdgePath(c,E,Pi,gen);
end);

InstallGlobalFunction( IsAcyclic, function(K)
	local V,E,F,chi,pi1;
	V:=K[2];E:=K[3];F:=K[4];
	chi:=Size(V)-Size(E)+Size(F);
	if not chi=1 then
		return false;
	fi;
	pi1:=Pi1(K);
	if pi1=fail then # K is not connected
		return false;
	fi;
	if not AbelianInvariants(pi1)=[] then
		return false;
	fi;
	return true;
end);

InstallGlobalFunction( IsAsphericalComplex, function(K)
	# Using Package HAP
	local A;
	A:=PrecomputePi1(K,[]);
	return IsAspherical(A[1],A[2]);
end);

InstallGlobalFunction( IsContractible, function(K,time_limit...)
			local P, result;
			if not IsAcyclic(K) then
				return false;
			fi;
			P:=PresentationFpGroup(Pi1(K) );
			TzOptions(P).printLevel:=0;
			if time_limit=[] then
				TzGoGo(P);
			else
				time_limit:=time_limit[1];
				result:=CallWithTimeout( rec(seconds:=time_limit),TzGoGo,P );
			fi;
			if Size(GeneratorsOfPresentation(P)) =0 then
				return true;
			else
				return fail;
			fi;
end);
