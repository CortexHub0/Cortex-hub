local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionTheDev/orionlib/master/orionlib.lua"))()

local Window = library:CreateWindow({
    Name = "Cortex hub",
    LoadingTitle = "Corhub",
    LoadingSubtitle = "by Cortex",
    Discord = {
        Enabled = true,
        Invite = "Cortex Exploits",
        RememberJoins = true
    }
})

local MainTab = Window:CreateTab("Ana Sayfa", nil)
local MainSection = MainTab:CreateSection("Main")

library:Notify({
    Title = "Thanks for using Corhub",
    Content = "Notification Content",
    Duration = 3,
    Image = nil,
    Actions = {
        Ignore = {
            Name = "Okay!",
            Callback = function()
                print("Thanks!")
            end
        },
    },
})

local Button = MainTab:CreateButton({
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
    end,
})

local Tab = library:CreateTab("Spam", nil)

local Section = Tab:CreateSection("Rhythm")

local RhythmExplosionToggle = Tab:CreateToggle({
    Name = "Rhythm Explosion Spam",
    CurrentValue = false,
    Callback = function(Value)
        RhythmSpam = Value
        while RhythmSpam do
            game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion", 0)
            wait()
        end
    end    
})

local Section = Tab:CreateSection("Rojo")

local RojoSpamToggle = Tab:CreateToggle({
    Name = "Rojo Spam",
    CurrentValue = false,
    Callback = function(Value)
        RojoSpam = Value
        while RojoSpam do
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
            wait()
        end
    end    
})

local Section = Tab:CreateSection("Named Rojo")

local RojoUserTextbox = Tab:CreateTextbox({
    Name = "Make person use rojo spam",
    Default = "Username",
    TextDisappear = false,
    Callback = function(Value)
        if Value == "Me" or Value == "me" or Value == "Username" or Value == "" then
            Person = game.Players.LocalPlayer.Name
        else
            Person = Value
        end
    end    
})
Person = game.Players.LocalPlayer.Name

local Section = Tab:CreateSection("Null")

local NullSpamToggle = Tab:CreateToggle({
    Name = "Null Spam",
    CurrentValue = false,
    Callback = function(Value)
        NullSpam = Value
        while NullSpam do
            game:GetService("ReplicatedStorage").NullAbility:FireServer()
            wait()
        end
    end    
})

local Section = Tab:CreateSection("Retro")

local RetroSpamToggle = Tab:CreateToggle({
    Name = "Retro Spam (All gloves)",
    CurrentValue = false,
    Callback = function(Value)
        RetroSpam = Value
        while RetroSpam do
            game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
            wait()
        end
    end    
})

local RetroAbilityDropdown = Tab:CreateDropdown({
    Name = "Retro Ability",
    Default = "Rocket Launcher",
    Options = {"Rocket Launcher", "Ban Hammer", "Bomb"},
    Callback = function(Value)
        RetroAbility = Value
    end    
})

local Tab = library:CreateTab("Slap farm", nil)

local Toggle = Tab:CreateToggle({
    Name = "Slap farm",
    CurrentValue = false,
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

local Tab = library:CreateTab("Slap aura", nil)

local Toggle = Tab:CreateToggle({
    Name = "Slap Aura",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            startSlapAura()
        else
            stopSlapAura()
        end
    end,
})

local isRunning = false

function isSpawned(player)
    if workspace:FindFirstChild(player.Name) and player.Character:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

function startSlapAura()
    isRunning = true
    while isRunning do
        for _, player in pairs(game.Players:GetPlayers()) do
            if isSpawned(player) and player ~= game.Players.LocalPlayer and not player.Character.Head:FindFirstChild("UnoReverseCard") then
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
    isRunning = false
end
