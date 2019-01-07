#############################################################################
##  
##  additional_functions.gi   G2Comp Package	Iván Sadofschi Costa
##  

InstallGlobalFunction( PresentationLength, function(P)
	return Sum(List(RelatorsOfFpGroup(FpGroupPresentation(P)),Length));
end);


InstallGlobalFunction(ElementsUpToAutomorphism, function(G)
	# returns a set of representatives of the elements of the 
    # finite group G up to automorphism
	local AutG,elements,x,o,representatives,i,g,h,orbit;
	AutG:=Set(AutomorphismGroup(G));
	elements:=Set(G);
	x:=List(elements,x->0);
	o:=Order(G);
	representatives:=[];
	for i in [1..o] do
		if x[i]=0 then
			g:=elements[i];
			Add(representatives,g);
			orbit:=Set(List(AutG,f -> Image(f,g)));
			for h in orbit do
				x[PositionSorted(elements,h)]:=1;
			od;
		fi;
	od;
	return representatives;
end);


InstallGlobalFunction( HomomorphismWithProperty, function (pi,G,property)
	# pi an FpGroup, G a finite group
	# returns a group homomorphism pi-->G  satisfying the property
	#  or false if there is no nontrivial homomorphism
	local R, elements, l, word, R1, tuples, t, defines_homomorphism, w, sigma, i,prgs,prg,f;
	R:= RelatorsOfFpGroup (pi);
	elements := Set(G);
	l:= Concatenation ([ ElementsUpToAutomorphism(G) ], List ([1..( Size( GeneratorsOfGroup (pi)) -1)] ,
					   x-> elements ));
	word := w -> Concatenation(List( [1.. NrSyllables (w)], 
					   i -> [ GeneratorSyllable (w,i), ExponentSyllable (w,i) ] ));
	R1:= List(R,word);
	prgs:=(List(R1,w-> StraightLineProgram([w],Size(GeneratorsOfGroup(pi))) ));
	
	tuples := IteratorOfCartesianProduct(l);
	for t in tuples do
		defines_homomorphism := true;
		for prg in prgs do
			sigma:=ResultOfStraightLineProgram(prg,t);
			if not sigma = () then
				defines_homomorphism := false;
				break;
			fi;
		od;
		if defines_homomorphism then
			f:=GroupHomomorphismByImages(pi,G,t);			
		 	if property(f) then
				return f;
			fi;
		fi;
	od;
	return false;
end);

InstallGlobalFunction( NontrivialHomomorphism, function(pi,G)
	# pi an FpGroup
	# G a finite group
	# returns true if there is a nontrivial homorphism pi->>G
	# otherwise returns false 
	local isNontrivial;
	if Order(G)=1 or Size(GeneratorsOfGroup(pi))=0 then
		return false;
	fi;
	isNontrivial:= f -> not Order(Image(f))=1;
	return HomomorphismWithProperty(pi,G,isNontrivial);
end);

InstallGlobalFunction( Epimorphism, function(pi,G)
	# pi an FpGroup
	# G a finite group
	# returns true if there is an epimorphism pi->>G
	# otherwise returns false 
	local isEpi;
	if Order(G)=1 then
		return true;
	fi;
    if Size(GeneratorsOfGroup(pi))=0 then
		return false;
	fi;
	isEpi:= f->Image(f)=G;
	return HomomorphismWithProperty(pi,G,isEpi);
end);
