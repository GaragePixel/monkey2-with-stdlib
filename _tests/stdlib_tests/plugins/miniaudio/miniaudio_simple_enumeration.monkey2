
#Import "<stdlib>"

'iDkP from GaragePixel:
'	Each time I want to run the test, I need to clean the old build
'	or a fatal mx2cc error will comes out. But it's maybe only
'	a false positive.

Using stdlib.plugins.libc
Using stdlib.plugins.miniaudio

Function Main()
	Local result:ma_result
	Local context:ma_context
	Local playbackDeviceInfos:ma_device_info ptr
	Local playbackDeviceCount:ma_uint32
	Local captureDeviceInfos:ma_device_info ptr
	Local captureDeviceCount:ma_uint32
	
	If ma_context_init( Null, 0, Null, Varptr( context ) ) <> MA_SUCCESS
		Print "Failed to initialize context"
		libc.exit_(-2)
	End
	
	result = ma_context_get_devices( Varptr( context ), Varptr( playbackDeviceInfos ), Varptr( playbackDeviceCount ), Varptr( captureDeviceInfos ), Varptr( captureDeviceCount ) )
    If result <> MA_SUCCESS
        Print "Failed to retrieve device information.\n"
        libc.exit_(-3)
    End

    Print "Playback Devices\n"
    For Local iDevice:= 0 Until playbackDeviceCount
        Print "    "+iDevice + ": " + String.FromCString(playbackDeviceInfos[iDevice].name)
    End


    Print "Capture Devices\n"
    For Local iDevice:= 0 Until captureDeviceCount
        Print "    " + iDevice + ": " + String.FromCString(captureDeviceInfos[iDevice].name)
    End


    ma_context_uninit(Varptr( context ) )
End