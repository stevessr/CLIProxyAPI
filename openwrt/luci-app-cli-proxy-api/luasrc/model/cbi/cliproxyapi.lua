-- Copyright (C) 2024 OpenWrt.org
-- Licensed under MIT License

local m, s, o

m = Map("cliproxyapi", translate("CLI Proxy API"), 
	translate("A proxy server that provides OpenAI/Gemini/Claude/Codex compatible API interfaces for CLI models. " ..
		"Supports OAuth login for OpenAI Codex, Claude Code, Qwen Code, and iFlow with multi-account management."))

m:section(SimpleSection).template = "cliproxyapi_status"

s = m:section(TypedSection, "cliproxyapi", translate("General Settings"))
s.anonymous = true
s.addremove = false

o = s:option(Flag, "enabled", translate("Enable"))
o.default = 0
o.rmempty = false

o = s:option(Value, "port", translate("Port"))
o.datatype = "port"
o.default = 8317
o.placeholder = 8317

o = s:option(Value, "host", translate("Listen Address"))
o.datatype = "ipaddr"
o.default = "0.0.0.0"
o.placeholder = "0.0.0.0"
o:value("0.0.0.0", translate("All Interfaces"))
o:value("127.0.0.1", translate("Localhost Only"))

o = s:option(Flag, "debug", translate("Debug Mode"))
o.default = 0
o.rmempty = false

o = s:option(Value, "log_file", translate("Log File"))
o.default = "/var/log/cli-proxy-api.log"
o.placeholder = "/var/log/cli-proxy-api.log"

o = s:option(Value, "auth_dir", translate("Authentication Directory"))
o.default = "/var/lib/cli-proxy-api"
o.placeholder = "/var/lib/cli-proxy-api"

o = s:option(Value, "config_file", translate("Configuration File"))
o.default = "/etc/cli-proxy-api/config.yaml"
o.placeholder = "/etc/cli-proxy-api/config.yaml"

o = s:option(DummyValue, "_info", translate("Additional Information"))
o.rawhtml = true
o.template = "cliproxyapi_info"

return m
