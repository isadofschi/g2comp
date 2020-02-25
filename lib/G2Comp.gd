#############################################################################
##  
##  G2Comp.gd      	 G2Comp Package		     Iván Sadofschi Costa
##  
#############################################################################
#! @Chapter G2Comp
#! @Section Introduction
#! This package includes functions to construct, manipulate and study $2$-complexes with an admissible (left) action of a finite group $G$.
#! As an example, we compute the fundamental group of the barycentric subdivision of the $2$-skeleton of Poincaré's dodecahedral space:
#! @BeginExampleSession
#! gap> G:=AlternatingGroup(5);;
#! gap> H1:=Group([ (3,4,5), (2,4)(3,5) ]);;
#! gap> H2:=Group([ (1,2)(4,5), (3,4,5) ]);;
#! gap> H3:=Group([ (1,4)(2,3), (1,3)(4,5) ]);;
#! gap> K:=NewEquivariantTwoComplex(G);
#! <G-equivariant 2-complex>
#! gap> v1:=AddOrbitOfVertices(K,H1,"v1");
#! v1
#! gap> v2:=AddOrbitOfVertices(K,H2,"v2");
#! v2
#! gap> v3:=AddOrbitOfVertices(K,H3,"v3");
#! v3
#! gap> e1:=AddOrbitOfEdges(K, Intersection(H1,H2), v1, v2, "e1");
#! e1
#! gap> e2:=AddOrbitOfEdges(K, Intersection(H1,H3), v1, v3, "e2");
#! e2
#! gap> e3:=AddOrbitOfEdges(K, Intersection(H2,H3), v2, v3, "e3");
#! e3
#! gap> gamma:=e1+e3+e2^-1;
#! e1+e3+e2^-1
#! gap> f:=AddOrbitOfTwoCells(K, Group(()), gamma, "f");
#! f
#! gap> IsAcyclic(K);
#! true
#! gap> pi:=FundamentalGroup(K);
#! <fp group with 80 generators>
#! gap> IdGroup(SimplifiedFpGroup(pi));
#! [ 120, 5 ]
#! @EndExampleSession
# G2Comp types:
DeclareCategory("IsG2Complex",IsObject);
DeclareCategory("IsG2CompVertex",IsObject);
DeclareCategory("IsG2CompEdgePath",IsObject);
DeclareCategory("IsG2CompEdge",IsG2CompEdgePath);
DeclareCategory("IsG2CompOrientedEdge",IsG2CompEdgePath);
DeclareCategory("IsG2CompTwoCell",IsObject);
#############################################################################
# Comparison (needed to consider sets)
DeclareOperation("\=", [IsG2CompVertex,IsG2CompVertex]);
DeclareOperation("\<", [IsG2CompVertex,IsG2CompVertex]);
DeclareOperation("\=", [IsG2CompEdge,IsG2CompEdge]);
DeclareOperation("\<", [IsG2CompEdge,IsG2CompEdge]);
DeclareOperation("\=", [IsG2CompOrientedEdge,IsG2CompOrientedEdge]);
DeclareOperation("\<", [IsG2CompOrientedEdge,IsG2CompOrientedEdge]);
DeclareOperation("\=", [IsG2CompTwoCell,IsG2CompTwoCell]);
DeclareOperation("\<", [IsG2CompTwoCell,IsG2CompTwoCell]);
DeclareOperation("\=", [IsG2CompEdgePath,IsG2CompEdgePath]);
DeclareOperation("\<", [IsG2CompEdgePath,IsG2CompEdgePath]);
#############################################################################
# Size, Length
DeclareOperation("ListOp", [IsG2CompEdgePath]);
DeclareAttribute("Size", IsG2CompEdgePath);
DeclareAttribute("Length",IsG2CompEdgePath);
#############################################################################
# Canonical representatives for cosets:
#! @Section Additional functions
#! @Arguments g,H
#! @Description Returns a "canonical" representative of the left coset <A>gH</A> which is independent of the given representative <A>g</A>. This can be used to compare cosets by comparing their canonical representatives.
#! The representative chosen to be the "canonical" one is representation dependent and only guaranteed to remain the same within one &GAP; session. See also <Ref Func="CanonicalRightCosetElement" BookName="ref"/>
#! @BeginExampleSession
#! gap> CanonicalLeftCosetElement((2,3,5),H);
#! (3,5)
#! @EndExampleSession
DeclareGlobalFunction("CanonicalLeftCosetElement");

DeclareGlobalFunction("CanonicalLeftCosetsRepresentatives");
#############################################################################
# Constructors:

#! @Section Constructing G 2-complexes
#! @Arguments G
#! @Description Returns an empty <A>G</A> $2$-complex.
#! @BeginExampleSession
#! gap> K:=NewEquivariantTwoComplex(AlternatingGroup(5));
#! <G-equivariant 2-complex>
#! @EndExampleSession
DeclareOperation("NewEquivariantTwoComplex", [IsGroup and IsFinite]);

# The following functions will not be documented:
DeclareGlobalFunction("MakeVertex");
DeclareGlobalFunction("MakeEdge");
DeclareGlobalFunction("MakeOrientedEdge");
DeclareGlobalFunction("MakeTwoCell");
DeclareGlobalFunction("MakeEdgePath");
#############################################################################
#! @Section Edges and edge paths
#! These functions allow to work with edges and edge paths. Note that edges and oriented edges are also edge paths of length 1.
#! @Arguments e
#! @Description Returns the set of vertices of the edge <A>e</A>.
DeclareOperation("VerticesOfEdge",[IsG2CompEdge]);
#! @Arguments e
#! @Description Returns the source of the oriented edge <A>e</A>.
DeclareOperation("SourceOrientedEdge",[IsG2CompOrientedEdge]);
#! @Arguments e
#! @Description Returns the target of the oriented edge <A>e</A>.
DeclareOperation("TargetOrientedEdge",[IsG2CompOrientedEdge]);
#! @Arguments e
#! @Description Returns a list with the source and target of the oriented edge <A>e</A> (in this order).
DeclareOperation("VerticesOrientedEdge",[IsG2CompOrientedEdge]);
#! @Arguments e
#! @Description Returns the opposite edge of an oriented edge <A>e</A>.
DeclareOperation("OppositeEdge",[IsG2CompOrientedEdge]);
#! @Arguments c
#! @Description Checks if an edge path <A>c</A> is a closed edge path.
DeclareProperty("IsClosedEdgePath",IsG2CompEdgePath);
#! @Arguments c
#! @Description Returns the inverse edge path of an edge path <A>c</A>.
DeclareOperation("InverseEdgePath",[IsG2CompEdgePath]);
#############################################################################
# Forming edge paths. Multiplicative notation would be better!
#! @Arguments c,n
#! @Description Returns the edge path $c^n$ (the concatenation of n copies of c) or fail if this concatenation is not possible. In particular, $c^-1$ is the inverse path of $c$.
DeclareOperation("\^",[IsG2CompEdgePath,IsInt]);
#! @Arguments c1,c2
#! @Description Returns the concatenation of c1 and c2 or fail if its not possible to concatenate.
DeclareOperation("\+",[IsG2CompEdgePath,IsG2CompEdgePath]);
#DeclareOperation("\-",[IsG2CompEdgePath,IsG2CompEdgePath]); 
#############################################################################
# Reduced and ciclically reduced paths
#! @Arguments c
#! @Description Reduces the edge path <A>c</A>.
DeclareOperation("ReducedEdgePath",[IsG2CompEdgePath]); 
#! @Arguments c
#! @Description Cyclically reduces the edge path <A>c</A>.
DeclareOperation("CyclicallyReducedEdgePath",[IsG2CompEdgePath]);
#############################################################################
#! @Section Action of G on the cells of K
#! @Arguments g,v
#! @Description Returns the vertex <A>g.v</A>.
DeclareOperation("ActionVertex",[IsObject,IsG2CompVertex]);
#! @Arguments g,e
#! @Description Returns the edge <A>g.e</A>.
DeclareOperation("ActionEdge",[IsObject,IsG2CompEdge]);
#! @Arguments g,e
#! @Description Returns the oriented edge <A>g.e</A>.
DeclareOperation("ActionOrientedEdge",[IsObject,IsG2CompOrientedEdge]);
#! @BeginGroup
#! @Arguments g,c
#! @Description Returns the edge path <A>g.c</A>.
DeclareOperation("\*",[IsAssociativeElement, IsG2CompEdgePath]);
DeclareOperation("ActionEdgePath",[IsObject,IsG2CompEdgePath]);
#! @EndGroup
#! @Arguments g,f
#! @Description Returns the 2-cell <A>g.f</A>.
DeclareOperation("ActionTwoCell",[IsObject,IsG2CompTwoCell]);
#############################################################################
#! @Section Components of a G 2-complex
#! @Arguments K
#! @Description Returns the group acting on <A>K</A>.
DeclareOperation("GroupOfComplex", [IsG2Complex]);
#! @Arguments K
#! @Description Returns the set of vertices of <A>K</A>.
DeclareOperation("VerticesOfComplex", [IsG2Complex]);
#! @Arguments K
#! @Description Returns the set of edges of <A>K</A>.
DeclareOperation("EdgesOfComplex", [IsG2Complex]);
#! @Arguments K
#! @Description Returns the set of faces (i.e. $2$-cells) of <A>K</A>.
DeclareOperation("FacesOfComplex", [IsG2Complex]);
#! @Arguments K
#! @Description Returns the set of representatives for the orbits of <A>K</A>.
DeclareOperation("OrbitRepresentatives", [IsG2Complex]);
#! @Arguments K
#! @Description Returns the dimension of <A>K</A>.
DeclareAttribute("Dimension", IsG2Complex);
#! @Arguments K
#! @Description Prints a description of <A>K</A>.
DeclareOperation("Describe", [IsG2Complex]);
#############################################################################
#! @Section Constructing G $2$-complexes
#! @Arguments K,H,label
#! @Description Adds an orbit of vertices to <A>K</A> of type <A>G/H</A>.
#! Returns the vertex in the new orbit corresponding to the coset <A>1.H</A>.
#! A string <A>label</A> to name this vertex must be provided.
#! @BeginExampleSession
#! gap> v0 := AddOrbitOfVertices(K, Group((1,2)(3,4)), "v0");
#! v0
#! @EndExampleSession
DeclareOperation("AddOrbitOfVertices", [IsG2Complex, IsGroup and IsFinite, IsString]);
#! @Arguments K, H, v1, v2, label
#! @Description Adds an orbit of edges to <A>K</A> of type <A>G/H</A>.
#! Returns the edge in the new orbit corresponding to the coset <A>1.H</A> which is attached with endpoints  the vertices <A>v1,v2</A>.
#! A string <A>label</A> to name this edge must be provided.
#! @BeginExampleSession
#! gap> e0 := AddOrbitOfEdges(K,Group(()),v0,v0,"e0");
#! e0
#! @EndExampleSession
DeclareOperation("AddOrbitOfEdges",[IsG2Complex, IsGroup and IsFinite, IsG2CompVertex, IsG2CompVertex, IsString]);
#! @Arguments K, H, f, label
#! @Description Adds an orbit of <M>2</M>-cells to <A>K</A> with stabilizer <A>H</A> and attaching map <A>f</A>.
#! Returns the 2-cell in the new orbit corresponding to the coset <A>1.H</A>.
#! A string <A>label</A> to name this 2-cell must be provided.
#! @BeginExampleSession
#! gap> gamma:=e0+e0+e0^-1;
#! e0+e0+e0^-1
#! gap> f:=AddOrbitOfTwoCells(K,Group(()),gamma,"f");
#! f
#! @EndExampleSession
DeclareOperation("AddOrbitOfTwoCells",[IsG2Complex, IsGroup and IsFinite, IsG2CompEdgePath, IsString]);
#############################################################################
#! @Section Stabilizers
#! @Arguments v
#! @Description Returns the stabilizer of <A>v</A>.
DeclareOperation("StabilizerVertex", [IsG2CompVertex]);
#! @Arguments e
#! @Description Returns the stabilizer of <A>e</A>.
DeclareOperation("StabilizerEdge", [IsG2CompEdge]);
#! @Arguments e
#! @Description Returns the stabilizer of <A>e</A>.
DeclareOperation("StabilizerOrientedEdge", [IsG2CompOrientedEdge]);
#! @Arguments c
#! @Description Returns stabilizer of <A>c</A>.
DeclareOperation("StabilizerEdgePath",[IsG2CompEdgePath]);
#! @Arguments f
#! @Description Returns the stabilizer of <A>f</A>.
DeclareOperation("StabilizerTwoCell", [IsG2CompTwoCell]);
#! @Arguments e
#! @Description Returns the stabilizer of a <M>k</M>-cell <A>e</A>.
DeclareGlobalFunction("StabilizerCell"); # maybe each G2CompnCell can be a subtype of G2CompCell
#############################################################################
#! @Section Orbits
#! @Arguments H,v
#! @Description Returns the orbit of the vertex <A>v</A> by the subgroup <A>H</A>.
DeclareOperation("OrbitOfVertex",[IsGroup and IsFinite, IsG2CompVertex]);
#! @Arguments H,e
#! @Description Returns the orbit of the edge <A>e</A> by the subgroup <A>H</A>.
DeclareOperation("OrbitOfEdge",[IsGroup and IsFinite, IsG2CompEdge]);
#! @Arguments H,e
#! @Description Returns the orbit of the oriented edge <A>e</A> by the subgroup <A>H</A>.
DeclareOperation("OrbitOfOrientedEdge",[IsGroup and IsFinite, IsG2CompOrientedEdge]);
#! @Arguments H,c 
#! @Description Returns the orbit of the edge path <A>f</A> by the subgroup <A>H</A>.
DeclareOperation("OrbitOfEdgePath",[IsGroup and IsFinite, IsG2CompEdgePath]);
#! @Arguments H,f
#! @Description Returns the orbit of the 2-cell <A>f</A> by the subgroup <A>H</A>.
DeclareOperation("OrbitOfTwoCell", [IsGroup and IsFinite, IsG2CompTwoCell]);
#############################################################################
#! @Section The complex K/G
#! @Arguments K
#! @Description Returns the complex <A>K/G</A>. This is represented as a G2Complex with an action of the trivial group.
#! @BeginExampleSession
#! gap> KmodG:=ComplexModG(K);
#! @EndExampleSession
DeclareGlobalFunction("ComplexModG");
#! The following functions allow to work in the quotient by the action of $G$.
#! @Arguments v
DeclareGlobalFunction("VertexModG");
#! @Arguments e
DeclareGlobalFunction("EdgeModG");
#! @Arguments e
DeclareGlobalFunction("DirectedEdgeModG");
#! @Arguments c
DeclareGlobalFunction("EdgePathModG");
#! @Arguments f
DeclareGlobalFunction("TwoCellModG");

#############################################################################
# Spanning trees:
#! @Arguments K
#! @Description Returns a spanning tree for the 1-skeleton of <A>K</A>.
DeclareGlobalFunction("SpanningTreeOfComplex");
#! @Arguments K
#! @Description Returns a spanning tree for the 1-skeleton of <A>K</A> chosen randomly.
DeclareGlobalFunction("RandomSpanningTreeOfComplex");
#! @Arguments K
#! @Description Returns <K>true</K> if <A>T</A> is a spanning tree of <A>K</A>, <K>false</K> otherwise.
DeclareOperation("IsSpanningTreeOfComplex",[IsG2Complex,IsList]);
#############################################################################
#! @Section Subcomplex fixed by a subgroup H of G
#! @Arguments K,H
#! @Description Returns the subcomplex <M>K^H</M> of <M>K</M> fixed by <M>H</M>. This is represented as a 2-complex with an action of the trivial group (this function may be improved in a future version to yield a complex with an action of $N_G(H)$ or $N_G(H)/H$).
DeclareOperation("FixedSubcomplex",[IsG2Complex,IsGroup and IsFinite]);
#############################################################################
#! @Section More
#! @Arguments K
#! @Description Returns the representation of the group $G$ given by the action on $H_2(K)$. It is represented as a morphism $G \to \mathrm{GL}(m,\mathbb{Z})$ where $m$ is the rank of $H_2(K)$.
DeclareOperation("H2AsGModule",[IsG2Complex]);
#! @Arguments f
#! @Description If <A>f</A> is a group homomorphism with finite image $G$ and the source $H$ of <A>f</A> is an FpGroup, returns the covering space of the presentation complex of <A>H</A> corresponding to the subgroup $\ker(f)$ of $H$. This covering space is represented as a <A>G</A> 2-complex.
DeclareOperation("CoveringSpaceFromHomomorphism",[IsGroupHomomorphism]);
#############################################################################

