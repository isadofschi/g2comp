# Test 10 - Example 8
gap> G := SmallGroup(IdGroup(PSL(2,8)));;
gap> H1:=Group([ (1,7)(2,9)(3,5)(4,6), (1,3,4,6,7,9,5) ]);;
gap> H2:=Group([ (1,7)(3,4)(5,8)(6,9), (2,3)(4,6)(5,8)(7,9) ]);;
gap> H3:=Group([ (1,8)(2,6)(3,7)(4,5), (1,3)(2,9)(5,8)(6,7) ]);;
gap> K:=NewEquivariantTwoComplex(G);;
gap> v1:=AddOrbitOfVertices(K,H1,"v1");;
gap> v2:=AddOrbitOfVertices(K,H2,"v2");;
gap> v3:=AddOrbitOfVertices(K,H3,"v3");;
gap> e1:=AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e1");;
gap> e2:=AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "e2");;
gap> e3:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");;
gap> c:= e1+e3+e2^-1+(2,4,7,9,3,5,6)*e1+(2,6,3,8,5,4,9)*e1^-1+(1,3,8,9,4,2,5)*e2+(1,5,9,7,6,4,3)*e2^-1;;
gap> AddOrbitOfTwoCells(K,Group(Identity(G)),c,"f");;
gap> IsAcyclic(K);
true

