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
Version := "1.0.1",
Date := "5/09/2018",

PackageWWWHome :=
  Concatenation( "https://github.com/isadofschi/g2comp" ),

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/isadofschi/", LowercaseString( ~.PackageName ) ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "isadofschi@dm.uba.ar",

#ArchiveURL := Concatenation( ~.SourceRepository.URL,
#                                 "/releases/download/v", ~.Version,
#                                 "/", ~.PackageName, "-", ~.Version ),

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

##  Here is the information on the help books of the package, used for
##  loading into GAP's online help and maybe for an online copy of the 
##  documentation on the GAP website.
##  
##  For the online help the following is needed:
##       - the name of the book (.BookName)
##       - a long title, shown by ?books (.LongTitle, optional)
##       - the path to the manual.six file for this book (.SixFile)
##  
##  For an online version on a Web page further entries are needed, 
##  if possible, provide an HTML- and a PDF-version:
##      - if there is an HTML-version the path to the start file,
##        relative to the package home directory (.HTMLStart)
##      - if there is a PDF-version the path to the .pdf-file,
##        relative to the package home directory (.PDFFile)
##      - give the paths to the files inside your package directory
##        which are needed for the online manual (as a list 
##        .ArchiveURLSubset of names of directories and/or files which 
##        should be copied from your package archive, given in .ArchiveURL 
##        above (in most cases, ["doc"] or ["doc","htm"] suffices).
##  
##  For links to other GAP or package manuals you can assume a relative 
##  position of the files as in a standard GAP installation.
##  
# in case of several help books give a list of such records here:
PackageDoc := rec(
  # use same as in GAP            
  BookName  := "G2Comp",
  # format/extension can be one of .tar.gz, .tar.bz2, -win.zip, .zip.
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile   := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  # LongTitle := "Elementary Divisors of Integer Matrices",
  LongTitle := "G2Comp/Equivariant 2-complexes",
),


Dependencies := rec(

  GAP := "4.8",
  NeededOtherPackages := [ ["HAP","1.11.13"], ["SONATA", "2.8"] ],
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

