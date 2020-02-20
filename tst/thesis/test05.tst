# Test 5 - Example 4
gap> # Test 5 - Example 4
gap> G:=AlternatingGroup(5);;
gap> H1:=Group([ (3,4,5), (2,4)(3,5) ]);;
gap> H2:=Group([ (1,2)(4,5), (3,4,5) ]);;
gap> H3:=Group([ (1,4)(2,3), (1,3)(4,5) ]);;
gap> K:=NewEquivariantTwoComplex(G);;
gap> v1:=AddOrbitOfVertices(K,H1,"v1");;
gap> v2:=AddOrbitOfVertices(K,H2,"v2");;
gap> v3:=AddOrbitOfVertices(K,H3,"v3");;
gap> e1:=AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e1");;
gap> e2:=AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "e2");;
gap> e3:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");;
gap> c:= e3+e2^-1+(2,3,4)*e1+(1,2,3,5,4)*e1^-1+(1,3,5,2,4)*e1+(1,3,4,2,5)*e1^-1+(1,3,5)*e1+(1,3,4,5,2)*e1^-1+(1,2)(4,5)*e1;;
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);
<fp group with 80 generators>
gap> P:=PresentationFpGroup(pi);;
gap> TzGoGo(P);
#I  there are 6 generators and 6 relators of total length 126
gap> pi:=FpGroupPresentation(P);;
gap> GroupHomomorphismByImages(
>      pi,
>      AlternatingGroup(5),
>      GeneratorsOfGroup(pi),
>      [ (), (), (), (1,2,3,4,5), (1,2,4,5,3), (1,2,5,3,4) ]
>    );
[ f46, f48, f50, f59, f61, f62 ] -> [ (), (), (), (1,2,3,4,5), (1,2,4,5,3), (1,2,5,3,4) ]

