# Test 8 - Example 3
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
gap> c:= e1+e3+(1,2)(3,5)*e2^-1+(1,2)(4,5)*e1+e3+(2,5)(3,4)*e3^-1+(2,3,5)*e1^-1;;
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);;
gap> P:=PresentationFpGroup(pi);;
gap> TzGoGo(P);;
#I  there are 14 generators and 14 relators of total length 201
#I  there are 14 generators and 14 relators of total length 98
gap> TzSubstitute(P,1);;
#I  substituting new generator _x81 defined by f43*f50
#I  eliminating f43 = _x81*f50^-1
#I  there are 14 generators and 14 relators of total length 95
gap> TzSubstitute(P,1);;
#I  substituting new generator _x82 defined by f50^-1*f66^-1
#I  eliminating f66 = _x82^-1*f50^-1
#I  there are 14 generators and 14 relators of total length 90
gap> TzPrintRelators(P);
#I  1. _x81*_x82^2*_x81*_x82^-1
#I  2. f22^-1*f3^-1*f22^-1*f3*f22*f3
#I  3. f19*f10*f19^-1*f10^-1*f19^-1*f10
#I  4. f5^-1*f21*f5*f21*f5^-1*f21^-1
#I  5. f13^-1*f18^-1*f13*f18*f13*f18^-1
#I  6. f50^-1*f48*f50*f48*f50^-1*f48^-1
#I  7. f20*f7^-1*f20^-1*f7^-1*f20*f7
#I  8. _x81^-2*_x82^-1*_x81*_x82^-1*_x81^-2
#I  9. f50^-1*f48^-1*f50^2*f48^-1*f50^-1*f48
#I  10. f21^-1*f5*f21*f5^-2*f21*f5
#I  11. f10^-1*f19*f10*f19^-2*f10*f19
#I  12. f13^-2*f18*f13*f18^-1*f13*f18
#I  13. f22^-1*f3*f22*f3^-2*f22*f3
#I  14. f20^-1*f7*f20*f7^-2*f20*f7

