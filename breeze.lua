local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local processedWardrobes = {}
local frozenRooms = {}

local ICE_COLOR = Color3.fromRGB(170, 220, 255)

local function FreezeRoom(room)
    if frozenRooms[room] then
        return
    end

    frozenRooms[room] = true

    for _, v in ipairs(room:GetDescendants()) do
        if v:IsA("BasePart") then
            local tween = TweenService:Create(
                v,
                TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {
                    Color = ICE_COLOR
                }
            )

            tween:Play()

            task.spawn(function()
                task.wait(0.5)
                if v and v.Parent then
                    v.Material = Enum.Material.Ice
                end
            end)
        end
    end
end

local spawn = Instance.new("Sound") 
spawn.Parent = workspace
spawn.Name = "Spawned" 
spawn.SoundId = "rbxassetid://137708649052437" 
spawn.Volume = 3

---====== Load spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.Create({
	Entity = {
		Name = "Breeze",
		Asset = "78597927756031",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 3
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
		Values = {3, 15, 1, 0.1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 90,
		Delay = 8,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 3,
		Delay = 1
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 45
	},
	Crucifixion = {
		Enabled = false,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"Death", "Hints", "Go", "Here"},
		Cause = "Breeze"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    spawn:Play() 
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room: Model, firstTime: boolean)
    if firstTime then
        print("Entity has entered room: "..room.Name.." for the first time")
    else
        print("Entity has entered room: "..room.Name.." again")
    end

    FreezeRoom(room)

    for _, obj in ipairs(room:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Wardrobe" and not processedWardrobes[obj] then
            processedWardrobes[obj] = true

            for _, v in ipairs(obj:GetDescendants()) do
                if v:IsA("BasePart") then
                    local tween = TweenService:Create(
                        v,
                        TweenInfo.new(1.5),
                        {
                            Color = ICE_COLOR
                        }
                    )

                    tween:Play()

                    task.spawn(function()
                        task.wait(0.5)
                        if v and v.Parent then
                            v.Material = Enum.Material.Ice
                        end
                    end)

                elseif v:IsA("ProximityPrompt") then
                    v.Enabled = false
                end
            end

            print("Frozen Wardrobe:", obj:GetFullName())
        end
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight: boolean)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound: boolean)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
    spawn:Destroy() 
    
    if getgenv()._BREEZE_ALREADY_EXECUTED then
        return
    end

    getgenv()._BREEZE_ALREADY_EXECUTED = true

    local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/Voor-Pr00/Achivements/refs/heads/main/Voorpr0"))()

    ---====== Display achievement ======---
    achievementGiver({
        Title = "Glacier Warden",
        Desc = "So cold, so cold...",
        Reason = "Encountered Breeze",
        Image = "rbxassetid://70465639666355"
    })
end)

entity:SetCallback("OnDamagePlayer", function(newHealth: number)
	if newHealth <= 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

task.spawn(function()
    while true do
        task.wait(0.1)

        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")

        if not hrp then
            continue
        end

        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {character}
        params.FilterType = Enum.RaycastFilterType.Blacklist

        local result = workspace:Raycast(
            hrp.Position,
            Vector3.new(0, -8, 0),
            params
        )

        if result and result.Instance then
            local roomModel = result.Instance:FindFirstAncestorOfClass("Model")

            while roomModel and roomModel.Parent ~= workspace.CurrentRooms do
                roomModel = roomModel.Parent
            end

            if roomModel and frozenRooms[roomModel] then
                local vel = hrp.AssemblyLinearVelocity

                hrp.AssemblyLinearVelocity =
                    Vector3.new(
                        vel.X * 1.03,
                        vel.Y,
                        vel.Z * 1.03
                    )
            end
        end
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

entity:Run(true)
