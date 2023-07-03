-- VoidOS Development (Startup.lua)

os.pullEvent = os.pullEventraw

local w, h = term.getSize()


-- Print Centered Function
function printCentered(y, s)
	local x = math.floor((w - string.len(s)) / 2)
	term.setCursorPos(x, y)
	term.clearLine()
	term.write(s)
end

local nOption = 1


-- Draw menu Function
local function drawMenu()
	term.clear()
	term.setCursorPos(1, 1)
	term.write("VoidOS")

	term.setCursorPos(w - 11, 1)
	if nOption == 1 then
		term.write("Command")
	elseif nOption == 2 then
		term.write("Chat")
	end
end


--GUI
term.clear()
local function drawFrontend()
	printCentered(math.floor(h/2) - 3, "")
	printCentered(math.floor(h/2) - 2, "Start Menu")
	printCentered(math.floor(h/2) - 1, "")
	printCentered(math.floor(h/2) + 0, ((nOption == 1) and "[ Chat      ]") or "Chat    ")
	printCentered(math.floor(h/2) + 1, ((nOption == 2) and "[ Shutdown  ]") or "Shutdown")
end


-- Display
drawMenu()
drawFrontend()


while true do
	local e, p = os.pullEvent()
	if e == "key" then
		local key = p
		if key == 17 or key == 200 then
			if nOption > 1 then
				nOption = nOption - 1
				drawMenu()
				drawFrontend()
			end
		elseif key == 31 or key == 208 then
			if nOption < 2 then
				nOption = nOption + 1
				drawMenu()
				drawFrontend()
			end
		elseif key == 28 then
			break
		end
	end
end
end
term.clear()


-- Conditions
if nOption == 1 then
	shell.run("os/.chat")
else
  os.shutdown()
end
