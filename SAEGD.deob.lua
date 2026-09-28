local str = "v202"
;(typeof(getgenv) == "function" and getgenv() or _G)["\0quantum_guard"] = { Ask = function(arg)
	if type(arg) ~= "string" or arg ~= str then
		return nil
	end
	return "b7Q2xL9pD4mT8kR3vZ6nH1sC5wY0jF7aE2gU4iO9qM3xB8dN6tK1rV5hL0yP7zW4"
end }
