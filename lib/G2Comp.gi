#############################################################################
##  
##  G2Comp.gi   	 G2Comp Package		     Iván Sadofschi Costa
##  


# K = [ G, V, E, F, labels ]
# each element r in F is a list of pairs [edge, sign]
# that represents a closed edge path used to attach a 2-cell

# to do: information_orbits, function to remove orbits, functions to select cells,...



#Canonical Elements

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

InstallGlobalFunction( CanonicalVertex, function(v) 
	local H,g;
	g:=v[1];
	H:=v[2];
	return [CanonicalLeftCosetElement(g,H), H,v[3]];
end);


# Action of G on cells
InstallGlobalFunction(ActionVertex, function(g,v) 
	local H,h;
	h:=v[1];
	H:=v[2];
	return [CanonicalLeftCosetElement(g*h,H), H, v[3]];
end);

InstallGlobalFunction(ActionEdge, function(g,e) 
	local h,H,label,v1,v2;
	h:=e[1]; H:=e[2]; label:=e[3]; v1:=e[4]; v2:=e[5];
	return [CanonicalLeftCosetElement(g*h,H),H,label, ActionVertex(g,v1),ActionVertex(g,v2)];
end);

InstallGlobalFunction(ActionEdgePath,function(g,path) 
	local e, gpath;
	gpath:=[];
	for e in path do
		Add(gpath, [ActionEdge(g,e[1]),e[2]]);
	od;
	return gpath;
end);

InstallGlobalFunction(ActionTwoCell, function(g,f) 
	return [CanonicalLeftCosetElement(g*f[1],f[2]),f[2],f[3],ActionEdgePath(g,f[4])];
end);


# Stabilizers of cells and paths
InstallGlobalFunction( StabilizerVertex, function(v)
	return v[2]^(v[1]^-1);
end);

InstallGlobalFunction( StabilizerEdge, function(e)
	return e[2]^(e[1]^-1);
end);

InstallGlobalFunction( StabilizerOrientedEdge, function(e)
	return StabilizerEdge(e[1]);
end);

InstallGlobalFunction( StabilizerEdgePath, function(c)
	return Intersection(List(c,x->StabilizerOrientedEdge(x)));
end);

InstallGlobalFunction( StabilizerTwoCell, function(f)
	return f[2]^(f[1]^-1);
end);

InstallGlobalFunction(StabilizerCell, function(x)
	return x[2]^(x[1]^-1); 	# generic
end);


# Edges and oriented edges
InstallGlobalFunction( VerticesOfEdge, function(e)
	return [e[4],e[5]];
end);

InstallGlobalFunction( SourceOrientedEdge, function(e)
	if e[2]=1 then
		return e[1][4];
	else
		return e[1][5];
	fi;
end);

InstallGlobalFunction( TargetOrientedEdge, function(e)
	if e[2]=1 then
		return e[1][5];
	else
		return e[1][4];
	fi;
end);

InstallGlobalFunction( VerticesOrientedEdge, function(e)
	return [SourceOrientedEdge(e),TargetOrientedEdge(e)];
end);

InstallGlobalFunction( OppositeEdge, function(e)
	return [e[1], -e[2]];
end);

# Edge Paths
InstallGlobalFunction( IsEdgePath, function(c) 
	local l,i;
	l:=Length(c);
	if l=0 then
		return false;
	fi;
	for i in [1..l-1] do
		if not TargetOrientedEdge(c[i])=SourceOrientedEdge(c[i+1]) then
			return false;
		fi;
	od;
	return true;
end);

InstallGlobalFunction( IsClosedEdgePath, function(c) 
	local l;
	if not IsEdgePath(c) then
		return false;
	fi;
	l:=Length(c);
	if not TargetOrientedEdge(c[l])=SourceOrientedEdge(c[1]) then
		return false;
	fi;
	return true;
end);

InstallGlobalFunction( InverseEdgePath, function(c) 
	return List(c, e->OppositeEdge(e));
end);


# Functions to construct G-complexes
InstallGlobalFunction( NewEquivariantTwoComplex, function(G) 
	return [G, [], [], [], [] ];
end);

InstallGlobalFunction( AddOrbitOfVertices, function(K,H,label) 
	local G,V,E,F,labels,g;
	G:=K[1];V:=K[2];E:=K[3];F:=K[4];labels:=K[5];
	if not IsSubgroup(G,H) then
		Print("Error, the stabilizer must be a subgroup of G\n");
	else
		if label in labels then
			Print("Error, the label of the orbit cannot be repeated\n");
		else
			Add(labels,label);
		fi;
		for g in G do
			Add(V, CanonicalVertex([g,H,label]));
		od;
	fi;
	K[2]:=Set(V);
end);

InstallGlobalFunction( AddOrbitOfEdges, function(K, H, v1, v2, label) 
	local G,V,E,F,labels,H1,H2,g;
	G:=K[1];V:=K[2];E:=K[3];F:=K[4];labels:=K[5];

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
		Add( E, [CanonicalLeftCosetElement(g,H), H , label , ActionVertex(g,v1), ActionVertex(g,v2)]);
	od;
	K[3]:=Set(E);
end);

InstallGlobalFunction( AddOrbitOfTwoCells , function(K, H, attaching_map, label)  
	local G,V,E,F,labels,H1,H2,g;
	G:=K[1];V:=K[2];E:=K[3];F:=K[4];labels:=K[5];

	if not IsSubgroup(G,H) then
		Print("Error, the stabilizer must be a subgroup of G\n");
		return fail;
	fi;

	if not IsClosedEdgePath(attaching_map) then 	
		Print("Error, the attaching map is not a closed edge path\n");
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
		Add( F, [CanonicalLeftCosetElement(g,H), H , label, ActionEdgePath(g,attaching_map) ]);
	od;
	K[4]:=Set(F);
end);

InstallGlobalFunction( AddOrbitOfTwoCellsNC, function(K, H, attaching_map, label) 
	local G,V,E,F,labels,H1,H2,g;
	G:=K[1];V:=K[2];E:=K[3];F:=K[4];labels:=K[5];

	if not IsSubgroup(G,H) then
		Print("Error, the stabilizer must be a subgroup of G\n");
		return fail;
	fi;

	if not IsClosedEdgePath(attaching_map) then 	
		Print("Warning: The attaching map is not a closed edge path!\n");
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
	for g in G do
		Add( F, [CanonicalLeftCosetElement(g,H), H , label, ActionEdgePath(g,attaching_map) ]);
	od;
	K[4]:=Set(F);
end);


InstallGlobalFunction( SpanningTreeOfComplex , function(K) 
	# Spanning tree of K^1 given as a list of edges
	# returns fail if K is not connected
	# Kruskal's algorithm
	local T,u,e,E,V,_cl,cl,join,i,j;
	V:=K[2];
	E:=K[3];
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
	if Size(V)=1 then
		return [];
	fi;
	u := 0;
	T:=[];
	for e in E do
		i:=Position(V,e[4]);
		j:=Position(V,e[5]);
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
	E:=L[3];
	n:=Size(E);
	sigma:=Random(SymmetricGroup(n));
	E:=Permuted(E,sigma);
	L[3]:=E;
	return SpanningTreeOfComplex(L);
end);

# Complexes mod G
InstallGlobalFunction( VertexModG , function(vertice) 
	return [ (), Group(()), vertice[3] ];
end);

InstallGlobalFunction( EdgeModG, function(e) 
	return [(),Group(()), e[3], VertexModG(e[4]), VertexModG(e[5]) ];
end);

InstallGlobalFunction( DirectedEdgeModG, function(e)
	return [ EdgeModG(e[1]) , e[2] ];
end);

InstallGlobalFunction( EdgePathModG, function(edge_path) 
	return List(edge_path, DirectedEdgeModG);
end);

InstallGlobalFunction( TwoComplexModG, function(K) 
	local G,V,E,F,labels;
	G:=K[1];V:=K[2];E:=K[3];F:=K[4];labels:=K[5];
	return [
	Group(()),
	Set(List(V,VertexModG)),
	Set(List(E,EdgeModG)),
	Set(List(F,EdgePathModG)),
	labels
	];
end);


# Reduced and ciclically reduced paths

InstallGlobalFunction( ReducedEdgePath, function(edge_path)
	# not very efficient
	local changes,i;
	if not IsEdgePath(edge_path) then
		Print("Error, the argument is not an edge path\n");
		return fail;
	fi;
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
	return edge_path;
end);


InstallGlobalFunction( CyclicallyReducedEdgePath, function(edge_path)
	local changes,i,j;
	if not IsClosedEdgePath(edge_path) then
		Print("Error, the argument is not a closed edge path\n");
		return fail;
	fi;
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
	return edge_path;
end);

# Extras
InstallGlobalFunction( H2AsGModule, function(K)
	local G,V,E,F,
	e,f,i,g,M,v,w,
	d_2,ZBaseH2,list_action_C2,action_C2,list_action_H2,action_H2;

	G:=K[1]; V:=K[2]; E:=K[3]; F:=K[4];
	
	if Size(F)=0 then
		return GroupHomomorphismByImages(G,Group([()]),List(GeneratorsOfGroup(G),x-> () ) );
	fi;

	# differential d_2
	d_2:=NullMat(Size(E),Size(F));;
	for i in [1..Size(F)] do
		f:=F[i][4];
		for e in f do
			d_2[PositionSorted(E,e[1])][i]:=d_2[PositionSorted(E,e[1])][i]+e[2];
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
			M[Position(F,ActionTwoCell(g,f))][Position(F,f)]:=1;
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

InstallGlobalFunction( CoveringSpaceFromHomomorphism, function(H,G,phi)
	# H finitely presented
	# G finite
	# phi: H -->> G onto
	local K,TrivialGroup,
	F,gens,rels,gens_free,edge_representatives,edge_representatives_inverses,
	g,v0,v1,r,f_r,j,x,i,eps;

	K:=NewEquivariantTwoComplex(G);
	gens:=GeneratorsOfGroup(H);
	TrivialGroup:=Group([Identity(G)]);
	
	AddOrbitOfVertices(K,TrivialGroup,"x");
	
	v0:=CanonicalVertex([Identity(G),TrivialGroup,"x"]);
	
	edge_representatives:=[];
	edge_representatives_inverses:=[];
	for g in gens do
		v1:= ActionVertex(Image(phi,g),v0);
		AddOrbitOfEdges(K, TrivialGroup, v0,v1, g );
		Add( edge_representatives, [Identity(G), TrivialGroup , g , v0, v1] );
		Add( edge_representatives_inverses, ActionEdge(Image(phi,g)^-1, [Identity(G), TrivialGroup , g , v0, v1]) );
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
				Add(f_r,StructuralCopy([ActionEdge(g,edge_representatives[i]),1]));
				eps:=1;
			else
				i:=Position(gens_free,x^-1);
				Add(f_r,StructuralCopy([ActionEdge(g,edge_representatives_inverses[i]),-1]));
				eps:=-1;
			fi;

			g:=g*Image(phi,gens[i]^eps);
		od;
		#Print(f_r,"\n\n");
		AddOrbitOfTwoCells(K, TrivialGroup, f_r, r);
	od;
	return K;
end);

