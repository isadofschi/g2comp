# Test 7 - Example 6
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
gap> c:= e3+e2^-1+(2,3,4)*e1+(1,2,3,5,4)*e1^-1+(1,3,4)*e1+(1,3,5,4,2)*e1^-1+(1,2)(4,5)*e1;;
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);;
gap> P:=PresentationFpGroup(pi);;
gap> for i in [1..36] do
>      TzEliminate(P);;
>    od;;
#I  there are 41 generators and 41 relators of total length 160
#I  there are 40 generators and 40 relators of total length 158
#I  there are 39 generators and 39 relators of total length 156
#I  there are 38 generators and 38 relators of total length 154
#I  there are 37 generators and 37 relators of total length 152
#I  there are 36 generators and 36 relators of total length 150
#I  there are 35 generators and 35 relators of total length 148
#I  there are 34 generators and 34 relators of total length 146
#I  there are 33 generators and 33 relators of total length 144
#I  there are 32 generators and 32 relators of total length 142
#I  there are 31 generators and 31 relators of total length 140
#I  there are 30 generators and 30 relators of total length 138
#I  there are 29 generators and 29 relators of total length 136
#I  there are 28 generators and 28 relators of total length 134
#I  there are 27 generators and 27 relators of total length 132
#I  there are 26 generators and 26 relators of total length 130
#I  there are 25 generators and 25 relators of total length 128
#I  there are 24 generators and 24 relators of total length 126
#I  there are 23 generators and 23 relators of total length 124
#I  there are 22 generators and 22 relators of total length 122
#I  there are 21 generators and 21 relators of total length 120
#I  there are 20 generators and 20 relators of total length 118
#I  there are 19 generators and 19 relators of total length 116
#I  there are 18 generators and 18 relators of total length 114
#I  there are 17 generators and 17 relators of total length 112
#I  there are 16 generators and 16 relators of total length 110
#I  there are 15 generators and 15 relators of total length 108
#I  there are 14 generators and 14 relators of total length 106
#I  there are 13 generators and 13 relators of total length 104
#I  there are 12 generators and 12 relators of total length 102
#I  there are 11 generators and 11 relators of total length 100
#I  there are 10 generators and 10 relators of total length 98
#I  there are 9 generators and 9 relators of total length 96
#I  there are 8 generators and 8 relators of total length 94
#I  there are 7 generators and 7 relators of total length 92
#I  there are 6 generators and 6 relators of total length 90
gap> TzGoGo(P);;
#I  there are 5 generators and 5 relators of total length 217
gap> Epimorphism(FpGroupPresentation(P),G);
false
