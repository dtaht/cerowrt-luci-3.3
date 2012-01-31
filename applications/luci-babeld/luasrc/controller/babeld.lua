--[[
LuCI - Lua Configuration Interface

Copyright 2010 Jo-Philipp Wich <xm@subsignal.org>
Copyright 2012 Dave Täht <dave.taht@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

module("luci.controller.babeld", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/babeld") then
		return
	end

	entry({"admin", "network", "babeld"}, cbi("babeld"), _("Babeld"), 61).i18n = "babeld"
	entry({"admin", "network", "babeld", "interface"}, cbi("babeld/interface"), nil).leaf = true
	entry({"admin", "network", "babeld", "prefix"}, cbi("babeld/prefix"), nil).leaf = true
	entry({"admin", "network", "babeld", "route"}, cbi("babeld/route"), nil).leaf = true
	entry({"admin", "network", "babeld", "rdnss"}, cbi("babeld/rdnss"), nil).leaf = true
	entry({"admin", "network", "babeld", "dnssl"}, cbi("babeld/dnssl"), nil).leaf = true
end
