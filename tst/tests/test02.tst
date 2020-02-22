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
gap> EulerCharacteristic(K);
-59
gap> c:=e1+e3+e2^-1;;
gap> gamma:=c+c;
e1+e3+e2^-1+e1+e3+e2^-1
gap> Print(gamma);
e1+e3+e2^-1+e1+e3+e2^-1
gap> Length(gamma);
6
gap> f:=AddOrbitOfTwoCells(K, Group(()), gamma, "f");
f
gap> IsAcyclic(K);
false
gap> EulerCharacteristic(K);
1
gap> g_gamma:=(2,3)(4,5)*(e1+e3+e2^-1+e1+e3+e2^-1);
(2,3)(4,5)*e1+(2,3)(4,5)*e3+(2,3)(4,5)*e2^-1+(2,3)(4,5)*e1+(2,3)(4,5)*e3+(2,3)(4,5)*e2^-1
gap> (1,4,3,2,5) * g_gamma;
(1,3,4,2,5)*e1+(1,3,5,2,4)*e3+(1,2,3,4,5)*e2^-1+(1,3,4,2,5)*e1+(1,3,5,2,4)*e3+(1,2,3,4,5)*e2^-1
gap> AddOrbitOfTwoCells(K, Group(()), gamma, "f");
Error, the label of the orbit cannot be repeated
fail
gap> AddOrbitOfTwoCells(K, AlternatingGroup(10), gamma, "f");
Error, the stabilizer must be a subgroup of G
fail
gap> AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");
Error, the label of the orbit cannot be repeated
fail
gap> StabilizerTwoCell(f);
Group(())
gap> StabilizerEdgePath(gamma);
Group(())
gap> StabilizerEdgePath(e1);
Group([ (3,4,5) ])
gap> StabilizerOrientedEdge(e1^-1);
Group([ (3,4,5) ])
gap> StabilizerEdgePath(e1)=StabilizerEdgePath((1,4,3,2,5)*e1)^(1,4,3,2,5);
true
gap> OrbitOfVertex(H2,v1);
[ v1, (1,2)(4,5)v1 ]
gap> OrbitOfEdge(H2,e3);
[ e3, (3,4,5)*e3, (3,5,4)*e3 ]
gap> OrbitOfOrientedEdge(H2, e3^-1);
[ e3^-1, (3,4,5)*e3^-1, (3,5,4)*e3^-1 ]
gap> OrbitOfEdgePath(H2,gamma);
[ e1+e3+e2^-1+e1+e3+e2^-1, 
  e1+(3,4,5)*e3+(3,4,5)*e2^-1+e1+(3,4,5)*e3+(3,4,5)*e2^-1, 
  e1+(3,5,4)*e3+(3,5,4)*e2^-1+e1+(3,5,4)*e3+(3,5,4)*e2^-1, 
  (1,2)(4,5)*e1+e3+(1,2)(3,5)*e2^-1+(1,2)(4,5)*e1+e3+(1,2)(3,5)*e2^-1, 
  (1,2)(4,5)*e1+(3,4,5)*e3+(1,2)(3,4)*e2^-1+(1,2)(4,5)*e1+(3,4,5)*e3+(1,2)(3,4)*e2^-1, 
  (1,2)(4,5)*e1+(3,5,4)*e3+(1,2)(4,5)*e2^-1+(1,2)(4,5)*e1+(3,5,4)*e3+(1,2)(4,5)*e2^-1 ]
gap> TwoComplexModG(K);
<G-equivariant 2-complex>
gap> EulerCharacteristic(TwoComplexModG(K));
1
gap> VerticesOfComplex(TwoComplexModG(K));
[ v1, v2, v3 ]
gap> EdgesOfComplex(TwoComplexModG(K));
[ e1, e2, e3 ]
gap> FacesOfComplex(TwoComplexModG(K));
[ f ]
gap> KH1:=FixedSubcomplex(K,H1);
<G-equivariant 2-complex>
gap> VerticesOfComplex(KH1);
[ v_1 ]
gap> EdgesOfComplex(KH1);
[  ]
gap> FacesOfComplex(KH1);
[  ]
gap> L:=FixedSubcomplex(K, StabilizerEdge(e1));
<G-equivariant 2-complex>
gap> VerticesOfComplex(L);
[ v_1, v_12, v_2 ]
gap> EdgesOfComplex(L);
[ e_1, e_23 ]
gap> FacesOfComplex(L);
[  ]
gap> EulerCharacteristic(L);
1
gap> VerticesOfEdge(EdgesOfComplex(L)[1]);
[ v_1, v_2 ]
gap> VerticesOfEdge(EdgesOfComplex(L)[2]);
[ v_12, v_2 ]
gap> IsConnected(L);
true
gap> IsContractible(L);
true
gap> IsAcyclic(L);
true
gap> Order(FundamentalGroup(L));
1
gap> IsContractible(K);
false
gap> FacesOfComplex(K)=FacesOfComplex(OSA5Example(gamma));
true

