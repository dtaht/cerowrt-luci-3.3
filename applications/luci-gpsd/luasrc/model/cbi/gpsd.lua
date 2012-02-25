--[[
LuCI - Lua Configuration Interface

Copyright 2012 Eric S. Raymond <esr@thyrsus.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

]]--

m = Map("gpsd", translate("GPSD"),
	translate("GPSD is an interface to many common gpsd devices"))

-- General section
s = m:section(NamedSection, "general", "gpsd", translate("GPSD"))

s:tab("general", translate("General Settings"))
s:tab("logging", translate("Log Settings"))
s:tab("status",  translate("Status"))

-- General settings
s:taboption("general", Flag, "enabled", translate("enable"))

o = s:taboption("general", Value, "address", translate("Listen address"),
	translate("The interface on which GPSD will listen. To listen on all " ..
		"interfaces use 0.0.0.0 or :: (IPv6)."))

o.placeholder = "0.0.0.0"
o.datatype = "ipaddr"


o = s:taboption("general", Value, "port", translate("Listen port"),
	translate("Port on which GPSD will listen"))

o.optional = true
o.placeholder = "2947"
o.datatype = "port"


o = s:taboption("general", DynamicList, "allowedClients",
	translate("Allowed clients"),
	translate("When listen address is set to 0.0.0.0 or :: (IPv6), you must " ..
		"list clients that are allowed to connect. The format is IP address " ..
		"or network address (192.168.1.123, 192.168.1.0/24, " ..
		"2001:660:116::/48 (IPv6))"))

o.datatype = "ipaddr"
o.placeholder = "0.0.0.0/0"

-- Logging
s:taboption("logging", Flag, "logSyslog", translate("Log to syslog"))

s:taboption("logging", Value, "logFacility",
	translate("Syslog facility")):depends("logSyslog", "1")


v = s:taboption("logging", Value, "logFile",
	translate("Log file location"),
	translate("Use of external storage device is recommended, because the " ..
		"log file is written frequently and can grow considerably."))

v:depends("logSyslog", "")
v.rmempty = true

return m
