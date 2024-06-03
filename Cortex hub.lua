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
    Actions = { -- Notification Buttons
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

local Tab = Window:CreateTab("Spam", nil) -- Title, Image

local Section = Tab:CreateSection("Rhythm")

local RhythmExplosionToggle = Tab:CreateToggle({
    Name = "Rhythm Explosion Spam",
    CurrentValue = false,
    Flag = "RhythmExplosionSpam",
    Callback = function(Value)
        RhythmSpam = Value
        while RhythmSpam do
            game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion", 0)
            task.wait()
        end
    end    
})

local Section = Tab:CreateSection("Rojo")

local RojoSpamToggle = Tab:CreateToggle({
    Name = "Rojo Spam",
    CurrentValue = false,
    Flag = "RojoSpam",
    Callback = function(Value)
        RojoSpam = Value
        while RojoSpam do
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
            task.wait()
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
    Name = "Null Spam (All gloves)",
    CurrentValue = false,
    Flag = "NullSpam",
    Callback = function(Value)
        NullSpam = Value
        while NullSpam do
            game:GetService("ReplicatedStorage").NullAbility:FireServer()
            task.wait()
        end
    end    
})

local Section = Tab:CreateSection("Retro")

local RetroSpamToggle = Tab:CreateToggle({
    Name = "Retro Spam (All gloves)",
    CurrentValue = false,
    Flag = "RetroSpam",
    Callback = function(Value)
        RetroSpam = Value
        while RetroSpam do
            game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
            task.wait()
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

local Section = Tab:CreateSection("Killstreak")

local KillstreakOrbSpamToggle = Tab:CreateToggle({
    Name = "Killstreak Orb Spam",
    CurrentValue = false,
    Flag = "KillstreakOrbSpam",
    Callback = function(Value)
        On = Value
        while On and game.Players.LocalPlayer.leaderstats.Glove.Value == "Killstreak" do
            game:GetService("ReplicatedStorage").KSABILI:FireServer()
            wait(6.1)
        end
    end    
})

local Tab = Window:CreateTab("Arena", nil)

local AutoEnterArenaToggle = Tab:CreateToggle({
    Name = "Auto Enter Arena",
    CurrentValue = false,
    Flag = "AutoEnterArena",
    Callback = function(Value)
        AutoEnterArena = Value
        while AutoEnterArena do
            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
            end
            task.wait()
        end
    end
})

local Tab = Window:CreateTab("Teleports", nil) -- Title, Image

local TeleportDropdown = Tab:CreateDropdown({
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

local Tab = Window:CreateTab("Slap farm", nil)

local Toggle = Tab:CreateToggle({
   Name = "Slap farm",
   CurrentValue = false,
   Flag = "Toggle1",
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

local Tab = Window:CreateTab("infinite yield", nil)

local Button = Tab:CreateButton({
   Name = "Infinite yield",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Tab = Window:CreateTab("Slap aura", nil)

local Toggle = Tab:CreateToggle({
   Name = "Slap Aura",
   CurrentValue = false,
   Flag = "ToggleSlapAura",
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
 
 local Tab = Window:CreateTab("Antis", nil)
 
 local Toggle = Tab:CreateToggle({
     Name = "Anti admin ban",
     CurrentValue = false,
     Flag = "Toggle1",
     Callback = function(Value)
         if game.PlaceId == 9431156611 then
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