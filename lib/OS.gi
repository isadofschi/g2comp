#############################################################################
##  
##  OS.gi	     	 G2Comp Package		     Iván Sadofschi Costa
##

InstallGlobalFunction( OSA5Example, function(f)
	# Oliver and Segev's example for A5 with attaching map f
	local G,S,H1,H2,H3,v1,v2,v3,K;
	G:=AlternatingGroup(5);;
	S:=Subgroups(G);;
	H1:=S[54];;
	H2:=S[38];;
	H3:=S[48];;

	K:=NewEquivariantTwoComplex(G);

	AddOrbitOfVertices(K,H1,"A");
	AddOrbitOfVertices(K,H2,"B");
	AddOrbitOfVertices(K,H3,"C");

	v1:=CanonicalVertex([Identity(G),H1,"A"]);
	v2:=CanonicalVertex([Identity(G),H2,"B"]);
	v3:=CanonicalVertex([Identity(G),H3,"C"]);

	AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "D");
	AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "E");
	AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "F");

	AddOrbitOfTwoCells(K, S[1], f, 1);
	return K;
end);


