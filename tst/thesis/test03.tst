gap> # Test 3 - Example 2 a
gap> G:=AlternatingGroup(5);;
gap> H1:=Group([ (3,4,5), (2,4)(3,5) ]);
Group([ (3,4,5), (2,4)(3,5) ])
gap> H2:=Group([ (1,2)(4,5), (3,4,5) ]);
Group([ (1,2)(4,5), (3,4,5) ])
gap> H3:=Group([ (1,4)(2,3), (1,3)(4,5) ]);
Group([ (1,4)(2,3), (1,3)(4,5) ])
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
gap> e4:=AddOrbitOfEdges(K, Group(()), v1, v1, "e4");
e4
gap> c1:= e4+(3,4,5)*e2+(2,5,4)*e3^-1+(2,3,4)*e1^-1+(2,5)(3,4)*e4;
e4+(3,4,5)e2+(2,5,4)e3^-1+(2,3,4)e1^-1+(2,5)(3,4)e4
gap> 
gap> c2:= e4+(2,3,5)*e4^-1+(2,3,4)*e4^-1+(3,5,4)*e4+(2,5,4)*e4;
e4+(2,3,5)e4^-1+(2,3,4)e4^-1+(3,5,4)e4+(2,5,4)e4
gap> 
gap> f1:=AddOrbitOfTwoCells(K, Group(()),c1,"f1");
f1
gap> f2:=AddOrbitOfTwoCells(K, Group(()),c2,"f2");
f2
gap> IsAcyclic(K);
true
gap> Pi:=FundamentalGroup(K);
<fp group with 140 generators>
gap> P:=PresentationFpGroup(Pi);
<presentation with 140 gens and 140 rels of total length 620>
gap> TzGoGo(P);;
#I  there are 12 generators and 12 relators of total length 106
#I  there are 12 generators and 12 relators of total length 92
gap> TzSubstitute(P);;
#I  substituting new generator _x141 defined by f109*f134
#I  eliminating _x141 = f109*f134
gap> TzGoGo(P);;
#I  there are 12 generators and 12 relators of total length 78
gap> GeneratorsOfPresentation(P);
[ f19, f25, f35, f63, f73, f76, f77, f93, f109, f111, f132, f134 ]
gap> TzPrintRelators(P);
#I  1. f77*f93*f77^-1*f93*f77*f93^-1
#I  2. f109^-1*f134*f109*f134^-1*f109*f134
#I  3. f76^-1*f111^-1*f76^-1*f111*f76*f111
#I  4. f19*f25*f19^-1*f25^-1*f19^-1*f25
#I  5. f35^-1*f63^-1*f35*f63^-1*f35^-1*f63
#I  6. f73*f132*f73^-1*f132*f73*f132^-1
#I  7. f109^-1*f134^-3*f109^-1*f134^2
#I  8. f63^-1*f35*f63^3*f35*f63^-1
#I  9. f19^3*f25^-1*f19^-2*f25^-1
#I  10. f111*f76^-1*f111^-1*f76*f111^-1*f76^-1*f111
#I  11. f132^-2*f73^-1*f132*f73*f132*f73^-1
#I  12. f93*f77^-1*f93^-2*f77^-1*f93*f77

