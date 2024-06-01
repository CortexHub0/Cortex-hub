local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Corox",
    LoadingTitle = "Corox",
    LoadingSubtitle = "by Cortex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
 

 local Section = Tab:NewSection("Tp")
    
    Section:NewDropdown("All Teleports", "Teleport", {"SafePort", "Slapples Isl", "Moai Isl", "Plate", "Battle Arena", "Cannon Island", "Bounti Hunter(Hitman) Room", "Default Arena", "Normal Arena", "Spawn"}, function(abc)
        if abc == "SafePort" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2461.50464, 243.291565, -4546.78467, 0.966821849, -0.00649187574, 0.255369186, -1.00234743e-09, 0.999677002, 0.0254133251, -0.255451679, -0.0245701578, 0.966509581)
      elseif abc == "Slapples Isl" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.island5.Union.CFrame
     elseif abc == "Moai Isl" then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.island4["Big Tree"].Bark.CFrame
    elseif abc == "Plate" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame
    elseif abc == "Battle Arena" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
    elseif abc == "Default Arena" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,364,-3)
    elseif abc == "Normal Arena" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15.3642788, -3.69053721, -7.41954088, 0.405183077, -0.00669269683, -0.914211094, -1.2553046e-05, 0.999973178, -0.00732610561, 0.914235532, 0.00297989813, 0.40517211)
    elseif abc == "Spawn" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-798.47345, 329.357147, 0.84058404, -0.791819096, -2.52048302e-08, -0.610755682, -2.72838037e-08, 1, -5.89596372e-09, 0.610755682, 1.19952013e-08, -0.791819096)
    elseif abc == "Cannon Island" then 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(257.620972, 35.9974861, 198.8535, 0.788386106, 0.045268368, -0.613512933, -8.81827944e-09, 0.997288942, 0.0735854656, 0.615180731, -0.0580137558, 0.786248744)
    elseif abc == "Bounti Hunter(Hitman) Room" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17894.6855, -130.158478, -3539.8374, -0.993310213, -4.15437862e-09, 0.11547628, -4.47561899e-09, 1, -2.52259036e-09, -0.11547628, -3.02254266e-09, -0.993310213)
end
    end)

    local Section = Tab:NewSection("Slapple Farm")

    Section:NewToggle("Slapple Farm", "Only In Arena", function(state)
        getgenv().slapfarmspissb = state
        while getgenv().slapfarmspissb do
            for i,v in pairs(game.Workspace.Arena.island5.Slapples:GetDescendants()) do
                if v.Name == "Glove" and v:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
        task.wait()
        end
    end)

    local Section = Tab:NewSection("Remove Name Tag")
    
    Section:NewToggle("Remove NameTag", "Good For Video", function(state)
        getgenv().removenametag = state
        if getgenv().removenametag == false then
            game.Players.LocalPlayer.Character.Head.Nametag.Enabled = true
        end
        while getgenv().removenametag do
            game.Players.LocalPlayer.Character.Head.Nametag.Enabled = false
        task.wait(0.3)
        end
    end)


    local Tab = Window:NewTab("Badge")

    local Section = Tab:NewSection("Get Plank Glove")

    Section:NewButton("Get Plank Glove", "Need Fort", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8, 97, 4)
            wait(0.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            wait(0.3)
            game:GetService("ReplicatedStorage").Fortlol:FireServer()
            wait(3.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8, 106, -6)
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Fort Glove.",Icon = "rbxassetid://7733658504",Duration = 10})
        end
    end)

    local Section = Tab:NewSection("Get Psycho Glove")

    Section:NewButton("Get Psycho Glove", "In Limbo", function()
        if game.Workspace then
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StartPsychoEvent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(2.5)
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StartPsychoEvent.CFrame = CFrame.new(17879.957, 2977.60913, -242.609451, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            wait(2.5)
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StopPsychoEvent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(2.5)
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StopPsychoEvent.CFrame = CFrame.new(17347.5801, 2977.60913, 103.471375, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            wait(2.5)
            fireclickdetector(workspace.RepressedMemoriesMap.Psychokinesis.Triggers.Psycho.ClickDetector)
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You have not entered Limbo.",Icon = "rbxassetid://7733658504",Duration = 10})
        end
    end)

    local Section = Tab:NewSection("Get FrostBite Glove")
    
    Section:NewButton("Get FrostBite Glove", "Badge", function()
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
wait(0.7)
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                v.HoldDuration = 0
            end
        end
       wait(0.5)
       for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
        ]])
    end
    game:GetService("TeleportService"):Teleport(17290438723)
    end)

    local Section = Tab:NewSection("Get Admin Glove")
    
    Section:NewButton("Get Admin Glove", "Badge", function()
        if game:GetService("ReplicatedStorage").Assets.Retro.Map then
    game.ReplicatedStorage.Assets.Retro.Map.Parent = workspace
    wait(0.4)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
    wait(0.4)
    fireclickdetector(workspace.Map.RetroObbyMap:GetChildren()[5].StaffApp.Button.ClickDetector)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
    wait(0.4)
    fireclickdetector(workspace.Map.RetroObbyMap:GetChildren()[5].StaffApp.Button.ClickDetector)
    end
    end)
    
    local Section = Tab:NewSection("Get Lamp Glove")
    
    Section:NewButton("Get Lamp Glove", "Need ZZZZZZZ Glove", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" then
            for i = 1,5 do
                game:GetService("ReplicatedStorage").nightmare:FireServer("LightBroken")
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need ZZZZZZZ Glove.",Icon = "rbxassetid://7733658504",Duration = 10})
        end
    end)
    
    local Section = Tab:NewSection("Get Ice Skate Glove")
    
    Section:NewButton("Get Ice Skate Glove", "Badge", function()
        local args = {
        [1] = "Freeze"
    }
    
    game:GetService("ReplicatedStorage").IceSkate:FireServer(unpack(args))
    end)
    
    local Section = Tab:NewSection("Elude & Counter Badge")

    Section:NewDropdown("Maze Badge", "Badge", {"Counter", "Elude"}, function(y)
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
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(15.2456455, 4.49108553, -233.529053, -0.631848156, -0.00334048411, 0.775085032, -1.25992265e-05, 0.999990761, 0.00429952005, -0.775092185, 0.00270687975, -0.631842375)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 minutes and 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 minutes to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 59 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 58 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 57 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 56 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 55 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 54 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 53 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 52 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 51 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 50 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 49 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 48 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 47 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 46 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 45 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 44 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 43 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 42 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 41 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 40 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 39 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 38 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 37 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 36 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 35 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 34 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 33 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 32 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 31 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 30 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 29 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 28 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 27 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 26 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 25 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 24 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 23 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 22 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 21 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 20 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 19 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 18 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 17 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 16 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 15 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 14 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 13 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 12 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 11 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 10 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 9 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 8 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 7 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 6 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 5 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 4 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 3 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 2 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 59 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 58 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 57 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 56 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 55 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 54 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 53 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 52 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 51 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 50 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 49 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 48 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 47 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 46 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 45 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 44 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 43 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 42 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 41 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 40 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 39 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 38 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 37 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 36 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 35 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 34 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 33 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 32 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 31 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 30 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 29 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 28 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 27 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 26 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 25 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 24 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 23 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 22 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 21 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 20 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 19 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 18 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 17 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 16 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 15 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 14 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 13 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 12 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 11 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 10 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 9 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 8 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 7 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 6 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 5 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 4 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 3 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
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

local Section = Tab:NewSection("Get Chain Glove")

Section:NewButton("Get Chain Glove", "Need 1k And More Slap", function()
    if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 1000 then
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
        if teleportFunc then
            teleportFunc([[
                if not game:IsLoaded() then
                    game.Loaded:Wait()
                end
                repeat wait() until game.Players.LocalPlayer
         repeat wait() until game.Workspace:FindFirstChild("Map"):FindFirstChild("CodeBrick")
        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "1st"
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "2nd"
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "3rd"
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "4th"
        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "1st" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            first = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            first = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            first = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            first = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            first = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            first = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            first = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            first = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            first = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            first = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            first = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            first = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            first = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            first = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            first = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            first = "2"
                        end
                            end
                        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "2nd" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            second = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            second = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            second = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            second = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            second = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            second = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            second = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            second = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            second = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            second = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            second = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            second = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            second = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            second = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            second = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            second = "2"
                        end
                            end
                        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "3rd" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            third = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            third = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            third = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            third = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            third = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            third = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            third = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            third = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            third = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            third = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            third = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            third = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            third = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            third = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            third = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            third = "2"
                        end
                            end
                        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "4th" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            fourth = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            fourth = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            fourth = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            fourth = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            fourth = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            fourth = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            fourth = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            fourth = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            fourth = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            fourth = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            fourth = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            fourth = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            fourth = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            fourth = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            fourth = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            fourth = "2"
                        end
                            end
                        end
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[first].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[second].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[third].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[fourth].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
        task.wait(0.5)
        game:GetService("TeleportService"):Teleport(6403373529)
            ]])
        end
        game:GetService("TeleportService"):Teleport(9431156611)
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need 1000 And More Slap.",Icon = "rbxassetid://7733658504",Duration = 10})
    end
end)

    local Section = Tab:NewSection("Get Redacted Glove")
    
    Section:NewButton("Get Redacted Glove", "Need 5k And More Slap", function()
        if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 5000 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["1"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["10"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["2"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["3"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["4"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["5"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["6"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["7"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["8"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["9"].CFrame
    else 
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need 5000 And More Slap.",Icon = "rbxassetid://7733658504",Duration = 10})
    end
    end)
    
    local Section = Tab:NewSection("Get Retro Glove")
    
    Section:NewButton("Get Retro Glove", "Badge", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Recall" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.FinishDoor_Retro.Part.CFrame
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Recall Glove.",Icon = "rbxassetid://7733658504",Duration = 10})
        end
    end)
    
    local Section = Tab:NewSection("Brazil Badge")
    
    Section:NewButton("TP to Brazil", "You Got Kicked", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Lobby.brazil.portal.CFrame
    end)
    
    local Section = Tab:NewSection("Get Duck, The Lone Orange, Court Evidence Badge")
    
    Section:NewButton("Get Badge", "Badge", function()
        fireclickdetector(workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
        fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
        fireclickdetector(workspace.Arena.island5.Orange.ClickDetector)
    end)


    local Section = Tab:NewSection("Slap Aura")
    
    Section:NewToggle("Slap Aura", "All Glove", function(state)
        getgenv().slapaurasr = state
            if game.Players.LocalPlayer.Character.inMatch.Value == true then
                while getgenv().slapaurasr do
                    for i,v in pairs(game.Players:GetChildren()) do
                        if v ~= game.Players.LocalPlayer and v.Character then
                            if v.Character:FindFirstChild("Dead") == nil and v.Character:FindFirstChild("HumanoidRootPart") then
                                Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                                if 25 >= Magnitude then
                                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Slap"):FireServer(v.Character:WaitForChild("HumanoidRootPart"))
                                end
                            end
                        end
                    end
                task.wait()
                end
            else
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Wait For Match Started.",Icon = "rbxassetid://7733658504",Duration = 5})
            end
    end)


    local Section = Tab:NewSection("Unlock Lab")
    
    Section:NewButton("Unlock Lab And Get Chain Glove", "Misc", function()
        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
            fireclickdetector(workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "1st"
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "2nd"
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "3rd"
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "4th"
    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "1st" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        first = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        first = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        first = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        first = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        first = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        first = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        first = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        first = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        first = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        first = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        first = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        first = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        first = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        first = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        first = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        first = "2"
                    end
                        end
                    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "2nd" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        second = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        second = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        second = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        second = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        second = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        second = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        second = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        second = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        second = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        second = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        second = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        second = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        second = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        second = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        second = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        second = "2"
                    end
                        end
                    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "3rd" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        third = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        third = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        third = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        third = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        third = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        third = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        third = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        third = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        third = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        third = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        third = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        third = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        third = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        third = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        third = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        third = "2"
                    end
                        end
                    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "4th" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        fourth = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        fourth = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        fourth = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        fourth = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        fourth = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        fourth = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        fourth = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        fourth = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        fourth = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        fourth = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        fourth = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        fourth = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        fourth = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        fourth = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        fourth = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        fourth = "2"
                    end
                        end
                    end
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[first].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[second].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[third].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[fourth].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
    end)
    
    local Section = Tab:NewSection("Leave Bus")
    
    Section:NewButton("Leave Bus", "Misc", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BusJumping"):FireServer()
    end)
    
    local Tab = Window:NewTab("Antis")
    
    local Section = Tab:NewSection("Anti Ragdoll")
    
    Section:NewToggle("Anti Ragdoll", "Anti Ragdoll", function(state)
        getgenv().antiragdolsr = state
        if getgenv().antiragdolsr == false then
            game.Players.LocalPlayer.Character.Torso.Anchored = false
        end
        while getgenv().antiragdolsr do
            if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
                until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                game.Players.LocalPlayer.Character.Torso.Anchored = false
            end
        task.wait()
        end
    end)

    local Section =  Tab:NewSection("Anti Ice")

    Section:NewToggle("Anti Cube Of Ice, Glacier", "Anti", function(state)
        getgenv().antiicesr = state
        while getgenv().antiicesr do
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Icecube" then
                        v:Destroy()
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                    end
               end
        task.wait()
        end
    end)
    
    local Section = Tab:NewSection("Anti Locked Lab")
    
    Section:NewToggle("Anti Locked Lab", "You can't get kicked", function(state)
        if state then
            workspace.Map.OriginOffice:WaitForChild("Antiaccess").CanTouch = false
        else
            workspace.Map.OriginOffice:WaitForChild("Antiaccess").CanTouch = true
        end
    end)
    
    local Section = Tab:NewSection("Anti Lava")
    
    Section:NewToggle("Anti Lava", "Antis", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiLavaKYK"
    block.Size = Vector3.new(100, 1, 110) 
    block.Transparency = 0.5
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-240.93428, -29.1903477, 401.880219, 0.349086821, -0.0864096507, 0.933097899, 1.95710618e-06, 0.995739639, 0.0922098681, -0.937090397, -0.0321874209, 0.347599745) 
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("AntiLavaKYK")
    if block then
        block:Destroy()
    end
        end
    end)
    
    Section:NewToggle("Anti Lava 2.0", "Can Swim", function(state)
        if state then
            workspace.Map.DragonDepths.Lava.CanTouch = false
        else
            workspace.Map.DragonDepths.Lava.CanTouch = true
        end
    end)
    
    local Section = Tab:NewSection("Anti Acid")
    
    Section:NewToggle("Anti Acid", "Antis", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiAcidKYK"
    block.Size = Vector3.new(200, 1, 200) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-64.6827164, 0.228857517, -711.446655, -0.91774404, -0.0017926431, 0.397168338, -6.40035691e-10, 0.999989808, 0.00451351237, -0.397172391, 0.004142249, -0.917734683)
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("AntiAcidKYK")
    if block then
        block:Destroy()
    end
        end
    end)
    
    Section:NewToggle("Anti Acid 2.0", "Can Swim", function(state)
        if state then
            workspace.Map.AcidAbnormality:GetChildren()[26].CanTouch = false
        else
            workspace.Map.AcidAbnormality:GetChildren()[26].CanTouch = true
        end
    end)
    
    local Section = Tab:NewSection("Remove Zone Blur")
    
    Section:NewButton("Remove Zone Blur", "Antis", function()
    local objects = game:GetService("ReplicatedStorage"):GetDescendants()
    local objects = game:GetService("ReplicatedStorage"):GetDescendants()
    for _, object in ipairs(objects) do
        if object.Name == "ZoneEffects" then
            object:Destroy()
        end
    end
    end)
    
    local Section = Tab:NewSection("Anti Void")
    
    Section:NewToggle("Anti Void", "You can't fall below water", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiVoidSR"
    block.Size = Vector3.new(100000, 10, 100000) 
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true
    block.Position = Vector3.new(482.1156005859375, -159.50196838378906, -147.98330688476562)
    block.Parent = game.Workspace
    -----------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidSR2"
    block.Size = Vector3.new(100000, 10, 100000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-674.9874267578125, -159.50196838378906, -263.7173156738281)
    block.Parent = game.Workspace
        else 
    local block = game.Workspace:FindFirstChild("AntiVoidSR")
    if block then
        block:Destroy()
    end
    -------
    local block = game.Workspace:FindFirstChild("AntiVoidSR2")
    if block then
        block:Destroy()
    end
        end
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 9020359053 then
    
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Corhub.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("Cortex Hub | SB Test Server", "DarkTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/s6P9trKq')
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCHJTtkEgJsjQQPozACCDaQQ")
    end)
    
    local Tab = Window:NewTab("Home")
    
    local Section = Tab:NewSection("Inf Yiedl")
    
    Section:NewButton("Inf Yield", "Home", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    
    local Section = Tab:NewSection("FreeCam :credit guy that exsitis")
    
    Section:NewButton("FreeCam", "Home", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/SB%20Freecam"))()
    end)
    
    local Section = Tab:NewSection("FreeCam(Mobile)")
    
    Section:NewButton("FreeCam(Mobile)", "Home", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    
    local Section = Tab:NewSection("Dark Dex")
    
    Section:NewButton("Dark Dex", "Home", function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)