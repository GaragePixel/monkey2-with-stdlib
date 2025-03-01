#Import "<stdlib>"
#Import "<sdklib_mojo>"

Using stdlib..
Using sdklib_mojo..

Const WIDTH:Int = 640
Const HEIGHT:Int = 400

Class MyWindow Extends Window
    
    Field showFPS:Bool=True
    Field t:Float
    Field dt:DeltaTimer
    
    '-----------------------------------------------------------------------------------------------------------
    Method New(title:String, width:Int, height:Int, flags:WindowFlags=Null)
        Super.New(title,width,height,flags)
        ClearColor=Color.Black
        SwapInterval=0
        dt= New DeltaTimer(100)
    End Method  
    '-----------------------------------------------------------------------------------------------------------
    Method OnRender( canvas:Canvas ) Override
        App.RequestRender()
        
        If Keyboard.KeyReleased(Key.Escape) App.Terminate()
            
        dt.UpdateDelta()
        t+=dt.delta
        
        If showFPS canvas.DrawText( App.FPS,10,10 )
	    canvas.DrawText( t,10,30 )
        
    End
End
Function Main()

    New AppInstance
    
    New MyWindow("Deltatimer Hello World",WIDTH, HEIGHT, WindowFlags.Resizable)
    App.Run()
    
End