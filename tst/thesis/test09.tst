# Test 9 - Example 7
# Running TzGoGo(P) at the end of this test produces the following output
# #I  there are 20 generators and 20 relators of total length 493056
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
gap> c:= e1+(1,2)(4,5)*e1^-1+(1,2)(3,4)*e2+(1,4,5,2,3)*e3^-1+(1,3)(2,5)*e3+(1,2,4,3,5)*e2^-1
>          +(1,3,2,4,5)*e1+(1,4,5,2,3)*e3+(1,2)(3,4)*e2^-1+(1,3,4,5,2)*e1+(1,3,5)*e1^-1+(1,2,3,4,5)*e1+(2,3,5)*e1^-1;;
gap> AddOrbitOfTwoCells(K, Group(()), c, "f");;
gap> IsAcyclic(K);
true
gap> pi:=FundamentalGroup(K);;
gap> P:=PresentationFpGroup(pi);
<presentation with 80 gens and 80 rels of total length 800>
gap> GeneratorsOfPresentation(P);
[ f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, 
  f30, f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, f41, f42, f43, f44, f45, f46, f47, f48, f49, f50, f51, f52, f53, f54, f55, f56, f57, 
  f58, f59, f60, f61, f62, f63, f64, f65, f66, f67, f68, f69, f70, f71, f72, f73, f74, f75, f76, f77, f78, f79, f80 ]
gap> TzPrintRelators(P);
#I  1. f1
#I  2. f2
#I  3. f4
#I  4. f6
#I  5. f8
#I  6. f9
#I  7. f11
#I  8. f12
#I  9. f14
#I  10. f15
#I  11. f23
#I  12. f27
#I  13. f29
#I  14. f31
#I  15. f39
#I  16. f42
#I  17. f44
#I  18. f52
#I  19. f55
#I  20. f57
#I  21. f1*f23^-1*f25*f71^-1*f60*f35^-1*f55*f71*f25^-1*f42*f50^-1*f29*f14^-1
#I  22. f1*f23^-1*f24*f74^-1*f79*f34^-1*f57*f74*f24^-1*f44*f48^-1*f31*f11^-1
#I  23. f1*f23^-1*f26*f73^-1*f78*f33^-1*f52*f73*f26^-1*f39*f46^-1*f27*f8^-1
#I  24. f8*f27^-1*f33*f66^-1*f45*f38^-1*f48*f66*f33^-1*f52*f61^-1*f31*f11^-1
#I  25. f11*f31^-1*f34*f67^-1*f43*f37^-1*f50*f67*f34^-1*f57*f62^-1*f29*f14^-1
#I  26. f14*f29^-1*f35*f64^-1*f41*f36^-1*f46*f64*f35^-1*f55*f59^-1*f27*f8^-1
#I  27. f8*f27^-1*f28*f74^-1*f58*f30^-1*f62*f74*f28^-1*f59*f55^-1*f29*f14^-1
#I  28. f14*f29^-1*f30*f73^-1*f54*f32^-1*f61*f73*f30^-1*f62*f57^-1*f31*f11^-1
#I  29. f11*f31^-1*f32*f71^-1*f80*f28^-1*f59*f71*f32^-1*f61*f52^-1*f27*f8^-1
#I  30. f8*f27^-1*f36*f67^-1*f76*f25^-1*f42*f67*f36^-1*f46*f39^-1*f23*f1^-1
#I  31. f11*f31^-1*f38*f64^-1*f75*f26^-1*f39*f64*f38^-1*f48*f44^-1*f23*f1^-1
#I  32. f14*f29^-1*f37*f66^-1*f77*f24^-1*f44*f66*f37^-1*f50*f42^-1*f23*f1^-1
#I  33. f23*f1^-1*f4*f54^-1*f78*f70^-1*f61*f54*f4^-1*f11*f31^-1*f48*f44^-1
#I  34. f23*f1^-1*f2*f58^-1*f79*f69^-1*f62*f58*f2^-1*f14*f29^-1*f50*f42^-1
#I  35. f23*f1^-1*f6*f80^-1*f60*f68^-1*f59*f80*f6^-1*f8*f27^-1*f46*f39^-1
#I  36. f27*f8^-1*f16*f43^-1*f76*f51^-1*f50*f43*f16^-1*f14*f29^-1*f55*f59^-1
#I  37. f29*f14^-1*f12*f45^-1*f77*f49^-1*f48*f45*f12^-1*f11*f31^-1*f57*f62^-1
#I  38. f31*f11^-1*f9*f41^-1*f75*f47^-1*f46*f41*f9^-1*f8*f27^-1*f52*f61^-1
#I  39. f27*f8^-1*f9*f79^-1*f58*f72^-1*f57*f79*f9^-1*f11*f31^-1*f61*f52^-1
#I  40. f31*f11^-1*f12*f60^-1*f80*f56^-1*f55*f60*f12^-1*f14*f29^-1*f62*f57^-1
#I  41. f29*f14^-1*f16*f78^-1*f54*f53^-1*f52*f78*f16^-1*f8*f27^-1*f59*f55^-1
#I  42. f27*f8^-1*f6*f77^-1*f45*f63^-1*f44*f77*f6^-1*f1*f23^-1*f39*f46^-1
#I  43. f29*f14^-1*f2*f75^-1*f41*f40^-1*f39*f75*f2^-1*f1*f23^-1*f42*f50^-1
#I  44. f31*f11^-1*f4*f76^-1*f43*f65^-1*f42*f76*f4^-1*f1*f23^-1*f44*f48^-1
#I  45. f39*f46^-1*f68*f18^-1*f15*f37^-1*f29*f18*f68^-1*f59*f55^-1*f50*f42^-1
#I  46. f42*f50^-1*f69*f19^-1*f13*f38^-1*f31*f19*f69^-1*f62*f57^-1*f48*f44^-1
#I  47. f44*f48^-1*f70*f17^-1*f10*f36^-1*f27*f17*f70^-1*f61*f52^-1*f46*f39^-1
#I  48. f46*f39^-1*f63*f13^-1*f21*f32^-1*f31*f13*f63^-1*f44*f48^-1*f61*f52^-1
#I  49. f48*f44^-1*f65*f15^-1*f22*f30^-1*f29*f15*f65^-1*f42*f50^-1*f62*f57^-1
#I  50. f50*f42^-1*f40*f10^-1*f20*f28^-1*f27*f10*f40^-1*f39*f46^-1*f59*f55^-1
#I  51. f52*f61^-1*f72*f22^-1*f18*f35^-1*f29*f22*f72^-1*f57*f62^-1*f55*f59^-1
#I  52. f55*f59^-1*f53*f21^-1*f19*f34^-1*f31*f21*f53^-1*f52*f61^-1*f57*f62^-1
#I  53. f57*f62^-1*f56*f20^-1*f17*f33^-1*f27*f20*f56^-1*f55*f59^-1*f52*f61^-1
#I  54. f59*f55^-1*f51*f5^-1*f3*f26^-1*f23*f5*f51^-1*f50*f42^-1*f39*f46^-1
#I  55. f61*f52^-1*f47*f3^-1*f7*f24^-1*f23*f3*f47^-1*f46*f39^-1*f44*f48^-1
#I  56. f62*f57^-1*f49*f7^-1*f5*f25^-1*f23*f7*f49^-1*f48*f44^-1*f42*f50^-1
#I  57. f39*f46^-1*f47*f58^-1*f74*f49^-1*f57*f58*f47^-1*f52*f61^-1*f48*f44^-1
#I  58. f44*f48^-1*f49*f80^-1*f71*f51^-1*f55*f80*f49^-1*f57*f62^-1*f50*f42^-1
#I  59. f42*f50^-1*f51*f54^-1*f73*f47^-1*f52*f54*f51^-1*f55*f59^-1*f46*f39^-1
#I  60. f46*f39^-1*f40*f79^-1*f74*f56^-1*f62*f79*f40^-1*f42*f50^-1*f55*f59^-1
#I  61. f50*f42^-1*f65*f78^-1*f73*f72^-1*f61*f78*f65^-1*f44*f48^-1*f57*f62^-1
#I  62. f48*f44^-1*f63*f60^-1*f71*f53^-1*f59*f60*f63^-1*f39*f46^-1*f52*f61^-1
#I  63. f59*f55^-1*f56*f77^-1*f66*f70^-1*f48*f77*f56^-1*f62*f57^-1*f61*f52^-1
#I  64. f61*f52^-1*f53*f76^-1*f67*f69^-1*f50*f76*f53^-1*f59*f55^-1*f62*f57^-1
#I  65. f62*f57^-1*f72*f75^-1*f64*f68^-1*f46*f75*f72^-1*f61*f52^-1*f59*f55^-1
#I  66. f52*f61^-1*f70*f43^-1*f67*f40^-1*f42*f43*f70^-1*f48*f44^-1*f39*f46^-1
#I  67. f55*f59^-1*f68*f45^-1*f66*f65^-1*f44*f45*f68^-1*f46*f39^-1*f42*f50^-1
#I  68. f57*f62^-1*f69*f41^-1*f64*f63^-1*f39*f41*f69^-1*f50*f42^-1*f44*f48^-1
#I  69. f39*f46^-1*f36*f19^-1*f21*f4^-1*f11*f19*f36^-1*f27*f8^-1*f1*f23^-1
#I  70. f42*f50^-1*f37*f17^-1*f20*f6^-1*f8*f17*f37^-1*f29*f14^-1*f1*f23^-1
#I  71. f44*f48^-1*f38*f18^-1*f22*f2^-1*f14*f18*f38^-1*f31*f11^-1*f1*f23^-1
#I  72. f46*f39^-1*f26*f22^-1*f15*f16^-1*f14*f22*f26^-1*f23*f1^-1*f8*f27^-1
#I  73. f48*f44^-1*f24*f20^-1*f10*f9^-1*f8*f20*f24^-1*f23*f1^-1*f11*f31^-1
#I  74. f50*f42^-1*f25*f21^-1*f13*f12^-1*f11*f21*f25^-1*f23*f1^-1*f14*f29^-1
#I  75. f52*f61^-1*f32*f5^-1*f7*f6^-1*f1*f5*f32^-1*f31*f11^-1*f8*f27^-1
#I  76. f55*f59^-1*f28*f7^-1*f3*f2^-1*f1*f7*f28^-1*f27*f8^-1*f14*f29^-1
#I  77. f57*f62^-1*f30*f3^-1*f5*f4^-1*f1*f3*f30^-1*f29*f14^-1*f11*f31^-1
#I  78. f59*f55^-1*f35*f13^-1*f19*f9^-1*f11*f13*f35^-1*f29*f14^-1*f8*f27^-1
#I  79. f61*f52^-1*f33*f15^-1*f18*f12^-1*f14*f15*f33^-1*f27*f8^-1*f11*f31^-1
#I  80. f62*f57^-1*f34*f10^-1*f17*f16^-1*f8*f10*f34^-1*f31*f11^-1*f14*f29^-1

