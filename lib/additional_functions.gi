#############################################################################
##  
##  additional_functions.gi   G2Comp Package	Iván Sadofschi Costa
##  

InstallGlobalFunction( PresentationLength, function(P)
	return Sum(List(RelatorsOfFpGroup(FpGroupPresentation(P)),Length));
end);

InstallGlobalFunction( Epimorphism, function(P,G)
	# P a finite presentation
	# G a finite group
	# returns true if there is an epimorphism P->>G
	# otherwise returns false 
	local H,gens,tuples,t,f;
	H:=FpGroupPresentation(P);
	gens:=GeneratorsOfGroup(H);
	tuples:=IteratorOfTuples(G,Size(gens));
	for t in tuples do
		f:=GroupHomomorphismByImages(H,G,gens,t);
		if (not f=fail) and Image(f)=G then
			return true;
		fi;
	od;
	return false;
end);
