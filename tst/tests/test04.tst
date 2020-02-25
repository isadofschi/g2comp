gap> H:=SymmetricGroup(7);;
gap> N:=AlternatingGroup(7);;
gap> f:=NaturalHomomorphismByNormalSubgroup(H,N);;
gap> CoveringSpaceFromHomomorphism(f);
# The source of phi must be an FpGroup
fail
gap> G:=Image(f);;
gap> iso:=IsomorphismFpGroup(H);;
gap> H:=Image(iso);;
gap> f:=CompositionMapping(f,InverseGeneralMapping(iso));;
gap> K:=CoveringSpaceFromHomomorphism(f);
<G-equivariant 2-complex>
gap> EulerCharacteristic(K);
32
gap> pi:=SimplifiedFpGroup(FundamentalGroup(K));;
gap> Order(pi);
2520
gap> pi:=Image(IsomorphismPermGroup(pi));;
gap> IsSimple(pi);
true
gap> StructureDescription(pi);
"A7"
gap> pi1KmodG:=FundamentalGroup(ComplexModG(K));;
gap> StructureDescription(Image(IsomorphismPermGroup(pi1KmodG)));
"S7"
gap> G:=AlternatingGroup(5);;
gap> H1:=Group([ (3,4,5), (2,4)(3,5) ]);;
gap> H2:=Group([ (1,2)(4,5), (3,4,5) ]);;
gap> H3:=Group([ (1,4)(2,3), (1,3)(4,5) ]);;
gap> K:=NewEquivariantTwoComplex(G);;
gap> Describe(K);
# A5-equivariant complex of dimension -1
gap> v1:=AddOrbitOfVertices(K,H1,"v1");;
gap> v2:=AddOrbitOfVertices(K,H2,"v2");;
gap> v3:=AddOrbitOfVertices(K,H3,"v3");;
gap> e1:=AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e1");;
gap> e2:=AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "e2");;
gap> e3:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");;
gap> c:= e3+e2^-1+(2,3,4)*e1+(1,2,3,5,4)*e1^-1+(1,3,5,2,4)*e1+(1,3,4,2,5)*e1^-1+(1,3,5)*e1+(1,3,4,5,2)*e1^-1+(1,2)(4,5)*e1;;
gap> Describe(K);
# A5-equivariant complex of dimension 1 with
#  3 orbits of vertices:
#   -the orbit of v1 has size 5 and stabilizer A4
#   -the orbit of v2 has size 10 and stabilizer S3
#   -the orbit of v3 has size 6 and stabilizer D10
#  3 orbits of edges:
#   -the orbit of e1 has size 20 and stabilizer C3
#   -the orbit of e2 has size 30 and stabilizer C2
#   -the orbit of e3 has size 30 and stabilizer C2
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> Describe(K);
# A5-equivariant complex of dimension 2 with
#  3 orbits of vertices:
#   -the orbit of v1 has size 5 and stabilizer A4
#   -the orbit of v2 has size 10 and stabilizer S3
#   -the orbit of v3 has size 6 and stabilizer D10
#  3 orbits of edges:
#   -the orbit of e1 has size 20 and stabilizer C3
#   -the orbit of e2 has size 30 and stabilizer C2
#   -the orbit of e3 has size 30 and stabilizer C2
#  1 orbits of 2-cells:
#   -the orbit of f has size 60 and stabilizer 1
gap> IsAcyclic(K);
true
gap> pi:=SimplifiedFpGroup(FundamentalGroup(K));;
gap> f:=GroupHomomorphismByImages(
>      pi,
>      AlternatingGroup(5),
>      GeneratorsOfGroup(pi),
>      [ (), (), (), (1,2,3,4,5), (1,2,4,5,3), (1,2,5,3,4) ]
>    );;
gap> L:=CoveringSpaceFromHomomorphism(f);
<G-equivariant 2-complex>
gap> VerticesOfComplex(L);
[ x0, (3,4,5)x0, (3,5,4)x0, (2,3)(4,5)x0, (2,3,4)x0, (2,3,5)x0, 
  (2,4,3)x0, (2,4,5)x0, (2,4)(3,5)x0, (2,5,3)x0, (2,5,4)x0, 
  (2,5)(3,4)x0, (1,2)(4,5)x0, (1,2)(3,4)x0, (1,2)(3,5)x0, (1,2,3)x0, 
  (1,2,3,4,5)x0, (1,2,3,5,4)x0, (1,2,4,5,3)x0, (1,2,4)x0, 
  (1,2,4,3,5)x0, (1,2,5,4,3)x0, (1,2,5)x0, (1,2,5,3,4)x0, (1,3,2)x0, 
  (1,3,4,5,2)x0, (1,3,5,4,2)x0, (1,3)(4,5)x0, (1,3,4)x0, (1,3,5)x0, 
  (1,3)(2,4)x0, (1,3,2,4,5)x0, (1,3,5,2,4)x0, (1,3)(2,5)x0, 
  (1,3,2,5,4)x0, (1,3,4,2,5)x0, (1,4,5,3,2)x0, (1,4,2)x0, 
  (1,4,3,5,2)x0, (1,4,3)x0, (1,4,5)x0, (1,4)(3,5)x0, (1,4,5,2,3)x0, 
  (1,4)(2,3)x0, (1,4,2,3,5)x0, (1,4,2,5,3)x0, (1,4,3,2,5)x0, 
  (1,4)(2,5)x0, (1,5,4,3,2)x0, (1,5,2)x0, (1,5,3,4,2)x0, (1,5,3)x0, 
  (1,5,4)x0, (1,5)(3,4)x0, (1,5,4,2,3)x0, (1,5)(2,3)x0, 
  (1,5,2,3,4)x0, (1,5,2,4,3)x0, (1,5,3,2,4)x0, (1,5)(2,4)x0 ]
gap> OrbitRepresentatives(L);
[ x0, f46, f48, f50, f59, f61, f62, 
  f59^-1*f62^-1*f50*f46^-1*f62*f48*f59*f62*f46^-1*f61^-1*f62^-1*f48^-1*f61*f59*f50*f61*f46*f50^-1*f61^-1*f48*f50^-1, 
  f48*f46^-1*f59*f48*f50^-1*f59^-1*f48^-1*f62^-1*f59^-1*f46*f61*f59*f50*f61^-1*f62^-1*f46^-1*f61^-1*f50*f48^-1*f61*f62, 
  f46^-1*f61^-1*f62^-1*f46*f48^-1*f59^-1*f46*f62^-1*f50*f46^-1*f48*f50^-1*f59^-1*f61^-1*f50^-1*f62*f61*f50*f48^-1*f61*f59, 
  f46*f50^-1*f62*f46*f48^-1*f62^-1*f46^-1*f61^-1*f62^-1*f50*f59*f62*f48*f59^-1*f61^-1*f50^-1*f59^-1*f48*f46^-1*f59*f61, 
  f48^-1*f62^-1*f59^-1*f48*f50^-1*f61^-1*f48*f59^-1*f46*f48^-1*f50*f46^-1*f61^-1*f62^-1*f46^-1*f59*f62*f46*f50^-1*f62*f61, 
  f50^-1*f59^-1*f61^-1*f50*f46^-1*f62^-1*f50*f61^-1*f48*f50^-1*f46*f48^-1*f62^-1*f59^-1*f48^-1*f61*f59*f48*f46^-1*f59*f62 ]
gap> CoveringSpaceFromHomomorphism(IdentityMapping(FreeGroup(1)));
# The image of phi must be finite
fail


