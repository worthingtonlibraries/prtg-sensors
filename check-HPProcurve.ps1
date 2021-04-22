param (
$IP = "1.1.1.1", 
$Community = "public"
)

Install-Module -Name SNMP

$CurrentTemp = (Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.1.2.8.1.1.3.0 -Community $Community).Data -replace "C",""
$CPULoad = (Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.5.1.9.6.1.0 -Community $Community).Data

$FreeMemory = ([Math]::Round(((Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.5.1.1.2.1.1.1.6.1 -Community $Community).Data / (1024*1024)), 2))
$FanState = (Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.1.2.6.1.4.1 -Community $Community).Data
$PrimaryPowerSupplyState = (Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.1.2.6.1.4.2 -Community $Community).Data
$SecondaryPowerSupplyState = (Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.1.2.6.1.4.3 -Community $Community).Data
$TempState = (Get-SnmpData -IP $IP -OID 1.3.6.1.4.1.11.2.14.11.1.2.6.1.4.4 -Community $Community).Data

$TotalPowerSupply1 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.2.1 -Community $Community).Data
$TotalPowerSupply2 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.2.2 -Community $Community).Data
$TotalPowerSupply3 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.2.3 -Community $Community).Data
$TotalPowerSupply4 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.2.4 -Community $Community).Data

Write-Host @"
<prtg>
	<result>
		<channel>Current Temperature</channel>
		<value>$CurrentTemp</value>
    </result>
	<result>
		<channel>CPU Load</channel>
		<value>$CPULoad</value>
    </result>
	<result>
		<channel>Free Memory</channel>
		<value>$FreeMemory</value>
        <float>1</float>
    </result>
	<result>
		<channel>Fan State</channel>
		<value>$FanState</value>
    </result>
	<result>
		<channel>Primary Power Supply</channel>
		<value>$PrimaryPowerSupplyState</value>
    </result>
	<result>
		<channel>Secondary Power Supply</channel>
		<value>$SecondaryPowerSupplyState</value>
    </result>
	<result>
		<channel>Temperature State</channel>
		<value>$TempState</value>
    </result>
"@

if ($TotalPowerSupply1 -ne "NoSuchInstance") {$CurrentPowerSupply1 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.4.1 -Community $Community).Data

Write-Host @"
	<result>
		<channel>Power Supply 1 PoE</channel>
		<value>$CurrentPowerSupply1</value>
    </result>
"@

}

if ($TotalPowerSupply2 -ne "NoSuchInstance") {$CurrentPowerSupply2 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.4.2 -Community $Community).Data

Write-Host @"
	<result>
		<channel>Power Supply 2 PoE</channel>
		<value>$CurrentPowerSupply2</value>
    </result>
"@


}
if ($TotalPowerSupply3 -ne "NoSuchInstance") {$CurrentPowerSupply3 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.4.3 -Community $Community).Data

Write-Host @"
	<result>
		<channel>Power Supply 3 PoE</channel>
		<value>$CurrentPowerSupply3</value>
    </result>
"@


}
if ($TotalPowerSupply4 -ne "NoSuchInstance") {$CurrentPowerSupply4 = (Get-SnmpData -IP $IP -OID 1.3.6.1.2.1.105.1.3.1.1.4.4 -Community $Community).Data

Write-Host @"
	<result>
		<channel>Power Supply 4 PoE</channel>
		<value>$CurrentPowerSupply4</value>
    </result>
"@


}

Write-Host @"
</prtg>
"@
