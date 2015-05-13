module("luci.controller.hopcloud", package.seeall)

sys = require "luci.sys"
ut = require "luci.util"

function index()
	if not nixio.fs.access("/etc/config/hopcloud") then
		return
	end
	entry({"admin", "hopcloud"},
		alias("admin", "hopcloud", "configuration"),
		_("HopCloud"), 89)
	
	entry({"admin", "hopcloud", "configuration"},
        cbi("hopcloud"), "Set Up", 30).dependent = false
end
