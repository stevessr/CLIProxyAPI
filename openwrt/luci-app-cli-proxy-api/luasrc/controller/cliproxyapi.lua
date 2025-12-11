-- Copyright (C) 2024 OpenWrt.org
-- Licensed under MIT License

-- Note: module() with package.seeall is deprecated in modern Lua but still
-- widely used in OpenWrt LuCI packages for compatibility
module("luci.controller.cliproxyapi", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/cliproxyapi") then
		return
	end

	entry({"admin", "services", "cliproxyapi"}, 
		cbi("cliproxyapi"), 
		_("CLI Proxy API"), 
		60).dependent = true
	
	entry({"admin", "services", "cliproxyapi", "status"}, 
		call("act_status")).leaf = true
end

function act_status()
	local e = {}
	e.running = luci.sys.call("/etc/init.d/cli-proxy-api status >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end
