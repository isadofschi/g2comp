# Test 2 - Example 1 b
gap> G:=AlternatingGroup(5);;
gap> H1:=Group([ (3,4,5), (2,4)(3,5) ]);;
gap> H2:=Group([ (1,2)(4,5), (3,4,5) ]);;
gap> H3:=Group([ (1,4)(2,3), (1,3)(4,5) ]);;
gap> K:=NewEquivariantTwoComplex(G);;
gap> v1:=AddOrbitOfVertices(K,H1,"v1");;
gap> v2:=AddOrbitOfVertices(K,H2,"v2");;
gap> v3:=AddOrbitOfVertices(K,H3,"v3");;
gap> e1:=AddOrbitOfEdges (K,Intersection(H1,H2),v1,v2,"e1");;
gap> e2:=AddOrbitOfEdges (K,Intersection(H1,H3),v1,v3,"e2");;
gap> e3:=AddOrbitOfEdges (K,Intersection(H1,H2^(1,2,3)),ActionVertex((1,2,3)^2,v2),v1,"e3");;
gap> c:= (1,3,5)*e2+(1,2,3,5,4)*e2^-1+(1,2,3,5,4)*e1+(1,2,4,3,5)*e3;;
gap> f:=AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);;
gap> IdGroup(SimplifiedFpGroup(pi))=IdGroup(SL(2,5));
true

