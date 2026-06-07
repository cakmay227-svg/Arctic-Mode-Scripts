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
end

-- Run on everything currently in the game right now
for _, descendant in ipairs(game:GetDescendants()) do
task.spawn(checkDescendant, descendant)
end

-- Listen everywhere (deep inside rooms, workspace, storage) for when they spawn
game.DescendantAdded:Connect(function(descendant)
checkDescendant(descendant)
end)


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

    local rooms = workspace:FindFirstChild("CurrentRooms")

    if rooms then
        local room50 = rooms:FindFirstChild("50")
        if room50 then
            applyRoom50Ice(room50)
        end
    end

    while task.wait(15) do
        if rooms and rooms.Parent then
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
