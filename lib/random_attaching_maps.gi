#############################################################################
##
#W  random_attaching_maps.gi	The G2Comp package     Iván Sadofschi Costa
#W
##
InstallGlobalFunction( RandomAttachingMaps, function(K,lengths,rs...)  
	local G,V,E,
	adjacency_lists_out,
	a,n,v,i,i1,i2,
	num,partial_path,
	current_vertex,previous_edge,
	paths,time,rs1;

	G:=GroupOfComplex(K);
	V:=VerticesOfComplex(K);
	E:=EdgesOfComplex(K);

	if rs=[] then
		rs1:=GlobalMersenneTwister;
	else
		if rs=["time"] then
			time:=Runtime( );
			rs1 := RandomSource(IsMersenneTwister,time);
		else
			rs1:=rs[1];
		fi;
	fi;
	adjacency_lists_out:=[];
	for v in V do
		Add(adjacency_lists_out,[]);
	od;
	for a in E do
		i1:=PositionSorted( V, SourceOrientedEdge(MakeOrientedEdge(1,a)));
		i2:=PositionSorted( V, SourceOrientedEdge(MakeOrientedEdge(-1,a)));
		Add( adjacency_lists_out[i1], MakeOrientedEdge(1,a));
		Add( adjacency_lists_out[i2],MakeOrientedEdge(-1,a));
	od;
	num:=Size(lengths);
	paths:=[];
	while Size(paths)<num do 
		partial_path:=[];
		n:=lengths[Size(paths)+1]; #length of the path
		current_vertex:=Random(V);
		previous_edge:=fail;
		while Size(partial_path) < n do
			a:=Random(rs1, adjacency_lists_out[PositionSorted(V,current_vertex)] );
			if previous_edge = OppositeEdge(a) then
				continue;
			fi;
			Add(partial_path,a);
			previous_edge:=a;
			current_vertex:=TargetOrientedEdge(a);
		od;
		# we check that the path is closed and cyclically reduced
		if IsClosedEdgePath(MakeEdgePath(partial_path)) and not partial_path[1] = OppositeEdge(partial_path[Size(partial_path)]) then
			Add(paths,partial_path);
		fi;
		paths:=Set(paths);
	od;
	return List(paths, MakeEdgePath);
end);

