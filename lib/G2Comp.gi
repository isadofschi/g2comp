#############################################################################
##  
##  G2Comp.gi   	 G2Comp Package		     Iván Sadofschi Costa
##  

#############################################################################

# to do: information_orbits, functions to remove orbits?, functions to select cells?
# dictionary mapping label to representative of the orbit given by the label
# cells could store the complex K
#############################################################################


#############################################################################
# New types

G2ComplexFamily:=NewFamily("G2ComplexFamily",IsMutable and IsG2Complex and IsCopyable);;
G2ComplexType:=NewType(G2ComplexFamily,  IsG2Complex and IsAttributeStoringRep);;

G2CompVertexFamily:=NewFamily("G2CompVertexFamily",IsG2CompVertex and IsCopyable);;
G2CompVertexType:=NewType(G2CompVertexFamily,  IsG2CompVertex and IsAttributeStoringRep);;

G2CompEdgePathFamily:=NewFamily("G2CompEdgePathFamily", IsG2CompEdgePath and IsCopyable);;
G2CompEdgePathType:=NewType(G2CompEdgePathFamily,  IsG2CompEdgePath and IsAttributeStoringRep);;

G2CompEdgeFamily:=NewFamily("G2CompEdgeFamily", IsG2CompEdge and IsCopyable);;
G2CompEdgeType:=NewType(G2CompEdgeFamily,  IsG2CompEdge and IsAttributeStoringRep);;

G2CompOrientedEdgeFamily:=NewFamily("G2CompOrientedEdgeFamily", IsG2CompOrientedEdge and IsCopyable);;
G2CompOrientedEdgeType:=NewType(G2CompOrientedEdgeFamily,  IsG2CompOrientedEdge and IsAttributeStoringRep);;

G2CompTwoCellFamily:=NewFamily("G2CompTwoCellFamily", IsG2CompTwoCell and IsCopyable);;
G2CompTwoCellType:=NewType(G2CompTwoCellFamily,  IsG2CompTwoCell and IsAttributeStoringRep);;



#############################################################################
# PrintObj and ViewObj:

InstallMethod(ViewObj,
"for G2Complex",
[IsG2Complex],
function(X)
	Print("<G-equivariant 2-complex>");
end);

InstallMethod(PrintObj,"for G2Complex",
[IsG2Complex],
function(X)
	Print("<G-equivariant 2-complex>");
end);

InstallMethod(ViewObj,
"for G2CompVertex",
[IsG2CompVertex],
function(v)
	local g;
	g:=v!.g;
	if Order(g)=1 then
		g:="";
	fi;
	Print(g,v!.label);
end);

InstallMethod(PrintObj,"for G2CompVertex",
[IsG2CompVertex],
function(v)
	local g;
	g:=v!.g;
	if Order(g)=1 then
		g:="";
	else
		g:=Concatenation(String(g),"*");
	fi;
	Print(g,v!.label);
end);

InstallMethod(PrintObj,"for G2CompEdge",
[IsG2CompEdge],
function(e)
	local g;
	g:=e!.g;
	if Order(g)=1 then
		g:="";
	else
		g:=Concatenation(String(g),"*");
	fi;
	Print(g,e!.label);
end);

InstallMethod(ViewObj,
"for G2CompEdge",
[IsG2CompEdge],
function(e)
	local g;
	g:=e!.g;
	if Order(g)=1 then
		g:="";
	else
		g:=Concatenation(String(g),"*");
	fi;
	Print(g,e!.label);
end);

InstallMethod(PrintObj,"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
function(e)
	local s;
	if e!.sign = 1 then
		s:="";
	else
		s:="^-1";
	fi;
	Print(e!.edge,s);
end);

InstallMethod(ViewObj,
"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
function(e)
	local s;
	if e!.sign = 1 then
		s:="";
	else
		s:="^-1";
	fi;
	Print(e!.edge,s);
end);


InstallMethod(ViewObj,
"for G2CompTwoCell",
[IsG2CompTwoCell],
function(f)
	local g;
	g:=f!.g;
	if Order(g)=1 then
		g:="";
	else
		g:=Concatenation(String(g),"*");
	fi;
	Print(g,f!.label);
end);

InstallMethod(PrintObj,"for G2CompTwoCell",
[IsG2CompTwoCell],
function(f)
	local g;
	g:=f!.g;
	if Order(g)=1 then
		g:="";
	else
		g:=Concatenation(String(g),"*");
	fi;
	Print(g,f!.label);
end);

InstallMethod(ViewObj,
"for G2CompEdgePath",
[IsG2CompEdgePath],
function(gamma)
	local es,i,l;
	es:=gamma!.edgepath;
	l:=Length(es);	
	for i in [1..l] do
		ViewObj(es[i]);
		if i<l then
			Print("+");
		fi;
	od;
end);

InstallMethod(PrintObj,"for G2CompeEdgePath",
[IsG2CompEdgePath],
function(gamma)
	local es,i,l;
	es:=gamma!.edgepath;
	l:=Length(es);	
	for i in [1..l] do
		PrintObj(es[i]);
		if i<l then
			Print("+");
		fi;
	od;
end);


#############################################################################
# Length, Size, List:

InstallMethod(Length,
"for G2CompEdgePath",
[IsG2CompEdgePath],
function(es)
	return Length(List(es));
end);

InstallMethod(Size,
"for G2CompEdgePath",
[IsG2CompEdgePath],
function(es)
	return Size(List(es));
end);

InstallMethod(ListOp,
"for G2CompEdgePath",
[IsG2CompEdgePath],
function(es)
	return es!.edgepath;
end);


#############################################################################
#Canonical Elements:

InstallGlobalFunction( CanonicalLeftCosetElement, function(g,H)
	return Inverse(CanonicalRightCosetElement(H,Inverse(g)));
end );

InstallGlobalFunction( CanonicalLeftCosetsRepresentatives, function(G,H)
    local l,g;
    l:=[];
    for g in G do
        Add(l,CanonicalLeftCosetElement(g,H));
    od;
    return l;
end);

#############################################################################
# Comparison:

InstallOtherMethod(\<,
"for G2CompVertex, G2CompVertex",
[IsG2CompVertex,IsG2CompVertex],
function(v,w)
	return [v!.g, v!.H, v!.label] < [w!.g, w!.H, w!.label];
end);
InstallOtherMethod(\=,
"for G2CompVertex, G2CompVertex",
[IsG2CompVertex,IsG2CompVertex],
function(v,w)
	return [v!.g, v!.H, v!.label] = [w!.g, w!.H, w!.label];
end);
InstallOtherMethod(\<,
"for G2CompEdge, G2CompEdge",
[IsG2CompEdge,IsG2CompEdge],
function(v,w)
	return [v!.g, v!.H, v!.label] < [w!.g, w!.H, w!.label];
end);
InstallOtherMethod(\=,
"for G2CompEdge, G2CompEdge",
[IsG2CompEdge,IsG2CompEdge],
function(v,w)
	return [v!.g, v!.H, v!.label] = [w!.g, w!.H, w!.label];
end);

InstallOtherMethod(\<,
"for G2CompOrientedEdge, G2CompOrientedEdge",
[IsG2CompOrientedEdge,IsG2CompOrientedEdge],
function(e1,e2)
	return [e1!.sign, e1!.edge] < [e2!.sign, e2!.edge];
end);
InstallOtherMethod(\=,
"for G2CompOrientedEdge, G2CompOrientedEdge",
[IsG2CompOrientedEdge,IsG2CompOrientedEdge],
function(e1,e2)
	return [e1!.sign, e1!.edge] = [e2!.sign, e2!.edge];
end);

InstallOtherMethod(\<,
"for G2CompEdgePath, G2CompEdgePath",
[IsG2CompEdgePath,IsG2CompEdgePath],
function(c1,c2)
	return List(c1)<List(c2);
end);

InstallOtherMethod(\=,
"for G2CompEdgePath, G2CompEdgePath",
[IsG2CompEdgePath,IsG2CompEdgePath],
function(c1,c2)
	return List(c1)=List(c2);
end);


InstallOtherMethod(\<,
"for G2CompTwoCell, G2CompTwoCell",
[IsG2CompTwoCell,IsG2CompTwoCell],
function(f1,f2)
	return [f1!.g, f1!.H, f1!.label,f1!.attaching_map] < [f2!.g, f2!.H, f2!.label,f2!.attaching_map];
end);
InstallOtherMethod(\=,
"for G2CompTwoCell, G2CompTwoCell",
[IsG2CompTwoCell,IsG2CompTwoCell],
function(f1,f2)
	return [f1!.g, f1!.H, f1!.label,f1!.attaching_map] = [f2!.g, f2!.H, f2!.label,f2!.attaching_map];
end);

#############################################################################
# Constructors:

InstallMethod(NewEquivariantTwoComplex,
"for Finite Group",
[IsGroup and IsFinite],
function(G)
	return Objectify( G2ComplexType, rec(group:=G, vertices:=[], edges:=[], faces:=[], labels:=[] ) );  
end);

InstallGlobalFunction( MakeVertex, function(g,H,label)
	# chequeos?
	return Objectify(G2CompVertexType, rec( g:=CanonicalLeftCosetElement(g,H), H:=H, label:=label));
end);

InstallGlobalFunction( MakeEdge,
function(g,H,label,v1,v2)
	# chequeos?
	local e;
	e:= Objectify(G2CompEdgeType, rec( g:=CanonicalLeftCosetElement(g,H), H:=H, label:=label, v1:=v1, v2:=v2 ));
	e!.edgepath:=[MakeOrientedEdge(1,e)];
	return e;
end);

InstallGlobalFunction(MakeOrientedEdge,
function(s,e)
	# chequeos?
	e:=Objectify(G2CompOrientedEdgeType, rec(sign:=s, edge:=e));	
	e!.edgepath:=[e];
	return e;
end);

InstallGlobalFunction(MakeTwoCell,
function(g,H,label,attaching_map)
	# chequeos?
	return Objectify(G2CompTwoCellType, rec(g:=CanonicalLeftCosetElement(g,H),H:=H,label:=label, attaching_map:=attaching_map ));
end);

InstallGlobalFunction(MakeEdgePath,
function(c) 
	local l,i;
	if not (IsList(c) and ForAll(c, IsG2CompOrientedEdge)) then
		Print("Error, c must be a list of oriented edges");
		return fail;
	fi;
	l:=Length(c);
	if l=0 then
		return fail;
	fi;
	for i in [1..l-1] do
		if not TargetOrientedEdge(c[i])=SourceOrientedEdge(c[i+1]) then
			Print("Error, c is not an edge path");
			return fail;
		fi;
	od;
	return Objectify(G2CompEdgePathType,rec(edgepath:=c));
end);

#############################################################################
# Edges:

InstallMethod( VerticesOfEdge,
"for G2CompEdge",
[IsG2CompEdge],
function(e)
	return [e!.v1,e!.v2];
end);

InstallMethod( SourceOrientedEdge,
"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
function(e)
	if e!.sign=1 then
		return (e!.edge)!.v1;
	else
		return (e!.edge)!.v2;
	fi;
end);

InstallMethod(TargetOrientedEdge,
"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
function(e)
	if e!.sign=1 then
		return (e!.edge)!.v2;
	else
		return (e!.edge)!.v1;
	fi;
end);

InstallMethod(VerticesOrientedEdge,
"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
function(e)
	return [SourceOrientedEdge(e),TargetOrientedEdge(e)];
end);

InstallMethod(OppositeEdge,
"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
function(e)
	return MakeOrientedEdge(-(e!.sign),e!.edge);
end);

#############################################################################
# Edge Paths:

InstallMethod(IsClosedEdgePath,
"for G2CompEdgePath",
[IsG2CompEdgePath],
function(gamma) 
	local c,l;
	c:=List(gamma);
	l:=Length(c);
	if not TargetOrientedEdge(c[l])=SourceOrientedEdge(c[1]) then
		return false;
	fi;
	return true;
end);

InstallMethod( InverseEdgePath,
"for G2CompEdgePath",
[IsG2CompEdgePath],
function(c)
	return MakeEdgePath(List(Reversed(List(c)), OppositeEdge ));
end);
#############################################################################
# Forming edge paths:
InstallMethod(\+,
"for edge path and edge path",
[IsG2CompEdgePath,IsG2CompEdgePath],
function(c1,c2)
	return MakeEdgePath(Concatenation(List(c1),List(c2)));
end);

#InstallMethod(\-,
#"for edge path and edge path",
#[IsG2CompEdgePath,IsG2CompEdgePath],
#function(c1,c2)
#	return MakeEdgePath(Concatenation(List(c1), List(InverseEdgePath(c2))));
#end);

InstallMethod(\^,
"for edge path integer",
[IsG2CompEdgePath,IsInt],
function(c,n)
	if n=1 then
		return c;
	fi;
	if n=-1 then
		if IsG2CompEdge(c) then
			return MakeOrientedEdge(-1,c);
		fi;
		if IsG2CompOrientedEdge(c) then
			return OppositeEdge(c);
		fi;
		return MakeEdgePath(List(InverseEdgePath(c)));
	fi;
	if IsClosedEdgePath(c) then
		if n>0 then
			return Sum(List([1..n], x->c));
		fi;
		if n<0 then
			return Sum(List([1..n], x->c^-1));
		fi;
	fi;
	return fail;
end);

#############################################################################
# Reduced and ciclically reduced paths

InstallMethod(ReducedEdgePath,
"for edge path",
[IsG2CompEdgePath],
function(gamma)
	# not very efficient
	local changes,i,edge_path;
	edge_path:=StructuralCopy(List(gamma));
	changes:=true;
	while changes do
		changes:=false;
		for i in [1..Length(edge_path)-1] do			
			if edge_path[i]=OppositeEdge(edge_path[i+1]) then
				Remove(edge_path,i+1);
				Remove(edge_path,i);
				changes:=true;
				break;		
			fi;
		od;
	od;
	return MakeEdgePath(edge_path);
end);

InstallMethod( CyclicallyReducedEdgePath,
"for closed edge path",
[IsG2CompEdgePath],
function(gamma)
	local changes,i,j,edge_path;
	edge_path:=StructuralCopy(List(gamma));
	changes:=true;
	while changes do
		changes:=false;
		for i in [1..Length(edge_path)] do			
			j:=i+1;
			if j > Length(edge_path) then
				j:=1;
			fi;
			if edge_path[i]=OppositeEdge(edge_path[j]) then
				Remove(edge_path,Maximum(i,j));
				Remove(edge_path,Minimum(i,j));
				changes:=true;
				break;		
			fi;
		od;
	od;
	return MakeEdgePath(edge_path);
end);

#############################################################################
# Action of G on cells:

InstallMethod(ActionVertex,
"for group element and G2CompVertex",
[IsObject, IsG2CompVertex],
function(g,v) 
	return MakeVertex(CanonicalLeftCosetElement(g*(v!.g),v!.H), v!.H, v!.label);
end);

InstallMethod(ActionEdge,
"for group element and G2CompEdge",
[IsObject, IsG2CompEdge],
function(g,e) 
	return MakeEdge(CanonicalLeftCosetElement(g*e!.g,e!.H),e!.H,e!.label, ActionVertex(g,e!.v1),ActionVertex(g,e!.v2));
end);

InstallMethod(ActionOrientedEdge,
"for group element and G2CompOrientedEdge",
[IsObject, IsG2CompOrientedEdge],
function(g,e)
	return MakeOrientedEdge(e!.sign, ActionEdge(g,e!.edge));
end);

InstallMethod(ActionEdgePath,
"for group element and edge path",
[IsObject, IsG2CompEdgePath],
function(g,gamma)
	return MakeEdgePath(List(List(gamma), e->ActionOrientedEdge(g,e)));
end);

InstallMethod(ActionTwoCell,
"for group element and G2CompTwoCell",
[IsObject, IsG2CompTwoCell],
function(g,f)
	return MakeTwoCell(g * f!.g, f!.H, f!.label, ActionEdgePath(g,f!.attaching_map));
end);

InstallMethod(\*,
"for group element and edge path",
[IsAssociativeElement,IsG2CompEdgePath],
function(g,c)
	if IsG2CompEdge(c) then
		return ActionEdge(g,c);
	fi;
	if IsG2CompOrientedEdge(c) then
		return ActionOrientedEdge(g,c);
	fi;
	return ActionEdgePath(g,c);
end);

#############################################################################
# Components of the 2-complex

InstallMethod(GroupOfComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	return K!.group;
end);

InstallMethod(VerticesOfComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	return K!.vertices;
end);
InstallMethod(EdgesOfComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	return K!.edges;
end);
InstallMethod(FacesOfComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	return K!.faces;
end);
InstallMethod(LabelsOfComplex,
"for G2Complex",
[IsG2Complex],
function(K)
	return K!.labels;
end);

#############################################################################
# Adding orbits of cells

InstallMethod( AddOrbitOfVertices,
"for G2Complex, group and label",
[IsG2Complex, IsGroup and IsFinite, IsObject],
function(K,H,label) 
	local G,V,labels,g;
	G:=GroupOfComplex(K);
	V:=VerticesOfComplex(K);
	labels:=LabelsOfComplex(K);
	if not IsSubgroup(G,H) then
		Print("Error, the stabilizer must be a subgroup of G\n");
	else
		if label in labels then
			Print("Error, the label of the orbit cannot be repeated\n");
		else
			Add(labels,label);
		fi;
		for g in G do
			Add(V, MakeVertex(g,H,label));
		od;
	fi;
	K!.vertices:=Set(V);
	K!.labels:=labels;
	return MakeVertex(Identity(G),H,label);
end);

InstallMethod(AddOrbitOfEdges,
"for G2Complex, group, vertex, vertex, label",
[IsG2Complex, IsGroup and IsFinite, IsG2CompVertex, IsG2CompVertex, IsObject],
function(K, H, v1, v2, label) 
	local G,V,E,labels,H1,H2,g;

	G:=GroupOfComplex(K);
	V:=VerticesOfComplex(K);
	E:=EdgesOfComplex(K);
	labels:=LabelsOfComplex(K);

	if not IsSubgroup(G,H) then
		Print("Error, the stabilizer must be a subgroup of G\n");
		return fail;
	fi;
	if not (v1 in V and v2 in V) then
		Print("Error, v1 and v2 must be vertices\n");
		return fail;
	fi;
	if not (IsSubgroup(StabilizerVertex(v1),H) and IsSubgroup(StabilizerVertex(v2),H)) then
		Print("Error, the stabilizer of the edge must be a subgroup of the stabilizers of the vertices\n");
		return fail;
	fi;
	if label in labels then
		Print("Error, the label of the orbit cannot be repeated\n");
		return fail;
	fi;
	Add(labels,label);
	for g in G do
		Add( E, MakeEdge(g,H, label, ActionVertex(g,v1), ActionVertex(g,v2)));
	od;
	K!.labels:=labels;
	K!.edges:=Set(E);
	return MakeEdge(Identity(G), H , label , ActionVertex(Identity(G),v1), ActionVertex(Identity(G),v2));
end);

InstallMethod(AddOrbitOfTwoCells,
"for G2Complex, group, closed edge path, label",
[IsG2Complex, IsGroup and IsFinite, IsG2CompEdgePath, IsObject],
function(K, H, attaching_map, label)  
	local G,V,E,F,labels,H1,H2,g,e;
	G:=GroupOfComplex(K);
	V:=VerticesOfComplex(K);
	E:=EdgesOfComplex(K);
	F:=FacesOfComplex(K);
	labels:=LabelsOfComplex(K);
	if not IsSubgroup(G,H) then
		Print("Error, the stabilizer must be a subgroup of G\n");
		return fail;
	fi;

	for e in List(attaching_map) do
		if not e!.edge in E then
			Print("Error, some edges of the path are not in K\n");
			return fail;
		fi;
	od;
	if not IsClosedEdgePath(attaching_map) then
		Print("Error, the edge path is not closed\n");
		return fail;
	fi;

	if not IsSubgroup(StabilizerEdgePath(attaching_map), H) then
		Print("Error, the stabilizer of the orbit must stabilize the image of the attaching map\n");
		return fail;
	fi;

	if label in labels then
			Print("Error, the label of the orbit cannot be repeated\n");
			return fail;
	fi;
	Add(labels,label);
	for g in G do # canonical left transversal
		Add( F, MakeTwoCell(g, H , label, ActionEdgePath(g,attaching_map)) );
	od;
	K!.faces:=Set(F);
	K!.labels:=labels;
	return MakeTwoCell(Identity(G), H , label, ActionEdgePath(Identity(G),attaching_map));
end);

#############################################################################
# Stabilizers:

InstallMethod( StabilizerVertex,
"for G2CompVertex",
[IsG2CompVertex],
function(x)
	return (x!.H)^((x!.g)^-1);
end);

InstallMethod( StabilizerEdge,
"for G2CompEdge",
[IsG2CompEdge],
function(x)
	return (x!.H)^((x!.g)^-1);
end);

InstallMethod( StabilizerOrientedEdge,
"for G2CompOrientedEdge",
[IsG2CompOrientedEdge],
 function(e)
	return StabilizerEdge(e!.edge);
end);

InstallMethod(StabilizerEdgePath,
"for edge path",
[IsG2CompEdgePath],
function(gamma)
	return Intersection(List(List(gamma),x->StabilizerOrientedEdge(x)));
end);

InstallMethod(StabilizerTwoCell,
"for G2CompTwoCell",
[IsG2CompTwoCell],
function(f)
	return (f!.H)^((f!.g)^-1);
end);

InstallGlobalFunction( StabilizerCell, function(x)
	return (x!.H)^((x!.g)^-1); 	# generic
end);

#############################################################################
# Orbits:

InstallMethod( OrbitOfVertex,
"for group and G2CompVertex",
[IsGroup and IsFinite,IsG2CompVertex],
function(H,v)
	return Set(List(H,g-> ActionVertex(g,v)));
end);

InstallMethod( OrbitOfEdge, 
"for group and G2CompEdge",
[IsGroup and IsFinite,IsG2CompEdge],
function(H,v)
	return Set(List(H,g-> ActionEdge(g,v)));
end);

InstallMethod( OrbitOfOrientedEdge,
"for group and G2CompOrientedEdge",
[IsGroup and IsFinite,IsG2CompOrientedEdge],
 function(H,v)
	return Set(List(H,g-> ActionOrientedEdge(g,v)));
end);

InstallMethod( OrbitOfEdgePath,
"for group and edge path",
[IsGroup and IsFinite, IsG2CompEdgePath],
function(H,gamma)
	return Set(List(H,g-> ActionEdgePath(g,gamma)));
end);

InstallMethod( OrbitOfTwoCell,
"for group and G2CompTwoCell",
[IsGroup and IsFinite, IsG2CompTwoCell],
function(H,f)
	return Set(List(H,g-> ActionTwoCell(g,f)));
end);

#############################################################################
# Complexes mod G

InstallGlobalFunction( VertexModG , function(v) 
	return MakeVertex((), Group(()), v!.label);
end);

InstallGlobalFunction( EdgeModG, function(e) 
	return MakeEdge((), Group(()), e!.label, VertexModG(e!.v1), VertexModG(e!.v2));
end);

InstallGlobalFunction( DirectedEdgeModG, function(e)
	return MakeOrientedEdge(e!.sign, EdgeModG(e!.edge));
end);

InstallGlobalFunction( EdgePathModG, function(gamma) 
	return MakeEdgePath(List(List(gamma), DirectedEdgeModG));
end);

InstallGlobalFunction( TwoCellModG, function(f)
	return MakeTwoCell((), Group(()), f!.label, EdgePathModG(f!.attaching_map));
end);

InstallGlobalFunction( TwoComplexModG, 
function(K)
	return Objectify(
		G2ComplexType,
		rec(
			group:= Group(()),
			vertices:= Set(List(VerticesOfComplex(K), VertexModG)),
			edges:=	Set(List(EdgesOfComplex(K),    EdgeModG)),
			faces:=	Set(List(FacesOfComplex(K),    TwoCellModG)),
			labels:= LabelsOfComplex(K)
		)
	);
end);

InstallMethod(FixedSubcomplex,
"for G2Complex and group",
[IsG2Complex, IsGroup and IsFinite],
function(K,H)
	# returns X^H with the trivial group action
	# could be improved to return an N_G(H)-complex 
	local V,E,F,vertex_H,edge_H,face_H,EH,VH,FH;
    V:=VerticesOfComplex(K);
	E:=EdgesOfComplex(K);
	F:=FacesOfComplex(K);
	vertex_H := v -> MakeVertex((), Group(()), Concatenation("v_", String(PositionSorted(V,v))));
	edge_H   := e -> MakeEdge((), Group(()), Concatenation("e_", String(PositionSorted(E,e))), vertex_H(e!.v1), vertex_H(e!.v2));
	face_H   := f -> [(), Group(()), ["f_", PositionSorted(F,f)], List(f[4], e->[edge_H(e[1]),e[2]]) ];
	VH:=List( Filtered(V, v -> IsSubgroup(StabilizerVertex(v),H)),  vertex_H);
	EH:=List( Filtered(E, e -> IsSubgroup(StabilizerEdge(e),H)),    edge_H);
	FH:=List( Filtered(F, f -> IsSubgroup(StabilizerTwoCell(f),H)), face_H);
	return Objectify(
		G2ComplexType,
		rec(
			group:=Group(()),
			vertices:=Set(VH),
			edges:=Set(EH),
			faces:=Set(FH),
			labels:=Set(Union(List([VH,EH,FH], l ->List(l,x->x!.label))))
		)
	);
end);

#############################################################################
# Spanning trees:
InstallGlobalFunction( SpanningTreeOfComplex , function(K)
	# Spanning tree of K^1 given as a list of edges
	# returns fail if K is not connected
	# Kruskal's algorithm
	# The set of vertices of K must be sorted
	# Must work even if the set of edges of K is not sorted
	local T,u,e,E,V,_cl,cl,join,i,j;
	V:=VerticesOfComplex(K);
	E:=EdgesOfComplex(K);
	_cl:=List(V, x -> -1 );
    cl:=function(i)
		if _cl[i] =-1 then
			return i;
		else
			_cl[i]:=cl(_cl[i]);
			return _cl[i];
		fi;
	end;;
	join:=function(i,j)
		if not cl(i)=cl(j) then
			_cl[cl(i)] := cl(j);
		fi;
	end;;
	if Size(V) <= 1 then
		return [];
	fi;
	u := 0;
	T:=[];
	for e in E do
		i:=PositionSorted(V,VerticesOfEdge(e)[1]);
		j:=PositionSorted(V,VerticesOfEdge(e)[2]);
		if not cl(i) = cl(j) then
			u:=u+1;
			Add(T,e);
			if u=Size(V)-1 then
				return T;
			fi;
			join(i, j);
		fi;
	od;
	return fail;;
end);

InstallGlobalFunction( RandomSpanningTreeOfComplex , function(K) 
	local sigma, E,n, L;
	L:=StructuralCopy(K);
	E:=EdgesOfComplex(L);
	n:=Size(E);
	sigma:=Random(SymmetricGroup(n));
	E:=Permuted(E,sigma);
	L!.edges:=E;
	return SpanningTreeOfComplex(L);
end);

InstallMethod(IsSpanningTreeOfComplex,
"for G2Complex, list of edges",
[IsG2Complex, IsList],
function(K,T)
	local L,T1;

	if not (ForAll(T, e-> e in EdgesOfComplex(K)) and Length(Set(T))=Length(T)) then
		return false;
	fi;
	L:=StructuralCopy(K);
	L!.edges:=T;
	T1:=SpanningTreeOfComplex(L);
	if T1 = fail then
		return false;
	fi;
	if Set(T1) = Set(T) then
		return true;
	fi;
	return false;
end);



#############################################################################
# Extras

InstallMethod( H2AsGModule,
"for G2Complex",
[IsG2Complex],
function(K)
	local G,V,E,F,
	e,f,i,g,M,v,w,
	d_2,ZBaseH2,list_action_C2,action_C2,list_action_H2,action_H2;

	G:=GroupOfComplex(K);
	V:=VerticesOfComplex(K);
	E:=EdgesOfComplex(K);
	F:=FacesOfComplex(K);
	
	if Size(F)=0 then
		return GroupHomomorphismByImages(G,Group([()]),List(GeneratorsOfGroup(G),x-> () ) );
	fi;

	# differential d_2
	d_2:=NullMat(Size(E),Size(F));;
	for i in [1..Size(F)] do
		f:=F[i]!.attaching_map;
		for e in f do
			d_2[PositionSorted(E,e!.edge)][i]:=d_2[PositionSorted(E,e!.edge)][i]+e!.sign;
		od;
	od;

	ZBaseH2:=NullspaceIntMat(TransposedMat(d_2));;

	if Size(ZBaseH2)=0 then
		return GroupHomomorphismByImages(G,Group([()]),List(GeneratorsOfGroup(G),x-> () ) );
	fi;

	# C2 as a ZG-module	
	list_action_C2:=[];;
	for g in GeneratorsOfGroup(G) do
		M:=NullMat(Size(F),Size(F));
		for f in F do
			M[PositionSorted(F,ActionTwoCell(g,f))][PositionSorted(F,f)]:=1;
		od;
		Add(list_action_C2,M);
	od;
	action_C2:=GroupHomomorphismByImagesNC(G, GL(Size(F),Integers), list_action_C2);; # NC!

	# H2 as a ZG-module
	list_action_H2:=[];;
	for g in GeneratorsOfGroup(G) do
		M:=[];
		for v in ZBaseH2 do
			w:=Image(action_C2,g)*v;
			Add(M,SolutionIntMat(ZBaseH2,w));		
		od;
		Add(list_action_H2,M);
	od;
	action_H2:=GroupHomomorphismByImagesNC(G, GL(Size(ZBaseH2),Integers), list_action_H2);; # NC!

	return action_H2;
end);

InstallMethod(CoveringSpaceFromHomomorphism,
"for group homomorphism with FpGroup source and finite image",
[IsGroupHomomorphism],
function(phi)
	local G,H,K,TrivialGroup,
	F,gens,rels,gens_free,edge_representatives,edge_representatives_inverses,
	g,v0,v1,e,r,f_r,j,x,i,eps;

	G:=Image(phi);
	H:=Source(phi);
	if not IsFinite(G) then
		Print("# The image of phi must be finite\n");
		return fail;
	fi;
	if not IsFpGroup(H) then
		Print("# The source of phi must be an FpGroup\n");
		return fail;
	fi;
	
	K:=NewEquivariantTwoComplex(G);
	gens:=GeneratorsOfGroup(H);
	TrivialGroup:=Group([Identity(G)]);
	
	v0:=AddOrbitOfVertices(K,TrivialGroup,"x0");
	
	edge_representatives:=[];
	edge_representatives_inverses:=[];
	for g in gens do
		v1:= ActionVertex(Image(phi,g),v0);
		e:=AddOrbitOfEdges(K, TrivialGroup, v0,v1, String(g) );
		Add( edge_representatives, e );
		Add( edge_representatives_inverses, ActionEdge(Image(phi,g)^-1, e) );
	od;

	F:=FreeGroupOfFpGroup(H);
	gens_free:=GeneratorsOfGroup(F);
	rels:=RelatorsOfFpGroup(H);

	for r in rels do
		f_r:=[];
		g:=Identity(G);
		for j in [1..Length(r)] do
			x:=Subword(r,j,j);			
			if x in gens_free then
				i:=Position(gens_free,x);
				Add(f_r,StructuralCopy(MakeOrientedEdge(1,ActionEdge(g,edge_representatives[i]))));
				eps:=1;
			else
				i:=Position(gens_free,x^-1);
				Add(f_r,StructuralCopy(MakeOrientedEdge(-1,ActionEdge(g,edge_representatives_inverses[i]))));
				eps:=-1;
			fi;

			g:=g*Image(phi,gens[i]^eps);
		od;
		AddOrbitOfTwoCells(K, TrivialGroup, MakeEdgePath(f_r), String(r));
	od;
	return K;
end);



