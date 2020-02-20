gap> # Test 4 - Example 2 b
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
gap> c:=(2,4,3)*e2^-1+(2,3,5)*e1+(2,4,5)*e3+(2,3,4)*e3^-1+(2,3,4)*e1^-1+(2,3)(4,5)*e1+(2,4,3)*e3;;
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> T:=[ (1,4,5,2,3)*e3, (1,3,5)*e1, (1,4,2)*e3, (3,5,4)*e2, (1,2,5,4,3)*e2,(1,4,2,5,3)*e3,
>         (1,3,2,4,5)*e2, (1,5,4,2,3)*e3, (1,3)(4,5)*e1, (1,2,4,3,5)*e2, (1,2,3,4,5)*e1,
>         (1,4)(2,3)*e2, (1,2)(4,5)*e2, (1,3,5)*e2, (1,5,3,4,2)*e3, (1,3)(2,4)*e1, (2,3,4)*e3,
>         e3, (1,3,5,2,4)*e1, (1,2,3)*e1 ];;
gap> IsSpanningTreeOfComplex(K,T);
true
gap> pi:=FundamentalGroup(K,T);;
gap> P:=PresentationFpGroup(pi);;
gap> TzGoGo(P);;
#I  there are 12 generators and 12 relators of total length 155
#I  there are 12 generators and 12 relators of total length 115
gap> for i in [1..9] do
>      TzSubstitute(P,1);
>    od;
#I  substituting new generator _x81 defined by f55*f76^-1
#I  eliminating f76 = _x81^-1*f55
#I  there are 12 generators and 12 relators of total length 110
#I  substituting new generator _x82 defined by f55^-1*_x81^-1
#I  eliminating _x81 = _x82^-1*f55^-1
#I  there are 12 generators and 12 relators of total length 104
#I  substituting new generator _x83 defined by f23^-1*f44^-1
#I  eliminating f23 = f44^-1*_x83^-1
#I  there are 12 generators and 12 relators of total length 98
#I  substituting new generator _x84 defined by f7^-1*_x83
#I  eliminating _x83 = f7*_x84
#I  there are 12 generators and 12 relators of total length 93
#I  substituting new generator _x85 defined by f42^-1*_x84^-1
#I  eliminating f42 = _x84^-1*_x85^-1
#I  there are 12 generators and 12 relators of total length 88
#I  substituting new generator _x86 defined by _x82^-1*_x85
#I  eliminating _x85 = _x82*_x86
#I  there are 12 generators and 12 relators of total length 83
#I  substituting new generator _x87 defined by f1*f2^-1
#I  eliminating f2 = _x87^-1*f1
#I  there are 12 generators and 12 relators of total length 81
#I  substituting new generator _x88 defined by f1*f7
#I  eliminating f1 = _x88*f7^-1
#I  there are 12 generators and 12 relators of total length 76
#I  substituting new generator _x89 defined by _x87*_x88^-1
#I  eliminating _x88 = _x89^-1*_x87
#I  there are 12 generators and 12 relators of total length 75
gap> TzPrintRelators(P);
#I  1. _x87^-1*_x89^-1*_x87^-1*_x89^2
#I  2. f44*_x84^2*f44*_x84^-1
#I  3. f55*_x82^-1*f55*_x82^2
#I  4. f7^-1*_x86*f7*_x86*f7^-1*_x86^-1
#I  5. f41^-1*f10^-1*f41*f10*f41*f10^-1
#I  6. f58^-1*f61*f58*f61*f58^-1*f61^-1
#I  7. _x87^-1*_x89^-1*_x87^4*_x89^-1
#I  8. f7^-1*_x86*f7^2*_x86*f7^-2
#I  9. f44^-4*_x84^-1*f44*_x84^-1
#I  10. f55^-1*_x82*f55^4*_x82
#I  11. f41*f10^-1*f41^-1*f10^2*f41^-1*f10^-1
#I  12. f58^-1*f61*f58^-1*f61^-1*f58^2*f61^-1

