$url_services = "https://status.postmarkapp.com/api/1.0/services"
$url_status = "https://status.postmarkapp.com/api/1.0/status"

$status = ((curl $url_status -UseBasicParsing).Content | ConvertFrom-Json)

$text = "Overall status is $($status.status) as of $([datetime]$($status.lastCheckDate) -f "a")"

$components = ((curl $url_services -UseBasicParsing).Content | ConvertFrom-Json)

Write-Output "<prtg>"

foreach ($component in $components) {

switch ($($component.status)) {
"UP" {$statusvalue = 0}
"MAINTENANCE" {$statusvalue = 1} 
"DELAY" {$statusvalue = 2}
"DEGRADED" {$statusvalue = 3}
"DOWN" {$statusvalue = 4}
default {$statusvalue = 5}
}

write-output @"
<result>
	<channel>$($component.name)</channel>
	<value>$statusvalue</value>
</result>

"@
}

Write-Output @"

<text>$text</text>
</prtg>

"@