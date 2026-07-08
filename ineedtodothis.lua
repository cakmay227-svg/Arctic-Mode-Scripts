
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local Ended = false
local originalMiniGame = player.PlayerGui.Main.PandemoniumMiniGame

local miniGame = originalMiniGame:Clone()
miniGame.Name = "PandemoniumMiniGameClone"
miniGame.Parent = player.PlayerGui.Main
miniGame.Background.Frame.TextLabel.Text = "Good Luck"

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local ASSET_ID = "rbxassetid://101293062691113"

task.spawn(function()
function GitAud(soundgit, filename)
local url = soundgit
local FileName = filename

writefile(FileName .. ".mp3", game:HttpGet(url))  
return (getcustomasset or getsynasset)(FileName .. ".mp3")

end

function CustomGitSound(soundlink, volume, filename, soundName, parent, looped)
local sound = Instance.new("Sound")

sound.SoundId = GitAud(soundlink, filename)  
sound.Parent = parent or workspace  
sound.Volume = volume or 1  
sound.RollOffMaxDistance = 400  
sound.RollOffMinDistance = 5  
sound.PlaybackSpeed = 1  
sound.Name = soundName or "bgtheme"  
sound.Looped = looped or false  

sound:Play()  

return sound

end

local objects = game:GetObjects(ASSET_ID)
if #objects == 0 then
warn("Không load được asset!")
return
end

local obj = objects[1]

-- Nếu chỉ là BasePart thì bọc vào Model
local model
if obj:IsA("Model") then
model = obj
elseif obj:IsA("BasePart") then
model = Instance.new("Model")
obj.Parent = model
model.PrimaryPart = obj
else
warn("Asset không phải Model hoặc BasePart!")
return
end

model.Parent = workspace
model.Name = "HarbingerChecking"

local spawnPos = hrp.Position + hrp.CFrame.LookVector * -3

if not model.PrimaryPart then
local pp = model:FindFirstChildWhichIsA("BasePart", true)
if pp then
model.PrimaryPart = pp
end
end

if model.PrimaryPart then
model:PivotTo(CFrame.new(spawnPos))
else
warn("Model không có BasePart!")
end
end)

local PlayerModule = require(player.PlayerScripts:WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()

Controls:Disable()

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local camera = workspace.CurrentCamera

-- Lưu lại độ nhạy chuột gốc của ông để tí nữa còn trả lại

local Config = {
FlickerSpeed = 75,
MaxDarkness = 0.2
}

local ShakeConfig = {
Intensity = 8,
SpeedMultiplier = 0.5
}

local original = {}
local fadeObjects = {miniGame}

for _, v in ipairs(miniGame:GetDescendants()) do
table.insert(fadeObjects, v)
end

function GitAud(soundgit, filename)
local url = soundgit
local FileName = filename

writefile(FileName .. ".mp3", game:HttpGet(url))  
return (getcustomasset or getsynasset)(FileName .. ".mp3")

end

function CustomGitSound(soundlink, volume, filename, soundName, parent, looped)
local sound = Instance.new("Sound")

sound.SoundId = GitAud(soundlink, filename)  
sound.Parent = parent or workspace  
sound.Volume = volume or 1  
sound.RollOffMaxDistance = 400  
sound.RollOffMinDistance = 5  
sound.PlaybackSpeed = 1  
sound.Name = soundName or "bgtheme"  
sound.Looped = looped or false  

sound:Play()  

return sound

end

local MainSound = workspace:WaitForChild("HarbingerTheme")

-- đợi sound sẵn sàng
repeat
task.wait()
until MainSound.IsLoaded

local ThemeDuration = MainSound.TimePosition

print("Harbinger Theme Current Time:", ThemeDuration)

local PushSounds = {
{
Url = "https://github.com/cakmay227-svg/random/raw/refs/heads/main/ch%E1%BA%A3o%20_1.mp3",
File = "chao_1"
},

{  
	Url = "https://github.com/cakmay227-svg/random/raw/refs/heads/main/ch%E1%BA%A3o%20_2.mp3",  
	File = "chao_2"  
},  

{  
	Url = "https://github.com/cakmay227-svg/random/raw/refs/heads/main/ch%E1%BA%A3o%20_3.mp3",  
	File = "chao_3"  
},  

{  
	Url = "https://github.com/cakmay227-svg/random/raw/refs/heads/main/ch%E1%BA%A3o%20_4.mp3",  
	File = "chao_4"  
}

}

local function PlayRandomPushSound()

local data = PushSounds[math.random(#PushSounds)]  

local sound = Instance.new("Sound")  

sound.SoundId = GitAud(  
	data.Url,  
	data.File .. "_" .. tostring(math.random(100000))  
)  

sound.Name = "Push_" .. data.File  
sound.Volume = 4  
sound.Parent = workspace  
sound.RollOffMaxDistance = 400  
sound.RollOffMinDistance = 5  

sound:Play()  

sound.Ended:Connect(function()  
	sound:Destroy()  
end)

end

miniGame.Visible = true

local tweens = {}

local circle
local originalCircleSize

for _, v in ipairs(miniGame:GetDescendants()) do
if v:IsA("ImageLabel") and v.Name == "circle" then
circle = v
originalCircleSize = v.Size

circle.Visible = false -- Ẩn ngay từ đầu  

	break  
end

end

for _, v in ipairs(fadeObjects) do
local goals = {}

-- Circle sẽ tween riêng

if v == circle then
continue
end

if v:IsA("CanvasGroup") then  
	original[v] = {  
		GroupTransparency = v.GroupTransparency  
	}  
	v.GroupTransparency = 1  
	goals.GroupTransparency = original[v].GroupTransparency  

elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then  
	original[v] = {  
		ImageTransparency = v.ImageTransparency  
	}  
	v.ImageTransparency = 1  
	goals.ImageTransparency = original[v].ImageTransparency  

elseif v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then  
	original[v] = {  
		TextTransparency = v.TextTransparency,  
		TextStrokeTransparency = v.TextStrokeTransparency  
	}  
	v.TextTransparency = 1  
	v.TextStrokeTransparency = 1  

	goals.TextTransparency = original[v].TextTransparency  
	goals.TextStrokeTransparency = original[v].TextStrokeTransparency  

elseif v:IsA("Frame") then  
	original[v] = {  
		BackgroundTransparency = v.BackgroundTransparency  
	}  
	v.BackgroundTransparency = 1  
	goals.BackgroundTransparency = original[v].BackgroundTransparency  

elseif v:IsA("ScrollingFrame") then  
	original[v] = {  
		BackgroundTransparency = v.BackgroundTransparency,  
		ScrollBarImageTransparency = v.ScrollBarImageTransparency  
	}  
	v.BackgroundTransparency = 1  
	v.ScrollBarImageTransparency = 1  

	goals.BackgroundTransparency = original[v].BackgroundTransparency  
	goals.ScrollBarImageTransparency = original[v].ScrollBarImageTransparency  

elseif v:IsA("UIStroke") then  
	original[v] = {  
		Transparency = v.Transparency  
	}  
	v.Transparency = 1  
	goals.Transparency = original[v].Transparency  
end  

if next(goals) then  
	table.insert(tweens,  
		TweenService:Create(  
			v,  
			TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),  
			goals  
		)  
	)  
end

end

for _, tween in ipairs(tweens) do
tween:Play()
end

-- Đợi toàn bộ UI hiện xong
task.wait(2)

-- Circle xuất hiện sau cùng
if circle then
circle.Visible = true

local center = circle.AnchorPoint  
local oldPos = circle.Position  

circle.Size = UDim2.new(  
	originalCircleSize.X.Scale / 10,  
	originalCircleSize.X.Offset / 10,  
	originalCircleSize.Y.Scale / 10,  
	originalCircleSize.Y.Offset / 10  
)  

TweenService:Create(  
circle,  
TweenInfo.new(1),  
{  
    Size = originalCircleSize  
}

):Play()

task.wait(1)

end

task.spawn(function()
task.wait(2)
TweenService:Create(
miniGame.Background.Frame.TextLabel,
TweenInfo.new(5),
{
TextTransparency = 1
}
):Play()

TweenService:Create(
miniGame.Background.Frame.TopLine,
TweenInfo.new(5),
{
BackgroundTransparency = 1
}
):Play()
end)

-- Chỉ bắt đầu minigame sau khi circle phóng to xong
task.wait(0.1)

local circle

local middle

local bar

local deathspot

for _,v in ipairs(miniGame:GetDescendants()) do
if v:IsA("ImageLabel") then
if v.Name == "circle" then
circle = v
elseif v.Name == "middle" then
middle = v
elseif v.Name == "deathspot" then
deathspot = v
deathspot.Visible = false
end
elseif v:IsA("Frame") and v.Name == "Bar" then
bar = v
end
end

local DeathspotActive = false
local Phase3Active = false
local Phase4Active = false

if not circle then
warn("Không tìm thấy ImageLabel 'circle'")
return
end

local targetPosition = circle.Position
local pushTarget = nil
local PlayerFollowSpeed = 75 -- tốc độ khi người chơi điều khiển
local PushFollowSpeed = 20 -- tốc độ khi Pandemonium đẩy
local CurrentFollowSpeed = PlayerFollowSpeed
local shakeTime = 0
local shakeAmount = 5 -- độ rung (pixel)
local shakeSpeedX = 13
local shakeSpeedY = 18
local FillTime = 2   -- đầy trong 1.5 giây
local DrainTime = 4    -- cạn trong 3 giây
local Frozen = false
local IsBeingPushed = false
local PressureShake = true
local PressureBlackout = true
local CameraShakeConnection
local BlackoutConnection
local BlackFrame
local ActiveShaker
local PushForce = Vector2.new(0,0)
local lastDirection = nil

task.spawn(function()
task.wait(10)

if Frozen then return end

DeathspotActive = true
deathspot.Visible = true

-- Phase 3
task.wait(15)

if Frozen then return end

Phase3Active = true

FillTime = 3
DrainTime = 7

-- Phase 4
task.wait(20)

if Frozen then return end

Phase4Active = true

TweenService:Create(
middle,
TweenInfo.new(0.5, Enum.EasingStyle.Quad),
{
Size = UDim2.new(
0.119999997,0,
0.346907109,0
)
}

):Play()

FillTime = 2
DrainTime = 7
end)

local RunService = game:GetService("RunService")

local PlayerGui = player.PlayerGui

local BlackGui = Instance.new("ScreenGui")
BlackGui.Name = "PressureBlackoutGui"
BlackGui.IgnoreGuiInset = true
BlackGui.ResetOnSpawn = false
BlackGui.Parent = PlayerGui

BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.fromScale(1,1)
BlackFrame.BackgroundColor3 = Color3.new(0,0,0)
BlackFrame.BackgroundTransparency = 1
BlackFrame.BorderSizePixel = 0
BlackFrame.Parent = BlackGui

-- rung nhẹ liên tục
local camera = workspace.CurrentCamera

if PressureShake then
CameraShakeConnection = RunService.RenderStepped:Connect(function()
if not MainSound.IsPlaying then
CameraShakeConnection:Disconnect()
CameraShakeConnection = nil
return
end

local x = math.noise(os.clock() * 10) * 0.15  
local y = math.noise(os.clock() * 10) * 0.15  

local camera = workspace.CurrentCamera

camera.CFrame *= CFrame.Angles(
math.rad(x),
math.rad(y),
0
)
end)
end

local function getOrCreateBlackoutGui()
local gui = PlayerGui:FindFirstChild("PressureBlackoutGui")
if not gui then
gui = Instance.new("ScreenGui")
gui.Name = "PressureBlackoutGui"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local frame = Instance.new("Frame")  
    frame.Name = "BlackFrame"  
    frame.Size = UDim2.new(1, 0, 1, 0)  
    frame.BackgroundColor3 = Color3.new(0, 0, 0)  
    frame.BorderSizePixel = 0  
    frame.BackgroundTransparency = 1  
    frame.Parent = gui  
end  
return gui:FindFirstChild("BlackFrame")

end

-- blackout chạy mãi
if PressureBlackout then
BlackoutConnection = RunService.RenderStepped:Connect(function()
if not MainSound.IsPlaying then
return
end

local wave = math.sin(os.clock()*75)  
	local weight = (wave+1)/2  
end)

end

local function initializeBypassedShaker()
local playerCamera = workspace.CurrentCamera
if not playerCamera then return nil end

local currentCFrame = playerCamera.CFrame  

local function cameraCallback(shakeCFrame)  
    playerCamera.CFrame = currentCFrame * shakeCFrame  
end  

local renderPriority = Enum.RenderPriority.Camera.Value + 1  
  
local shakerInstance = {  
    ["_running"] = false,  
    ["_renderName"] = "BypassedCameraShaker",  
    ["_renderPriority"] = renderPriority,  
    ["_camShakeInstances"] = {},  
    ["_removeInstances"] = {},  
    ["_callback"] = cameraCallback  
}  

RunService:BindToRenderStep(shakerInstance._renderName, shakerInstance._renderPriority, function(deltaTime)  
    currentCFrame = playerCamera.CFrame  
      
    local posAccumulator = Vector3.new()  
    local rotAccumulator = Vector3.new()  
    local instances = shakerInstance._camShakeInstances  
      
    for i = 1, #instances do  
        local inst = instances[i]  
        if inst.currentFadeTime <= 0 and not inst.sustain then  
            shakerInstance._removeInstances[#shakerInstance._removeInstances + 1] = i  
        else  
            local deltaTick = inst.tick  
            local fadeTime = inst.currentFadeTime  
            local noiseVal = Vector3.new(math.noise(deltaTick, 0) * 0.5, math.noise(0, deltaTick) * 0.5, math.noise(deltaTick, deltaTick) * 0.5)  
              
            if inst.fadeInDuration > 0 and inst.sustain then  
                if fadeTime < 1 then  
                    fadeTime = fadeTime + deltaTime / inst.fadeInDuration  
                end  
            end  
            if not inst.sustain then  
                fadeTime = fadeTime - deltaTime / inst.fadeOutDuration  
            end  
            if inst.sustain then  
                inst.tick = deltaTick + deltaTime * inst.Roughness * inst.roughMod  
            else  
                inst.tick = deltaTick + deltaTime * inst.Roughness * inst.roughMod * fadeTime  
            end  
            inst.currentFadeTime = math.clamp(fadeTime, 0, 1)  
              
            local shakeVector = noiseVal * inst.Magnitude * inst.magnMod * fadeTime  
            posAccumulator = posAccumulator + shakeVector * inst.PositionInfluence  
            rotAccumulator = rotAccumulator + shakeVector * inst.RotationInfluence  
        end  
    end  
      
    for i = #shakerInstance._removeInstances, 1, -1 do  
        table.remove(instances, shakerInstance._removeInstances[i])  
        shakerInstance._removeInstances[i] = nil  
    end  
      
    local finalCFrame = CFrame.new(posAccumulator) * CFrame.Angles(0, math.rad(rotAccumulator.Y), 0) * CFrame.Angles(math.rad(rotAccumulator.X), 0, math.rad(rotAccumulator.Z))  
    shakerInstance._callback(finalCFrame)  
end)  

shakerInstance._running = true  
return shakerInstance

end

local function shakeCameraInfinite(presetName)
if not ActiveShaker then return end

local presets = {  
    ["Bump"] = {Magnitude = 2.5, Roughness = 4, FadeIn = 0.1, PosInf = Vector3.new(0.15, 0.15, 0.15), RotInf = Vector3.new(1, 1, 1)},  
    ["Explosion"] = {Magnitude = 5, Roughness = 10, FadeIn = 0.1, PosInf = Vector3.new(0.25, 0.25, 0.25), RotInf = Vector3.new(4, 1, 1)},  
    ["Earthquake"] = {Magnitude = 0.6, Roughness = 3.5, FadeIn = 2, PosInf = Vector3.new(0.25, 0.25, 0.25), RotInf = Vector3.new(1, 1, 4)},  
    ["BadTrip"] = {Magnitude = 10, Roughness = 0.15, FadeIn = 5, PosInf = Vector3.new(0, 0, 0.15), RotInf = Vector3.new(2, 1, 4)},  
    ["HandheldCamera"] = {Magnitude = 1, Roughness = 0.25, FadeIn = 5, PosInf = Vector3.new(0, 0, 0), RotInf = Vector3.new(1, 0.5, 0.5)},  
    ["Vibration"] = {Magnitude = 0.4, Roughness = 20, FadeIn = 2, PosInf = Vector3.new(0, 0.15, 0), RotInf = Vector3.new(1.25, 0, 4)},  
    ["RoughDriving"] = {Magnitude = 2, Roughness = 3, FadeIn = 1, PosInf = Vector3.new(0, 0, 0), RotInf = Vector3.new(1, 1, 1)}  
}  

local data = presets[presetName]  
if not data then return end  

local newInstance = {  
    ["Magnitude"] = data.Magnitude,  
    ["Roughness"] = data.Roughness,  
    ["PositionInfluence"] = data.PosInf,  
    ["RotationInfluence"] = data.RotInf,  
    ["roughMod"] = ShakeConfig.SpeedMultiplier,  
    ["magnMod"] = ShakeConfig.Intensity,  
    ["fadeOutDuration"] = 0.5,  
    ["fadeInDuration"] = data.FadeIn,  
    ["sustain"] = true,  
    ["currentFadeTime"] = 0,  
    ["tick"] = Random.new():NextNumber(-100, 100)  
}  

table.insert(ActiveShaker._camShakeInstances, newInstance)

end

local function StartPressureEffects()

ActiveShaker = initializeBypassedShaker()  

shakeCameraInfinite("Vibration")  

BlackoutConnection = RunService.RenderStepped:Connect(function()  

	local wave = math.sin(os.clock() * 75)  
	local weight = (wave + 1) / 2  

	BlackFrame.BackgroundTransparency = 1 - (weight * 0.2)  

end)

end

local function PlayShockWave()

if not ActiveShaker then  
	return  
end  

local newInstance = {  
	Magnitude = 10,  
	Roughness = 30,  

	PositionInfluence = Vector3.new(0.3,0.3,0.3),  
	RotationInfluence = Vector3.new(3,3,3),  

	roughMod = 1.5,  
	magnMod = 1,  

	fadeOutDuration = 1,  
	fadeInDuration = 0.05,  

	sustain = false,  
	currentFadeTime = 1,  

	tick = Random.new():NextNumber(-100,100)  
}  

table.insert(  
	ActiveShaker._camShakeInstances,  
	newInstance  
)

end

ActiveShaker = initializeBypassedShaker()

StartPressureEffects()

task.spawn(function()

while not Frozen do  

	if not Phase3Active then  
		task.wait(1)  
		continue  
	end  

	task.wait(8)  

	if Frozen then  
		break  
	end  

	if math.random(100) <= 25 then  

		TweenService:Create(  
			middle,  
			TweenInfo.new(0.5),  
			{  
				ImageTransparency = 1  
			}  
		):Play()  

		task.wait(5)  

		if Frozen then  
			break  
		end  

		TweenService:Create(  
			middle,  
			TweenInfo.new(0.5),  
			{  
				ImageTransparency = 0  
			}  
		):Play()  

		task.wait(0.5)  
	end  

end

end)

local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled then
local camera = workspace.CurrentCamera
UserInputService.TouchMoved:Connect(function(input)
if Frozen then return end

local delta = input.Delta  
local sensitivity = 1.3  

local parent = circle.Parent  
local parentSize = parent.AbsoluteSize  
local circleSize = circle.AbsoluteSize  

local Overflow = 90  

-- Đảm bảo targetPosition có giá trị ngay từ đầu

local targetPosition2 = circle and circle.Position or UDim2.fromOffset(0, 0)

-- Trong hàm UserInputService, kiểm tra trước khi dùng:
local x = math.clamp(
(targetPosition2 and targetPosition2.X.Offset or 0) + delta.X * sensitivity,
-Overflow,
parentSize.X - circleSize.X + Overflow
)

local y = math.clamp(  
    targetPosition.Y.Offset + delta.Y * sensitivity,  
    -Overflow,  
    parentSize.Y - circleSize.Y + Overflow  
)  

targetPosition = UDim2.fromOffset(x, y)

end)

else
UserInputService.InputChanged:Connect(function(input)
if Frozen or IsBeingPushed or not circle or not circle.Parent then
return
end

if input.UserInputType ~= Enum.UserInputType.MouseMovement then  
		return  
	end  

	local mousePos = UserInputService:GetMouseLocation()  

	local parent = circle.Parent  
	local parentPos = parent.AbsolutePosition  
	local parentSize = parent.AbsoluteSize  
	local circleSize = circle.AbsoluteSize  

	local Overflow = 90  

	local x = math.clamp(  
		mousePos.X - parentPos.X - circleSize.X/2,  
		-Overflow,  
		parentSize.X - circleSize.X + Overflow  
	)  

	local y = math.clamp(  
		mousePos.Y - parentPos.Y - circleSize.Y/2,  
		-Overflow,  
		parentSize.Y - circleSize.Y + Overflow  
	)  

	targetPosition = UDim2.fromOffset(x, y)  
end)

end

local RunService = game:GetService("RunService")

local fullSize
local currentPercent = 1
local tween

if bar then
fullSize = bar.Size
end

RunService.RenderStepped:Connect(function(dt)
if Frozen then
return
end

if not (bar and middle and circle) then  
	return  
end  

local circleCenter = circle.AbsolutePosition + circle.AbsoluteSize / 2  
local middleCenter = middle.AbsolutePosition + middle.AbsoluteSize / 2  

local radius = math.min(middle.AbsoluteSize.X, middle.AbsoluteSize.Y) / 2  

local inside = (circleCenter - middleCenter).Magnitude <= radius  
  
local InDeathspot = false

if DeathspotActive and deathspot then
local deathCenter = deathspot.AbsolutePosition + deathspot.AbsoluteSize/2
local deathRadius = math.min(deathspot.AbsoluteSize.X,deathspot.AbsoluteSize.Y)/2

InDeathspot = (circleCenter-deathCenter).Magnitude <= deathRadius

end

if InDeathspot then  
bar.BackgroundColor3 = Color3.fromRGB(255,0,0)  

currentPercent = math.clamp(  
	currentPercent - dt/(DrainTime/2),  
	0,  
	1  
)

elseif inside then
bar.BackgroundColor3 = Color3.fromRGB(255,255,255)

currentPercent = math.clamp(  
	currentPercent + dt/FillTime,  
	0,  
	1  
)

else
bar.BackgroundColor3 = Color3.fromRGB(255,0,0)

currentPercent = math.clamp(  
	currentPercent - dt/DrainTime,  
	0,  
	1  
)

end

bar.Size = UDim2.new(  
fullSize.X.Scale * currentPercent,  
fullSize.X.Offset * currentPercent,  
fullSize.Y.Scale,  
fullSize.Y.Offset

)

if currentPercent <= 0 and not Ended then
Ended = true
Frozen = true

if CameraShakeConnection then  
	CameraShakeConnection:Disconnect()  
end  

if BlackoutConnection then  
	BlackoutConnection:Disconnect()  
end  

if BlackGui then  
	BlackGui:Destroy()  
end  

if ActiveShaker then  
	ActiveShaker._camShakeInstances = {}  
	RunService:UnbindFromRenderStep(ActiveShaker._renderName)  
	ActiveShaker = nil  
end  

Controls:Enable()  

if workspace:FindFirstChild("HarbingerChecking") then  
	workspace.HarbingerChecking:Destroy()  
end  

for _, name in ipairs({"Push1","Push2","Push3","Push4"}) do  
	local s = workspace:FindFirstChild(name)  
	if s then  
		s:Destroy()  
	end  
end  

local checking = workspace:FindFirstChild("HarbingerChecking")  
if checking then  
	checking:Destroy()  
end  

if miniGame then  
	miniGame:Destroy()  
end  
  
for _, v in ipairs(workspace:GetChildren()) do  
	if v:IsA("Sound") and (  
		v.Name == "HarbingerTheme"  
		or v.Name == "Push1"  
		or v.Name == "Push2"  
		or v.Name == "Push3"  
		or v.Name == "Push4"  
	) then  
		v:Destroy()  
	end  
end

task.spawn(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function killOneShot()
local damageRemote = ReplicatedStorage:FindFirstChild("LocalDamage", true) or ReplicatedStorage:FindFirstChild("ChangeHealth", true)

if damageRemote and damageRemote:IsA("RemoteEvent") then  
    damageRemote:FireServer(100, "SittingItOut", 1, nil)  
    damageRemote:FireServer("Damage", 100)  
    print("ngol")  
else  
    print("đéo được")  
end

end

task.spawn(function()
killOneShot()
end)

task.spawn(function()
while true do
task.wait(0.5)

local playerGui = game.Players.LocalPlayer.PlayerGui  
        local entityPage = playerGui.Main.AfterDeath.Document.EntityPage  
        local imgLabel = entityPage.DeathFrame.Entities.Button.ImageLabel  

        imgLabel.Image = "rbxassetid://83670738338408"  
        imgLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)  

        entityPage.DeathFrame.EntityName.Text = "HARBINGER"  
        playerGui.Main.AfterDeath.Document.ScorePage.OverseerNotes.Text = "You are so dead."  
    end  
end)  
end)   

return

end
end)

local function MoveMiddle()
if not middle or not middle.Parent then
return
end

local parent = middle.Parent  
local parentSize = parent.AbsoluteSize  
local middleSize = middle.AbsoluteSize  

local padding = 10  

local randomX = math.random(padding, parentSize.X - middleSize.X - padding)  
local randomY = math.random(padding, parentSize.Y - middleSize.Y - padding)  

middle.Position = UDim2.fromOffset(randomX, randomY)  

-- Deathspot chỉ random khi Middle vừa đổi vị trí  
if DeathspotActive and deathspot then  
	local radius = 220  

	local angle = math.rad(math.random(0,359))  
	local dist = math.random(30,radius)  

	local offset = Vector2.new(  
		math.cos(angle) * dist,  
		math.sin(angle) * dist  
	)  

	local targetPos = middle.Position + UDim2.fromOffset(offset.X, offset.Y)

local currentPos = Vector2.new(
deathspot.Position.X.Offset,
deathspot.Position.Y.Offset
)

local newPos = Vector2.new(
targetPos.X.Offset,
targetPos.Y.Offset
)

local distance = (newPos - currentPos).Magnitude
local speed = 250 -- pixel/giây

local time = distance / speed

TweenService:Create(
deathspot,
TweenInfo.new(time, Enum.EasingStyle.Linear),
{
Position = targetPos
}
):Play()
end
end

local smoothPosition = circle.Position

RunService.RenderStepped:Connect(function(dt)
if Frozen then
return
end

shakeTime += dt  

local alpha = math.clamp(dt * CurrentFollowSpeed, 0, 1)  
local pushOffset = UDim2.fromOffset(  
PushForce.X * dt,  
PushForce.Y * dt

)

local function AddUDim2(u1, u2)
return UDim2.new(
u1.X.Scale + u2.X.Scale, u1.X.Offset + u2.X.Offset,
u1.Y.Scale + u2.Y.Scale, u1.Y.Offset + u2.Y.Offset
)
end

-- Sau đó áp dụng vào logic:
local goal = pushTarget or targetPosition
smoothPosition = smoothPosition:Lerp(
AddUDim2(goal, pushOffset),
alpha
)

PushForce *= 0.85

local ox =  
math.sin(shakeTime * shakeSpeedX) * shakeAmount +  
math.cos(shakeTime * (shakeSpeedX * 1.6)) * (shakeAmount * 0.35)

local oy =
math.cos(shakeTime * shakeSpeedY) * shakeAmount +
math.sin(shakeTime * (shakeSpeedY * 1.6)) * (shakeAmount * 0.35)

circle.Position = smoothPosition + UDim2.fromOffset(ox, oy)

end)

MainSound.Ended:Connect(function()
if Frozen then return end -- Tránh chạy nhiều lần
Frozen = true

-- 1. Dừng các kết nối hệ thống  
if CameraShakeConnection then CameraShakeConnection:Disconnect() end  
if BlackoutConnection then BlackoutConnection:Disconnect() end  
if BlackGui then BlackGui:Destroy() end  
  
if ActiveShaker then  
    ActiveShaker._camShakeInstances = {}  
    RunService:UnbindFromRenderStep(ActiveShaker._renderName)  
    ActiveShaker = nil  
end  

targetPosition = circle.Position  

-- 2. Thực hiện Fade Out UI  
task.wait(1)  
local FadeOutTweens = {}  
for _, v in ipairs(fadeObjects) do  
    if not v or not v:IsA("Instance") then continue end  
      
    local goals = {}  
    if v:IsA("CanvasGroup") then goals.GroupTransparency = 1  
    elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then goals.ImageTransparency = 1  
    elseif v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then  
        goals.TextTransparency = 1  
        goals.TextStrokeTransparency = 1  
    elseif v:IsA("Frame") then goals.BackgroundTransparency = 1  
    elseif v:IsA("ScrollingFrame") then  
        goals.BackgroundTransparency = 1  
        goals.ScrollBarImageTransparency = 1  
    elseif v:IsA("UIStroke") then goals.Transparency = 1  
    end  

    if next(goals) then  
        local t = TweenService:Create(v, TweenInfo.new(3, Enum.EasingStyle.Quad), goals)  
        table.insert(FadeOutTweens, t)  
        t:Play()  
    end  
end  
  
local cc = game:GetService("Lighting"):FindFirstChild("AltColorCorrection")

if cc then
TweenService:Create(
cc,
TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
{
TintColor = Color3.fromRGB(255, 255, 255),
Contrast = 0,
Saturation = 0
}
):Play()
end

task.wait(3)
Controls:Enable()
print("After Enable")

-- 3. Dọn dẹp Workspace  
if workspace:FindFirstChild("HarbingerChecking") then  
    workspace.HarbingerChecking:Destroy()  
end  

for _, v in ipairs(workspace:GetChildren()) do  
    if v:IsA("Sound") and (v.Name == "HarbingerTheme" or v.Name:match("Push")) then  
        v:Destroy()  
    end  
end  

-- 4. Xóa UI sau cùng để tránh lỗi index nil  
if miniGame then  
    miniGame:Destroy()  
    miniGame = nil  
end

end)

local function DoPush()
local parent = circle.Parent
local parentSize = parent.AbsoluteSize
local circleSize = circle.AbsoluteSize

local Extra = 100  

local minX = -circleSize.X/2 - Extra  
local maxX = parentSize.X - circleSize.X/2 + Extra  

local minY = -circleSize.Y/2 - Extra  
local maxY = parentSize.Y - circleSize.Y/2 + Extra  

local randomX, randomY  

local directions = {1,2,3,4}  

if lastDirection then  
	table.remove(directions, table.find(directions, lastDirection))  
end  

local dir = directions[math.random(#directions)]  
lastDirection = dir  

if dir == 1 then  
	randomX = minX  
	randomY = math.random(minY, maxY)  

elseif dir == 2 then  
	randomX = maxX  
	randomY = math.random(minY, maxY)  

elseif dir == 3 then  
	randomX = math.random(minX, maxX)  
	randomY = minY  

else  
	randomX = math.random(minX, maxX)  
	randomY = maxY  
end  

MoveMiddle()  

IsBeingPushed = true  
CurrentFollowSpeed = PushFollowSpeed  

local current = Vector2.new(  
	circle.Position.X.Offset,  
	circle.Position.Y.Offset  
)  

local target = Vector2.new(randomX, randomY)  
local direction = (target - current).Unit  

PushForce = direction * 7000  
pushTarget = UDim2.fromOffset(randomX, randomY)  

task.delay(0.15,function()  
	targetPosition = pushTarget  
	pushTarget = nil  
	IsBeingPushed = false  
	CurrentFollowSpeed = PlayerFollowSpeed  
end)  

PlayRandomPushSound()  
PlayShockWave()  
  
task.spawn(function()  
for i = 1,20 do  
    local power = 1 - i/20  

    workspace.CurrentCamera.CFrame *= CFrame.Angles(  
        math.rad(math.random(-10,10) * power),  
        math.rad(math.random(-10,10) * power),  
        0  
    )  

    task.wait(0.05)  
end

end)
end

task.spawn(function()
while not Frozen do
task.wait(math.random(1.7, 2))

if math.random(100) <= 40 then  
DoPush()  
task.wait(0.2)  
DoPush()

else
DoPush()
end

end

end)

task.spawn(function()
local lastDirection
while not Frozen do
task.wait(4)

-- 30% tỉ lệ bị đẩy  
	if math.random(100) <= 20 then  
	DoPush()  
	end  
end

end)
