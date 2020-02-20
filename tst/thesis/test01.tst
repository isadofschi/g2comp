gap> G:=AlternatingGroup(5);;
gap> H1:=Group([ (3,4,5), (2,4)(3,5) ]);;
gap> H2:=Group([ (1,2)(4,5), (3,4,5) ]);;
gap> H3:=Group([ (1,4)(2,3), (1,3)(4,5) ]);;
gap> K:=NewEquivariantTwoComplex(G);
<G-equivariant 2-complex>
gap> v1:=AddOrbitOfVertices(K,H1,"v1");
v1
gap> v2:=AddOrbitOfVertices(K,H2,"v2");
v2
gap> v3:=AddOrbitOfVertices(K,H3,"v3");
v3
gap> e1:=AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e1");
e1
gap> e2:=AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "e2");
e2
gap> e3:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");
e3
gap> gamma:=e1+e3+e2^-1;
e1+e3+e2^-1
gap> f:=AddOrbitOfTwoCells(K, Group(()), gamma, "f");
f
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);
<fp group with 80 generators>
gap> IdGroup(SimplifiedFpGroup(pi));
[ 120, 5 ]

