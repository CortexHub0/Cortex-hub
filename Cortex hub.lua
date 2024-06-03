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

local AntiTab = Window:MakeTab({
    Name = "Antis",
    PremiumOnly = false
})

local AntiSection = AntiTab:AddSection({
    Name = "Anti admin ban(Not finished)"
})
