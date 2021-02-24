param (
$IP = "",
$OID = "1.3.6.1.2.1.25.4.2.1.2",
$Community = "",
$process = ""
)

if (!(Get-Module snmp)) {Install-Module snmp -force}

$snmp = Invoke-SnmpWalk -IP $IP -OIDStart $OID -Community $Community

 if ($snmp.data -contains $process) {
	write-host "1:OK" 
 	exit(0)
 } else {
	write-host "0:Error" 
	exit(4)
 }  
