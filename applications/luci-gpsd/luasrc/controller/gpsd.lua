--[[
LuCI - Lua Configuration Interface

Copyright 2012 Eric S. Raymond <esr@thyrsus.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

module("luci.controller.gpsd", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/gpsd") then
		return
	end

	entry({"admin", "services", "gpsd"}, alias("admin", "services", "gpsd", "config"), _("Polipo")).i18n = "gpsd"
	entry({"admin", "services", "gpsd", "status"}, template("gpsd_status"), _("Status"))
	entry({"admin", "services", "gpsd", "config"}, cbi("gpsd"), _("Configuration"))
end

