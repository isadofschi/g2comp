#############################################################################
##  
##  OS.gi	     	 G2Comp Package		     Iván Sadofschi Costa
##

InstallGlobalFunction( OSA5Example, function(f)
	# Oliver and Segev's example for A5 with attaching map f
	local G,S,H1,H2,H3,v1,v2,v3,e1,e2,e3,K;
	G:=AlternatingGroup(5);;
	S:=Subgroups(G);;
	H1:=S[54];;
	H2:=S[38];;
	H3:=S[48];;

	K:=NewEquivariantTwoComplex(G);

	v1:=AddOrbitOfVertices(K,H1,"v1");
	v2:=AddOrbitOfVertices(K,H2,"v2");
	v3:=AddOrbitOfVertices(K,H3,"v3");

	e1:= AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e1");
	e2:=AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "e2");
	e3:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");
	AddOrbitOfTwoCells(K, S[1], f, 1);
	return K;
end);


