
'Note: ZipFile is VERY WIP!
'
#Import "<stdlib>"

#Import "blah.zip@/"

Using stdlib..

Function Main()

	Local zip:=ZipFile.Open( "asset::blah.zip" )
	
	For Local file:=Eachin zip.Files
		Print file
	Next
	
	Local str:=zip.ExtractData( "geom/affinemat3.monkey2" ).PeekString( 0 )
	
	Print str
	
	zip.Close()

End
