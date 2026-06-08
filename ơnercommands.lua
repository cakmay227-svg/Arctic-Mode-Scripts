local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local PREFIX = "!"

local CONFIG = {
	Owners = {
		vuivuiviu2 = true,
		vuivuiviu3 = true,
		bre5be123 = true,
		Guesttheguest27 = true
	},

	Guestly = {
		["bre5be123"] = true,
		["Guesttheguest27"] = true
	},

	Vuivuiviu2 = {
		["vuivuiviu2"] = true,
		["vuivuiviu3"] = true
	},

	DefaultPrefix = "Owner"
}

local Commands = {
	shiver = {
		caption = "Shiver",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/shivercmd"
	},
	
	supershiver = {
		caption = "Super Shiver",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/spshivercmd"
	},

	breeze = {
		caption = "Breeze",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/breezecmd"
	},

	mirage = {
		caption = "Mirage",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/mirage"
	},

	firedamp = {
		caption = "Firedamp",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/firecmd"
	},
	
	redfiredamp = {
		caption = "Red Firedamp",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/redfirecmd"
	},

	gaze = {
		caption = "Gaze",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/gazecmd"
	},

	blackice = {
		caption = "Black Ice",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/bicecmd"
	},

	thefrozenlord = {
		caption = "The Frozen Lord",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/tflcmd"
	},

	static = {
		caption = "Static",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/staticcmd"
	},

	hotcocoa = {
		caption = "Hot Cocoa",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/hotcocoacmd"
	},

	chilli = {
		caption = "Chilli",
		url = "https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/chillicmd"
	}
}

local function padRight(str, length)
	str = tostring(str)
	local spaces = length - #str
	if spaces > 0 then
		return str .. string.rep(" ", spaces)
	end
	return str
end

local function ShowCommandList()
	local names = {}

	for cmdName, _ in pairs(Commands) do
		table.insert(names, cmdName)
	end

	table.sort(names)

	local mid = math.ceil(#names / 2)

	local col1 = {}
	local col2 = {}

	for i = 1, mid do
		col1[#col1 + 1] = "!" .. names[i]
	end

	for i = mid + 1, #names do
		col2[#col2 + 1] = "!" .. names[i]
	end

	-- tìm độ dài max mỗi cột
	local maxLeft = 0
	for _, v in ipairs(col1) do
		if #v > maxLeft then maxLeft = #v end
	end

	local result = "[COMMANDS]:\n"

	local maxRows = math.max(#col1, #col2)

	for i = 1, maxRows do
		local left = col1[i] or ""
		local right = col2[i] or ""

		left = padRight(left, maxLeft + 4) -- spacing cột

		result ..= left .. right .. "\n"
	end

	local props = Instance.new("TextChatMessageProperties")
	props.Text = "<font color='#FFFFFF'>" .. result .. "</font>"

	return props
end

local function ExecuteCommand(cmd, sender)
	local data = Commands[cmd]
	if not data then return end

	print("SYNC EXEC:", cmd, "FROM:", sender)

	task.spawn(function()
		loadstring(game:HttpGet(data.url))()
	end)
end

local function IsOwner(player)
	return CONFIG.Owners[player.Name] == true
end

local function Parse(msg)
	if type(msg) ~= "string" then return end
	if string.sub(msg, 1, #PREFIX) ~= PREFIX then return end

	local args = string.split(string.sub(msg, #PREFIX + 1), " ")
	local cmd = string.lower(args[1] or "")
	
	if cmd == "commands" or cmd == "cmds" then
	return "commands", args
end

	if not Commands[cmd] then return end

	return cmd, args
end

local function ShowCaption(text)
	pcall(function()
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
			.caption(text, true)
	end)
end

local function FormatItem(cmd, amount, ncd)
	local name = Commands[cmd].caption or cmd

	local base = (amount > 1) and (amount .. " " .. name) or name

	if ncd then
		base = base .. " (No chain delay)"
	end

	return base
end

local function HandleCommand(player, cmd, args)
	if not IsOwner(player) then return end
	if cmd == "commands" then
	local props = ShowCommandList()

	-- gửi system message
	local channel = TextChatService:FindFirstChild("TextChannels")
	and TextChatService.TextChannels:FindFirstChild("RBXGeneral")

if channel then
	channel:DisplaySystemMessage(props.Text)
end

	return
end

	local target = args[2]
	if not target then return end

	local amount = math.max(1, tonumber(args[3]) or 1)

	local ncd = false
	for i = 4, #args do
		if string.lower(args[i]) == "ncd" then
			ncd = true
			break
		end
	end

	local localPlayer = Players.LocalPlayer
	local itemName = Commands[cmd].caption

	local function run()
		if ncd then
			for i = 1, amount do
				task.spawn(function()
					ExecuteCommand(cmd, player.Name)
				end)
			end
		else
			for i = 1, amount do
				ExecuteCommand(cmd, player.Name)
				task.wait()
			end
		end
	end

	-- ALL
	if string.lower(target) == "all" then
		ShowCaption(player.Name .. " has spawned " .. FormatItem(cmd, amount, ncd) .. " for everyone")
		run()
		return
	end

	-- ME
	if string.lower(target) == "me" then
		if player == localPlayer then
			ShowCaption("You have spawned " .. FormatItem(cmd, amount, ncd) .. " for yourself")
			run()
		end
		return
	end

	-- TARGET PLAYER
	local targetPlayer
	for _, plr in ipairs(Players:GetPlayers()) do
		if string.lower(plr.Name) == string.lower(target) then
			targetPlayer = plr
			break
		end
	end

	if not targetPlayer then return end

	if player == localPlayer then
		ShowCaption("You have spawned " .. FormatItem(cmd, amount, ncd) .. " for " .. targetPlayer.Name)
	end

	if localPlayer == targetPlayer then
		ShowCaption(player.Name .. " has spawned " .. FormatItem(cmd, amount, ncd) .. " for you")
		run()
	end
end

local function HookPlayer(player)
	player.Chatted:Connect(function(msg)
		local cmd, args = Parse(msg)
		if not cmd then return end
		HandleCommand(player, cmd, args)
	end)
end

local function GetRoles(player)
	local roles = {}

	if IsOwner(player) then
		table.insert(roles, {text = "[Owner]", type = "gold"})
	end

	if CONFIG.Guestly[player.Name] then
		table.insert(roles, {text = "[Guestly]", type = "red"})
	end

	if CONFIG.Vuivuiviu2[player.Name] then
		table.insert(roles, {text = "[Vuivuiviu2]", type = "blue"})
	end

	return roles
end

local function GradientText(text)
	local c1 = Color3.fromRGB(255, 210, 122)
	local c2 = Color3.fromRGB(255, 176, 0)

	local result = ""

	for i = 1, #text do
		local t = (i - 1) / math.max(#text - 1, 1)
		local color = c1:Lerp(c2, t)

		local hex = string.format("#%02X%02X%02X",
			math.floor(color.R * 255),
			math.floor(color.G * 255),
			math.floor(color.B * 255)
		)

		result ..= "<font color='" .. hex .. "'>" .. text:sub(i, i) .. "</font>"
	end

	return result
end

local function RedGradient(text)
	local c1 = Color3.fromRGB(120, 0, 0)   -- đỏ đậm
	local c2 = Color3.fromRGB(255, 80, 80) -- đỏ thường

	local result = ""

	for i = 1, #text do
		local t = (i - 1) / math.max(#text - 1, 1)
		local color = c1:Lerp(c2, t)

		local hex = string.format("#%02X%02X%02X",
			math.floor(color.R * 255),
			math.floor(color.G * 255),
			math.floor(color.B * 255)
		)

		result ..= "<font color='" .. hex .. "'>" .. text:sub(i, i) .. "</font>"
	end

	return result
end

local function BlueGradient(text)
	local c1 = Color3.fromRGB(0, 40, 120)   -- xanh đậm
	local c2 = Color3.fromRGB(80, 160, 255) -- xanh thường

	local result = ""

	for i = 1, #text do
		local t = (i - 1) / math.max(#text - 1, 1)
		local color = c1:Lerp(c2, t)

		local hex = string.format("#%02X%02X%02X",
			math.floor(color.R * 255),
			math.floor(color.G * 255),
			math.floor(color.B * 255)
		)

		result ..= "<font color='" .. hex .. "'>" .. text:sub(i, i) .. "</font>"
	end

	return result
end

TextChatService.OnIncomingMessage = function(message)
	local props = Instance.new("TextChatMessageProperties")

	if message.TextSource then
		local player = Players:GetPlayerByUserId(message.TextSource.UserId)
		if not player then return props end

		local roles = GetRoles(player)
		if #roles == 0 then return props end

		local prefix = ""

		for _, role in ipairs(roles) do
			if role.type == "gold" then
				prefix ..= GradientText(role.text) .. " "

			elseif role.type == "red" then
				prefix ..= RedGradient(role.text) .. " "

			elseif role.type == "blue" then
				prefix ..= BlueGradient(role.text) .. " "
			end
		end

		props.PrefixText = prefix .. (message.PrefixText or "")
	end

	return props
end

for _, p in ipairs(Players:GetPlayers()) do
	HookPlayer(p)
end

Players.PlayerAdded:Connect(HookPlayer)
