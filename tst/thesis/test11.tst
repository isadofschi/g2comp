# Test 11 - Examples 9 and 10
gap> IsSuitableChoiceForGammaOS:=function(K)
>  # checks if a G-graph K having the correct orbit types 
>  # is a suitable choice for Gamma_OS( G )
>  local G,H,KH,conj;
>  G:=GroupOfComplex(K);
>  if not IsConnected(K) then
>    Print("# The complex is not connected.\n");
>    return false;
>  fi;
>  conj:= List(ConjugacyClassesSubgroups(G),Representative);
>  for H in conj do                                              
>    if Order(H)<> 1 then
>      KH:=FixedSubcomplex(K,H);
>      if (not (IsEmptyComplex(KH) or IsAcyclic(KH) ))
>        or
>         (Size(Set(Factors(Order(H))))=1 and not IsAcyclic(KH))           
>      then
>        Print("# Fails for ", H, "\n");
>        return false;
>      fi;
>    fi;
>  od;
>  return true;
> end;;
gap> G:=PSL(2,13);;
gap> Borel := Group([
>  (1,13)(2,14)(3,10)(4,7)(5,12)(8,11),
>  (1,8,4,2,10,14)(5,11,6,13,7,12) ]);;
gap> D14   := Group([
>  (2,13)(3,11)(4,6)(5,8)(7,14)(9,10),
>  (1,2)(4,14)(5,13)(6,12)(7,11)(8,10) ]);;
gap> D12   := Group([
>  (3,9)(4,10)(5,11)(6,12)(7,13)(8,14),
>  (1,11)(2,13)(3,4)(5,7)(6,12)(8,9)]);;
gap> A4    := Group([
>  (1,3,6)(2,9,12)(4,14,10)(5,13,11),
>  (1,2)(3,9)(4,8)(5,7)(10,14)(11,13) ]);;
gap> g1    := (2,8,6)(3,4,10)(5,7,14)(9,13,12);;
gap> g2    :=(2,10,11,14,12,7,3,9,13,6,8,5,4);;
gap> C6    := Intersection(Borel,D12^g1);;
gap> C2xC2 := Intersection(D12,A4);;
gap> C3    := Intersection(A4,D12^g2);;
gap> C2    := Intersection(D14,Borel);;
gap> K:=NewEquivariantTwoComplex(G);;
gap> v_B:=AddOrbitOfVertices(K,Borel,"v_B");;
gap> v_D14:=AddOrbitOfVertices(K,D14,"v_D14");;
gap> v_D12:=AddOrbitOfVertices(K,D12,"v_D12");;
gap> v_A4:=AddOrbitOfVertices(K,A4,"v_A4");;
gap> e1:=AddOrbitOfEdges(K,C6, v_B,ActionVertex(g1^-1,v_D12),"e1");;
gap> e2:=AddOrbitOfEdges(K,C2xC2, v_D12,v_A4,"e2");;
gap> e3:=AddOrbitOfEdges(K,C3,v_A4,ActionVertex(g2^-1,v_D12),"e3");;
gap> e4:=AddOrbitOfEdges(K,C2,v_D14,v_B,"e4");;
gap> IsSuitableChoiceForGammaOS(K);
true
gap> Describe(K);
# PSL(2,13)-equivariant complex of dimension 1 with
#  4 orbits of vertices:
#   -the orbit of v_B has size 14 and stabilizer C13 : C6
#   -the orbit of v_D14 has size 78 and stabilizer D14
#   -the orbit of v_D12 has size 91 and stabilizer D12
#   -the orbit of v_A4 has size 91 and stabilizer A4
#  4 orbits of edges:
#   -the orbit of e1 has size 182 and stabilizer C6
#   -the orbit of e2 has size 273 and stabilizer C2 x C2
#   -the orbit of e3 has size 364 and stabilizer C3
#   -the orbit of e4 has size 546 and stabilizer C2
gap> G:=Group([
>  (2,3,4,6)(5,8,11,16)(7,10,14,19)(9,13,18,24)(12,17,22,30)
>  (15,20,27,34)(21,29,37,46)(23,32,41,25)(26,33,42,52)
>  (28,36,44,54)(31,40,50,59)(35,38,48,57)(39,49,58,51)
>  (43,53,61,65)(45,55,63,64)(47,56,60,62),
>  (1,2)(3,5)(4,7)(6,9)(8,12)(10,15)(11,13)(16,21)(17,23)
>  (18,25)(19,26)(20,28)(22,31)(24,32)(27,35)(29,38)(30,39)
>  (33,42)(34,43)(36,45)(37,47)(40,51)(41,49)(44,54)(46,55)
>  (48,52)(50,60)(53,62)(56,64)(57,65)(58,59)(61,63) ]);;
gap> IsomorphismGroups(G,Sz(8))<>fail;
true
gap> H1:= Group([
>  (1,35,31,37,39,4,50)(2,13,64,20,40,55,29)(3,18,34,30,52,38,32)
>  (5,56,47,61,17,26,16)(6,15,58,10,33,42,59)(7,19,44,11,25,49,57)
>  (8,43,63,46,62,54,27)(12,41,51,23,60,24,36)(21,45,22,28,65,48,53),
>  (1,10,54,33)(2,15,44,42)(3,52,11,55)(4,27,23,36)(5,48,13,46)
>  (6,21,58,24)(7,35,17,45)(8,41,18,20)(9,16,59,32)(12,49,25,28)
>  (19,65,62,30)(22,34,64,37)(26,57,53,39)(29,63,50,40)
>  (31,43,56,47)(38,61,60,51) ]);; # Borel
gap> H2:=Group([
>  (1,48)(2,41)(3,54)(4,5)(6,26)(7,16)(8,9)(10,46)(11,60)(12,24)
>  (13,44)(14,49)(15,23)(17,25)(18,20)(19,33)(21,56)(22,52)(27,29)
>  (28,58)(30,62)(31,39)(32,51)(34,40)(35,45)(36,37)(38,65)(42,59)
>  (43,55)(47,50)(57,61)(63,64),
>  (1,45)(2,37)(3,25)(4,32)(6,33)(7,64)(8,51)(9,53)(10,11)(12,56)
>  (13,22)(14,49)(15,27)(16,35)(17,62)(18,41)(19,63)(20,50)(21,29)
>  (23,61)(24,60)(26,39)(28,40)(30,42)(31,48)(34,55)(36,43)(38,52)
>  (44,54)(46,57)(47,58)(59,65) ]);; # D14
gap> H3:=Group([
>  (1,49)(2,11)(3,35)(4,6)(5,55)(7,29)(8,41)(9,20)(10,30)(12,62)
>  (13,46)(14,60)(15,28)(16,51)(17,25)(18,21)(19,27)(22,64)(24,26)
>  (31,54)(32,63)(33,59)(34,39)(36,57)(37,50)(38,58)(40,47)(42,52)
>  (43,44)(45,61)(48,56)(53,65),
>  (1,40,11,32)(2,36,60,41)(3,44,5,17)(4,42,55,50)(6,58,65,43)
>  (7,22,18,61)(8,49,48,15)(9,52,35,38)(10,59,39,64)(12,29,33,13)
>  (14,56,19,47)(16,51,23,26)(20,37,53,25)(21,31,30,62)
>  (27,63,28,57)(34,45,46,54) ]);; # C5 \rtimes C4
gap> H4:=Group([
>  (1,10)(2,11)(3,32)(4,36)(5,28)(6,65)(7,54)(8,21)(9,38)(12,34)
>  (13,55)(14,29)(15,61)(16,60)(17,30)(18,19)(20,37)(22,24)(23,53)
>  (25,42)(26,45)(27,31)(33,58)(35,56)(39,50)(40,46)(41,51)(43,62)
>  (44,59)(47,64)(48,52)(49,63),
>  (1,56,28,41)(2,63,49,47)(3,58,20,42)(4,38,53,44)(5,37,6,52)
>  (7,59,46,62)(8,11,57,14)(9,50,65,17)(10,12,18,54)(13,31,39,61)
>  (15,36,19,32)(16,23,24,51)(21,45,29,64)(22,30,33,34)
>  (25,35,43,55)(27,40,60,48) ]);; # C13 \rtimes C4
gap> H12:=Intersection(H1,H2);; # C7
gap> H23:=Intersection(H2,H3);; # C2
gap> H24:=Intersection(H2,H4);; # C2
gap> H14:=Intersection(H1,H4);; # C4
gap> H34:=Intersection(H3,H4);; # C4
gap> K:=NewEquivariantTwoComplex(G);;
gap> v1:=AddOrbitOfVertices(K,H1,"v1");;
gap> v2:=AddOrbitOfVertices(K,H2,"v2");;
gap> v3:=AddOrbitOfVertices(K,H3,"v3");;
gap> v4:=AddOrbitOfVertices(K,H4,"v4");;
gap> e12:=AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e12");;
gap> e23:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e23");;
gap> e14:=AddOrbitOfEdges(K, Intersection(H1,H4), v1, v4, "e14");;
gap> e34:=AddOrbitOfEdges(K, Intersection(H3,H4), v3, v4, "e34");;
gap> IsSuitableChoiceForGammaOS(K);
true
gap> Describe(K);
# Sz(8)-equivariant complex of dimension 1 with
#  4 orbits of vertices:
#   -the orbit of v1 has size 65 and stabilizer ((C2 x C2 x C2) . (C2 x C2 x C2)) : C7
#   -the orbit of v2 has size 2080 and stabilizer D14
#   -the orbit of v3 has size 1456 and stabilizer C5 : C4
#   -the orbit of v4 has size 560 and stabilizer C13 : C4
#  4 orbits of edges:
#   -the orbit of e12 has size 4160 and stabilizer C7
#   -the orbit of e23 has size 14560 and stabilizer C2
#   -the orbit of e14 has size 7280 and stabilizer C4
#   -the orbit of e34 has size 7280 and stabilizer C4

