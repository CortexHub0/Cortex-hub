local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Cortex Hub",
    LoadingTitle = "Corhub",
    LoadingSubtitle = "by Cortex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Cortex Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "Cortex Exploits", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
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

local Tab = Window:CreateTab("Nametag", nil)

if game.Workspace:Find
local Tab = Window:CreateTab("Nametag", nil)

if game.Workspace:FindFirstChild("NametagChanged") == nil then
    local NametagChanged = Instance.new("StringValue", workspace)
    NametagChanged.Name = "NametagChanged"
    NametagChanged.Value = ""
end

local AutoChangeNametagToggle = Tab:CreateToggle({
    Name = "Auto Change Nametag(Clientside)",
    CurrentValue = false,
    Flag = "AutoChangeNametag",
    Callback = function(Value)
        AutoChangeNameTag = Value
        if AutoChangeNameTag == true and game.Players.LocalPlayer.Character:FindFirstChild("Nametag", true) then
            game.Players.LocalPlayer.Character.Head.Nametag.TextLabel.Text = workspace.NametagChanged.Value
        end
        workspace.NametagChanged.Changed:Connect(function()
            if AutoChangeNameTag == true and game.Players.LocalPlayer.Character:FindFirstChild("Nametag", true) then
                game.Players.LocalPlayer.Character.Head.Nametag.TextLabel.Text = workspace.NametagChanged.Value
            end
        end)
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if AutoChangeNameTag == true then
                repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("Nametag", true)
                game.Players.LocalPlayer.Character.Head.Nametag.TextLabel.Text = workspace.NametagChanged.Value
            end
        end)
    end
})

local NametagTextbox = Tab:CreateTextbox({
    Name = "Auto Change Nametag (Clientside)",
    Default = "Nametag",
    TextDisappear = false,
    Callback = function(Value)
        workspace.NametagChanged.Value = Value
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

local Label = Tab:CreateLabel("All teleport locations")
local Paragraph = Tab:CreateParagraph({Title = "Teleport Locations", Content = "Safe spot: A location where the player is protected and cannot be attacked\nArena: The main fighting area\nDefault Arena: The default spawn location in the main arena\nLobby: The starting area where players gather\nTournament: A special area for tournament matches\nMoai Island: A themed island area\nSlapple Island: An island with unique features\nPlate: An elevated plate area, possibly for viewing or staging"})

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
 
 local Tab = Window:CreateTab("Emotes for free", nil)
 
 local ToggleFreeEmotes = Tab:CreateToggle({
     Name = "Free Emotes (Type /e emotename)",
     CurrentValue = false,
     Flag = "ToggleFreeEmotes",
     Callback = function(Value)
         if Value then
             local Floss = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Floss, game.Players.LocalPlayer.Character.Humanoid)
             local Groove = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Groove, game.Players.LocalPlayer.Character.Humanoid)
             local Headless = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Headless, game.Players.LocalPlayer.Character.Humanoid)
             local Helicopter = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Helicopter, game.Players.LocalPlayer.Character.Humanoid)
             local Kick = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Kick, game.Players.LocalPlayer.Character.Humanoid)
             local L = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.L, game.Players.LocalPlayer.Character.Humanoid)
             local Laugh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Laugh, game.Players.LocalPlayer.Character.Humanoid)
             local Parker = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Parker, game.Players.LocalPlayer.Character.Humanoid)
             local Spasm = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Spasm, game.Players.LocalPlayer.Character.Humanoid)
             local Thriller = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Thriller, game.Players.LocalPlayer.Character.Humanoid)
             
             local EP
 
             game.Players.LocalPlayer.Chatted:Connect(function(msg)
                 if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                     if string.lower(msg) == "/e floss" then
                         Floss:Play()
                     elseif string.lower(msg) == "/e groove" then
                         Groove:Play()
                     elseif string.lower(msg) == "/e headless" then
                         Headless:Play()
                     elseif string.lower(msg) == "/e helicopter" then
                         Helicopter:Play()
                     elseif string.lower(msg) == "/e kick" then
                         Kick:Play()
                     elseif string.lower(msg) == "/e l" then
                         L:Play()
                     elseif string.lower(msg) == "/e laugh" then
                         Laugh:Play()
                     elseif string.lower(msg) == "/e parker" then
                         Parker:Play()
                     elseif string.lower(msg) == "/e spasm" then
                         Spasm:Play()
                     elseif string.lower(msg) == "/e thriller" then
                         Thriller:Play()
                     end
                     EP = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                 end
             end)
 
             game:GetService("RunService").Heartbeat:Connect(function()
                 if EP ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (Floss.IsPlaying or Groove.IsPlaying or Headless.IsPlaying or Helicopter.IsPlaying or Kick.IsPlaying or L.IsPlaying or Laugh.IsPlaying or Parker.IsPlaying or Spasm.IsPlaying or Thriller.IsPlaying) then
                     local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - EP).Magnitude
                     if Magnitude > 1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(EP)
                    end
                end
            end)
        else
            -- Release animations if needed
        end
    end
}) 

