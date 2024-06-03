local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Cortex hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionConfig"
})

local MainTab = Window:MakeTab({
    Name = "Ana Sayfa",
    PremiumOnly = false
})

local MainSection = MainTab:AddSection({
    Name = "Main"
})

OrionLib:MakeNotification({
    Name = "Thanks for using Corhub",
    Content = "Notification Content",
    Time = 3
})

local Button = MainSection:AddButton({
    Name = "No cooldown",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")

        if tool then
            local localscript = tool:FindFirstChildOfClass("LocalScript")
            if localscript then
                while character.Humanoid.Health ~= 0 do
                    local localscriptclone = localscript:Clone()
                    localscript:Destroy()
                    localscriptclone.Parent = tool
                    wait(0.1)
                end
            else
                warn("No LocalScript found in the tool.")
            end
        else
            warn("No tool found in character or backpack.")
        end
    end
})

local SpamTab = Window:MakeTab({
    Name = "Spam",
    PremiumOnly = false
})

local RhythmSection = SpamTab:AddSection({
    Name = "Rhythm"
})

local RhythmExplosionToggle = RhythmSection:AddToggle({
    Name = "Rhythm Explosion Spam",
    Default = false,
    Callback = function(Value)
        while Value do
            game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion", 0)
            wait()
        end
    end    
})

local RojoSection = SpamTab:AddSection({
    Name = "Rojo"
})

local RojoSpamToggle = RojoSection:AddToggle({
    Name = "Rojo Spam",
    Default = false,
    Callback = function(Value)
        while Value do
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
            wait()
        end
    end    
})

local NamedRojoSection = SpamTab:AddSection({
    Name = "Named Rojo"
})

local Person = game.Players.LocalPlayer.Name
local RojoUserTextbox = NamedRojoSection:AddTextbox({
    Name = "Make person use rojo spam",
    Default = "Username",
    Callback = function(Value)
        if Value == "Me" or Value == "me" or Value == "Username" or Value == "" then
            Person = game.Players.LocalPlayer.Name
        else
            Person = Value
        end
    end    
})

local NullSection = SpamTab:AddSection({
    Name = "Null"
})

local NullSpamToggle = NullSection:AddToggle({
    Name = "Null Spam",
    Default = false,
    Callback = function(Value)
        while Value do
            game:GetService("ReplicatedStorage").NullAbility:FireServer()
            wait()
        end
    end    
})

local RetroSection = SpamTab:AddSection({
    Name = "Retro"
})

local RetroSpamToggle = RetroSection:AddToggle({
    Name = "Retro Spam (All gloves)",
    Default = false,
    Callback = function(Value)
        while Value do
            game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
            wait()
        end
    end    
})

local RetroAbilityDropdown = RetroSection:AddDropdown({
    Name = "Retro Ability",
    Default = "Rocket Launcher",
    Options = {"Rocket Launcher", "Ban Hammer", "Bomb"},
    Callback = function(Value)
        RetroAbility = Value
    end    
})

local SlapFarmTab = Window:MakeTab({
    Name = "Slap farm",
    PremiumOnly = false
})

local SlapFarmSection = SlapFarmTab:AddSection({
    Name = "Slap farm"
})

local SlapFarmToggle = SlapFarmSection:AddToggle({
    Name = "Slap farm",
    Default = false,
    Callback = function(Value)
        if Value then
            print("Slap farm started")
            startSlapFarm()
        else
            print("Slap farm stopped")
            stopSlapFarm()
        end
    end,
})

function startSlapFarm()
    ToggleLoop = true
    while ToggleLoop do
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))()
        wait(1)
    end
end

function stopSlapFarm()
    ToggleLoop = false
end

local SlapTab = Window:CreateTab("Slap Aura", nil)
local SlapSection = SlapTab:CreateSection("Slap Aura Section")

local SlapAuraButton = SlapSection:CreateButton({
    Name = "Activate Slap Aura",
    Callback = function()
        isSlapAuraActive = not isSlapAuraActive
        if isSlapAuraActive then
            print("Slap Aura activated")
            startSlapAura()
        else
            print("Slap Aura deactivated")
            stopSlapAura()
        end
    end,
})

local TeleportsTab = Window:CreateTab("Teleports", nil) -- Title, Image
local TeleportsSection = TeleportsTab:CreateSection("Teleport Locations")

local TeleportDropdown = TeleportsSection:CreateDropdown({
    Name = "Teleport",
    Default = "",
    Options = {"Safe spot", "Arena", "Default Arena", "Lobby", "Tournament", "Moai Island", "Slapple Island", "Plate"},
    Callback = function(Value)
        if Value == "Safe spot" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0, 28, 0)
        elseif Value == "Arena" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0, -5, 0)
        elseif Value == "Moai Island" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-61.02, 38, 744.37)
        elseif Value == "Slapple Island" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 150, 350)
        elseif Value == "Plate" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.ElevatorPlate.CFrame * CFrame.new(0, 8, 0)
        elseif Value == "Lobby" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-35, 2, 4)
        elseif Value == "Tournament" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(21, 3, 140)
        elseif Value == "Default Arena" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.DefaultSpawn.CFrame
        end
    end    
})

local TeleportsInfoLabel = TeleportsTab:CreateLabel("All teleport locations")
local TeleportsInfoParagraph = TeleportsTab:CreateParagraph({
    Title = "Teleport Locations", 
    Content = "Safe spot: A location where the player is protected and cannot be attacked\nArena: The main fighting area\nDefault Arena: The default spawn location in the main arena\nLobby: The starting area where players gather\nTournament: A special area for tournament matches\nMoai Island: A themed island area\nSlapple Island: An island with unique features\nPlate: An elevated plate area, possibly for viewing or staging"
})

local SlapRoyaleSection = EmotesTab:CreateSection("Slap Royale")

local ToggleAntiAcidLava = SlapRoyaleSection:CreateToggle({
    Name = "Anti acid/Anti lava",
    CurrentValue = false,
    Flag = "ToggleAntiAcidLava", 
    Callback = function(Value)
        if Value then
            local AntiLava = Instance.new("Part", workspace)
            AntiLava.Name = "AntiLava"
            AntiLava.Position = Vector3.new(-238, -43, 401)
            AntiLava.Size = Vector3.new(150, 30, 150)
            AntiLava.Anchored = true
            AntiLava.Transparency = 1
            AntiLava.CanCollide = false

            local AntiAcid = Instance.new("Part", workspace)
            AntiAcid.Name = "AntiAcid"
            AntiAcid.Position = Vector3.new(-70, -20, -725)
            AntiAcid.Size = Vector3.new(155, 35, 144)
            AntiAcid.Anchored = true
            AntiAcid.Transparency = 1
            AntiAcid.CanCollide = false
        end
    end,
})

local BadgeTab = Window:CreateTab("Badge", nil)

local BadgeSection = BadgeTab:CreateSection("Badge")

local TeleportDropdown = BadgeSection:CreateDropdown("Maze Badge", "Badge", {"Counter", "Elude"}, function(y)
    if y == "Counter" then
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
        if teleportFunc then
            teleportFunc([[
                if not game:IsLoaded() then
                    game.Loaded:Wait()
                end
                repeat wait() until game.Players.LocalPlayer
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-61.4113426, 4.67113781, -45.0443306, -0.0143145993, 0.00252397754, -0.999894321, -7.96703534e-06, 0.999996841, 0.00252435054, 0.99989748, 4.41164557e-05, -0.014314536)
                wait(0.3)
                fireclickdetector(game.Workspace.CounterLever.ClickDetector)
                wait(2)
                for i,v in pairs(workspace.Maze:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                    end
                end
            ]])
        end
        game:GetService("TeleportService"):Teleport(11828384869)
    elseif y == "Elude" then
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
        if teleportFunc then
            teleportFunc([[
                if not game:IsLoaded() then
                    game.Loaded:Wait()
                end
                repeat wait() until game.Players.LocalPlayer
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-193.290787, 7.39999914, -130.307114, 0.454088956, 1.82432505e-08, 0.890956342, -2.14201332e-08, 1, -9.55894652e-09, -0.890956342, -1.4743792e-08, 0.454088956)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.8454437, 7.39999914, -201.827698, 0.694604456, -5.9176017e-08, 0.719391882, 4.9516661e-08, 1, 3.44478792e-08, -0.719391882, 1.16942349e-08, 0.694604456)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(218.528198, 7.39999914, 83.4171371, 0.655885577, 5.49275381e-09, 0.754860282, -1.8204565e-08, 1, 8.54112692e-09, -0.754860282, -1.9343906e-08, 0.655885577)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.568184, 10.5492659, 194.721115, 0.990249932, -0.136891961, 0.0258003082, -0.0024311184, 0.168200076, 0.9857499, -0.139280856, -0.976201475, 0.166227311)
                wait(2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-502.335632, 14.2279472, -179.596512, 1, 0, 0, 0, -0.965929747, 0.258804798, 0, -0.258804798, -0.965929747)
            ]])
        end
        game:GetService("TeleportService"):Teleport(11828384869)
    end
end)
