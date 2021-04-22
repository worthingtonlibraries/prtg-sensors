# PRTG Sensors
Custom sensors and lookups for [PRTG Network Monitor](https://www.paessler.com/prtg)

## Statuspage.io
#### check-statuspage.ps1 & lookup-statuspage.ovl
Sensor to check the status of any [statuspage.io](https://www.atlassian.com/software/statuspage) page and create channels for each object. 

Parameters
* ID - ID of the statuspage to monitor. ID can be found by visiting the statuspage.io URL + /API, see below for examples.

Some sample pages/IDs:

* **[Wasabi](https://status.wasabi.com/)** 2r1tdgqr8ld5
* **[Bridge](http://status.bridgeapp.com/)** tcylbbyggms8
* **[Zoom](https://status.zoom.us/)** 14qjgk812kgk
* **[AppRiver](https://status.appriver.com/)** zfhpg8k0c3wq
* **[Cloudflare](https://www.cloudflarestatus.com/)** yh6f0r4529hb

## Postmark
#### check-postmark.ps1 & lookup-postmark.ovl
Sensor to check the status of [Postmark](https://status.postmarkapp.com/), a transactional e-mail delivery service. 


## SNMP Windows Process
#### check-snmpprocess.ps1 & lookup-snmpprocess.ovl
Sensor to check if a given process is running in Windows, using SNMP compared to the built-in sensor that uses WMI.

Parameters
* IP - the IP address of the target. Useful with %host placeholder.
* OID - the OID start for all Windows processes. Static at "1.3.6.1.2.1.25.4.2.1.2".
* Community - community string of the target.
* Process - process name to monitor.


## HP ProCurve
#### check-HPProcurve.ps1
Sensor to monitor status/health of an HP ProCurve network switch. Uses lookup provided & inspired by PRTG in their [official sensor](https://kb.paessler.com/en/topic/73833), but adds PoE wattage monitoring. Checks if there is a "total" power supply size for up to 4 power supplies and displays their usage accordingly. Set your own limits based on total power supply size. 1 switch with 1 power supply, 1 switch with redundant power supplies, 2-4 switches (in a stack) with 1 power supply each, 2 switches (in a stack) with redundant power supplies. 

Parameters
* IP - the IP address of the target. Useful with %host placeholder.
* Community - community string of the target.
