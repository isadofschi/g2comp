#############################################################################
##  
##  PackageInfo.g for the package `G2Comp'             Iván Sadofschi Costa
##  
##  
##  
##

SetPackageInfo( rec(

PackageName := "G2Comp",
Subtitle := "G2Comp/Equivariant 2-complexes",
Version := "1.1.0",
Date := "17/06/2020",

PackageWWWHome := "https://github.com/isadofschi/g2comp",

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/isadofschi/", LowercaseString( ~.PackageName ) ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "isadofschi@dm.uba.ar",


ArchiveURL := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),
ArchiveFormats := ".tar.gz",

Persons := [
  rec( 
    LastName      := "Sadofschi Costa",
    FirstNames    := "Iván",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "isadofschi@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~isadofschi",
    PostalAddress := Concatenation( [
                       "Pabellón I - Ciudad Universitaria (1428)\n",
                       "Buenos Aires\n",
                       "Argentina" ] ),
    Place         := "Buenos Aires",
    Institution   := "University of Buenos Aires"
  ),
  
],

Status := "dev",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
  "Equivariant 2-complexes.",

PackageDoc := rec(
  BookName  := "G2Comp",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "G2Comp/Equivariant 2-complexes",
),


Dependencies := rec(

  GAP := "4.8",
  NeededOtherPackages := [ ["GapDoc", "1.5.1"], ["HAP","1.11.13"], ["SONATA", "2.8"] ],
  SuggestedOtherPackages := [],
  ExternalConditions := []
                      
),

AvailabilityTest := ReturnTrue,

BannerString := Concatenation( 
    "─────────────────────────────────────────────────────────────────────────────\n",
    "Loading  G2Comp ", ~.Version, " (Equivariant 2-complexes) \n",
    "by ",
    JoinStringsWithSeparator( List( Filtered( ~.Persons, r -> r.IsAuthor ),
                                    r -> Concatenation(
        r.FirstNames, " ", r.LastName, " (", r.WWWHome, ")\n" ) ), "   " ),
    "For help, type: ?G2Comp \n",
    "─────────────────────────────────────────────────────────────────────────────\n" ),

Keywords := ["package G2Comp", "2-complexes", "action", "equivariant", "G-CW"]

));

