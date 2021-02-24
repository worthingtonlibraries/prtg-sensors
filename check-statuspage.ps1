param (
$statuspage
)

$text = ((curl https://$statuspage.statuspage.io/api/v2/status.json -UseBasicParsing).Content | ConvertFrom-Json).status | Select-Object -ExpandProperty description

$components = ((curl https://$statuspage.statuspage.io/api/v2/components.json -UseBasicParsing).Content | ConvertFrom-Json).components

Write-Output "<prtg>"

foreach ($component in $components) {

switch ($($component.status)) {
"operational" {$statusvalue = 0}
"partial_outage" {$statusvalue = 1} 
"major_outage" {$statusvalue = 2}
"degraded_performance" {$statusvalue = 3}
"under_maintenance" {$statusvalue = 4}
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
