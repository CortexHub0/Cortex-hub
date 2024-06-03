-- OrionLib kütüphanesini yükle
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionTheDev/orionlib/master/orionlib.lua"))()

-- Pencere oluştur
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

-- Ana sekme oluştur
local MainTab = Window:CreateTab("Ana Sayfa", nil)
local MainSection = MainTab:CreateSection("Main")

-- Bildirim göster
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

-- Buton oluştur
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

-- Spam sekmesi oluştur
local Tab = library:CreateTab("Spam", nil)

-- Rhythm bölümü oluştur
local Section = Tab:CreateSection("Rhythm")

-- Rhythm Explosion Spam anahtarı oluştur
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

-- Rojo bölümü oluştur
local Section = Tab:CreateSection("Rojo")

-- Rojo Spam anahtarı oluştur
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

-- Named Rojo bölümü oluştur
local Section = Tab:CreateSection("Named Rojo")

-- Rojo kullanıcısı için metin kutusu oluştur
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

-- Null bölümü oluştur
local Section = Tab:CreateSection("Null")

-- Null Spam anahtarı oluştur
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

-- Retro bölümü oluştur
local Section = Tab:CreateSection("Retro")

-- Retro Spam anahtarı oluştur
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

-- Retro Ability açılır menüsü oluştur
local RetroAbilityDropdown = Tab:CreateDropdown({
    Name = "Retro Ability",
    Default = "Rocket Launcher",
    Options = {"Rocket Launcher", "Ban Hammer", "Bomb"},
    Callback = function(Value)
        RetroAbility = Value
    end    
})

-- Slap farm sekmesi oluştur
local Tab = library:CreateTab("Slap farm", nil)

-- Slap farm anahtarı oluştur
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

-- Slap farm fonksiyonunu başlat
function startSlapFarm()
    ToggleLoop = true
    while ToggleLoop do
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/SlapFarm'))()
        wait(1)
    end
end

-- Slap farm fonksiyonunu durdur
function stopSlapFarm()
    ToggleLoop = false
end

-- Slap aura sekmesi oluştur
local Tab = library:CreateTab("Slap aura", nil)

-- Slap Aura anahtarı oluştur
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

-- Oyuncu spawn edildi mi kontrol et
function isSpawned(player)
    if workspace:FindFirstChild(player.Name) and player.Character:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

-- Slap Aura fonksiyonunu başlat
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

-- Slap Aura fonksiyonunu durdur
function stopSlapAura()
    isRunning = false
end

-- Antis sekmesi oluştur
local Tab = library:CreateTab("Antis", nil)

-- Anti admin ban anahtarı oluştur
local Toggle = Tab:CreateToggle({
    Name = "Anti admin ban",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local bypass;
            bypass = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                if method == "FireServer" then
                    local event = self
                    if event == game.ReplicatedStorage.Events.Ban or
                        event == game.ReplicatedStorage.Events.AdminGUI or
                        event == game.ReplicatedStorage.Events.WS or
                        event == game.ReplicatedStorage.Events.WS2 then
                        return
                    end
                end
                return bypass(self, ...)
            end)
        end
    end,
})   
