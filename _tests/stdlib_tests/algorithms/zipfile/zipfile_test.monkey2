
#Import "assets/test_zip.zip"

#Import "<stdlib>"

Using stdlib..

Function Main()

	Local zip:=ZipFile.Open( "asset::test_zip.zip" )
	
	For Local file:=Eachin zip.Files
		Print file
	Next
	
	If Not zip.Extract( DesktopDir() ) Print "Failed to extract ZIP"
	
	zip.Close()
	
End

