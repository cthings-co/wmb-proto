# Protocol versions

Version 2 adds `CMD_NETWORK_RESET` (command ID 8). Command IDs 1–7 and
their payloads retain the version-1 layout. CRC-16/DDS-110 still covers the
serialized message and is appended most-significant byte first.

`CMD_NETWORK_RESET` requires message version 2 and an `EmptyFrame` command
payload. The device replies with the existing ACK/NACK answer format. An ACK
means the request was accepted, not that erasure or commissioning has finished.
Only after transmitting the ACK does the device stop its radio, issue the
standard radio factory-reset request, and restart the host. A lost ACK must not
be interpreted as proof that no reset occurred.

The reset clears **all radio settings**, including network keys, address,
channel, role, node address and access locks. It retains host application
settings, including Modbus ports, periodic jobs, application role and antenna
selection. A compatible radio application rearms Open Join after factory reset.
The device leaves its previous network; its commissioned node address may change.
Further commands require a working commissioning proxy and the new address.

Version-2 firmware continues to accept version-1 commands 1–7 and uses the
request version for their direct replies. Version 1 must not use command 8.
Unsolicited telemetry uses the firmware's configured protocol version.
Older firmware may require version 1 explicitly; version selection is not
automatically negotiated.
