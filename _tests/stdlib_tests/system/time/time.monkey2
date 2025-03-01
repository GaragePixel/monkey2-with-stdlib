
#Import "<stdlib>"

Using stdlib..

Function Main()
	
	Local now:=stdlib.system.time.Time.Now()
	Local oneWeek:=New TimeSpan( 7,0,0,0,0 )
	Local nextWeek:=now+oneWeek
	
	Print "now:~n"+now
	Print "~nnow:~n"+Time.Parse( Time.Now() )
	Print "~none week:~n"+oneWeek
	Print "~none week:~n"+(nextWeek-now)
	Print "~nnext week:~n"+nextWeek
	Print "~n14/6/2018:~n"+Time.Parse( "14/6/2018" )
End
