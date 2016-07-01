#pragma rtGlobals=3		// Use modern global access method and strict wave access.
//Author: Annalisa Scimemi

//Remove_Value: 
//This Macro allows the user to remove the "inf" values from the txt output waves generated by M-Track
Macro Remove_Value(wn, value)
	Prompt wn, "Source wave name"
	Prompt value, "Value to remove from source wave"
	String wn = "LeftY"
	Variable value=inf
	
	variable i=0, npnts
	Wavestats/Q $wn
	npnts=V_npnts
	do
		if($wn[i]==value)
			$wn[i]=NaN
		endif
	i+=1
	while(i<npnts)
EndMacro

//Measure_Displacement: 
//This Macro is used to measure the frame to frame displacement in each txt output wave generated by M-Track
Macro Measure_Displacement(wn, dest_wn)
	Prompt wn, "Source wave name"
	Prompt dest_wn, "Destination wave name"
	String wn = "LeftY", dest_wn="test"
	
	variable i=0, npnts
	Wavestats/Q $wn
	npnts=V_npnts
	Duplicate/O $wn, $dest_wn
	do
		$dest_wn[i]=$wn[i]-$wn[i-1]
		i+=1
	while(i<npnts)
EndMacro
