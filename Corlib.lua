-- OrionLib kütüphanesini dahil edin
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Ana pencereyi oluşturun
local Window = OrionLib:MakeWindow({Name = "MurchCase and Relic ESP and AutoCollect", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Sekme oluşturun
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- ESP işlevi
local function enableESP(item)
    if item:FindFirstChild("ESP") then return end
    
    local Box = Instance.new("BoxHandleAdornment")
    Box.Name = "ESP"
    Box.Adornee = item
    Box.Size = item.Size
    Box.Color3 = Color3.new(1, 0, 0)
    Box.Transparency = 0.5
    Box.ZIndex = 1
    Box.AlwaysOnTop = true
    Box.Parent = item
    
    print("ESP enabled for:", item.Name)
end

-- AutoCollect işlevi
local function autoCollect(item)
    game:GetService("Players").LocalPlayer.Character:MoveTo(item.Position)
    wait(0.5)
    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, item, 0)
    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, item, 1)
    
    print("AutoCollected:", item.Name)
end

-- ESP ve AutoCollect için kontrol işlevi
local function checkItems(name)
    local found = false
    for _, item in pairs(workspace:GetDescendants()) do
        if item.Name == name and item:IsA("BasePart") then
            found = true
            if espEnabled then
                enableESP(item)
            end
            if autoCollectEnabled then
                autoCollect(item)
            end
        end
    end
    if not found then
        print(name, "not found in workspace")
    end
end

-- MurchCase ESP
local espEnabled = false
Tab:AddToggle({
    Name = "MurchCase ESP",
    Default = false,
    Callback = function(Value)
        espEnabled = Value
        while espEnabled do
            checkItems("MurchCase")
            wait(1)
        end
    end    
})

-- MurchCase AutoCollect
local autoCollectEnabled = false
Tab:AddToggle({
    Name = "MurchCase AutoCollect",
    Default = false,
    Callback = function(Value)
        autoCollectEnabled = Value
        while autoCollectEnabled do
            checkItems("MurchCase")
            wait(1)
        end
    end    
})

-- Relic ESP
Tab:AddToggle({
    Name = "Relic ESP",
    Default = false,
    Callback = function(Value)
        espEnabled = Value
        while espEnabled do
            checkItems("Relic")
            wait(1)
        end
    end    
})

-- Relic AutoCollect
Tab:AddToggle({
    Name = "Relic AutoCollect",
    Default = false,
    Callback = function(Value)
        autoCollectEnabled = Value
        while autoCollectEnabled do
            checkItems("Relic")
            wait(1)
        end
    end    
})

-- Kullanıcı arayüzünü başlatın
OrionLib:Init()
