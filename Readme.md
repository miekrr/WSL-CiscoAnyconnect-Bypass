
# Restore WSL network connection

 This repository is used to restore conectivity to WSL when a VPN connection is made using Cisco AnyConnect.

## How to install 

The PowerShell script can be run every time a connection is needed, or just use the Windows Task Scheduler to run it automatically every time a successful connection is made.

1. Edit **VPN-Connect-successful.xml** and replace the command with the location of script path.
```
    <Exec>
      <Command>C:\dev\WSL-CiscoAnyconnect-Bypass\WSL-route-bypass.ps1</Command>
    </Exec>
```
2. Import the XML task using Windows Task Scheduler
```
Task Scheduler > Action > Import Task.. <Select VPN-Connect-successful.xml>
```

## History / details

Cisco AnyConnect can now force route rewrite so any route changes will be voided.
New workaround is to change the interface metric.

### Event Viewer details
Cisco AnyConnect is being notified of routing table change as seen in the Event Viewer:

```
A routing table change notification has been received.  Starting automatic correction of the routing table.
```

And then:

```
Automatic correction of the routing table has been successful.
```

## Notes

There while be a couple of seconds of downtime when you login. PowerShell takes a while to run the script.