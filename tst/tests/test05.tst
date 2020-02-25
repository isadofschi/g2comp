gap> F:=FreeGroup(["a","c","d","y"]);;
gap> a:=F.1;;c:=F.2;;d:=F.3;;y:=F.4;;
gap> R:=[a^3,c^2,d^5,(a*c)^2,(d^-1*a*c)^2,(y*c*a^-1*d*y^-1*a)^3];;
gap> G:=F/R;;
gap> phi:=GroupHomomorphismByImages(G,AlternatingGroup(5),[(3,4,5),(1,2)(4,5), (1,5,4,3,2), ()]);;
gap> X_G:=CoveringSpaceFromHomomorphism(phi);;
gap> rho:=H2AsGModule(X_G);;
gap> chi:=NaturalCharacter(rho);
Character( CharacterTable( Alt( [ 1 .. 5 ] ) ), [ 239, -1, -1, -1, -1 ] )
gap> F:=FreeGroup(["a","b"]);;
gap> a:=F.1;;b:=F.2;;
gap> R:=[a^2,b^3,(a*b)^5];
[ a^2, b^3, (a*b)^5 ]
gap> G:=F/R;
<fp group on the generators [ a, b ]>
gap> phi:=GroupHomomorphismByImages(G,AlternatingGroup(5),[(2,4)(3,5),(1,2,3)]);;
gap> X_G:=CoveringSpaceFromHomomorphism(phi);;
gap> rho1:=H2AsGModule(X_G);;
gap> chi1:=NaturalCharacter(rho1);
Character( CharacterTable( Alt( [ 1 .. 5 ] ) ), [ 119, -1, -1, -1, -1 ] )
gap> chi2:=PermutationCharacter( AlternatingGroup(5),Group([()])  );
Character( CharacterTable( Alt( [ 1 .. 5 ] ) ), [ 60, 0, 0, 0, 0 ] )
gap> chi=chi1+2*chi2;
true

