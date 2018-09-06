#############################################################################
##
#W  random_attaching_maps.gi	The G2Comp package     Iván Sadofschi Costa
#W
##
InstallGlobalFunction( RandomAttachingMaps, function(K,lengths)  
	local G,V,E,
	adjacency_lists_out, #adjacency_lists_in,
	a,n,v,v1,v2,i,i1,i2,
	num,partial_path,
	current_vertex,previous_edge,
	paths,tiempo,rs1;

	G:=K[1];;
	V:=K[2];;
	E:=K[3];;

	tiempo:=Runtime( );
	rs1 := RandomSource(IsMersenneTwister,tiempo);
	
	adjacency_lists_out:=[];
	#adjacency_lists_in:=[];
	for v in V do
		Add(adjacency_lists_out,[]);
		#Add(adjacency_lists_in,[]);
	od;
	for a in E do
		v1:=a[4];
		v2:=a[5];
		i1:=Position(V,v1);
		i2:=Position(V,v2);
		Add( adjacency_lists_out[i1],   [a,1]  );
		#Add( adjacency_lists_in[i1],  [a,-1]  );		
		#Add( adjacency_lists_in[i2],  [a, 1] );
		Add( adjacency_lists_out[i2],   [a,-1] );
	od;
	num:=Size(lengths);
	paths:=[];
	while Size(paths)<num do 
		partial_path:=[];
		n:=lengths[Size(paths)+1]; #length of the path
		current_vertex:=V[1];
		previous_edge:=[[],1];
		while Size(partial_path) < n do
			a:=Random(rs1, adjacency_lists_out[Position(V,current_vertex)] );
			if previous_edge[1]=a[1] and previous_edge[2]+a[2]=0 then
				continue;
			fi;
			Add(partial_path,a);
			previous_edge:=a;
			if a[2]=1 then
				current_vertex:=a[1][5];
			else
				current_vertex:=a[1][4];
			fi;	
		od;
		if current_vertex = V[1] then # is the path closed?
			if # is the path cyclically reduced?
				not ( 	partial_path[1][1] = partial_path[Size(partial_path)][1] and 
						partial_path[1][2]+partial_path[Size(partial_path)][2]=0)
			then 
				Add(paths,partial_path);
			fi;
		fi;
		paths:=Set(paths);
	od;
	return paths;
end);

