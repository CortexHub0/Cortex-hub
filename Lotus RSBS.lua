local Corlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Lotus Hub",
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

CorLib:MakeNotification({
    Name = "Thanks for using Lotus Hub",
    Content = "Notification Content",
    Time = 3
})

local NoCooldownEnabled = false

local Button = MainSection:AddButton({
    Name = "No Cooldown",
    Callback = function()
        NoCooldownEnabled = not NoCooldownEnabled
        if NoCooldownEnabled then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")

            if tool then
                local localscript = tool:FindFirstChildOfClass("LocalScript")
                if localscript then
                    while character.Humanoid.Health > 0 and NoCooldownEnabled do
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
local RetroAbility = "Rocket Launcher" -- Default value

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
    Name = "Slap Farm",
    PremiumOnly = false
})

local SlapFarmSection = SlapFarmTab:AddSection({
    Name = "Slap Farm"
})

local SlapFarmEnabled = false

local SlapFarmToggle = SlapFarmSection:AddToggle({
    Name = "Slap Farm",
    Default = false,
    Callback = function(Value)
        SlapFarmEnabled = Value
        if SlapFarmEnabled then
            print("Slap Farm Started")
            startSlapFarm()
        else
            print("Slap Farm Stopped")
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

local isSlapAuraActive = false

local SlapAuraTab = Window:MakeTab({
    Name = "Slap Aura",
    PremiumOnly = false
})

local SlapAuraSection = SlapAuraTab:AddSection({
    Name = "Slap Aura"
})

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
    Options = {"Safe Spot", "Arena", "Default Arena", "Lobby", "Tournament", "Moai Island", "Slapple Island", "Plate"},
    Callback = function(Value)
        if Value == "Safe Spot" then
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
    Name = "Anti Acid/Anti Lava"
})

local AntiLava, AntiAcid

local ToggleAntiAcidLava = SlapRoyaleSection:AddToggle({
    Name = "Toggle Anti Acid/Anti Lava",
    Default = false,
    Callback = function(Value)
        if Value then
            if AntiLava then
                AntiLava:Destroy()
                AntiLava = nil
            end
            if AntiAcid then
                AntiAcid:Destroy()
                AntiAcid = nil
            end

            AntiAcid = game.Players.LocalPlayer.Character.HumanoidRootPart.Touched:Connect(function(hit)
                if hit:IsA("Part") and (hit.Name == "Acid" or hit.Name == "Lava") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
                end
            end)
        else
            if AntiAcid then
                AntiAcid:Destroy()
                AntiAcid = nil
            end
            if AntiLava then
                AntiLava:Destroy()
                AntiLava = nil
            end
        end
    end
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    PremiumOnly = false
})

local MiscSection = MiscTab:AddSection({
    Name = "Miscellaneous"
})

MiscSection:AddButton({
    Name = "Fix Character",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character:MoveTo(Vector3.new(0, 1000, 0))
        end
    end
})

MiscSection:AddButton({
    Name = "Rejoin",
    Callback = function()
        game.Players.LocalPlayer:Kick("Rejoining...")
        wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

OrionLib:Init()
