#############################################################################
##  
##  G2Comp.gd      	 G2Comp Package		     Iván Sadofschi Costa
##  
#############################################################################
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
DeclareGlobalFunction("CanonicalLeftCosetElement");
DeclareGlobalFunction("CanonicalLeftCosetsRepresentatives");
#############################################################################
# Constructors:
DeclareOperation("NewEquivariantTwoComplex", [IsGroup and IsFinite]);
DeclareGlobalFunction("MakeVertex");
DeclareGlobalFunction("MakeEdge");
DeclareGlobalFunction("MakeOrientedEdge");
DeclareGlobalFunction("MakeTwoCell");
DeclareGlobalFunction("MakeEdgePath");
#############################################################################
# Edges and edge paths
DeclareOperation("VerticesOfEdge",[IsG2CompEdge]);
DeclareOperation("SourceOrientedEdge",[IsG2CompOrientedEdge]);
DeclareOperation("TargetOrientedEdge",[IsG2CompOrientedEdge]);
DeclareOperation("VerticesOrientedEdge",[IsG2CompOrientedEdge]);
DeclareOperation("OppositeEdge",[IsG2CompOrientedEdge]);
DeclareProperty("IsClosedEdgePath",IsG2CompEdgePath);
DeclareOperation("InverseEdgePath",[IsG2CompEdgePath]);
#############################################################################
# Forming edge paths
# multiplicative notation would be better!
DeclareOperation("\^",[IsG2CompEdgePath,IsInt]);
DeclareOperation("\*",[IsAssociativeElement, IsG2CompEdgePath]);
DeclareOperation("\+",[IsG2CompEdgePath,IsG2CompEdgePath]);
#DeclareOperation("\-",[IsG2CompEdgePath,IsG2CompEdgePath]); 
#############################################################################
# Reduced and ciclically reduced paths
DeclareOperation("ReducedEdgePath",[IsG2CompEdgePath]); 
DeclareOperation("CyclicallyReducedEdgePath",[IsClosedEdgePath]);
#############################################################################
# Group actions:
DeclareOperation("ActionVertex",[IsObject,IsG2CompVertex]);
DeclareOperation("ActionEdge",[IsObject,IsG2CompEdge]);
DeclareOperation("ActionOrientedEdge",[IsObject,IsG2CompOrientedEdge]);
DeclareOperation("ActionEdgePath",[IsObject,IsClosedEdgePath]);
DeclareOperation("ActionTwoCell",[IsObject,IsG2CompTwoCell]);
#############################################################################
# Components:
DeclareOperation("GroupOfComplex", [IsG2Complex]);
DeclareOperation("VerticesOfComplex", [IsG2Complex]);
DeclareOperation("EdgesOfComplex", [IsG2Complex]);
DeclareOperation("FacesOfComplex", [IsG2Complex]);
DeclareOperation("LabelsOfComplex", [IsG2Complex]);
#############################################################################
# Adding orbits of cells:
DeclareOperation("AddOrbitOfVertices", [IsG2Complex, IsGroup and IsFinite, IsObject]);
DeclareOperation("AddOrbitOfEdges",[IsG2Complex, IsGroup and IsFinite, IsG2CompVertex, IsG2CompVertex, IsObject]);
DeclareOperation("AddOrbitOfTwoCells",[IsG2Complex, IsGroup and IsFinite, IsG2CompEdgePath, IsObject]);
DeclareOperation("AddOrbitOfTwoCellsNC",[IsG2Complex, IsGroup and IsFinite, IsG2CompEdgePath, IsObject]);
#############################################################################
# Stabilizers:
DeclareOperation("StabilizerVertex", [IsG2CompVertex]);
DeclareOperation("StabilizerEdge", [IsG2CompEdge]);
DeclareOperation("StabilizerOrientedEdge", [IsG2CompOrientedEdge]);
DeclareOperation("StabilizerEdgePath",[IsClosedEdgePath]);
DeclareOperation("StabilizerTwoCell", [IsG2CompTwoCell]);
DeclareGlobalFunction("StabilizerCell"); # maybe each G2CompnCell can be a subtype of G2CompCell
#############################################################################
# Orbits:
DeclareOperation("OrbitOfVertex",[IsGroup and IsFinite, IsG2CompVertex]);
DeclareOperation("OrbitOfEdge",[IsGroup and IsFinite, IsG2CompEdge]);
DeclareOperation("OrbitOfOrientedEdge",[IsGroup and IsFinite, IsG2CompOrientedEdge]);
DeclareOperation("OrbitOfEdgePath",[IsGroup and IsFinite, IsList]);
DeclareOperation("OrbitOfTwoCell", [IsGroup and IsFinite, IsG2CompTwoCell]);
#############################################################################
# Complex mod G:
DeclareGlobalFunction("VertexModG");
DeclareGlobalFunction("EdgeModG");
DeclareGlobalFunction("DirectedEdgeModG");
DeclareGlobalFunction("EdgePathModG");
DeclareGlobalFunction("TwoCellModG");
DeclareGlobalFunction("TwoComplexModG");
#############################################################################
# Spanning trees:
DeclareGlobalFunction("SpanningTreeOfComplex");#
DeclareGlobalFunction("RandomSpanningTreeOfComplex");#
DeclareGlobalFunction("IsSpanningTreeOfComplex");#
#############################################################################
# Extras:
DeclareOperation("FixedSubcomplex",[IsG2Complex,IsGroup and IsFinite]);
DeclareOperation("H2AsGModule",[IsG2Complex]);
DeclareGlobalFunction("CoveringSpaceFromHomomorphism");
#############################################################################

