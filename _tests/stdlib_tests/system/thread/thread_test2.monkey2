
Namespace threadtest2

#Import "<stdlib>"
#Import "<mojo>"

#Import "threads.jpg"

Using stdlib..
Using mojo..

#rem 

	This test cannot passes because the types wanted by mojo
	must be the type declared in std, not in stdlib. Thus, all programs using
	mojo, mojo3d and mojox cannot work with the stdlib at the moment until these
	later module are forked.

#end 

Class MyWindow Extends Window
	
	Field _image:Image
	
	Field _progress:Int

	Method New( title:String="Simple mojo app",width:Int=640,height:Int=480,flags:WindowFlags=Null )

		Super.New( title,width,height,flags )
		
		'Create our loading thread.
		New Thread( Lambda()
		
			For Local i:=0 Until 1000
				
				Local image:=Image.Load( "asset::threads.jpg" )
				
				'Update progress %
				_progress=i*100/1000
			Next

			Local image:=Image.Load( "asset::threads.jpg" )
			
			image.Handle=New Vec2f( .5,.5 )
			
			_image=image
			
		End ).Detach()
	End

	Method OnRender( canvas:Canvas ) Override
	
		App.RequestRender()
		
		If Not _image
			canvas.DrawText( "Loading...progress "+_progress+"%",Width/2,Height/2,.5,.5 )
			Return
		Endif
		
		canvas.DrawImage( _image,Mouse.Location )
	End
	
End

Function Main()

	New AppInstance
	
	New MyWindow
	
	App.Run()
End
