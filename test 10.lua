game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("<font color='#7efcff'>[Arctic Mode]: Script Succesfully Executed/Loaded.</font>")
game.Players.LocalPlayer.PlayerGui.MainUI.Jumpscare.Jumpscare_Rush.ImageLabel.Image = "rbxassetid://115415255329114"
game.Players.LocalPlayer.PlayerGui.MainUI.Jumpscare.Jumpscare_Rush.ImageLabelBig.Image = "rbxassetid://115415255329114"

--// AUTO CLONE PATHFINDNODES SYSTEM

local roomsFolder = workspace:WaitForChild("CurrentRooms")

local SavedClones = {}

local function clonePath(room)
    if SavedClones[room] then return end

    local nodes = room:FindFirstChild("PathfindNodes")
    if not nodes then return end

    local clone = nodes:Clone()
    clone.Name = "PathfindNodes"
    clone.Parent = room -- hoÄ‚Â¡Ã‚ÂºÃ‚Â·c ReplicatedStorage nÄ‚Â¡Ã‚ÂºÃ‚Â¿u thÄ‚Æ’Ã‚Â­ch

    SavedClones[room] = clone
end

local function removeClone(room)
    if SavedClones[room] then
        SavedClones[room]:Destroy()
        SavedClones[room] = nil
    end
end

-- Ä‚Â°Ã…Â¸Ã¢â‚¬ÂÃ‚Â¥ CHECK CÄ‚Â¡Ã‚Â»Ã‚Â°C NHANH (Heartbeat level)
game:GetService("RunService").Heartbeat:Connect(function()
    for _, room in ipairs(roomsFolder:GetChildren()) do
        if not SavedClones[room] then
            clonePath(room)
        end
    end
end)

-- dÄ‚Â¡Ã‚Â»Ã‚Ân clone nÄ‚Â¡Ã‚ÂºÃ‚Â¿u room bÄ‚Â¡Ã‚Â»Ã¢â‚¬Â¹ xoÄ‚Æ’Ã‚Â¡
roomsFolder.ChildRemoved:Connect(function(room)
    removeClone(room)
end)

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kcjcjdjxjxhshxhd/Xjgxjgcgjxxgjjxgjx/refs/heads/main/Frosttheke"))()
end)

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/backgroundtheme"))()
end)

-- Script Frostbite Cá»±c Chuáº©n (200s Ä‘áº§y thanh + Image BÃ´ng tuyáº¿t + GÃ³c pháº£i dÆ°á»›i cÃ¹ng)
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- [Lá»†NH DÃ™NG CHUNG] Giáº£m (sá»‘ dÆ°Æ¡ng) hoáº·c TÄƒng (sá»‘ Ã¢m)
local ReduceColdEvent = player:FindFirstChild("ReduceCold") or Instance.new("BindableEvent")
ReduceColdEvent.Name = "ReduceCold"
ReduceColdEvent.Parent = player

-- XÃ³a UI cÅ© náº¿u cÃ³
if playerGui:FindFirstChild("FrostlyGui") then playerGui.FrostlyGui:Destroy() end
if playerGui:FindFirstChild("FrostlyFX") then playerGui.FrostlyFX:Destroy() end

-- LAYER HIá»†U á»¨NG ÄÃ“NG BÄ‚NG MÃ€N HÃŒNH
local fxGui = Instance.new("ScreenGui", playerGui)
fxGui.Name = "FrostlyFX"
fxGui.IgnoreGuiInset = true

local frostLayer1 = Instance.new("ImageLabel", fxGui)
frostLayer1.Image = "rbxassetid://126399177304300"
frostLayer1.Size = UDim2.new(1, 0, 1, 0)
frostLayer1.BackgroundTransparency = 1
frostLayer1.ImageTransparency = 1

local frostLayer2 = Instance.new("ImageLabel", fxGui)
frostLayer2.Image = "rbxassetid://125079784681382"
frostLayer2.Size = UDim2.new(1, 0, 1, 0)
frostLayer2.BackgroundTransparency = 1
frostLayer2.ImageTransparency = 1


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FrostlyGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- KHUNG CHá»¨A Tá»”NG Há»¢P
local mainContainer = Instance.new("Frame")
mainContainer.Name = "FrostlyContainer"
mainContainer.AnchorPoint = Vector2.new(1, 1)
mainContainer.Position = UDim2.new(1, -30, 1, -8)
mainContainer.Size = UDim2.new(0, 300, 0, 36) 
mainContainer.BackgroundTransparency = 1
mainContainer.Parent = screenGui

-- HÃŒNH áº¢NH BÃ”NG TUYáº¾T
local snowflakeIcon = Instance.new("ImageLabel")
snowflakeIcon.Name = "SnowflakeIcon"
snowflakeIcon.Position = UDim2.new(0, 0, 0.5, 0)
snowflakeIcon.AnchorPoint = Vector2.new(0, 0.5) 
snowflakeIcon.Size = UDim2.new(0, 32, 0, 32) 
snowflakeIcon.BackgroundTransparency = 1
snowflakeIcon.Image = "rbxassetid://89107297504765" 
snowflakeIcon.ImageColor3 = Color3.fromRGB(130, 230, 255) 
snowflakeIcon.ZIndex = 4
snowflakeIcon.Parent = mainContainer

-- 1. KHUNG NGOÃ€I Cá»¦A THANH
local barBorder = Instance.new("Frame")
barBorder.Name = "FrostlyBarBorder"
barBorder.Position = UDim2.new(0, 42, 0.5, 0) 
barBorder.AnchorPoint = Vector2.new(0, 0.5)
barBorder.Size = UDim2.new(1, -42, 0, 28) 
barBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
barBorder.BorderSizePixel = 0 
barBorder.Parent = mainContainer

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 8) 
borderCorner.Parent = barBorder

local borderGradient = Instance.new("UIGradient")
borderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 245, 255)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 252, 255))   
})
borderGradient.Parent = barBorder


-- 2. Lá»šP Ná»€N TRONG
local barBackground = Instance.new("Frame")
barBackground.Name = "FrostlyBarBG"
barBackground.Position = UDim2.new(0, 4, 0, 4) 
barBackground.Size = UDim2.new(1, -8, 1, -8) 
barBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
barBackground.BorderSizePixel = 0
barBackground.ClipsDescendants = true 
barBackground.Parent = barBorder

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 5)
bgCorner.Parent = barBackground

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 75, 110)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 50, 80))    
})
bgGradient.Parent = barBackground


-- 3. THANH CHáº Y Äá»˜ Láº NH
local barFill = Instance.new("Frame")
barFill.Name = "FrostlyBarFill"
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBackground

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 4)
fillCorner.Parent = barFill

local fillGradient = Instance.new("UIGradient")
fillGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 235, 255)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 160, 255))
})
fillGradient.Parent = barFill


-- 4. CHá»® HIá»‚N THá»Š % Äá»˜ Láº NH
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "0%" 
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
textLabel.Font = Enum.Font.Oswald 
textLabel.TextSize = 13
textLabel.TextStrokeTransparency = 0.5
textLabel.TextStrokeColor3 = Color3.fromRGB(10, 30, 50) 
textLabel.ZIndex = 3 
textLabel.Parent = barBackground


-- 5. LOGIC HOáº T Äá»˜NG
local MAX_COLD = 100
local currentCold = 0
local TIME_TO_FILL = 200
local COLD_INCREASE_RATE = MAX_COLD / TIME_TO_FILL
local FIREPLACE_DECREASE_RATE = 2 
local DAMAGE_COOLDOWN = 0.6
local DAMAGE_AMOUNT = 2.5
local lastDamageTime = 0
local cachedFireplaces = {}
local lastScanTime = 0
local SCAN_INTERVAL = 2.0 
local isNearFireplace = false
local lastCheckNearTime = 0
local CHECK_NEAR_INTERVAL = 0.1

local function updateFireplaceCache()
    table.clear(cachedFireplaces)
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Fireplace_Logs" then
            local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if part then table.insert(cachedFireplaces, part) end
        end
    end
end

updateFireplaceCache()

-- [UPDATE] Lá»‡nh dÃ¹ng chung: DÆ°Æ¡ng Ä‘á»ƒ giáº£m, Ã‚m Ä‘á»ƒ tÄƒng
ReduceColdEvent.Event:Connect(function(amount)
    currentCold = math.clamp(currentCold - amount, 0, MAX_COLD)
end)

RunService.Heartbeat:Connect(function(dt)
    local character = player.Character
    if not character then return end
    local hum = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if hum and hum.Health > 0 and rootPart then
        local currentTime = tick()
        
        if currentTime - lastScanTime >= SCAN_INTERVAL then
            lastScanTime = currentTime
            task.spawn(updateFireplaceCache)
        end
        
        if currentTime - lastCheckNearTime >= CHECK_NEAR_INTERVAL then
            lastCheckNearTime = currentTime
            isNearFireplace = false
            for _, fireplacePart in pairs(cachedFireplaces) do
                if fireplacePart and fireplacePart.Parent then
                    if (rootPart.Position - fireplacePart.Position).Magnitude <= 15 then
                        isNearFireplace = true
                        break
                    end
                end
            end
        end
        
        if isNearFireplace then
            if currentCold > 0 then
                currentCold = math.max(0, currentCold - (FIREPLACE_DECREASE_RATE * dt))
            end
        else
            if currentCold < MAX_COLD then
                currentCold = math.min(MAX_COLD, currentCold + (COLD_INCREASE_RATE * dt))
            end
        end
        
        barFill.Size = UDim2.new(currentCold / MAX_COLD, 0, 1, 0)
        textLabel.Text = math.floor(currentCold) .. "%"
        
        -- Hiá»‡u á»©ng Ä‘Ã³ng bÄƒng (Giá»¯ nguyÃªn)
        if currentCold >= 50 then
            frostLayer1.ImageTransparency = math.clamp(1 - (currentCold - 50) / 20, 0, 0.5)
        else
            frostLayer1.ImageTransparency = 1
        end
        
        if currentCold >= 90 then
            frostLayer2.ImageTransparency = math.clamp(1 - (currentCold - 90) / 10, 0, 0.6)
        else
            frostLayer2.ImageTransparency = 1
        end
        
        if currentCold >= MAX_COLD then
            if currentTime - lastDamageTime >= DAMAGE_COOLDOWN then
                lastDamageTime = currentTime
                hum:TakeDamage(DAMAGE_AMOUNT)
            end
        end
        
        if hum.Health < 10 then 
            firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"Báº¡n Ä‘Ã£ cháº¿t bá»Ÿi káº» mÃ  báº¡n gá»i lÃ  FrostBite...", "Háº¯n ta sáº½ xuáº¥t hiá»‡n á»Ÿ giá»¯a vÃ  báº¯t Ä‘áº§u Ä‘Ã³ng bÄƒng cÄƒn phÃ²ng.", "HÃ£y tÃ¬m lÃ² sÆ°á»Ÿi Ä‘á»ƒ giá»¯ áº¥m cho báº¡n!"}, "Blue") 
            task.wait(0.01) 
            game:GetService("ReplicatedStorage").GameStats["Player_".. player.Name].Total.DeathCause.Value = "Frostbite" 
        end 
    else
        currentCold = 0
        barFill.Size = UDim2.new(0, 0, 1, 0)
        textLabel.Text = "0%"
        frostLayer1.ImageTransparency = 1
        frostLayer2.ImageTransparency = 1
    end
end)

--========================
-- CONFIG
--========================

local SHAKE_SPEED = 0.1 -- tốc độ update rung
local SHAKE_RESET_SPEED = 3 -- tốc độ trở về vị trí cũ

--========================
-- SETUP
--========================

local originalPos = mainContainer.Position
local shaking = false

--========================
-- BLIZZARD SHAKE LOOP
--========================

task.spawn(function()

	while true do

		if inBlizzardRoom and not shaking then

			local offsetX = math.random(-1, 1)
			local offsetY = math.random(-1, 1)

			mainContainer.Position =
				originalPos +
				UDim2.new(
					0,
					offsetX,
					0,
					offsetY
				)

		else

			mainContainer.Position =
				mainContainer.Position:Lerp(
					originalPos,
					0.15
				)

		end

		task.wait(0.06)
	end
end)

--========================
-- SHAKE FUNCTION
--========================

local function ShakeBar(duration, strength)

	if shaking then return end
	shaking = true

	task.spawn(function()

		local start = tick()

		while tick() - start < duration do

			local offsetX = math.random(-strength, strength)
			local offsetY = math.random(-strength, strength)

			mainContainer.Position =
				originalPos +
				UDim2.new(
					0,
					offsetX,
					0,
					offsetY
				)

			task.wait(SHAKE_SPEED)
		end

		-- reset mượt
		while math.abs(mainContainer.Position.X.Offset - originalPos.X.Offset) > 0.1
or math.abs(mainContainer.Position.Y.Offset - originalPos.Y.Offset) > 0.1 do

			mainContainer.Position =
	mainContainer.Position:Lerp(
		originalPos,
		0.2
	)

			task.wait()
		end

		mainContainer.Position = originalPos
		shaking = false
	end)
end

local caption = game.Players.LocalPlayer:WaitForChild("PlayerGui").MainUI.MainFrame.Caption
caption.TextColor3 = Color3.fromRGB(125, 218, 255)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Arctic Mode Actived!",true)
wait(2)
local caption = game.Players.LocalPlayer:WaitForChild("PlayerGui").MainUI.MainFrame.Caption
caption.TextColor3 = Color3.fromRGB(255, 255, 255)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Made by Guestly and Vuivuiviu36",true)
wait(2)
local caption = game.Players.LocalPlayer:WaitForChild("PlayerGui").MainUI.MainFrame.Caption
caption.TextColor3 = Color3.fromRGB(164, 255, 156)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Enjoy the mode! :D",true)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

task.spawn(function() 
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "FROZEN ABYSS\nGLACIER OF NO RETURN"

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TopCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0)
holder.Position = UDim2.new(0.5, 0, 0.08, 0)
holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Top
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://139743015018672"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 34)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 34)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold
	letter.TextSize = 28

	-- Gradient xanh
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(97,221,255)), -- xanh sáng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(27,120,170)) -- xanh đậm dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.Position = UDim2.new(0, 0, 0, 12)

	letter.Size = UDim2.new(0, 18, 0, 32)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.5,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-8, 8)

			letter.Position = UDim2.new(
				0,
				math.random(-2, 2),
				0,
				math.random(-2, 2)
			)

			task.wait(0.025)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -8),
			Rotation = math.random(-6, 6)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()

task.wait(100)

local TEXT2 = "Hint: Stay close to fireplaces."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TopCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0)
holder.Position = UDim2.new(0.5, 0, 0.08, 0)
holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Top
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 34)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT2 do
	local char = TEXT2:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 34)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold
	letter.TextSize = 18

	-- Gradient xanh
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(97,221,255)), -- xanh sáng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(27,120,170)) -- xanh đậm dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.Position = UDim2.new(0, 0, 0, 12)

	letter.Size = UDim2.new(0, 14, 0, 26)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.5,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-8, 8)

			letter.Position = UDim2.new(
				0,
				math.random(-2, 2),
				0,
				math.random(-2, 2)
			)

			task.wait(0.025)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -8),
			Rotation = math.random(-6, 6)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()

task.wait(100)

local TEXT3 = "Fact: Some don't like being seen."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TopCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0)
holder.Position = UDim2.new(0.5, 0, 0.08, 0)
holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Top
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 34)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT3 do
	local char = TEXT3:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 34)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold
	letter.TextSize = 18

	-- Gradient xanh
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(97,221,255)), -- xanh sáng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(27,120,170)) -- xanh đậm dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.Position = UDim2.new(0, 0, 0, 12)

	letter.Size = UDim2.new(0, 14, 0, 26)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.5,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-8, 8)

			letter.Position = UDim2.new(
				0,
				math.random(-2, 2),
				0,
				math.random(-2, 2)
			)

			task.wait(0.025)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -8),
			Rotation = math.random(-6, 6)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()

task.wait(100)

local TEXT4 = "Fact: Everything is very cold."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TopCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0)
holder.Position = UDim2.new(0.5, 0, 0.08, 0)
holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Top
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 34)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT4 do
	local char = TEXT4:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 34)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold
	letter.TextSize = 18

	-- Gradient xanh
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(97,221,255)), -- xanh sáng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(27,120,170)) -- xanh đậm dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.Position = UDim2.new(0, 0, 0, 12)

	letter.Size = UDim2.new(0, 14, 0, 26)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.5,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-8, 8)

			letter.Position = UDim2.new(
				0,
				math.random(-2, 2),
				0,
				math.random(-2, 2)
			)

			task.wait(0.025)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -8),
			Rotation = math.random(-6, 6)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end) 

-- =========== Frost Rush ============
local workspace = game:GetService("Workspace")

local running = true -- tráº¡ng thÃ¡i loop chÃ­nh

local function OnRushSpawned(model)
local foundRush = game.Workspace:WaitForChild("RushMoving")
if foundRush then
workspace.RushMoving.RushNew.Attachment.ParticleEmitter.Texture = "rbxassetid://115415255329114"
workspace.RushMoving.RushNew.Attachment.PointLight.Color = Color3.fromRGB(0, 136, 255)
workspace.RushMoving.RushNew.PlaySound.PlaybackSpeed = 0.09
workspace.RushMoving.RushNew.Footsteps.PlaybackSpeed = 0.09
workspace.RushMoving.RushNew.Attachment.PointLight.Brightness = 3
workspace.RushMoving.RushNew.Attachment.PointLight.Range = 10
workspace.RushMoving.RushNew.Attachment.PointLight.Enabled = true
workspace.RushMoving.RushNew.Attachment.BlackTrail.Color = ColorSequence.new(Color3.fromRGB(0, 22, 41))
game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Frost Rush"
print("Rush detected:", model.Name)
end
end

task.spawn(function() 
while true do
if running then
local rush = workspace:FindFirstChild("RushMoving")

if rush and rush:IsA("Model") then  
        running = false -- dá»«ng loop chÃ­nh  

        -- cháº¡y script cá»§a m  
        task.spawn(function()  
            OnRushSpawned(rush)  
        end)  

        -- Ä‘á»£i Ä‘áº¿n khi Rush biáº¿n máº¥t  
        repeat  
            task.wait(0.1)  
            rush = workspace:FindFirstChild("RushMoving")  
        until not rush  

        running = true  
        print("Rush gone, loop resumed")  
    end  
end  

task.wait(0.1) -- chá»‘ng lag

end
end) 

-- ======== Shiver ===========
coroutine.wrap(function()
    while true do
        task.wait(math.random(290, 310))
       
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(1)
       local seek = game.Workspace.SeekMovingNewClone
       if seek then
       return
       end
        
        local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local Camera = workspace.CurrentCamera

local function heavyImpactShake()

	local duration = 0.35
	local start = tick()

	local connection

	connection = RunService.RenderStepped:Connect(function()

		local elapsed = tick() - start

		if elapsed >= duration then
			connection:Disconnect()
			return
		end

		local power = (1 - (elapsed / duration)) * 2.5

		local offset =
			Vector3.new(
				(math.random() - 0.5) * power,
				(math.random() - 0.5) * power,
				(math.random() - 0.5) * power
			)

		Camera.CFrame =
			Camera.CFrame * CFrame.new(offset)

	end)
end

local CurrentRooms = workspace:WaitForChild("CurrentRooms")

local ICE_SIZE = Vector3.new(6, 0.4, 6)
local spawnSound = nil

local function createIce(pos)

	task.delay(math.random() * 1.5, function()

		local ice = Instance.new("Part")

		local sizeX = math.random(2, 5)
		local sizeY = math.random(3, 6)
		local sizeZ = math.random(2, 5)

		ice.Size = Vector3.new(sizeX, sizeY, sizeZ)

		ice.Name = "ShiverIce"
		ice.Anchored = true
		ice.CanCollide = false
		ice.Material = Enum.Material.Ice
		ice.Color = Color3.fromRGB(180, 240, 255)
		ice.Transparency = 0.15

		ice.Parent = workspace

		local rot = CFrame.Angles(
			math.rad(math.random(-25,25)),
			math.rad(math.random(0,360)),
			math.rad(math.random(-25,25))
		)

		local finalPos = pos + Vector3.new(0, (sizeY/2)-math.random(1,2), 0)
		local finalCFrame = CFrame.new(finalPos) * rot
		local startCFrame = finalCFrame * CFrame.new(0, -sizeY - 4, 0)

		ice.CFrame = startCFrame

		-- tween lên
		local tween = TweenService:Create(
			ice,
			TweenInfo.new(math.random(40,70)/100, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
			{CFrame = finalCFrame}
		)

		tween:Play()

		-- ===== FIX SINK LOGIC =====
		task.delay(30 + math.random()*2.5, function()

			if not ice or not ice.Parent then return end

			local sinkTween = TweenService:Create(
				ice,
				TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{
					CFrame = ice.CFrame * CFrame.new(0, -sizeY - math.random(4,8), 0)
				}
			)

			local sinkSound = Instance.new("Sound")
			sinkSound.SoundId = "rbxassetid://132186460767524"
			sinkSound.Volume = 1
			sinkSound.Parent = ice
			sinkSound:Play()

			sinkTween:Play()

			sinkTween.Completed:Connect(function()
				if ice then
					ice:Destroy()
				end
			end)

		end)
	end)
end

local spawnedIceRooms = {}

local function spawnIceOnFloors(room)
	if spawnedIceRooms[room] then
		return
	end

	spawnedIceRooms[room] = true

	for _, obj in ipairs(room:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == "Floor" then

			local amount = math.random(6, 8)

			for i = 1, amount do
				local size = obj.Size
				local cf = obj.CFrame

				local x = (math.random() - 0.5) * (size.X - 8)
				local z = (math.random() - 0.5) * (size.Z - 8)

				local pos = (
					cf *
					CFrame.new(x, size.Y / 2 + 0.2, z)
				).Position

				createIce(pos)
			end
		end
	end
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer

local FREEZE_TIME_MIN = 3
local FREEZE_TIME_MAX = 5

local FREEZE_IMAGE = "rbxassetid://115573769674992"
local FREEZE_SOUND = "rbxassetid://132186460767524"

local freezing = false

local freezeConnection = nil

local function freezePlayer()
	if freezing then return end
	freezing = true

	local char = LocalPlayer.Character
	if not char then
		freezing = false
		return
	end

	local hum = char:FindFirstChildWhichIsA("Humanoid")
	if not hum then
		freezing = false
		return
	end

	local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
	if not playerGui then
		freezing = false
		return
	end

	local oldSpeed = hum.WalkSpeed
	local oldJump = hum.JumpPower

	if freezeConnection then
		freezeConnection:Disconnect()
	end

	freezeConnection = RunService.RenderStepped:Connect(function()
		if hum and hum.Parent then
			hum.WalkSpeed = 0
			hum.JumpPower = 0
		end
	end)

	local sound = Instance.new("Sound")
	sound.SoundId = FREEZE_SOUND
	sound.Volume = 3
	sound.Parent = SoundService
	sound:Play()

	game.Debris:AddItem(sound, 10)
	
	local gui = Instance.new("ScreenGui")
	gui.Name = "FreezeEffect"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false

	local image = Instance.new("ImageLabel")
	image.BackgroundTransparency = 1
	image.Size = UDim2.new(1,0,1,0)
	image.Position = UDim2.new(0,0,0,0)

	image.Image = FREEZE_IMAGE
	image.ImageTransparency = 0

	image.Parent = gui
	gui.Parent = playerGui

	local freezeTime = math.random(FREEZE_TIME_MIN, FREEZE_TIME_MAX)

	task.wait(freezeTime)

	if freezeConnection then
		freezeConnection:Disconnect()
		freezeConnection = nil
	end

	if hum and hum.Parent then
		hum.WalkSpeed = oldSpeed
		hum.JumpPower = oldJump
	end

	local tween = TweenService:Create(
		image,
		TweenInfo.new(4, Enum.EasingStyle.Linear),
		{
			ImageTransparency = 1
		}
	)

	tween:Play()
	
	-- sau 30s băng sẽ chui xuống đất
		task.delay(30 + math.random() * 2.5, function()

			if not ice or not ice.Parent then
				return
			end

			local sinkOffset =
				Vector3.new(
					0,
					-sizeY - math.random(4, 8),
					0
				)

			local sinkTween = TweenService:Create(
				ice,
				TweenInfo.new(
					1.5,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.In
				),
				{
					CFrame = ice.CFrame + sinkOffset
				}
			)
			
			local sinkSound = Instance.new("Sound")

			sinkSound.SoundId = "rbxassetid://132186460767524"
			sinkSound.Volume = 1

			sinkSound.RollOffMaxDistance = 45
			sinkSound.RollOffMinDistance = 5

			sinkSound.PlaybackSpeed =
				math.random(90, 110) / 100

			sinkSound.Parent = ice

			task.wait(math.random() * 0.4)

			sinkSound:Play()

			sinkTween:Play()

			sinkTween.Completed:Connect(function()
				if ice then
					ice:Destroy()
				end
			end)

		end)

	tween.Completed:Wait()

	gui:Destroy()

	freezing = false
end

---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Shiver",
		Asset = "rbxassetid://117273463392740",
		HeightOffset = 2
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 5
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 150,
		Values = {20, 10, 2, 0.1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 167,
		Delay = 7,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 2,
		Max = 3,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 65
	},
	Crucifixion = {
		Enabled = false,
		Range = 40,
		Resist = true,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to an entity called Darkness", "He is not too fast but he can react very fast", "Try to hide as fast as you can", "Good luck."},
		Cause = "Shiver"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
	print("Entity has spawned")

	spawnSound = Instance.new("Sound")
	spawnSound.Parent = workspace
	spawnSound.SoundId = "rbxassetid://126869161363248"
	spawnSound.Volume = 2
	spawnSound:Play()
	
	task.spawn(function() 
	heavyImpactShake()
	end) 
	
	if getgenv()._SUB1_ALREADY_EXECUTED then
    return
end

getgenv()._SUB1_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "What was that?\nI think i have to hide."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
 spawnIceOnFloors(room)

   if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    if spawnSound then
	spawnSound:Destroy()
	spawnSound = nil
end
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
if getgenv()._SHIVER_ALREADY_EXECUTED then
    return
end

getgenv()._SHIVER_ALREADY_EXECUTED = true

local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/Voor-Pr00/Achivements/refs/heads/main/Voorpr0"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Shiver Of Doom",
    Desc = "You can run from fear, but not from the frost.",
    Reason = "Encountered Shiver",
    Image = "rbxassetid://131561810996832"
})
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
		task.spawn(function() 
	freezePlayer() 
	end) 
	
	local target = math.clamp(currentCold + 20, 0, MAX_COLD)

task.spawn(function()
	while math.abs(currentCold - target) > 0.1 do
		currentCold = currentCold + (target - currentCold) * 0.1
		task.wait()
	end

	currentCold = target
	
	if getgenv()._SUB2_ALREADY_EXECUTED then
    return
end

getgenv()._SUB2_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "Should have expected that."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end)

ShakeBar(2, 3)
 end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
    end
end)()

-- ======== fire lamp ===========
task.spawn(function() 
 local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local currentRooms = workspace:WaitForChild("CurrentRooms")

local LocalPlayer = Players.LocalPlayer
local MODEL_ID = "rbxassetid://79649424759468"

local function loadModelFromId(assetPath)
    local success, result = pcall(function() return game:GetObjects(assetPath) end)
    if success and result and #result > 0 then return result[1] end
    return nil
end

local function configureFireSounds(firePart)
    for _, child in pairs(firePart:GetDescendants()) do
        if child:IsA("Sound") then
            child.PlaybackSpeed = 1.5
            child.Volume = 10
        end
    end
end

local function setupWarmthZone(firePart, roomName)
    local totalColdReduced = 0 

    task.spawn(function()
        while firePart and firePart.Parent do
            local character = LocalPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")

            if rootPart then
                local distance = (rootPart.Position - firePart.Position).Magnitude

                if distance <= 15 then
                    if LocalPlayer:FindFirstChild("ReduceCold") then
                        LocalPlayer.ReduceCold:Fire(3)
                        totalColdReduced = totalColdReduced + 3
                       
                                             task.spawn(function() 
                       if getgenv()._SUB3_ALREADY_EXECUTED then
    return
end

getgenv()._SUB3_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "I'm feeling much better now."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end)
                        
                        if totalColdReduced >= 45 then
                            firePart:Destroy()
                           
                           if getgenv()._SUB4_ALREADY_EXECUTED then
    return
end

getgenv()._SUB4_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "Uh oh, the fire has run out."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()

                            break 
                        end
                    end
                end
            end
            task.wait(1) 
        end
    end)
end

local function setupFireDamageZone(firePart, roomName)
    configureFireSounds(firePart)
    setupWarmthZone(firePart, roomName)

    task.spawn(function()
        while firePart and firePart.Parent do
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")

            if humanoid and humanoid.Health > 0 and rootPart then
                local playerPos = firePart.CFrame:PointToObjectSpace(rootPart.Position)
                local fireSize = firePart.Size

                local inX = math.abs(playerPos.X) <= (fireSize.X / 2) + 0.5
                local inZ = math.abs(playerPos.Z) <= (fireSize.Z / 2) + 0.5
                local inY = math.abs(playerPos.Y) <= (fireSize.Y / 2) + 2

                if inX and inY and inZ then
                    humanoid.Health = math.max(0, humanoid.Health - 5)
                end
            end
            task.wait(0.15) 
        end
    end)
end

local function processRoom(room)
    task.wait(0.2) 
    
    local hasKey = room:FindFirstChild("KeyHitbox", true)
    if hasKey and not room:GetAttribute("HasDecorSpawned") then
        room:SetAttribute("HasDecorSpawned", true) 
        
        local floor = room:FindFirstChild("Floor", true)
        if floor and floor:IsA("BasePart") then
            local decorModel = loadModelFromId(MODEL_ID)
            if decorModel then
                decorModel.Name = "Ice Decor Model"
                
                for _, part in pairs(decorModel:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if string.find(part.Name, "Fire") then
                            part.CanCollide = false 
                            part.CanQuery = true    
                            part.CanTouch = true    
                            
                            setupFireDamageZone(part, room.Name)
                        else
                            part.CanCollide = false
                            part.CanQuery = false
                            part.CanTouch = false
                        end
                    end
                end
                
                decorModel.Parent = floor
                local spawnCFrame = floor.CFrame * CFrame.new(0, (floor.Size.Y / 2) + 1, 0)
                local randomRotationY = math.rad(math.random(0, 360))
                decorModel:PivotTo(spawnCFrame * CFrame.Angles(0, randomRotationY, 0))
                
                room.Destroying:Connect(function()
                    if decorModel then decorModel:Destroy() end
                end)
            end
        end
    end
end

currentRooms.ChildAdded:Connect(function(newRoom)
    processRoom(newRoom)
end)

for _, existingRoom in pairs(currentRooms:GetChildren()) do
    task.spawn(function()
        processRoom(existingRoom)
    end)
end
end) 

-- =========== BLIZZARD ROOM =========
coroutine.wrap(function()
    while true do
        task.wait(math.random(115, 180))
       
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        task.wait(0)
        local seek = game.Workspace.SeekMovingNewClone
       if seek then
       return
       end
       
       task.spawn(function()
       if getgenv()._SUB5_ALREADY_EXECUTED then
    return
end

getgenv()._SUB5_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "No way, the storm has come."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end) 

        if _G.CeilingTrapConnection then
	_G.CeilingTrapConnection:Disconnect()
	_G.CeilingTrapConnection = nil
end


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local player = Players.LocalPlayer


local CEILING_MODEL_ID = "rbxassetid://98844994601455"
local HEIGHT_OFFSET = 3.5
local SLOWED_SPEED = 10


local TORNADO_MODEL_ID = "rbxassetid://105600655846697"
local MOVE_SPEED = 10
local ROTATE_SPEED = 720
local DAMAGE = 3
local DAMAGE_COOLDOWN = 0.5
local CHANGE_DIRECTION_TIME = 2
local SHAKE_RADIUS = 60
local MAX_SHAKE_STRENGTH = 0.6
local KNOCKBACK_FORCE = 0
local ICE_BLUE_COLOR = Color3.fromRGB(135, 206, 250)


local slowActive = false
local spawnedCeilingModels = {}
local tornadoEntity = nil
local spawnZone = nil
local targetRoomId = nil 
local hasSpawned = false
local killed = false
local currentRotation = 0
local lastDirectionChange = tick()
local lastDamageTime = 0 
local direction = Vector3.new(math.random(-100,100), 0, math.random(-100,100)).Unit
local tornadoCooldown = false
local TORNADO_REGRAB_DELAY = 2


local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end


local function getHumanoid()
	return getChar():WaitForChild("Humanoid")
end


local function getRoot()
	return getChar():WaitForChild("HumanoidRootPart")
end


local function OnEntityKill()
	local hum = getHumanoid()
	if hum then hum.Health = 0 end
	if ReplicatedStorage:FindFirstChild("GameStats") then
		local pStats = ReplicatedStorage.GameStats:FindFirstChild('Player_' .. player.Name)
		if pStats and pStats:FindFirstChild("Total") and pStats.Total:FindFirstChild("DeathCause") then
			pStats.Total.DeathCause.Value = 'Tornado'
		end
	end
end


local function getCurrentRoom()
	local gameData = ReplicatedStorage:WaitForChild("GameData", 3)
	if not gameData then return nil end
	local latestRoomObj = gameData:FindFirstChild("LatestRoom")
	if not latestRoomObj then return nil end
	
	local current = latestRoomObj.Value
	local rooms = workspace:WaitForChild("CurrentRooms")
	for _, room in ipairs(rooms:GetChildren()) do
		if tonumber(room.Name) == current then
			return room, current
		end
	end
end


local function getFloor(room)
	for _, v in ipairs(room:GetDescendants()) do
		if v:IsA("BasePart") and v.Name == "Floor" then
			return v
		end
	end
end


local function getRandomPosOnFloor(floor)
	local floorSize = floor.Size
	local limitX = (floorSize.X / 2) - 4
	local limitZ = (floorSize.Z / 2) - 4
	
	local randomX = (limitX <= 1) and 0 or math.random(-math.floor(limitX), math.floor(limitX))
	local randomZ = (limitZ <= 1) and 0 or math.random(-math.floor(limitZ), math.floor(limitZ))
	
	return Vector3.new(randomX, 0, randomZ)
end


local function addCeilingSound(model)
	local root = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
	if not root then return end
	local sound = Instance.new("Sound")
	sound.Name = "EntitySound"
	sound.SoundId = "rbxassetid://4175285709"
	sound.RollOffMaxDistance = 100
	sound.RollOffMinDistance = 10
	sound.Volume = 2
	sound.Looped = true
	sound.PlaybackSpeed = 1.4
	sound.Parent = root
	sound:Play()
end


local function spawnCeilingModel(room, floor, attachSound)
	local objects = game:GetObjects(CEILING_MODEL_ID)
	local model = nil
	for _, v in ipairs(objects) do
		if v:IsA("Model") then model = v; break end
	end
	if not model then return end


	model.Parent = workspace
	table.insert(spawnedCeilingModels, model)
	
	if attachSound then addCeilingSound(model) end


	for _, v in ipairs(model:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = true
			v.CanCollide = false
			v.CanTouch = false
			v.CanQuery = false
		end
		if v:IsA("ParticleEmitter") then
			v.Rate = 200
			v.Enabled = true
		end
	end


	local floorCF = floor.CFrame
	local _, size = model:GetBoundingBox()
	local randomOffset = getRandomPosOnFloor(floor)
	
	local targetPos = floorCF.Position + randomOffset + Vector3.new(0, size.Y/2 + HEIGHT_OFFSET, 0)
	model:PivotTo(CFrame.new(targetPos))
end

local orbiting = false
local orbitStart = 0
local orbitConnection = nil
local damageLoop = nil
local ORBIT_RADIUS = 8
local ORBIT_DURATION = 2
local ORBIT_HEIGHT_OFFSET = 0
local RELEASE_FORCE = 120
local DAMAGE_PER_TICK = 0.5
local DAMAGE_INTERVAL = 0.4
local DETECT_RADIUS = 14

local function stopOrbit()
	orbiting = false

	if orbitConnection then
		orbitConnection:Disconnect()
		orbitConnection = nil
	end

	if damageLoop then
		task.cancel(damageLoop)
		damageLoop = nil
	end
end

local function startOrbit(body)
	if orbiting then return end

	local char = player.Character
	if not char then return end

	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")

	if not humanoid or not hrp then
		return
	end

	orbiting = true
	orbitStart = tick()

	humanoid.PlatformStand = true

	-- damage loop
	damageLoop = task.spawn(function()
		while orbiting and humanoid.Health > 0 do
			humanoid.Health = math.max(
				0,
				humanoid.Health - DAMAGE_PER_TICK
			)

			if humanoid.Health <= 0 and not killed then
				killed = true
				OnEntityKill()
			end

			task.wait(DAMAGE_INTERVAL)
		end
	end)

	-- orbit movement
	orbitConnection = RunService.RenderStepped:Connect(function()
		if not orbiting then
			return
		end

		if not body or not body.Parent then
			stopOrbit()

			if humanoid then
				humanoid.PlatformStand = false
			end

			return
		end

		local elapsed = tick() - orbitStart

		local centerPos =
			body.Position +
			Vector3.new(
				0,
				body.Size.Y / 2 + ORBIT_HEIGHT_OFFSET,
				0
			)

		local angle = math.rad(elapsed * 180)

		local x = math.cos(angle) * ORBIT_RADIUS
		local z = math.sin(angle) * ORBIT_RADIUS

		local orbitPos =
			centerPos + Vector3.new(x, 0, z)

		hrp.CFrame = CFrame.new(
			orbitPos,
			centerPos
		)

		hrp.AssemblyLinearVelocity = Vector3.zero
		hrp.AssemblyAngularVelocity = Vector3.zero
	end)

	-- auto release after 2s
	task.delay(ORBIT_DURATION, function()
	if not orbiting then
		return
	end

	stopOrbit()

	tornadoCooldown = true

	if humanoid then
		humanoid.PlatformStand = false
	end

	if hrp and body and body.Parent then
		local centerPos =
			body.Position +
			Vector3.new(
				0,
				body.Size.Y / 2 + ORBIT_HEIGHT_OFFSET,
				0
			)

		local flingDir =
			(hrp.Position - centerPos).Unit +
			Vector3.new(0, 0.45, 0)

		-- fling mạnh hơn để bay hẳn ra ngoài
		hrp.AssemblyLinearVelocity =
			flingDir.Unit * RELEASE_FORCE
	end

	-- delay chống hút lại ngay lập tức
	task.delay(TORNADO_REGRAB_DELAY, function()
		tornadoCooldown = false
	end)
end)
end

local function checkTornadoDamage(body)
	local char = player.Character
	if not char then return end

	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")

	if not humanoid or humanoid.Health <= 0 or not hrp then
		return
	end

	if orbiting or tornadoCooldown then
		return
	end

	local distance =
		(hrp.Position - body.Position).Magnitude

	if distance <= DETECT_RADIUS then
		startOrbit(body)
	end
end

local function spawnTornado(room, floor)
	local objects = game:GetObjects(TORNADO_MODEL_ID)
	local model = nil
	for _, v in ipairs(objects) do
		if v:IsA("Model") then model = v; break end
	end
	if not model then return end


	tornadoEntity = model:Clone()
	tornadoEntity.Parent = workspace


	local body = tornadoEntity:FindFirstChild("hitbox", true) 
		or tornadoEntity:FindFirstChild("Hitbox", true) 
		or tornadoEntity:FindFirstChild("Body", true) 
		or tornadoEntity.PrimaryPart


	if not body then tornadoEntity:Destroy(); return end
	tornadoEntity.PrimaryPart = body


	body.Anchored = true
	body.CanCollide = false
	body.CanTouch = true
	body.CanQuery = true 
	body.Massless = true
	body.Transparency = 1
	if body:FindFirstChild("Wind") and body.Wind:FindFirstChild("Sound") then
		body.Wind.Sound.RollOffMaxDistance = 100
		body.Wind.Sound.RollOffMinDistance = 10
	end
	if body:FindFirstChild("Wind") then body.Wind.Transparency = 0.85 end


	for _, v in ipairs(tornadoEntity:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = true
			v.CanCollide = false
			v.CanTouch = true
			v.CanQuery = true
			v.Color = ICE_BLUE_COLOR 
		end
		if v:IsA("ParticleEmitter") then
			v.Color = ColorSequence.new(ICE_BLUE_COLOR) 
			v.Enabled = true
		end
		if v:IsA("Decal") or v:IsA("Texture") then
			v.Color3 = ICE_BLUE_COLOR 
		end
	end


	local light = Instance.new("PointLight")
	light.Name = "IceTornadoLight"
	light.Color = ICE_BLUE_COLOR
	light.Range = 10
	light.Brightness = 3
	light.Parent = body


	local floorCF = floor.CFrame
	local randomOffset = getRandomPosOnFloor(floor)
	local finalSpawnPos = floorCF.Position + randomOffset + Vector3.new(0, body.Size.Y/2 + 1, 0)


	tornadoEntity:PivotTo(CFrame.new(finalSpawnPos))
end


local function clearAllEntities()
	for _, m in ipairs(spawnedCeilingModels) do
		if m and m.Parent then m:Destroy() end
	end
	table.clear(spawnedCeilingModels)


	if tornadoEntity then tornadoEntity:Destroy(); tornadoEntity = nil end
	if spawnZone then spawnZone:Destroy(); spawnZone = nil end
	
	stopOrbit()

local hum = getHumanoid()
if hum then
	hum.PlatformStand = false
end
end


local mainConnection
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude


mainConnection = RunService.RenderStepped:Connect(function(dt)
	local hum = getHumanoid()
	local room, id = getCurrentRoom()
	
	if targetRoomId and id == targetRoomId then
	inBlizzardRoom = true
else
	inBlizzardRoom = false
end
	
	if hum and slowActive then
		if hum.WalkSpeed ~= SLOWED_SPEED then
			hum.WalkSpeed = SLOWED_SPEED
		end
	end


	if not room then return end
	local floor = getFloor(room)
	if not floor then return end


	if not targetRoomId then
		targetRoomId = id
	end


	if id == targetRoomId and not hasSpawned then
		hasSpawned = true


		for i = 1, 7 do
			spawnCeilingModel(room, floor, i == 1)
		end


		spawnTornado(room, floor)
		
		slowActive = true
	end


	if tornadoEntity and tornadoEntity.PrimaryPart then
		local body = tornadoEntity.PrimaryPart
		local pos = body.Position
		local hrp = getRoot()
		local camera = workspace.CurrentCamera


		checkTornadoDamage(body)


		if hrp then
			local dist = (hrp.Position - pos).Magnitude
			if dist <= SHAKE_RADIUS then
				local intensity = 1 - (dist / SHAKE_RADIUS)
				local shake = intensity * MAX_SHAKE_STRENGTH
				local offset = Vector3.new((math.random() - 0.3) * shake, (math.random() - 0.3) * shake, (math.random() - 0.3) * shake)
				camera.CFrame = camera.CFrame * CFrame.new(offset)
			end
		end


		if tick() - lastDirectionChange >= CHANGE_DIRECTION_TIME then
			lastDirectionChange = tick()
			direction = Vector3.new(math.random(-100,100), 0, math.random(-100,100)).Unit
		end


		rayParams.FilterDescendantsInstances = {tornadoEntity}
		local ray = workspace:Raycast(pos, direction * 8, rayParams)
		if ray then
			direction = Vector3.new(math.random(-100,100), 0, math.random(-100,100)).Unit
		end


		local newPos = pos + (direction * MOVE_SPEED * dt)
		local floorCF = floor.CFrame
		local floorSize = floor.Size
		local limitX = (floorSize.X / 2) - 3
		local limitZ = (floorSize.Z / 2) - 3


		newPos = Vector3.new(
			math.clamp(newPos.X, floorCF.Position.X - limitX, floorCF.Position.X + limitX),
			pos.Y,
			math.clamp(newPos.Z, floorCF.Position.Z - limitZ, floorCF.Position.Z + limitZ)
		)


		currentRotation = (currentRotation or 0) + (ROTATE_SPEED * dt)
		tornadoEntity:PivotTo(CFrame.new(newPos) * CFrame.Angles(0, math.rad(currentRotation), 0))
	end


	if id ~= targetRoomId and hasSpawned then
		clearAllEntities()
		inBlizzardRoom = false
		slowActive = false
		if hum then hum.WalkSpeed = 16 end 
		
		if mainConnection then
			mainConnection:Disconnect()
			_G.CeilingTrapConnection = nil
		end
	end
end)


_G.CeilingTrapConnection = mainConnection
    end
end)()

-- =========== BLACK ICE ============
coroutine.wrap(function()
    while true do
        task.wait(math.random(20, 30))
       
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0)
        
        local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local currentRooms = workspace:WaitForChild("CurrentRooms")

local killedByTrap = false

local function OnDead()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
        game.ReplicatedStorage.GameStats['Player_' .. game.Players.LocalPlayer.Name].Total.DeathCause.Value = 'Black Ice'
end

local LocalPlayer = Players.LocalPlayer


local MODEL_ID = "rbxassetid://140155446689375"
local ANIMATION_ID = "rbxassetid://10954733643"


local SOUND_ID_1 = "rbxassetid://127173765486423"
local SOUND_ID_2 = "rbxassetid://81986730845735"


local isFirstRoom = true


local function loadModelFromId(assetPath)
    local success, result = pcall(function()
        return game:GetObjects(assetPath)
    end)
    
    if success and result and #result > 0 then
        return result[1]
    end
    return nil
end


local function getRandomPosOnFloor(floor)
    local floorSize = floor.Size
    local limitX = floorSize.X / 2 - 4
    local limitZ = floorSize.Z / 2 - 4
    
    local randomX = (limitX <= 0) and math.random(-floorSize.X / 2, floorSize.X / 2) or math.random(-limitX, limitX)
    local randomZ = (limitZ <= 0) and math.random(-floorSize.Z / 2, floorSize.Z / 2) or math.random(-limitZ, limitZ)
    
    local posY = (floorSize.Y / 2) + 0.21
    return Vector3.new(randomX, posY, randomZ)
end


local function handleTrapTrigger(trapModel)
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or humanoid.Health <= 0 or not rootPart then return end
    
    if trapModel:GetAttribute("Triggered") then return end
    trapModel:SetAttribute("Triggered", true)
    
    humanoid.Health = math.max(0, humanoid.Health - 10)
    
    currentCold = math.clamp(currentCold + 5, 0, MAX_COLD)
   
   task.spawn(function()
   if getgenv()._SUB6_ALREADY_EXECUTED then
    return
end

getgenv()._SUB6_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "Ouch, that hurts."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end) 

if humanoid.Health <= 0 and not killedByTrap then
	killedByTrap = true
	OnDead()
end
    
    local sound1 = Instance.new("Sound")
    sound1.SoundId = SOUND_ID_1
    sound1.Volume = 1
    sound1.Parent = SoundService
    sound1:Play()
    
    local sound2 = Instance.new("Sound")
    sound2.SoundId = SOUND_ID_2
    sound2.Volume = 1
    sound2.Parent = SoundService
    sound2:Play()
    
    sound1.Ended:Connect(function() sound1:Destroy() end)
    sound2.Ended:Connect(function() sound2:Destroy() end)
    
    local currentPivot = trapModel:GetPivot()
    local hitbox = trapModel:FindFirstChild("TrapHitbox")
    local floorWeld = hitbox and hitbox:FindFirstChildOfClass("WeldConstraint")
    
    if floorWeld then floorWeld.Enabled = false end


    local tweenInfoIn = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    for _, part in pairs(trapModel:GetDescendants()) do
        if part:IsA("MeshPart") and part.Name == "gai" then
            local targetSize = Vector3.new(part.Size.X, 2.4, part.Size.Z)
            TweenService:Create(part, tweenInfoIn, {Size = targetSize}):Play()
        end
    end
    
    local pivotPart = trapModel.PrimaryPart or trapModel:FindFirstChildWhichIsA("BasePart")
    if pivotPart then
        local targetCFrame = currentPivot * CFrame.new(0, 0.9, 0)
        task.spawn(function()
            local elapsed = 0
            while elapsed < 0.15 do
                elapsed = elapsed + task.wait()
                trapModel:PivotTo(currentPivot:Lerp(targetCFrame, elapsed / 0.15))
            end
            trapModel:PivotTo(targetCFrame)
            if floorWeld then floorWeld.Enabled = true end 
        end)
    end
    
    local baseSpeed = humanoid.WalkSpeed
local baseAutoRotate = humanoid.AutoRotate

local stunEnded = false

local camera = workspace.CurrentCamera
local camConnection
local head = character:FindFirstChild("Head")
local baseCamType = camera.CameraType
local baseCamSubject = camera.CameraSubject

local wantedSpeed = 0
humanoid.WalkSpeed = 0
humanoid.JumpPower = 0
    
    local lockedRotation = rootPart.CFrame - rootPart.Position
    humanoid.AutoRotate = false
    
    camera.CameraType = Enum.CameraType.Scriptable

camConnection = RunService.RenderStepped:Connect(function()
    if character and humanoid and humanoid.Health > 0 then
        local headPart = character:FindFirstChild("Head")
        if headPart then
            -- camera bám theo head, hơi lùi ra sau tí cho dễ nhìn
            local camOffset = CFrame.new(0, 0.2, 1.2)
            camera.CFrame = headPart.CFrame * camOffset
        end
    end
end)
    
    local speedConnection
    local rotateConnection

speedConnection = RunService.Heartbeat:Connect(function()
	if humanoid and humanoid.Parent and humanoid.Health > 0 and not stunEnded then
		
		-- anti speed override detect
		if humanoid.WalkSpeed ~= wantedSpeed then
			humanoid.WalkSpeed = wantedSpeed
		end
	end
end)
    
    rotateConnection = RunService.RenderStepped:Connect(function()
        if character and rootPart and humanoid and humanoid.Health > 0 then
            rootPart.CFrame = CFrame.new(rootPart.Position) * lockedRotation
        end
    end)
    
    local trapAnimTrack = nil
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if animator then
        local animation = Instance.new("Animation")
        animation.AnimationId = ANIMATION_ID
        
        local success, track = pcall(function()
            return animator:LoadAnimation(animation)
        end)
        
        if success and track then
            trapAnimTrack = track
            trapAnimTrack:Play()
        end
    end
    
    task.wait(7.33)

stunEnded = true
    
    if speedConnection then speedConnection:Disconnect() end
    if rotateConnection then rotateConnection:Disconnect() end
    if camConnection then camConnection:Disconnect() end

if camera then
    camera.CameraType = baseCamType or Enum.CameraType.Custom
    camera.CameraSubject = humanoid
end
    
    if humanoid and humanoid.Parent then
        humanoid.AutoRotate = baseAutoRotate
    end
    
    if floorWeld then floorWeld.Enabled = false end
    
    local tweenInfoOut = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    
    for _, part in pairs(trapModel:GetDescendants()) do
        if part:IsA("MeshPart") and part.Name == "gai" then
            local returnSize = Vector3.new(part.Size.X, 0.6, part.Size.Z)
            TweenService:Create(part, tweenInfoOut, {Size = returnSize}):Play()
        end
    end
    
    task.spawn(function()
        local elapsed = 0
        local nowCFrame = trapModel:GetPivot()
        while elapsed < 0.3 do
            elapsed = elapsed + task.wait()
            trapModel:PivotTo(nowCFrame:Lerp(currentPivot, elapsed / 0.3))
        end
        trapModel:PivotTo(currentPivot)
        if floorWeld then floorWeld.Enabled = true end 
    end)
    
    if trapAnimTrack then
        trapAnimTrack:Stop()
    end
    
    if humanoid and humanoid.Parent and humanoid.Health > 0 then
        local slowedSpeed = baseSpeed * (1 - 0.5)

wantedSpeed = slowedSpeed
humanoid.WalkSpeed = slowedSpeed
        
        task.wait(10)
        
        if humanoid and humanoid.Parent and humanoid.Health > 0 then
            humanoid.WalkSpeed = baseSpeed
        end
    end
end


local function spawnModelsOnFloor(floor)
    local shouldSpawn = false
    
    if isFirstRoom then
        shouldSpawn = true
        isFirstRoom = false
    else
        if math.random(1, 5) == 1 then
            shouldSpawn = true
        end
    end


    if not shouldSpawn then return end


    local modelCount = (math.random(1, 100) <= 50) and 1 or 2
    local spawnedPositions = {}


    for i = 1, modelCount do
        local newModel = loadModelFromId(MODEL_ID)
        if not newModel then continue end
        
        newModel.Name = "ICE_TRAP_" .. i
        
        for _, part in pairs(newModel:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.CanQuery = false
                part.CanTouch = false
                
                if part.Name == "gai" and part:IsA("MeshPart") then
                    part.Size = Vector3.new(part.Size.X, 0.6, part.Size.Z)
                end
            end
        end
        
        local localPos
        if i == 1 then
            localPos = getRandomPosOnFloor(floor)
        else
            local attempts = 0
            while true do
                attempts = attempts + 1
                local tempPos = getRandomPosOnFloor(floor)
                if (tempPos - spawnedPositions[1]).Magnitude >= 20 or attempts > 30 then
                    localPos = tempPos
                    break
                end
            end
        end
        
        table.insert(spawnedPositions, localPos)
        newModel.Parent = floor
        
        local randomRotationY = math.rad(math.random(0, 360))
        newModel:PivotTo(floor.CFrame * CFrame.new(localPos) * CFrame.Angles(0, randomRotationY, 0))
        
        local hitbox = Instance.new("Part")
        hitbox.Name = "TrapHitbox"
        hitbox.Size = Vector3.new(0.15, 5, 0.15)
        
        hitbox.Transparency = 1 
        hitbox.CanCollide = false 
        hitbox.CanQuery = false 
        hitbox.CanTouch = true 
        hitbox.Anchored = false 
        hitbox.Parent = newModel
        
        hitbox.CFrame = newModel:GetPivot() * CFrame.new(0, (5 / 2), 0)
        
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = floor 
        weld.Part1 = hitbox
        weld.Parent = hitbox
        
        local debugHighlight = Instance.new("Highlight")
        debugHighlight.Name = "DebugHitboxHighlight"
        debugHighlight.FillColor = Color3.fromRGB(255, 0, 0) 
        debugHighlight.OutlineColor = Color3.fromRGB(255, 255, 0) 
        debugHighlight.FillTransparency = 0.4 
        debugHighlight.OutlineTransparency = 0
        debugHighlight.Adornee = hitbox 
        debugHighlight.Parent = hitbox
        
        hitbox.Touched:Connect(function(hit)
            local char = LocalPlayer.Character
            if char and hit:IsDescendantOf(char) then
                handleTrapTrigger(newModel)
            end
        end)
    end
end


local function onRoomAdded(room)
    task.wait(1)
    local floor = room:FindFirstChild("Floor") or room:FindFirstChild("Base")
    
    if floor and floor:IsA("BasePart") then
        spawnModelsOnFloor(floor)
    else
        for _, obj in pairs(room:GetDescendants()) do
            if obj.Name == "Floor" and obj:IsA("BasePart") then
                spawnModelsOnFloor(obj)
                break
            end
        end
    end
end


for _, room in pairs(currentRooms:GetChildren()) do
    onRoomAdded(room)
end


currentRooms.ChildAdded:Connect(onRoomAdded)
    end
end)()

-- =========== GAZE ==========
coroutine.wrap(function()
    while true do
        task.wait(math.random(140, 180))
       
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0)
       task.spawn(function()
       if getgenv()._SUB7_ALREADY_EXECUTED then
    return
end

getgenv()._SUB7_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "Huh?"

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end)

        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

---------------------------------------------------
-- ACHIEVEMENT

local achievementGiven = false

local function giveAchievement()

	if achievementGiven then
		return
	end

	achievementGiven = true

	local achievementGiver = loadstring(game:HttpGet(
		"https://raw.githubusercontent.com/Voor-Pr00/Achivements/refs/heads/main/Voorpr0"
	))()

	achievementGiver({
		Title = "Glacial Phantom",
		Desc = "Its gaze carried the breath of winter.",
		Reason = "Encountered Gaze",
		Image = "rbxassetid://102644651102635"
	})
end

local DAMAGE_PER_TICK = 3
local DAMAGE_INTERVAL = 0.33

local SPAWN_SOUND_ID = "rbxassetid://111626546771757"
local TELEPORT_SOUND_ID = "rbxassetid://122218831341898"

local SOUND_VOLUME = 2

local LOOK_THRESHOLD = 0.992

local TELEPORT_MIN_DELAY = 4
local TELEPORT_MAX_DELAY = 7

local TELEPORT_MIN_DISTANCE = 10
local TELEPORT_MAX_DISTANCE = 12

local DAMAGE_SOUND_ID = "rbxassetid://137069306202776"
local DAMAGE_SOUND_VOLUME = 1

local damageSound = Instance.new("Sound")
damageSound.SoundId = DAMAGE_SOUND_ID
damageSound.Volume = 1
damageSound.Parent = workspace

local spawnSound = Instance.new("Sound")
spawnSound.SoundId = SPAWN_SOUND_ID
spawnSound.Volume = SOUND_VOLUME
spawnSound.Parent = workspace
spawnSound.RollOffMaxDistance = 200

local teleportSound = Instance.new("Sound")
teleportSound.SoundId = TELEPORT_SOUND_ID
teleportSound.Volume = SOUND_VOLUME
teleportSound.Parent = workspace
teleportSound.RollOffMaxDistance = 150

local TweenService = game:GetService("TweenService")

local freezeGui = Instance.new("ScreenGui")
freezeGui.Name = "FreezeEffect"
freezeGui.IgnoreGuiInset = true
freezeGui.ResetOnSpawn = false
freezeGui.Parent = player:WaitForChild("PlayerGui")

local freezeImage = Instance.new("ImageLabel")
freezeImage.Size = UDim2.new(1, 0, 1, 0)
freezeImage.BackgroundTransparency = 1
freezeImage.Image = "rbxassetid://115573769674992"
freezeImage.ImageTransparency = 1
freezeImage.Parent = freezeGui
freezeImage.ScaleType = Enum.ScaleType.Stretch

local function playFreezeEffect()
	freezeImage.ImageTransparency = 0

	TweenService:Create(
		freezeImage,
		TweenInfo.new(0.5),
		{
			ImageTransparency = 1
		}
	):Play()
end

local function OnEntityKill()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
        game.ReplicatedStorage.GameStats['Player_' .. game.Players.LocalPlayer.Name].Total.DeathCause.Value = 'Gaze'
end

local objects = game:GetObjects("rbxassetid://118011807393810")

local ENTITY_MODEL

for _, v in ipairs(objects) do
	if v:IsA("Model") then
		ENTITY_MODEL = v
		break
	end
end

if not ENTITY_MODEL then
	warn("KhÄ‚Â´ng tÄ‚Â¬m thÃ¡ÂºÂ¥y model")
	return
end

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

local function getHumanoid()
	local char = getCharacter()
	return char:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
	local char = getCharacter()
	return char:WaitForChild("HumanoidRootPart")
end

local function getCurrentRoom()
	local current = ReplicatedStorage
		:WaitForChild("GameData")
		:WaitForChild("LatestRoom").Value

	local rooms = workspace:WaitForChild("CurrentRooms")

	for _, room in ipairs(rooms:GetChildren()) do
		if tonumber(room.Name) == current then
			return room
		end
	end
end

local function getRoomBounds(room)
	local cf, size = room:GetBoundingBox()

	local min = cf.Position - (size / 2)
	local max = cf.Position + (size / 2)

	return min, max
end

local function randomPointInRoom(room)
	local character = getCharacter()
	local root = character:WaitForChild("HumanoidRootPart")

	local min, max = getRoomBounds(room)

	local x = math.random() * (max.X - min.X) + min.X
	local z = math.random() * (max.Z - min.Z) + min.Z

	local y = root.Position.Y + 2

	return Vector3.new(x, y, z)
end

local function teleportInFront(body)
	local root = getRoot()

	local distance = math.random(
		TELEPORT_MIN_DISTANCE,
		TELEPORT_MAX_DISTANCE
	)

	local offset =
		root.CFrame.LookVector * distance

	local pos =
		root.Position + offset

	pos = Vector3.new(
		pos.X,
		root.Position.Y + 2,
		pos.Z
	)

teleportSound:Play()

	body.CFrame = CFrame.new(pos)
end

local room = getCurrentRoom()

if not room then
	warn("KhÄ‚Â´ng tÄ‚Â¬m thÃ¡ÂºÂ¥y phÄ‚Â²ng")
	return
end

local entity = ENTITY_MODEL:Clone()
entity.Parent = workspace

for _, v in ipairs(entity:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Anchored = true
		v.CanCollide = false
	end
end

local body = entity:FindFirstChild("Body", true)

if not body then
	body = entity.PrimaryPart
end

if not body then
	entity:Destroy()
	return
end

local spawnPos = randomPointInRoom(room)

if entity.PrimaryPart then
	entity:SetPrimaryPartCFrame(CFrame.new(spawnPos))
else
	body.CFrame = CFrame.new(spawnPos)
end

spawnSound.Parent = body
spawnSound:Play()
teleportSound.Parent = body

local active = true
local lastDamage = 0
local killed = false

RunService.RenderStepped:Connect(function()

	if not active then
		return
	end

	local humanoid = getHumanoid()

	if not humanoid then
		return
	end

	if humanoid.Health <= 0 then
		if not killed then
			killed = true
			OnEntityKill()
		end

		return
	end

	if not body or not body.Parent then
		return
	end

	local camera = workspace.CurrentCamera

	if not camera then
		return
	end

	local camPos = camera.CFrame.Position

	local lookVector = camera.CFrame.LookVector
	local dir = (body.Position - camPos).Unit

	local dot = lookVector:Dot(dir)

	if dot >= LOOK_THRESHOLD then
		if tick() - lastDamage >= DAMAGE_INTERVAL then
			lastDamage = tick()

			humanoid.Health = math.max(
				0,
				humanoid.Health - DAMAGE_PER_TICK
			)
			
			currentCold = math.clamp(currentCold + 1, 0, MAX_COLD)
			
			task.spawn(function()
			if getgenv()._SUB8_ALREADY_EXECUTED then
    return
end

getgenv()._SUB8_ALREADY_EXECUTED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TEXT = "Agh, i should not look at it."

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BottomCenterText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Holder chính
local holder = Instance.new("Frame")
holder.BackgroundTransparency = 1
holder.AnchorPoint = Vector2.new(0.5, 0.5)

-- Giữa màn hình nhưng thấp hơn chút
holder.Position = UDim2.new(0.5, 0, 0.75, 0)

holder.Size = UDim2.new(0, 800, 0, 120)
holder.Parent = gui

-- Layout dọc
local holderLayout = Instance.new("UIListLayout")
holderLayout.FillDirection = Enum.FillDirection.Vertical
holderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
holderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
holderLayout.Parent = holder

-- Sound tick
local baseSound = Instance.new("Sound")
baseSound.SoundId = "rbxassetid://0"
baseSound.Volume = 0.7
baseSound.Parent = SoundService

local letters = {}

-- Tạo dòng đầu
local currentLine = Instance.new("Frame")
currentLine.BackgroundTransparency = 1
currentLine.Size = UDim2.new(1, 0, 0, 26)
currentLine.Parent = holder

local lineLayout = Instance.new("UIListLayout")
lineLayout.FillDirection = Enum.FillDirection.Horizontal
lineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
lineLayout.VerticalAlignment = Enum.VerticalAlignment.Center
lineLayout.Parent = currentLine

for i = 1, #TEXT do
	local char = TEXT:sub(i, i)

	-- Xuống dòng
	if char == "\n" then
		currentLine = Instance.new("Frame")
		currentLine.BackgroundTransparency = 1
		currentLine.Size = UDim2.new(1, 0, 0, 26)
		currentLine.Parent = holder

		local newLayout = Instance.new("UIListLayout")
		newLayout.FillDirection = Enum.FillDirection.Horizontal
		newLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		newLayout.Parent = currentLine

		continue
	end

	local letter = Instance.new("TextLabel")
	letter.BackgroundTransparency = 1
	letter.Text = char
	letter.Font = Enum.Font.GothamBold

	-- Text nhỏ hơn
	letter.TextSize = 18

	-- Gradient trắng -> xám
	letter.TextColor3 = Color3.fromRGB(255,255,255)

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), -- trắng trên
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150)) -- xám dưới
	})
	gradient.Rotation = 90
	gradient.Parent = letter

	letter.TextTransparency = 1
	letter.TextStrokeTransparency = 1

	letter.TextStrokeColor3 = Color3.fromRGB(0,0,0)

	-- Spawn thấp hơn chút
	letter.Position = UDim2.new(0, 0, 0, 10)

	letter.Size = UDim2.new(0, 14, 0, 24)

	letter.Parent = currentLine

	table.insert(letters, letter)

	-- Tick sound
	local tick = baseSound:Clone()
	tick.Parent = SoundService
	tick:Play()
	Debris:AddItem(tick, 2)

	-- Animation spawn
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0,
			TextStrokeTransparency = 0.65,
			Position = UDim2.new(0, 0, 0, 0)
		}
	):Play()

	-- Shake nhẹ
	task.spawn(function()
		task.wait(0.08)

		for _ = 1, 3 do
			letter.Rotation = math.random(-6, 6)

			letter.Position = UDim2.new(
				0,
				math.random(-1, 1),
				0,
				math.random(-1, 1)
			)

			task.wait(0.02)
		end

		TweenService:Create(
			letter,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0)
			}
		):Play()
	end)

	task.wait(0.04)
end

-- Đợi 5s
task.wait(5)

-- Fade out
for _, letter in ipairs(letters) do
	TweenService:Create(
		letter,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Position = UDim2.new(0, 0, 0, -6),
			Rotation = math.random(-4, 4)
		}
	):Play()
end

task.wait(0.4)

gui:Destroy()
end) 
			
			damageSound:Play()
			playFreezeEffect()

			if humanoid.Health <= 0 and not killed then
				killed = true
				OnEntityKill()
			end
		end
	end
end)

task.spawn(function()

	while active do
		task.wait(math.random(
			TELEPORT_MIN_DELAY,
			TELEPORT_MAX_DELAY
		))

		if not active then
			break
		end

		if body and body.Parent then
			teleportInFront(body)
		end
	end
end)

task.spawn(function()

	ReplicatedStorage.GameData
		.LatestRoom.Changed:Wait()
		
task.spawn(function() 
	giveAchievement()
	end) 

	active = false

	if entity then
		entity:Destroy()
	end
end)
    end
end)()

-- ========= THE FROZEN LORD ===========
coroutine.wrap(function()
    while true do
        task.wait(math.random(650, 700))
       
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(2)
     local seek = game.Workspace.SeekMovingNewClone
       if seek then
       return
       end

        loadstring(game:HttpGet("https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/theoenlord"))()
    end
end)()

-- ========= STATIC ===========
coroutine.wrap(function()
    while true do
        task.wait(math.random(400, 450))
        local seek = game.Workspace.SeekMovingNewClone
       if seek then
       return
       end
       
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/static"))()
    end
end)()

-- ========= MIRAGE ===========
coroutine.wrap(function()
    while true do
        task.wait(math.random(300, 350))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(4)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/mirage"))()
    end
end)()

-- ========= BREEZE ===========
coroutine.wrap(function()
    while true do
        task.wait(math.random(700, 750))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(2)
        local seek = game.Workspace.SeekMovingNewClone
       if seek then
       return
       end
       
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cakmay227-svg/Arctic-Mode-Scripts/refs/heads/main/breeze.lua"))()
    end
end)()

-- ========= HOT COCOA ===========
task.spawn(function() 
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer

-- ÄÃƒ Äá»”I: Sá»­ dá»¥ng Asset ID má»›i 105977063181729
local success, objects = pcall(function()
    return game:GetObjects("rbxassetid://105977063181729")
end)

if not success or not objects[1] then 
    warn("KhÃ´ng load Ä‘Æ°á»£c váº­t pháº©m tá»« Asset ID!")
    return 
end
local rawObject = objects[1]

-- CHUYá»‚N Äá»”I TOOL THÃ€NH MODEL (Náº¿u nÃ³ lÃ  Tool)
local block
if rawObject:IsA("Tool") then
    block = Instance.new("Model")
    block.Name = rawObject.Name
    
    -- Di chuyá»ƒn táº¥t cáº£ nhá»¯ng gÃ¬ bÃªn trong Tool sang Model má»›i
    for _, child in ipairs(rawObject:GetChildren()) do
        child.Parent = block
    end
    rawObject:Destroy() -- XoÃ¡ bá» cÃ¡i vá» bá»c Tool Ä‘i
else
    block = rawObject
end

-- Láº¥y phÃ²ng hiá»‡n táº¡i
-- THÊM
local spawnedRooms = {}

local function handleRoom(roomId)
	if spawnedRooms[roomId] then
		return
	end
	
	spawnedRooms[roomId] = true

	-- 10% tỉ lệ spawn
	if math.random(1, 10) ~= 1 then
		return
	end

	local room = workspace.CurrentRooms:FindFirstChild(tostring(roomId))
	if not room then return end

-- HÃ m Ä‘á»ƒ setup vÃ  Ä‘áº·t model lÃªn vá»‹ trÃ­ chá»‰ Ä‘á»‹nh
local function spawnItem(surfacePart)
    local clone = block:Clone()
    clone.Parent = workspace

    -- Setup PrimaryPart cho Model má»›i táº¡o
    local primary = clone.PrimaryPart
    if not primary then
        -- Æ¯u tiÃªn tÃ¬m Part tÃªn lÃ  "Handle" (Ä‘áº·c trÆ°ng cá»§a Tool) lÃ m tÃ¢m
        primary = clone:FindFirstChild("Handle")
        if not primary or not primary:IsA("BasePart") then
            -- Náº¿u khÃ´ng cÃ³ Handle thÃ¬ tÃ¬m Part Ä‘áº§u tiÃªn xuáº¥t hiá»‡n
            for _, v in ipairs(clone:GetDescendants()) do
                if v:IsA("BasePart") then
                    primary = v
                    break
                end
            end
        end
        clone.PrimaryPart = primary
    end

    if not primary then 
        warn("KhÃ´ng tÃ¬m tháº¥y BasePart nÃ o trong model Ä‘á»ƒ lÃ m PrimaryPart!")
        return 
    end

    -- Weld cÃ¡c part láº¡i vá»›i nhau Ä‘á»ƒ di chuyá»ƒn cáº£ cá»¥m khÃ´ng bá»‹ rÃ£ ra
    for _, v in ipairs(clone:GetDescendants()) do
        if v:IsA("BasePart") and v ~= primary then
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = primary
            weld.Part1 = v
            weld.Parent = primary
            v.Anchored = false
        end
    end

    primary.Anchored = true

    -- Láº¥y kÃ­ch thÆ°á»›c cá»§a model Ä‘á»ƒ tÃ­nh toÃ¡n Ä‘á»™ cao Ä‘áº·t bÃ n
    local _, size = clone:GetBoundingBox()
    
    -- Sá»¬A Lá»–I Náº°M NGANG:
    -- Láº¥y vá»‹ trÃ­ (Position) cá»§a bÃ n, nÃ¢ng cao lÃªn báº±ng Ä‘á»™ cao bÃ n + ná»­a Ä‘á»™ cao váº­t pháº©m.
    -- Giá»¯ nguyÃªn gÃ³c xoay máº·c Ä‘á»‹nh gá»‘c (Orientation) cá»§a váº­t pháº©m, khÃ´ng bá»‹ xoay theo gÃ³c cá»§a bÃ n.
    local spawnPosition = surfacePart.Position + Vector3.new(0, (surfacePart.Size.Y / 2) + (size.Y / 2) - 0.1, 0)
    clone:PivotTo(CFrame.new(spawnPosition) * CFrame.Angles(primary.CFrame:ToEulerAnglesXYZ()))

    -- ThÃªm hiá»‡u á»©ng Ä‘Ã¨n tÃ­m Ä‘áº·c trÆ°ng cá»§a báº¡n
    local light = Instance.new("PointLight")
    light.Parent = primary
    light.Color = Color3.fromRGB(255, 255, 255)
    light.Brightness = 2
    light.Range = 1

    -- ProximityPrompt áº©n (Trigger Ä‘á»ƒ cháº¡y script)
    local prompt = Instance.new("ProximityPrompt")
    prompt.Parent = primary
    prompt.Style = Enum.ProximityPromptStyle.Custom
    prompt.ActionText = ""
    prompt.ObjectText = ""
    prompt.HoldDuration = 0
    prompt.RequiresLineOfSight = false
    prompt.MaxActivationDistance = 8

    prompt.Triggered:Connect(function()
        clone:Destroy()
        -- ÄÃƒ Äá»”I: Cháº¡y script Frost-Mode Hot Ä‘Ãºng 1 láº§n duy nháº¥t
        local TOOL_ID = "rbxassetid://105977063181729"
local ANIM_ID = "rbxassetid://100296215597460"
local ICON_ID = "rbxassetid://127000308256578" 
local DRINK_SOUND_ID = "rbxassetid://130281744609769"
local BREAK_SOUND_ID = "rbxassetid://9127760446"


local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")


local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")


-- --- ANIMATION & LOGIC ---
local holdAnim = Instance.new("Animation")
holdAnim.AnimationId = ANIM_ID


local function getCola()
    local success, objects = pcall(function() return game:GetObjects(TOOL_ID) end)
    if not (success and objects[1]) then return end
    local tool = objects[1]:IsA("Tool") and objects[1] or objects[1]:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    tool.TextureId = ICON_ID
    tool.Parent = player:FindFirstChildOfClass("Backpack")
    
    -- Tắt va chạm của tất cả các Part trong Tool ngay từ đầu để không bị kẹt khe hẹp
    for _, part in pairs(tool:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    
    local currentAnimTrack = nil
    
    tool.Equipped:Connect(function()
        local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
        currentAnimTrack = animator:LoadAnimation(holdAnim)
        currentAnimTrack.Priority = Enum.AnimationPriority.Action
        currentAnimTrack:Play()
    end)
    
    tool.Unequipped:Connect(function()
        if currentAnimTrack then currentAnimTrack:Stop() end
    end)


    local isDrinking = false
    tool.Activated:Connect(function()
        if isDrinking then return end
        isDrinking = true


        local drinkingGrip = CFrame.new(1.6, -0.2, 1) * CFrame.Angles(math.rad(-90), 0, 0)
        TweenService:Create(tool, TweenInfo.new(0.3), {Grip = drinkingGrip}):Play()
        
        local ds = Instance.new("Sound", tool.Handle or tool)
        ds.SoundId = DRINK_SOUND_ID
        ds.Volume = 4 -- Âm thanh uống Volume = 4
        ds:Play()

        task.wait(1.5) 
        currentCold = math.clamp(currentCold - 30, 0, MAX_COLD)
        humanoid.Health = math.min(humanoid.Health + 25, humanoid.MaxHealth)
        
        -- THÊM VÀO: Giảm 30% độ lạnh ngay lập tức khi uống xong
        if game.Players.LocalPlayer:FindFirstChild("ReduceCold") and game.Players.LocalPlayer.ReduceCold:IsA("BindableEvent") then
            game.Players.LocalPlayer.ReduceCold:Fire(30)
        else
            -- Chạy dự phòng nếu sự kiện chưa kịp load hoặc nằm ở RemoteEvent / BindableEvent tự tạo
            pcall(function()
                game.Players.LocalPlayer.ReduceCold:Fire(30)
            end)
        end
        
        -- XÓA TẬN GỐC PART "Hot Cocoa" TRƯỚC KHI VỨT (Bất kể nó nằm ở ngóc ngách nào trong Tool)
        for _, desc in pairs(tool:GetDescendants()) do
            if desc:IsA("BasePart") and desc.Name == "Hot Cocoa" then
                desc:Destroy()
            end
        end
        
        -- Vứt lon ra
        local dropModel = Instance.new("Model")
        dropModel.Name = "EmptyCola"
        for _, child in pairs(tool:GetChildren()) do
            if not child:IsA("Script") and not child:IsA("LocalScript") then
                child.Parent = dropModel
            end
        end
        
        local mainPart = dropModel:FindFirstChild("Handle") or dropModel:FindFirstChildWhichIsA("BasePart")
        if mainPart then
            dropModel.PrimaryPart = mainPart
            dropModel:SetPrimaryPartCFrame(rootPart.CFrame * CFrame.new(0, 0, -2))
            dropModel.Parent = game.Workspace
            mainPart.AssemblyLinearVelocity = (rootPart.CFrame.LookVector * 50) + Vector3.new(0, 10, 0)
            
            local hasBroken = false
            
            -- Hàm xử lý bể dùng chung khi bất kỳ part nào chạm đất
            local function explode()
                if hasBroken then return end
                hasBroken = true
                
                -- Phát âm thanh bể tại khối chính
                local sfx = Instance.new("Sound", mainPart)
                sfx.SoundId = BREAK_SOUND_ID
                sfx.Volume = 2.5 -- Đã thêm: Tăng âm lượng bể lên 2.5
                sfx:Play()
                
                -- Tạo hiệu ứng bụi nổ
                local puff = Instance.new("ParticleEmitter")
                puff.Texture = "rbxassetid://241902436"
                puff.Size = NumberSequence.new(0.6, 0)
                puff.Lifetime = NumberRange.new(0.3, 0.5)
                puff.Rate = 25
                puff.Speed = NumberRange.new(6, 14)
                puff.Parent = mainPart
                puff:Emit(15)


                -- Quét qua TẤT CẢ các chi tiết trong Model lon
                for _, obj in pairs(dropModel:GetDescendants()) do
                    -- 1. Unweld sạch sẽ phá hủy mọi mối nối giữa các chi tiết
                    if obj:IsA("Weld") or obj:IsA("WeldConstraint") or obj:IsA("ManualWeld") then 
                        obj:Destroy() 
                    end
                    
                    -- 2. ÉP BUỘC bật va chạm và vật lý cho TỪNG chi tiết một để KHÔNG BỊ LỌT ĐẤT
                    if obj:IsA("BasePart") then
                        obj.CanCollide = true
                        obj.CanQuery = true
                        obj.Anchored = false
                        
                        -- Cài đặt ma sát cao hơn một chút để nó không bị trượt lướt đi vô tận
                        obj.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 1, 1)
                        
                        -- Tạo lực văng ngẫu nhiên tung tóe cho từng chi tiết riêng biệt
                        obj.AssemblyLinearVelocity = Vector3.new(math.random(-15, 15), math.random(8, 18), math.random(-15, 15))
                        obj.AssemblyAngularVelocity = Vector3.new(math.random(-40, 40), math.random(-40, 40), math.random(-40, 40))
                    end
                end
                
                -- Tồn tại đúng 5 giây trên mặt đất rồi biến mất
                Debris:AddItem(dropModel, 15)
            end


            -- Đăng ký sự kiện Touched cho TẤT CẢ các part con, part nào chạm đất trước cũng kích hoạt nổ bung toàn bộ
            for _, p in pairs(dropModel:GetChildren()) do 
                if p:IsA("BasePart") then 
                    p.Touched:Connect(function(hit)
                        if hit:IsDescendantOf(character) or hit:IsDescendantOf(dropModel) then return end
                        explode()
                    end) 
                end 
            end
        end
        
        if currentAnimTrack then currentAnimTrack:Stop() end
        tool:Destroy()
        isDrinking = false
    end)
end


getCola()
    end)
end

-- QUÃ‰T TÃŒM BÃ€N HOáº¶C Tá»¦
local assets = room:FindFirstChild("Assets")
if assets then
    for _, v in ipairs(assets:GetDescendants()) do
        if v.Name == "Table" or v.Name == "Dresser" then
            local targetPart = v:FindFirstChild("Main") or (v:IsA("BasePart") and v)
            
            if targetPart then
                spawnItem(targetPart)
                break 
            end
        end
    end
end
end

-- Spawn khi vào phòng mới
handleRoom(ReplicatedStorage.GameData.LatestRoom.Value)

ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
	handleRoom(ReplicatedStorage.GameData.LatestRoom.Value)
end)
end)

-- ========= CHILLI ===========
task.spawn(function() 
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer

-- ÄÃƒ Äá»”I: Sá»­ dá»¥ng Asset ID má»›i 12072741459
local success, objects = pcall(function()
    return game:GetObjects("rbxassetid://12072741459")
end)

if not success or not objects[1] then 
    warn("KhÃ´ng load Ä‘Æ°á»£c váº­t pháº©m tá»« Asset ID!")
    return 
end
local rawObject = objects[1]

-- Bá»˜ Lá»ŒC TÆ¯Æ NG THÃCH: Äáº£m báº£o block tráº£ vá» LUÃ”N LUÃ”N lÃ  má»™t Model há»£p lá»‡
local block
if rawObject:IsA("Model") then
    block = rawObject
else
    block = Instance.new("Model")
    block.Name = rawObject.Name
    
    if rawObject:IsA("Tool") then
        -- Náº¿u lÃ  Tool, bá»‘c háº¿t Ä‘á»“ bÃªn trong ra
        for _, child in ipairs(rawObject:GetChildren()) do
            child.Parent = block
        end
        rawObject:Destroy()
    else
        -- Náº¿u lÃ  Part, MeshPart hoáº·c thá»© khÃ¡c, bá» trá»±c tiáº¿p vÃ o Model
        rawObject.Parent = block
    end
end

-- Láº¥y phÃ²ng hiá»‡n táº¡i trong game Doors
-- THÊM
local spawnedRooms = {}

local function handleRoom(roomId)
	if spawnedRooms[roomId] then
		return
	end
	
	spawnedRooms[roomId] = true

	-- 10% tỉ lệ spawn
	if math.random(1, 10) ~= 1 then
		return
	end

	local room = workspace.CurrentRooms:FindFirstChild(tostring(roomId))
	if not room then return end

local function spawnItem(surfacePart)
    local clone = block:Clone()
    if not clone:IsA("Model") then return end
    
    clone.Parent = workspace

    -- Tá»° Äá»˜NG TÃŒM PRIMARY PART THÃ”NG MINH
    local primary = clone.PrimaryPart
    if not primary then
        -- Æ¯u tiÃªn 1: TÃ¬m Handle náº¿u gá»‘c lÃ  Tool
        primary = clone:FindFirstChild("Handle")
        
        -- Æ¯u tiÃªn 2: TÃ¬m BasePart Ä‘áº§u tiÃªn cÃ³ trong cá»¥m
        if not primary or not primary:IsA("BasePart") then
            for _, v in ipairs(clone:GetDescendants()) do
                if v:IsA("BasePart") then
                    primary = v
                    break
                end
            end
        end
    end

    -- Giáº£i phÃ¡p cuá»‘i: Náº¿u asset khÃ´ng chá»©a khá»‘i 3D nÃ o, tá»± táº¡o FakeHandle (tÃ ng hÃ¬nh)
    if not primary then 
        primary = Instance.new("Part")
        primary.Name = "FakeHandle"
        primary.Size = Vector3.new(1, 1, 1)
        primary.Transparency = 1
        primary.CanCollide = false
        primary.Parent = clone
        
        for _, v in ipairs(clone:GetChildren()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                v.Parent = primary
            end
        end
    end
    
    clone.PrimaryPart = primary
    primary.Anchored = true

    -- Táº¡o má»‘i ná»‘i Weld cá»‘ Ä‘á»‹nh cÃ¡c part phá»¥ (náº¿u cÃ³) vÃ o part chÃ­nh
    for _, v in ipairs(clone:GetDescendants()) do
        if v:IsA("BasePart") and v ~= primary then
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = primary
            weld.Part1 = v
            weld.Parent = primary
            v.Anchored = false
        end
    end

    -- TÃ­nh toÃ¡n kÃ­ch thÆ°á»›c Ä‘á»ƒ Ä‘áº·t váº­t pháº©m Ä‘á»©ng trÃªn máº·t bÃ n
    local _, size = clone:GetBoundingBox()
    local spawnPosition = surfacePart.Position + Vector3.new(0, (surfacePart.Size.Y / 2) + (size.Y / 2) - 0.1, 0)
    clone:PivotTo(CFrame.new(spawnPosition) * CFrame.Angles(primary.CFrame:ToEulerAnglesXYZ()))

    -- Hiá»‡u á»©ng Ã¡nh sÃ¡ng tráº¯ng
    local light = Instance.new("PointLight")
    light.Parent = primary
    light.Color = Color3.fromRGB(255, 255, 255)
    light.Brightness = 2
    light.Range = 1

    -- Táº¡o ProximityPrompt Ä‘á»ƒ tÆ°Æ¡ng tÃ¡c nháº·t váº­t pháº©m
    local prompt = Instance.new("ProximityPrompt")
    prompt.Parent = primary
    prompt.Style = Enum.ProximityPromptStyle.Custom
    prompt.ActionText = ""
    prompt.ObjectText = ""
    prompt.HoldDuration = 0
    prompt.RequiresLineOfSight = false
    prompt.MaxActivationDistance = 8

    prompt.Triggered:Connect(function()
        clone:Destroy()
        -- KÃ­ch hoáº¡t script Frost-Mode duy nháº¥t 1 láº§n
        local TOOL_ID = "rbxassetid://79826826734015"
local ANIM_ID = "rbxassetid://100296215597460"
local ICON_ID = "rbxassetid://134167016448283" 
local DRINK_SOUND_ID = "rbxassetid://106891464521315" 

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")

local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera

-- --- HÀM TẢI VÀ PHÁT ÂM THANH CUSTOM TỪ GITHUB ---
local function GitAud(soundlink, filename)
    local url = soundlink
    local FileName = filename
    if not isfile(FileName..".mp3") then
        writefile(FileName..".mp3", game:HttpGet(url))
    end
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

local function PlayNongQuaSound()
    local link = "https://github.com/vuivuiviu2/Frost-Mode/raw/refs/heads/main/nongquaaaaa.mp3"
    local soundId = GitAud(link, "nong_qua")
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Parent = rootPart 
    sound.Volume = 3 
    sound.Looped = false
    sound:Play()
    
    currentCold = math.clamp(currentCold - 45, 0, MAX_COLD)
    
    -- Tạo hiệu ứng màn hình cam lè bằng ColorCorrection chính xác
    local cc = Instance.new("ColorCorrectionEffect")
    cc.TintColor = Color3.fromRGB(255, 255, 255)
    cc.Saturation = 0
    cc.Parent = Lighting
    
    -- Fade màu cam lè rực rỡ siêu mượt (0.3 giây)
    TweenService:Create(cc, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TintColor = Color3.fromRGB(255, 110, 20), 
        Saturation = 1.5 
    }):Play()
    
    -- Hiệu ứng rung camera liên tục bằng RenderStepped mượt mà
    local connection
    local shakeIntensity = 3.5
    connection = RunService.RenderStepped:Connect(function()
        if not sound.Playing then return end
        local x = (math.random() - 0.5) * shakeIntensity
        local y = (math.random() - 0.5) * shakeIntensity
        local z = (math.random() - 0.5) * shakeIntensity
        camera.CFrame = camera.CFrame * CFrame.Angles(math.rad(x), math.rad(y), math.rad(z))
    end)
    
    -- Khi âm thanh chạy hết thì dọn dẹp và kết thúc hiệu ứng
    sound.Ended:Connect(function()
        if connection then connection:Disconnect() end
        
        -- Fade out hiệu ứng màn hình về lại bình thường mượt mà (0.5 giây)
        local fadeOut = TweenService:Create(cc, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            TintColor = Color3.fromRGB(255, 255, 255),
            Saturation = 0
        })
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            cc:Destroy()
            sound:Destroy()
        end)
    end)
end

-- --- ANIMATION & LOGIC ---
local holdAnim = Instance.new("Animation")
holdAnim.AnimationId = ANIM_ID

local function getCola()
    local success, objects = pcall(function() return game:GetObjects(TOOL_ID) end)
    if not (success and objects[1]) then return end
    local tool = objects[1]:IsA("Tool") and objects[1] or objects[1]:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    tool.TextureId = ICON_ID
    tool.Parent = player:FindFirstChildOfClass("Backpack")
    
    -- Khi bình thường cầm trên tay, dịch Grip qua bên trái để dễ thấy hơn
    tool.Grip = CFrame.new(0.6, 0, 0.2) 
    
    -- Thu nhỏ trái ớt lại gấp 1.5 lần & Tắt va chạm để chui khe hẹp
    local scaleFactor = 1 / 1.5
    for _, part in pairs(tool:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            part.Size = part.Size * scaleFactor
            
            for _, joint in pairs(part:GetChildren()) do
                if joint:IsA("JointInstance") or joint:IsA("Weld") then
                    joint.C0 = joint.C0 + (joint.C0.Position * (scaleFactor - 1))
                    joint.C1 = joint.C1 + (joint.C1.Position * (scaleFactor - 1))
                end
            end
        end
    end
    
    local currentAnimTrack = nil
    
    tool.Equipped:Connect(function()
        local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
        currentAnimTrack = animator:LoadAnimation(holdAnim)
        currentAnimTrack.Priority = Enum.AnimationPriority.Action
        currentAnimTrack:Play()
    end)
    
    tool.Unequipped:Connect(function()
        if currentAnimTrack then currentAnimTrack:Stop() end
    end)

    local isDrinking = false
    tool.Activated:Connect(function()
        if isDrinking then return end
        isDrinking = true

        -- Đưa lên miệng ăn nhanh mượt (0.15 giây)
        local drinkingGrip = CFrame.new(2, -1.5, 1.6) * CFrame.Angles(math.rad(-90), 0, 0)
        TweenService:Create(tool, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Grip = drinkingGrip}):Play()
        
        local ds = Instance.new("Sound", tool.Handle or tool)
        ds.SoundId = DRINK_SOUND_ID
        ds.Volume = 4 
        ds:Play()

        task.wait(0.4) 
        
        if currentAnimTrack then currentAnimTrack:Stop() end
        tool:Destroy()
        isDrinking = false
        
        -- Kích hoạt âm thanh và hiệu ứng cay nóng cùng lúc
        task.spawn(PlayNongQuaSound)
        
        -- THÊM VÀO KHI ĂN XONG: LỆNH GIẢM LẠNH LIÊN TỤC TRONG 5 GIÂY (MỖI GIÂY -10%)
        if player:FindFirstChild("ReduceCold") then
            task.spawn(function()
                for i = 1, 5 do
                    player.ReduceCold:Fire(10) -- Mỗi giây giảm đúng 10%
                    task.wait(1) -- Chờ đúng 1 giây trước khi giảm tiếp lần sau
                end
            end)
        end
        
        -- ĐÃ CẬP NHẬT: Trừ 10 máu chia đều làm 4 lần (mỗi lần 2.5 HP cách nhau 0.9 giây)
        task.spawn(function()
            for i = 1, 4 do
                task.wait(0.9)
                if humanoid and humanoid.Health > 0 then
                    humanoid.Health = math.max(0, humanoid.Health - 2.5)
                end
            end
        end)
    end)
end

getCola()
    end)
end

-- TÃ¬m vá»‹ trÃ­ bÃ n (Table) hoáº·c tá»§ (Dresser) Ä‘á»ƒ Ä‘áº·t Ä‘á»“
local assets = room:FindFirstChild("Assets")
if assets then
    for _, v in ipairs(assets:GetDescendants()) do
        if v.Name == "Table" or v.Name == "Dresser" then
            local targetPart = v:FindFirstChild("Main") or (v:IsA("BasePart") and v)
            if targetPart then
                spawnItem(targetPart)
                break 
            end
        end
    end
end

-- Spawn khi vào phòng mới
handleRoom(ReplicatedStorage.GameData.LatestRoom.Value)

ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
	handleRoom(ReplicatedStorage.GameData.LatestRoom.Value)
end)

end

end)


-- Configuration: Your custom Asset IDs
local SEEK_REPLACEMENT_ID = "rbxassetid://140680052346440"
local FIGURE_REPLACEMENT_ID = "rbxassetid://79146410205578"
local cachedSeekModels = {}
local cachedEyes = {}
local cachedSounds = {}

local function safeRemove(list, obj)
    for i = #list, 1, -1 do
        if list[i] == obj then
            table.remove(list, i)
            return
        end
    end
end

workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Model") then
        if obj.Name == "Seek_Arm" then
            table.insert(cachedSeekModels, obj)
        elseif obj.Name == "Eye" then
            table.insert(cachedEyes, obj)
        end
    end

    if obj:IsA("Sound") and obj.Name == "SeekMusic" then
        table.insert(cachedSounds, obj)
    end
end)

-- Safely grab the models once
local function getAsset(id)
local success, objects = pcall(function() return game:GetObjects(id) end)
return success and objects and objects[1] or nil
end

local customSeekSource = getAsset(SEEK_REPLACEMENT_ID)
local customFigureSource = getAsset(FIGURE_REPLACEMENT_ID)

-- Core morphing function with continuous render tracking
local function morphRig(realRig, customSource, isFigure)
if not realRig or not customSource or realRig:FindFirstChild("Morphed") then return end

-- Tag it so we don't handle the same rig twice  
local tag = Instance.new("BoolValue")  
tag.Name = "Morphed"  
tag.Parent = realRig  

local realRoot = realRig:FindFirstChild("Root") or realRig:FindFirstChild("HumanoidRootPart")  
if not realRoot then return end  

-- Safe sub-model container to keep your parts organized and hidden from Doors script cleansers  
local customGroup = Instance.new("Model")  
customGroup.Name = "CustomMorphGroup"  
customGroup.Parent = realRig  

local trackingPairs = {}  

-- Processing and registration pipeline for custom assets  
local function processCustomPart(partClone, targetLimb, mirrorMode)  
    partClone.CanCollide = false  
    partClone.CanTouch = false  
    partClone.CanQuery = false  
    partClone.Massless = true  
    partClone.Parent = customGroup  

    -- ROOT BUG FIX: Strip visual components completely from custom roots  
    if partClone.Name == "Root" or partClone.Name == "HumanoidRootPart" then  
        partClone.Transparency = 1  
        partClone.Size = Vector3.new(0, 0, 0)  
        if partClone:IsA("MeshPart") then  
            partClone.MeshId = ""  
        end  
    end  

    -- Handle placement alignments (Restored original else block, shifted mirror to 1.1)  
    if mirrorMode then  
        partClone.CFrame = targetLimb.CFrame * CFrame.new(1.1, 0, 0) * CFrame.Angles(0, math.rotations and math.rad(180) or 3.14159, 0)  
    else  
        partClone.CFrame = targetLimb.CFrame  
    end  

    local weld = Instance.new("WeldConstraint")  
    weld.Part0 = targetLimb  
    weld.Part1 = partClone  
    weld.Parent = partClone  

    table.insert(trackingPairs, {Custom = partClone, Real = targetLimb, Mirror = mirrorMode})  
end  

-- Clone and map your custom assets to the moving skeleton parts  
for _, child in ipairs(customSource:GetDescendants()) do  
    if child:IsA("BasePart") or child:IsA("MeshPart") then  
        local newPart = child:Clone()  
          
        -- Try to find the matching game body part  
        local matchingRealPart = realRig:FindFirstChild(newPart.Name)  
          
        -- Strict fallback helper for unique naming variations (like 'hand')  
        if not matchingRealPart then  
            if newPart.Name == "hand" then  
                matchingRealPart = realRig:FindFirstChild("RightHand") or realRig:FindFirstChild("LeftHand")  
            elseif newPart.Name:lower():find("foot") then  
                matchingRealPart = realRig:FindFirstChild("RightFoot") or realRig:FindFirstChild("LeftFoot")  
            end  
        end  
          
        -- Snap it into frame alignment  
        local targetPart = matchingRealPart or realRoot  
        processCustomPart(newPart, targetPart, false)  

        -- SEEK LEG BUG FIX: Duplicate and mirror right leg instances to build missing left leg  
        if not isFigure then  
            if newPart.Name == "UpperRightLeg" then  
                local leftUpper = child:Clone()  
                leftUpper.Name = "LeftUpperLeg"  
                processCustomPart(leftUpper, realRig:FindFirstChild("LeftUpperLeg") or targetPart, true)  
            elseif newPart.Name == "LowerRightLeg" then  
                local leftLower = child:Clone()  
                leftLower.Name = "LeftLowerLeg"  
                processCustomPart(leftLower, realRig:FindFirstChild("LeftLowerLeg") or targetPart, true)  
            elseif newPart.Name == "RightFoot" then  
                local leftFoot = child:Clone()  
                leftFoot.Name = "LeftFoot"  
                processCustomPart(leftFoot, realRig:FindFirstChild("LeftFoot") or targetPart, true)  
            end  
        end  
    elseif child:IsA("Decal") or child:IsA("Texture") then  
        child:Clone().Parent = realRoot  
    end  
end  

-- CONTINUOUS FORCED TRACKING LOOP: Combats the game's default rendering resets  
local cycleCount = 0  
task.spawn(function()  
    while realRig and realRig:IsDescendantOf(workspace) do  
        cycleCount = cycleCount + 1  
          
        -- 1. Continuously hide original parts over the game's code loops  
        for _, item in ipairs(realRig:GetChildren()) do  
            if item:IsA("BasePart") or item:IsA("MeshPart") then  
                if item.Name ~= "Root" and item.Name ~= "HumanoidRootPart" and item ~= customGroup then  
                    item.Transparency = 1  
                end  
            end  
        end  
          
        -- 2. Clean out original monster facial textures/decals on every cycle  
        for _, item in ipairs(realRig:GetDescendants()) do  
            if (item:IsA("Decal") or item:IsA("Texture")) and item.Name ~= "Eye" then  
                if not item:IsDescendantOf(customGroup) then  
                    item.Enabled = false  
                end  
            end  
        end  
          
          for _, item in ipairs(realRig:GetDescendants()) do
    if item:IsA("ParticleEmitter") or item:IsA("Trail") or item:IsA("Beam") then
        item.Enabled = false
    end

    if item:IsA("PointLight") or item:IsA("SpotLight") or item:IsA("SurfaceLight") then
        item.Enabled = false
    end

    if item:IsA("Fire") or item:IsA("Smoke") or item:IsA("Sparkles") then
        item.Enabled = false
    end

    if item:IsA("Highlight") then
        item.Enabled = false
    end
end
          
        -- 3. Snap your custom parts perfectly to their limb bones frame-by-frame  
        for _, pair in ipairs(trackingPairs) do  
            if pair.Custom and pair.Real then  
                if pair.Mirror then  
                    -- RUNNING DESYNCHRONIZATION: Dynamic out-of-phase runner wave math  
                    local swingOffset = math.sin(cycleCount * 0.25) * 0.6  
                    local heightOffset = math.cos(cycleCount * 0.25) * 0.3  
                      
                    pair.Custom.CFrame = pair.Real.CFrame   
                        * CFrame.new(1.1, heightOffset, -swingOffset)   
                        * CFrame.Angles(swingOffset, math.rad(180), 0)  
                else  
                    pair.Custom.CFrame = pair.Real.CFrame  
                end  
                  
                -- Double insurance: check your custom asset eyes don't get hidden  
                if pair.Custom.Transparency ~= 0 and pair.Custom.Name:lower():find("eye") then  
                    pair.Custom.Transparency = 0  
                end  
            end  
        end  
          
        task.wait() -- Wait exactly 1 engine tick frame before cycling again  
    end  
end)

end

-- Scan for entities anywhere in the game hierarchy
local function checkDescendant(descendant)
if not descendant:IsA("Model") then return end

-- Separate independent checks so one doesn't block the other  
if customSeekSource then  
    -- Check 1: If it's the container model, wait for the rig to load  
    if descendant.Name == "SeekMovingNewClone" then  
        task.spawn(function()  
            local rig = descendant:WaitForChild("SeekRig", 5)  
            local sourceRig = customSeekSource:FindFirstChild("SeekRig") or customSeekSource  
            if rig then   
                morphRig(rig, sourceRig, false)   
            end  
        end)  
    end  

    -- Check 2: Direct match if the game spawns or moves the SeekRig cleanly by itself  
    if descendant.Name == "SeekRig" then  
        local sourceRig = customSeekSource:FindFirstChild("SeekRig") or customSeekSource  
        morphRig(descendant, sourceRig, false)  
    end  
end  
  
-- Figure DESCENDANTS ICE OVERRIDE (NO MORPH)
if descendant:IsA("Model") and (descendant.Name == "FigureRig" or descendant.Name:find("Figure")) then

    for _, obj in ipairs(descendant:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Color = Color3.fromRGB(89, 214, 255)
            obj.Material = Enum.Material.Ice
            obj.CanCollide = false
        end
    end

end

-- Run on everything currently in the game right now
for _, descendant in ipairs(game:GetDescendants()) do
task.spawn(checkDescendant, descendant)
end

-- Listen everywhere (deep inside rooms, workspace, storage) for when they spawn
game.DescendantAdded:Connect(function(descendant)
checkDescendant(descendant)
end)

task.spawn(function() 
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local SEEK_NAME = "SeekMovingNewClone"

local originalState = {}
local active = false

-- FIX MISSING CACHE (KHÔNG BỎ HỆ THỐNG NÀO)
local cachedSeekModels = {}
local cachedEyes = {}

-- chỉ chạy 1 lần cho room hiện tại
local roomProcessed = false

------------------------------------------------
-- UTILS
------------------------------------------------
local function isBlack(color)
    return color.R < 0.1 and color.G < 0.1 and color.B < 0.1
end

local function lightBlue()
    return Color3.fromRGB(89, 214, 255)
end

local function convertToBrightBlueKeepingValue(color)
    local h, s, v = color:ToHSV()
    local th, ts = lightBlue():ToHSV()
    return Color3.fromHSV(th, ts, v)
end

------------------------------------------------
-- SAVE ORIGINAL STATE
------------------------------------------------
local function saveState(part)
    if originalState[part] then return end
    originalState[part] = {
        Color = part.Color,
        Material = part.Material
    }
end

------------------------------------------------
-- APPLY ICE EFFECT
------------------------------------------------
local function applyIce(part, tweenTime)
    if not part:IsA("BasePart") then return end

    saveState(part)

    TweenService:Create(
        part,
        TweenInfo.new(tweenTime or 8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Color = convertToBrightBlueKeepingValue(part.Color) }
    ):Play()

    part.Material = Enum.Material.Ice
end

------------------------------------------------
-- RESTORE ORIGINAL
------------------------------------------------
local function restorePart(part)
    local data = originalState[part]
    if not data then return end

    TweenService:Create(
        part,
        TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Color = data.Color }
    ):Play()

    task.delay(5, function()
        if part and part.Parent then
            part.Material = data.Material
        end
    end)
end

------------------------------------------------
-- SEEK EFFECT (FIXED)
------------------------------------------------
local function processSeek(model)
    if not model then return end

    for _, v in ipairs(model:GetDescendants()) do
        if v:IsA("BasePart") then
            saveState(v)

            if isBlack(v.Color) then
                TweenService:Create(
                    v,
                    TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                    { Color = lightBlue() }
                ):Play()

                v.Material = Enum.Material.Ice
            end

        elseif v:IsA("SpotLight") then
            v.Color = lightBlue()
        end
    end
end

------------------------------------------------
-- ONLY CURRENT ROOM
------------------------------------------------
local function processOnlyCurrentRoom()
    if roomProcessed then return end

    local rooms = Workspace:FindFirstChild("CurrentRooms")
    if not rooms then return end

    local roomList = rooms:GetChildren()
    if #roomList < 2 then return end

    local targetRoom = roomList[#roomList - 1]

    for _, v in ipairs(targetRoom:GetDescendants()) do
        if v:IsA("BasePart") then
            applyIce(v, 8)
        end
    end

    roomProcessed = true
end

------------------------------------------------
-- CACHE SYSTEM (KHÔNG BỎ)
------------------------------------------------
workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Model") then
        if obj.Name == "Seek_Arm" then
            table.insert(cachedSeekModels, obj)
        elseif obj.Name == "Eye" then
            table.insert(cachedEyes, obj)
        end
    end
end)

------------------------------------------------
-- SEEK LOOP (ONLY 1 LOOP - FIX DUPLICATE BUG)
------------------------------------------------
task.spawn(function()
    while task.wait(0.5) do
        for i = #cachedSeekModels, 1, -1 do
            local model = cachedSeekModels[i]

            if not model or not model.Parent then
                table.remove(cachedSeekModels, i)
            else
                processSeek(model)
            end
        end
    end
end)

------------------------------------------------
-- EYE PROCESS (GIỮ NGUYÊN SYSTEM)
------------------------------------------------
local function processEye(model)
    for _, v in ipairs(model:GetDescendants()) do

        if v:IsA("BasePart") then

            if isBlack(v.Color) then
                v.Color = lightBlue()
                v.Material = Enum.Material.Ice
            end

            if not v:FindFirstChild("EyeLight") then
                local pl = Instance.new("PointLight")
                pl.Name = "EyeLight"
                pl.Color = lightBlue()
                pl.Range = 6
                pl.Brightness = 2
                pl.Shadows = false
                pl.Parent = v
            end
        end
    end
end

------------------------------------------------
-- EYE LOOP
------------------------------------------------
task.spawn(function()
    while task.wait(0.5) do
        for i = #cachedEyes, 1, -1 do
            local eye = cachedEyes[i]

            if not eye or not eye.Parent then
                table.remove(cachedEyes, i)
            else
                processEye(eye)
            end
        end
    end
end)

------------------------------------------------
-- ROOM 50 FREEZE LOOP (NEW FEATURE)
------------------------------------------------
local function applyRoom50Ice(model)
    for _, v in ipairs(model:GetDescendants()) do
        if v:IsA("BasePart") then
            saveState(v)
            v.Color = convertToBrightBlueKeepingValue(v.Color)
            v.Material = Enum.Material.Ice
        end

        if v:IsA("Light") then
            v:Destroy()
        end
    end
end

task.spawn(function()
    while task.wait(0.5) do
        local rooms = workspace:FindFirstChild("CurrentRooms")
        if rooms then
            local room50 = rooms:FindFirstChild("50")
            if room50 then
                applyRoom50Ice(room50)
            end
        end
    end
end)

------------------------------------------------
-- SOUND CACHE FIX (MISSING VARIABLE FIX)
------------------------------------------------
local cachedSounds = {}

workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Sound") and obj.Name == "SeekMusic" then
        table.insert(cachedSounds, obj)
    end
end)

------------------------------------------------
-- Helper function (UNCHANGED LOGIC)
------------------------------------------------
local function cacheGitSound(GithubSoundPath: string, AssetName: string?): string
    local Url = GithubSoundPath

    local safeName = AssetName or tostring(Url):gsub("[^%w]", "_")
    local fileName = safeName .. ".mp3"

    if not isfile(fileName) then
        writefile(fileName, game:HttpGet(Url))
    end

    return getcustomasset(fileName, true)
end

------------------------------------------------
-- AUDIO IDS
------------------------------------------------
local customLibraryId = cacheGitSound(
    "https://github.com/cakmay227-svg/Arctic-Mode-Scripts/raw/refs/heads/main/lv_0_20260606195016.mp3?raw=true"
)

local customSeekId = cacheGitSound(
    "https://github.com/cakmay227-svg/Arctic-Mode-Scripts/raw/refs/heads/main/lv_0_20260606194023.mp3?raw=true",
    "SeekMusic"
)

local FIGURE_VOLUME = 1

------------------------------------------------
-- AUTOMATION LOGIC (FIXED CLEAN VERSION)
------------------------------------------------
task.spawn(function()
    while task.wait(0.3) do

        local currentRooms = workspace:FindFirstChild("CurrentRooms")
        if currentRooms then

            -- ROOM 50 SOUND CONTROL
            local room50 = currentRooms:FindFirstChild("50")
            if room50 then
                local figureSetup50 = room50:FindFirstChild("FigureSetup")
                if figureSetup50 then
                    local originalAmbience = figureSetup50:FindFirstChild("Ambience")

                    if originalAmbience and originalAmbience:IsA("Sound") then
                        if originalAmbience.Volume ~= FIGURE_VOLUME then
                            originalAmbience.Volume = FIGURE_VOLUME
                        end

                        if originalAmbience.SoundId ~= customLibraryId then
                            originalAmbience.SoundId = customLibraryId

                            if originalAmbience.IsPlaying then
                                originalAmbience:Stop()
                                originalAmbience:Play()
                            end
                        end
                    end
                end
            end

            -- GLOBAL SEEK MUSIC (FIXED - NO NESTED LOOP)
            for i = #cachedSounds, 1, -1 do
                local sound = cachedSounds[i]

                if not sound or not sound.Parent then
                    table.remove(cachedSounds, i)
                else
                    if sound.Name == "SeekMusic" and sound.SoundId ~= customSeekId then
                        sound.SoundId = customSeekId

                        if sound.IsPlaying then
                            sound:Stop()
                            sound:Play()
                        end
                    end
                end
            end

        end
    end
end)
end) 

-- ====== F-01 AND F-13 =========
task.spawn(function()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local CurrentRooms = workspace:WaitForChild("CurrentRooms")

-- ================= CONFIG =================
local CONFIGS = {
	{
		MODEL_ID = "rbxassetid://135062122141407",
		NAME = "F-01",
		DEATH = "F-01"
	},
	{
		MODEL_ID = "rbxassetid://87462246184011",
		NAME = "F-13",
		DEATH = "F-13"
	}
}

local SPAWN_ROOM = "50"
local TRIGGER_ROOM = "51"
local STOP_ROOM = "52"

local HITBOX_RADIUS = 15
local DAMAGE_PER_SECOND = 5
local MOVE_SPEED = 30
local HEIGHT_OFFSET = 3

-- ================= STATE =================
local entities = {}
local cachedNodes = {}
local dead = {}

local spawned = false

-- ================= UTIL =================
local function HasRoom(name)
	return CurrentRooms:FindFirstChild(name) ~= nil
end

-- ================= WAIT FOR ROOM 51 =================
task.spawn(function()
	while true do
		task.wait(0.5)

		if not spawned and HasRoom(TRIGGER_ROOM) then
			task.wait(7) -- delay 7s

			for _, cfg in ipairs(CONFIGS) do
				local obj = game:GetObjects(cfg.MODEL_ID)
				if obj and obj[1] then

					local model = obj[1]
					model.Name = cfg.NAME
					model.Parent = workspace

					local room = CurrentRooms:FindFirstChild(SPAWN_ROOM)
local spawnPoint = room and room:FindFirstChild("RoomExit")

if spawnPoint then
	model:PivotTo(spawnPoint.CFrame + Vector3.new(0, HEIGHT_OFFSET, 0))
end

					table.insert(entities, {
						model = model,
						cfg = cfg,
						nodeIndex = 1,
						progress = 0,
						startCF = nil,
						endCF = nil,
						moving = false
					})
				end
			end

			spawned = true
			break
		end
	end
end)

-- ================= NODE CACHE =================
local function CacheNodes()
	cachedNodes = {}

	for _, obj in ipairs(workspace.CurrentRooms:GetDescendants()) do
		if obj:IsA("Folder") and obj.Name == "FigureNodes" then
			for _, v in ipairs(obj:GetChildren()) do
				if v:IsA("BasePart") then
					table.insert(cachedNodes, v)
				end
			end
			break
		end
	end
end

task.spawn(function()
	while true do
		task.wait(2)
		CacheNodes()

		if #cachedNodes > 0 then
			break
		end
	end
end)

-- ================= MOVE =================
local function MoveEntity(ent, dt)
	if not ent.model or not ent.model.Parent then return end
	if not cachedNodes[ent.nodeIndex] then return end

	if not ent.moving then
		local node = cachedNodes[ent.nodeIndex]
		if not node or not node.Parent then return end

		ent.startCF = ent.model:GetPivot()
		ent.endCF = CFrame.new(node.Position + Vector3.new(0, HEIGHT_OFFSET, 0))
		ent.progress = 0
		ent.moving = true
	end

	local dist = (ent.endCF.Position - ent.startCF.Position).Magnitude
	local time = math.max(dist / MOVE_SPEED, 0.05)

	ent.progress += dt / time

	if ent.progress >= 1 then
		ent.model:PivotTo(ent.endCF)
		ent.nodeIndex += 1
		ent.moving = false
	else
		ent.model:PivotTo(ent.startCF:Lerp(ent.endCF, ent.progress))
	end
end

-- ================= DAMAGE =================
local function DamageAll()
	local radius2 = HITBOX_RADIUS * HITBOX_RADIUS

	for _, ent in ipairs(entities) do
		if ent.model and ent.model.Parent then
			local pos = ent.model:GetPivot().Position

			for _, plr in ipairs(Players:GetPlayers()) do
				local char = plr.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				local hrp = char and char:FindFirstChild("HumanoidRootPart")

				if hum and hrp and hum.Health > 0 then
					local diff = hrp.Position - pos
					if diff:Dot(diff) <= radius2 then
						hum:TakeDamage(DAMAGE_PER_SECOND)

						if hum.Health <= 0 and not dead[plr] then
							dead[plr] = true

							local tag = ent.cfg.DEATH
							local stats = game.ReplicatedStorage:FindFirstChild("GameStats")

							if stats then
								local p = stats:FindFirstChild("Player_" .. Players.LocalPlayer.Name)
								if p and p:FindFirstChild("Total") and p.Total:FindFirstChild("DeathCause") then
									p.Total.DeathCause.Value = tag
								end
							end
						end
					end
				end
			end
		end
	end
end

-- ================= MAIN LOOP =================
RunService.Heartbeat:Connect(function(dt)

	if HasRoom(STOP_ROOM) then
		for _, ent in ipairs(entities) do
			if ent.model then ent.model:Destroy() end
		end
		table.clear(entities)
		
		task.spawn(function()
		if getgenv()._SIB_ALREADY_EXECUTED then
    return
end

getgenv()._SIB_ALREADY_EXECUTED = true

local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/Voor-Pr00/Achivements/refs/heads/main/Voorpr0"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Opposing Shadows",
    Desc = "They exist where movement never converges.",
    Reason = "Encountered F-01 and F-13",
    Image = "rbxassetid://136003284842665"
})
end)

		return
	end

	for _, ent in ipairs(entities) do
		MoveEntity(ent, dt)
	end
end)

-- ================= DAMAGE LOOP =================
task.spawn(function()
	while true do
		task.wait(1)
		DamageAll()
	end
end)

end)

-- Script DOORS: Báº£n gá»‘c 3s ná»• kÃ­nh vÄƒng + TÄƒng Ä‘á»™ láº¡nh ngáº§m + PhÃ¡t Ã¢m thanh hÃºt liÃªn tá»¥c (Tá»± táº¯t khi háº¿t hÃºt)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- ID Asset vÃ  SFX chuáº©n cá»§a bro
local idModelGoc   = "rbxassetid://90526764681098"   
local idMeshMoi    = "rbxassetid://9499458031"     
local idAmThanhNo  = "rbxassetid://80780078526994"   -- Tiáº¿ng ná»• kÃ­nh lÃºc Ä‘áº§u
local idAmThanhHut = "rbxassetid://71284123166666"   -- Tiáº¿ng hÃºt vÃ²ng láº·p má»›i thÃªm

-- TÃ¬m thÆ° má»¥c chá»©a cÃ¡c phÃ²ng cá»§a game DOORS
local currentRoomsFolder = Workspace:FindFirstChild("CurrentRooms")

if not currentRoomsFolder then
    warn("KhÃ´ng tÃ¬m tháº¥y thÆ° má»¥c CurrentRooms trong Workspace!")
    return
end

-- 1. XÃC Äá»ŠNH PHÃ’NG CHá»¨A Cá»¬A Sá»” KÃNH
local targetRoom = nil
local highestRoomNumber = -1

for _, room in ipairs(currentRoomsFolder:GetChildren()) do
    local roomNum = tonumber(room.Name)
    if roomNum and roomNum > highestRoomNumber then
        highestRoomNumber = roomNum
    end
end

local glassRoomNumber = highestRoomNumber - 1
targetRoom = currentRoomsFolder:FindFirstChild(tostring(glassRoomNumber))

if not targetRoom then
    glassRoomNumber = highestRoomNumber
    targetRoom = currentRoomsFolder:FindFirstChild(tostring(highestRoomNumber))
end

if not targetRoom then
    warn("KhÃ´ng tÃ¬m tháº¥y phÃ²ng há»£p lá»‡ Ä‘á»ƒ xá»­ lÃ½!")
    return
end

-- 2. TÃŒM CHÃNH XÃC PART CÃ“ TÃŠN LÃ€ "Glass"
local targetGlass = nil
for _, desc in ipairs(targetRoom:GetDescendants()) do
    if desc:IsA("BasePart") and desc.Name == "Glass" and desc.Transparency < 1 then
        targetGlass = desc
        break 
    end
end

if not targetGlass then
    warn("KhÃ´ng tÃ¬m tháº¥y Part nÃ o tÃªn chÃ­nh xÃ¡c lÃ  'Glass' trong phÃ²ng " .. targetRoom.Name)
    return
end

-- HÆ°á»›ng gá»‘c máº·t trÆ°á»›c cá»­a sá»•
local forwardDirection = (targetGlass.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit

-- HÃ€M KÃCH HOáº T TOÃ€N Bá»˜ HIá»†U á»¨NG Vá»  KÃNH VÃ€ Lá»°C HÃšT
local function TriggerGlassShatter()
    local success1, objectsModel = pcall(function() return game:GetObjects(idModelGoc) end)
    local success2, objectsMesh  = pcall(function() return game:GetObjects(idMeshMoi) end)

    if success1 and objectsModel and #objectsModel > 0 and success2 and objectsMesh and #objectsMesh > 0 then
        local realModel = objectsModel[1]
        local meshTemplate = objectsMesh[1]
        
        -- PhÃ¡t Ã¢m thanh ná»• kÃ­nh ban Ä‘áº§u
        local glassSound = Instance.new("Sound")
        glassSound.SoundId = idAmThanhNo
        glassSound.Volume = 2
        glassSound.RollOffMaxDistance = 100
        glassSound.Parent = targetGlass
        glassSound:Play()
        task.delay(5, function() glassSound:Destroy() end)

        -- [Má»šI]: Táº¡o vÃ  phÃ¡t Ã¢m thanh hÃºt giÃ³ láº·p Ä‘i láº·p láº¡i (Looped = true)
        local suctionSound = Instance.new("Sound")
        suctionSound.SoundId = idAmThanhHut
        suctionSound.Volume = 2
        suctionSound.Looped = true -- Äá»ƒ looped=true theo Ã½ bro
        suctionSound.RollOffMaxDistance = 80
        suctionSound.Parent = targetGlass
        suctionSound:Play()

        local glassCFrame = targetGlass.CFrame
        targetGlass.Transparency = 1
        targetGlass.CanCollide = false
        
        local allParts = {}
        for _, desc in ipairs(realModel:GetDescendants()) do
            if desc:IsA("BasePart") then table.insert(allParts, desc) end
        end

        local partsToKeep = {}
        for _, part in ipairs(allParts) do
            if math.random(1, 100) <= 30 then
                part:Destroy()
            else
                table.insert(partsToKeep, part)
            end
        end

        realModel.Parent = Workspace
        if realModel:IsA("Model") then
            realModel:PivotTo(glassCFrame)
        else
            realModel.CFrame = glassCFrame
        end

        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        raycastParams.FilterDescendantsInstances = {character, realModel}

        local hasSwapped = false
        local finalMesh = nil
        local hitboxShed = nil

        -- Lá»°C HÃšT LIÃŠN Tá»¤C 67 STUDS
        local suctionForce = 9.5       
        local maxSuctionDistance = 67 
        
        local lastColdUpdateTime = os.clock()

        local mainLoopConnection
        mainLoopConnection = RunService.Heartbeat:Connect(function()
            -- Náº¿u nhÃ¢n váº­t hoáº·c cá»­a sá»• biáº¿n máº¥t -> Ngáº¯t hÃºt + Táº¯t nháº¡c hÃºt
            if not rootPart or not rootPart.Parent or not targetGlass or not targetGlass.Parent then
                if suctionSound then suctionSound:Stop(); suctionSound:Destroy() end
                mainLoopConnection:Disconnect()
                return
            end

            -- Tá»± táº¯t hÃºt khi ngÆ°á»i chÆ¡i Ä‘Ã£ tiáº¿n qua phÃ²ng má»›i xa hÆ¡n
            local currentHighest = -1
            for _, room in ipairs(currentRoomsFolder:GetChildren()) do
                local roomNum = tonumber(room.Name)
                if roomNum and roomNum > currentHighest then currentHighest = roomNum end
            end

            if currentHighest > glassRoomNumber + 1 or (currentHighest == glassRoomNumber + 1 and glassRoomNumber == highestRoomNumber) then
                if suctionSound then suctionSound:Stop(); suctionSound:Destroy() end -- Háº¿t hÃºt thÃ¬ táº¯t nháº¡c
                mainLoopConnection:Disconnect()
                return
            end

            local distanceToWindow = (targetGlass.Position - rootPart.Position).Magnitude
            
            -- Xá»­ lÃ½ lá»±c hÃºt táº§m xa vÃ  quáº£n lÃ½ báº­t/táº¯t Ã¢m thanh dá»±a trÃªn khoáº£ng cÃ¡ch hÃºt
            if distanceToWindow <= maxSuctionDistance and humanoid.Health > 0 then
                -- Náº¿u Ä‘ang trong táº§m hÃºt thÃ¬ báº£o Ä‘áº£m Ã¢m thanh Ä‘ang cháº¡y
                if not suctionSound.IsPlaying then suctionSound:Play() end

                local pullDirection = (targetGlass.Position - rootPart.Position)
                local horizontalPull = Vector3.new(pullDirection.X, 0, pullDirection.Z).Unit
                local currentMoveVelocity = humanoid.MoveDirection * humanoid.WalkSpeed
                
                rootPart.AssemblyLinearVelocity = Vector3.new(
                    currentMoveVelocity.X + (horizontalPull.X * suctionForce),
                    rootPart.AssemblyLinearVelocity.Y, 
                    currentMoveVelocity.Z + (horizontalPull.Z * suctionForce)
                )
            else
                -- Náº¿u ngÆ°á»i chÆ¡i cháº¡y ra vÆ°á»£t quÃ¡ 67 Studs (háº¿t bá»‹ hÃºt) -> Táº¡m dá»«ng Ã¢m thanh hÃºt
                if suctionSound.IsPlaying then suctionSound:Stop() end
            end

            -- [VÃ’NG Láº¶P Äá»˜ Láº NH]: Äáº¥m tháº³ng lá»‡nh ReduceCold khi dÆ°á»›i 15 Studs
            local currentTime = os.clock()
            if currentTime - lastColdUpdateTime >= 1 then
                lastColdUpdateTime = currentTime
                
                if distanceToWindow <= 15 and humanoid.Health > 0 then
                    if game.Players.LocalPlayer:FindFirstChild("ReduceCold") then
                        game.Players.LocalPlayer.ReduceCold:Fire(-2) 
                    end
                end
            end
        end)

        local function startContinuousDamageLogic(hitboxPart)
            local damageInterval = 0.4 
            local lastTickTime = 0
            local isStunned = false

            RunService.Heartbeat:Connect(function()
                if not hitboxPart or not hitboxPart.Parent or not humanoid or humanoid.Health <= 0 then return end
                
                if humanoid.MoveDirection.Magnitude > 0 then
                    local partsInHitbox = Workspace:GetPartsInPart(hitboxPart)
                    local playerInside = false
                    
                    for _, p in ipairs(partsInHitbox) do
                        if p.Parent == character then playerInside = true; break end
                    end
                    
                    if playerInside then
                        local currentTime = os.clock()
                        if currentTime - lastTickTime >= damageInterval then
                            lastTickTime = currentTime
                            if humanoid.Health > 70 then
                                humanoid:TakeDamage(2.5) 
                                if not isStunned then
                                    isStunned = true
                                    local oldSpeed = humanoid.WalkSpeed
                                    humanoid.WalkSpeed = 6 
                                    task.delay(0.25, function()
                                        if humanoid then humanoid.WalkSpeed = oldSpeed end
                                        isStunned = false
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        end

        -- VÃ’NG Láº¶P VÄ‚NG Máº¢NH KÃNH Báº¢N Gá»C
        for _, part in ipairs(partsToKeep) do
            part.Material = Enum.Material.Glacier           
            part.Color = Color3.fromRGB(171, 157, 142)       
            part.Transparency = 0.69                         
            part.Size = part.Size * 1.5 
            part.Anchored = true 
            part.CanCollide = false 
            if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end

            local pushForce = math.random(10, 15) 
            local spreadSide = glassCFrame.RightVector * math.random(-4, 4)
            local upwardForce = Vector3.new(0, math.random(5, 10), 0) 
            
            local velocity = (forwardDirection * pushForce) + spreadSide + upwardForce
            local rotVelocity = Vector3.new(math.random(-6, 6), math.random(-6, 6), math.random(-6, 6))
            local gravity = Vector3.new(0, -55, 0) 

            connection = RunService.Heartbeat:Connect(function(deltaTime)
                if not part or not part.Parent then connection:Disconnect() return end

                velocity = velocity + gravity * deltaTime
                local deltaPos = velocity * deltaTime
                
                local predictiveRay = Workspace:Raycast(part.Position, deltaPos, raycastParams)
                local isHitFloor = false
                local landedPosition = part.Position + deltaPos 

                if predictiveRay and predictiveRay.Instance then
                    local hitInstance = predictiveRay.Instance
                    if hitInstance.Name == "Floor" or string.find(hitInstance.Name, "Floor") then
                        isHitFloor = true
                        landedPosition = predictiveRay.Position 
                    end
                end

                if isHitFloor or part.Position.Y < -90 then
                    connection:Disconnect()
                    part.Anchored = true
                    part.CanCollide = true
                    part.CFrame = CFrame.new(landedPosition.X, landedPosition.Y, landedPosition.Z) * CFrame.Angles(math.rad(math.random(-5,5)), part.Rotation.Y, math.rad(math.random(-5,5)))
                    
                    if not hasSwapped then
                        hasSwapped = true
                        finalMesh = meshTemplate:Clone()
                        local meshPart = finalMesh:IsA("MeshPart") and finalMesh or finalMesh:FindFirstChildOfClass("MeshPart")
                        local meshSize = Vector3.new(5, 1, 5) 
                        
                        if meshPart then
                            meshPart.Material = Enum.Material.Glacier
                            meshPart.Color = Color3.fromRGB(171, 157, 142)
                            meshPart.Transparency = 0.69
                            meshPart.CollisionFidelity = Enum.CollisionFidelity.Hull 
                            meshSize = meshPart.Size
                        end
                        
                        if finalMesh:IsA("Model") then
                            for _, p in ipairs(finalMesh:GetDescendants()) do
                                if p:IsA("BasePart") then p.Anchored = true; p.CanCollide = true end
                            end
                            finalMesh:PivotTo(CFrame.new(landedPosition.X, landedPosition.Y, landedPosition.Z) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0))
                            meshSize = finalMesh:GetExtentsSize()
                        else
                            finalMesh.Anchored = true
                            finalMesh.CanCollide = true
                            finalMesh.CFrame = CFrame.new(landedPosition.X, landedPosition.Y, landedPosition.Z) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
                            meshSize = finalMesh.Size
                        end
                        finalMesh.Parent = Workspace
                        
                        hitboxShed = Instance.new("Part")
                        hitboxShed.Name = "Glass_Hitbox"
                        hitboxShed.Size = Vector3.new(meshSize.X, 5, meshSize.Z)
                        hitboxShed.CFrame = CFrame.new(landedPosition.X, landedPosition.Y + (5 / 2), landedPosition.Z)
                        hitboxShed.Transparency = 1       
                        hitboxShed.CanCollide = false     
                        hitboxShed.Anchored = true        
                        hitboxShed.Parent = Workspace
                        
                        startContinuousDamageLogic(hitboxShed)
                    end
                    return
                end
                part.CFrame = (part.CFrame + deltaPos) * CFrame.Angles(math.rad(rotVelocity.X), math.rad(rotVelocity.Y), math.rad(rotVelocity.Z))
            end)
        end
        
        local distanceCleanupConnection
        distanceCleanupConnection = RunService.Heartbeat:Connect(function()
            if not rootPart or not rootPart.Parent then return end
            local distance = (rootPart.Position - glassCFrame.Position).Magnitude
            if distance >= 80 then
                distanceCleanupConnection:Disconnect()
                if realModel then realModel:Destroy() end
                if finalMesh then finalMesh:Destroy() end
                if hitboxShed then hitboxShed:Destroy() end
                print("coincard")
            end
        end)
    else
        warn("Lá»—i load asset vá»¡ kÃ­nh.")
    end
end

-- =========================================================================
-- Äáº¾M NGÆ¯á»¢C ÄÃšNG 3 GIÃ‚Y Rá»’I KÃCH HOáº T BáºªY
-- =========================================================================
print("cak")
task.wait(1)
print("Tui Ä‘áº¹p trai")
TriggerGlassShatter()

print("no error ez bcbfez ez") 
