-- OrionLib'i yükleyin
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Ana GUI'yi oluşturun
local Window = OrionLib:MakeWindow({Name = "Relic and Murch's Box Controller", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Tab oluşturun
local Tab = Window:MakeTab({
    Name = "Controls",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Değişkenler
local RelicOn = false
local MurchOn = false

-- Relic Button
Tab:AddButton({
    Name = "Toggle Relic",
    Callback = function()
        if not RelicOn then 
            RelicOn = true
            _G.On = true
            if game:GetService("Workspace").TempMap.Main.Relics:FindFirstChild("Relic") then
                while _G.On and wait(0.1) do
                    for _, v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
                        if v.Name == "Relic" then
                            fireproximityprompt(v.RelicPrompt)
                        end
                    end
                end
            end
        else 
            RelicOn = false
            _G.On = false
        end
    end
})

-- Murch's Box Button
Tab:AddButton({
    Name = "Toggle Murch's Box",
    Callback = function()
        MurchOn = not MurchOn
        _G.MurchOn = MurchOn

        if MurchOn and game:GetService("Workspace").TempMap.Main.Relics:FindFirstChild("Murch's Box") then
            while _G.MurchOn and wait(0.1) do
                for _, v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
                    if v.Name == "Murch's Box" then
                        fireproximityprompt(v.RelicPrompt)
                    end
                end
            end
        end
    end
})

-- OrionLib GUI'yi açın
OrionLib:Init()

-- Mevcut Relic Kodları
local RelicESP = script.Parent:WaitForChild("RelicESP")
local RelicAura = script.Parent:WaitForChild("RelicAura")

RelicESP.MouseButton1Down:connect(function()
    for i,v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
        if v.ClassName == "Relic" or v:IsA("MeshPart") then

            local function addGui(part)
                if v:FindFirstChild("STNESP") ~= nil then
                    v:FindFirstChild("STNESP"):Destroy()
                    print("Removing old ESP on " .. part.parent.Name)
                end

                local gui = Instance.new("BillboardGui", part)
                gui.Name = "STNESP"
                gui.Size = UDim2.new(1, 0, 1, 0)
                gui.AlwaysOnTop = true

                local frame = Instance.new("Frame", gui)
                frame.Size = UDim2.new(3, 0, 3, 0)
                frame.BackgroundTransparency = 0.5
                frame.BorderSizePixel = 0

                if part.parent.Name == "Relic" then
                    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                end

                print("Added ESP to " .. part.parent.Name .. "!")
            end
            addGui(v)
        end
    end
end)

RelicAura.MouseButton1Click:Connect(function()
    if not on then 
        on = true
        _G.On = true
        if game:GetService("Workspace").TempMap.Main.Relics.Relic then
            while _G.On and wait(0.1) do
                for i,v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
                    if v.Name == "Relic" then
                        fireproximityprompt(v.RelicPrompt)
                    end
                end
            end
        end
    else 
        on = false
        _G.On = false
    end
end)
