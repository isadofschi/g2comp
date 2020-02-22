gap> K:=NewEquivariantTwoComplex(AlternatingGroup(5));
<G-equivariant 2-complex>
gap> v0 := AddOrbitOfVertices(K, Group((1,2)(3,4)), "v0");
v0
gap> e0 := AddOrbitOfEdges(K,Group(()),v0,v0,"e0");
e0
gap> c:=e0+e0+e0^-1;
e0+e0+e0^-1
gap> f:=AddOrbitOfTwoCells(K,Group(()),c,"f");
f
gap> IsConnected(K);
false


gap> G:=AlternatingGroup(5);;
gap> K:=NewEquivariantTwoComplex(G);
<G-equivariant 2-complex>
gap> v:=AddOrbitOfVertices(K,G,"v");
v
gap> e:=AddOrbitOfEdges(K,G,v,v,"e");
e
gap> f:=AddOrbitOfTwoCells(K,Group(()),e,"f");
f
gap> pi:=FundamentalGroup(K);
<fp group on the generators [ f1 ]>
gap> Order(pi);
1




gap> G:=AlternatingGroup(5);;
gap> K:=NewEquivariantTwoComplex(G);
<G-equivariant 2-complex>
gap> v:=AddOrbitOfVertices(K,G,"v");
v
gap> e:=AddOrbitOfEdges(K,G,v,v,"e");
e
gap> AddOrbitOfTwoCells(K,Group(()),e,"f");
f
gap> pi:=FundamentalGroup(K);
<fp group on the generators [ f1 ]>
gap> Order(pi);
1

