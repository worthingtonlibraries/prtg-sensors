# PRTG Sensors
Custom sensors and lookups for PRTG Network Monitor

## Statuspage.io
#### check-statuspage.ps1 & lookup-statuspage.ovl
Sensor to check the status of any statuspage.io page and create channels for each object. 

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
