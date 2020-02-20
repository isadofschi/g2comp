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
gap> c:= e1+e3+e2^-1+e1+(1,2)(4,5)*e1^-1+(1,3,4,5,2)*e1+(1,3,5)*e1^-1+(1,3,4,2,5)*e1+(1,3,5,2,4)*e1^-1+(1,2,3,5,4)*e1+(2,3,4)*e1^-1;;
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);;
gap> P:=PresentationFpGroup(pi);;
gap> while Size(GeneratorsOfPresentation(P))>6 do
>      TzEliminate(P);;
>    od;;
#I  there are 59 generators and 59 relators of total length 268
#I  there are 58 generators and 58 relators of total length 266
#I  there are 57 generators and 57 relators of total length 264
#I  there are 56 generators and 56 relators of total length 262
#I  there are 55 generators and 55 relators of total length 260
#I  there are 54 generators and 54 relators of total length 258
#I  there are 53 generators and 53 relators of total length 256
#I  there are 52 generators and 52 relators of total length 254
#I  there are 51 generators and 51 relators of total length 252
#I  there are 50 generators and 50 relators of total length 250
#I  there are 49 generators and 49 relators of total length 248
#I  there are 48 generators and 48 relators of total length 246
#I  there are 47 generators and 47 relators of total length 244
#I  there are 46 generators and 46 relators of total length 242
#I  there are 45 generators and 45 relators of total length 240
#I  there are 44 generators and 44 relators of total length 238
#I  there are 43 generators and 43 relators of total length 236
#I  there are 42 generators and 42 relators of total length 234
#I  there are 41 generators and 41 relators of total length 232
#I  there are 40 generators and 40 relators of total length 230
#I  there are 39 generators and 39 relators of total length 228
#I  there are 38 generators and 38 relators of total length 226
#I  there are 37 generators and 37 relators of total length 224
#I  there are 36 generators and 36 relators of total length 222
#I  there are 35 generators and 35 relators of total length 220
#I  there are 34 generators and 34 relators of total length 218
#I  there are 33 generators and 33 relators of total length 216
#I  there are 32 generators and 32 relators of total length 214
#I  there are 31 generators and 31 relators of total length 212
#I  there are 30 generators and 30 relators of total length 210
#I  there are 29 generators and 29 relators of total length 208
#I  there are 28 generators and 28 relators of total length 206
#I  there are 27 generators and 27 relators of total length 204
#I  there are 26 generators and 26 relators of total length 202
#I  there are 25 generators and 25 relators of total length 200
#I  there are 24 generators and 24 relators of total length 198
#I  there are 23 generators and 23 relators of total length 196
#I  there are 22 generators and 22 relators of total length 194
#I  there are 21 generators and 21 relators of total length 192
#I  there are 20 generators and 20 relators of total length 190
#I  there are 19 generators and 19 relators of total length 188
#I  there are 18 generators and 18 relators of total length 186
#I  there are 17 generators and 17 relators of total length 184
#I  there are 16 generators and 16 relators of total length 182
#I  there are 15 generators and 15 relators of total length 180
#I  there are 14 generators and 14 relators of total length 178
#I  there are 13 generators and 13 relators of total length 176
#I  there are 12 generators and 12 relators of total length 174
#I  there are 11 generators and 11 relators of total length 172
#I  there are 10 generators and 10 relators of total length 170
#I  there are 9 generators and 9 relators of total length 168
#I  there are 8 generators and 8 relators of total length 166
#I  there are 7 generators and 7 relators of total length 164
#I  there are 6 generators and 6 relators of total length 162
gap> pi:=FpGroupPresentation(P);;
gap> GroupHomomorphismByImages(
>      pi,
>      AlternatingGroup(5),
>      GeneratorsOfGroup(pi),
>      [ (), (3,4,5), (2,3,4), (1,3,4,2,5), (1,2,5,4,3), (1,2,5) ]
>    );
[ f46, f48, f50, f59, f61, f62 ] -> [ (), (3,4,5), (2,3,4), (1,3,4,2,5), (1,2,5,4,3), (1,2,5) ]

