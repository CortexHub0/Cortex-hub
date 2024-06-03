local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Cortex hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionConfig"
})

local MainTab = Window:MakeTab({
    Name = "Main",
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

local NoCooldownEnabled = false

local Button = MainSection:AddButton({
    Name = "No cooldown",
    Callback = function()
        NoCooldownEnabled = not NoCooldownEnabled
        if NoCooldownEnabled then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")

            if tool then
                local localscript = tool:FindFirstChildOfClass("LocalScript")
                if localscript then
                    while character.Humanoid.Health ~= 0 and NoCooldownEnabled do
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
    end
})

local SpamTab = Window:MakeTab({
    Name = "Spam",
    PremiumOnly = false
})

local RhythmSection = SpamTab:AddSection({
    Name = "Rhythm"
})

local RhythmExplosionEnabled = false

local RhythmExplosionToggle = RhythmSection:AddToggle({
    Name = "Rhythm Explosion Spam",
    Default = false,
    Callback = function(Value)
        RhythmExplosionEnabled = Value
        while RhythmExplosionEnabled do
            game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion", 0)
            wait()
        end
    end    
})

local RojoSection = SpamTab:AddSection({
    Name = "Rojo"
})

local RojoSpamEnabled = false

local RojoSpamToggle = RojoSection:AddToggle({
    Name = "Rojo Spam",
    Default = false,
    Callback = function(Value)
        RojoSpamEnabled = Value
        while RojoSpamEnabled do
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

local NullSpamEnabled = false

local NullSpamToggle = NullSection:AddToggle({
    Name = "Null Spam",
    Default = false,
    Callback = function(Value)
        NullSpamEnabled = Value
        while NullSpamEnabled do
            game:GetService("ReplicatedStorage").NullAbility:FireServer()
            wait()
        end
    end    
})

local RetroSection = SpamTab:AddSection({
    Name = "Retro"
})

local RetroSpamEnabled = false

local RetroSpamToggle = RetroSection:AddToggle({
    Name = "Retro Spam (All gloves)",
    Default = false,
    Callback = function(Value)
        RetroSpamEnabled = Value
        while RetroSpamEnabled do
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

local SlapFarmEnabled = false

local SlapFarmToggle = SlapFarmSection:AddToggle({
    Name = "Slap farm",
    Default = false,
    Callback = function(Value)
        SlapFarmEnabled = Value
        if SlapFarmEnabled then
            print("Slap farm started")
            startSlapFarm()
        else
            print("Slap farm stopped")
            stopSlapFarm()
        end
    end,
})

function startSlapFarm()
    while SlapFarmEnabled do
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))()
        wait(1)
    end
end

function stopSlapFarm()
    SlapFarmEnabled = false
end

local SlapAuraTab = Window:MakeTab({
    Name = "Slap Aura",
    PremiumOnly = false
})

local SlapAuraSection = SlapAuraTab:AddSection({
    Name = "Slap Aura"
})

local isSlapAuraActive = false

local SlapAuraToggle = SlapAuraSection:AddToggle({
    Name = "Slap Aura",
    Default = false,
    Callback = function(Value)
        isSlapAuraActive = Value
        if isSlapAuraActive then
            startSlapAura()
        else
            stopSlapAura()
        end
    end,
})

function startSlapAura()
    isSlapAuraActive = true
    while isSlapAuraActive do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= game.Players.LocalPlayer and not player.Character.Head:FindFirstChild("UnoReverseCard") then
                if (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                    game:GetService("ReplicatedStorage").b:FireServer(player.Character["Right Arm"])
                    wait(0.1)
                end
            end
        end
        wait(0.1)
    end
end

function stopSlapAura()
    isSlapAuraActive = false
end

local TeleportsTab = Window:MakeTab({
    Name = "Teleports",
    PremiumOnly = false
})

local TeleportsSection = TeleportsTab:AddSection({
    Name = "Teleport Locations"
})

local TeleportDropdown = TeleportsSection:AddDropdown({
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

local SlapRoyaleTab = Window:MakeTab({
    Name = "Slap Royale",
    PremiumOnly = false
})

local SlapRoyaleSection = SlapRoyaleTab:AddSection({
    Name = "Anti acid/Anti lava"
})

local ToggleAntiAcidLava = SlapRoyaleSection:AddToggle({
    Name = "Toggle Anti acid/Anti lava",
    CurrentValue = false,
    Flag = "ToggleAntiAcidLava",
    Callback = function(Value)
        if Value then
            if AntiLava then
                AntiLava:Destroy()
            end
            if AntiAcid then
                AntiAcid:Destroy()
            end
            AntiLava = Instance.new("Part")
            AntiLava.Name = "AntiLava"
            AntiLava.Position = Vector3.new(-238, -43, 401)
            AntiLava.Size = Vector3.new(150, 30, 150)
            AntiLava.Anchored = true
            AntiLava.Transparency = 1
            AntiLava.CanCollide = false
            AntiLava.Parent = workspace

            AntiAcid = Instance.new("Part")
            AntiAcid.Name = "AntiAcid"
            AntiAcid.Position = Vector3.new(-70, -20, -725)
            AntiAcid.Size = Vector3.new(155, 35, 144)
            AntiAcid.Anchored = true
            AntiAcid.Transparency = 1
            AntiAcid.CanCollide = false
            AntiAcid.Parent = workspace
        else
            if AntiLava then
                AntiLava:Destroy()
                AntiLava = nil
            end
            if AntiAcid then
                AntiAcid:Destroy()
                AntiAcid = nil
            end
        end
    end,
})

local BadgeTab = Window:MakeTab({
    Name = "Badge teleport",
    PremiumOnly = false
})

local BadgeSection = BadgeTab:AddSection({
    Name = "Elude/Counter"
})

BadgeSection:AddButton({
    Name = "Teleport",
    Callback = function()
        game:GetService("TeleportService"):Teleport(11828384869)
    end
})
