m = Map("hopcloud", translate("HopCloud Setup"),
                translate("If you have a HopCloud account, you can configure your device \
                to be managed centrally from the HopCloud portal. To create an account  \
                and obtain device key please visit <a href='http://hopbox.in' target=_new>http://hopbox.in</a>"))

local s

s = m:section(TypedSection, "hopcloud", "Enter your Account ID and Device Key here")
s.addremove = false

s:option(Value, "account", "Your HopCloud Account ID") -- Text box to enter HopCloud Account
s:option(Value, "device", "Device Key for This Device") -- Text box to enter HopCloud Device Key

return m -- return the map
