#Import "<stdlib>"

'iDkP from GaragePixel:
'	Each time I want to run the test, I need to clean the old build
'	or a fatal mx2cc error will comes out. But it's maybe only
'	a false positive.

Using stdlib.plugins.miniaudio

Const DEVICE_CHANNELS:Int = 2
Const DEVICE_SAMPLE_RATE:Int = 48000

Function data_callback(pDevice:ma_device Ptr, pOutput:Void Ptr, pInput:ConstVoid Ptr, frameCount:ma_uint32)
	Local pSineWave:ma_waveform Ptr
	If pDevice->playback.channels = DEVICE_CHANNELS
		pSineWave = Cast<ma_waveform Ptr>(pDevice->pUserData)
		If pSineWave ma_waveform_read_pcm_frames(pSineWave, pOutput, frameCount)
	End
End

Function Main()
	Local sineWave:ma_waveform
	Local deviceConfig:ma_device_config
	Local device:ma_device
	Local sineWaveConfig:ma_waveform_config

	sineWaveConfig = ma_waveform_config_init(ma_format_f32, DEVICE_CHANNELS, DEVICE_SAMPLE_RATE, ma_waveform_type_sine, 0.2, 220)
	ma_waveform_init( Varptr( sineWaveConfig ), Varptr( sineWave ) )

	deviceConfig = ma_device_config_init( ma_device_type_playback )
	deviceConfig.playback.format	= ma_format_f32
	deviceConfig.playback.channels = DEVICE_CHANNELS
	deviceConfig.sampleRate		= DEVICE_SAMPLE_RATE
	deviceConfig.dataCallback		= data_callback
	deviceConfig.pUserData			= Varptr( sineWave )

	If ma_device_init(Null, Varptr( deviceConfig ), Varptr( device )) <> MA_SUCCESS
		Print("Failed to open playback device.")
		Return
	End

	Print( "Device Name: " + String.FromCString( device.playback.name ) )

	If ma_device_start( Varptr( device ) ) <> MA_SUCCESS
		Print("Failed to start playback device.")
		ma_device_uninit( Varptr( device ) )
		Return
	End
	
	stdlib.system.time.Sleep(5.0)
	'Print("Press Enter to quit...")
	'Input()
	
	ma_device_uninit( Varptr( device ) )
End