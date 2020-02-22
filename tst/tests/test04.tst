gap> H:=SymmetricGroup(7);;
gap> N:=AlternatingGroup(7);;
gap> f:=NaturalHomomorphismByNormalSubgroup(H,N);
[ (1,2,3,4,5,6,7), (1,2) ] -> [ <identity> of ..., f1 ]
gap> G:=Image(f);
Group([ f1 ])
gap> iso:=IsomorphismFpGroup(H);
[ (1,2), (2,3), (3,4), (4,5), (5,6), (6,7) ] -> [ S_7.1, S_7.2, S_7.3, S_7.4, S_7.5, S_7.6 ]
gap> H:=Image(iso);
<fp group of size 5040 on the generators [ S_7.1, S_7.2, S_7.3, S_7.4, S_7.5, S_7.6 ]>
gap> f:=CompositionMapping(f,InverseGeneralMapping(iso));
[ S_7.1, S_7.2, S_7.3, S_7.4, S_7.5, S_7.6 ] -> [ f1, f1, f1, f1, f1, f1 ]
gap> K:=CoveringSpaceFromHomomorphism(f);
<G-equivariant 2-complex>
gap> EulerCharacteristic(K);
32
gap> pi:=SimplifiedFpGroup(FundamentalGroup(K));
<fp group on the generators [ f2, f3, f4, f5, f6 ]>
gap> Order(pi);
2520
gap> pi:=Image(IsomorphismPermGroup(pi));
Group([ (5,6,7), (4,5)(6,7), (3,4)(6,7), (1,3)(6,7), (1,2)(6,7) ])
gap> IsSimple(pi);
true

