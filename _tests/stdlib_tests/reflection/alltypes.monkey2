
'Ok, not quite *all* types, but getting there...
'
#Import "<stdlib>"
#Import "<mojo>"
#Import "<mojox>"
#Import "<mojo3d>"

#Reflect stdlib..
#Reflect mojo..
#Reflect mojox..
#Reflect mojo3d..

Function Main()
	
	'This is all reflection.DebugTypes really does-ish...
	'
	
	stdlib.reflection.DebugTypes()
	
'	For Local type:=Eachin TypeInfo.GetTypes()
		
'		Print type
		
'		For Local decl:=Eachin type.GetDecls()
			
'			Print " "+decl
'		Next
		
'		Print ""
'	End
	
	Print "Done!"

End
