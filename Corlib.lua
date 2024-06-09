-- Murch's Case için GUI Oluşturma

-- Oyundaki tüm ScreenGui öğelerini bul ve yok et
for i, v in pairs(game:GetDescendants()) do
    if v:IsA("ScreenGui") then
        v:Destroy()
    end
end

-- Yeni ScreenGui ve UI öğelerini oluştur
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local ESPButton = Instance.new("TextButton")
local AuraButton = Instance.new("TextButton")
local FullBrightButton = Instance.new("TextButton")
local InvisibleButton = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")

-- ScreenGui ayarları
ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Frame ayarları
Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
Frame.BorderColor3 = Color3.fromRGB(226, 226, 226)
Frame.Draggable = true
Frame.Position = Udim2.new(0.833333313, -76, 0.606741607, -150)
Frame.Selectable = true
Frame.Size = UDim2.new(0, 153, 0, 33)

-- TextLabel ayarları
TextLabel.Parent = Frame
TextLabel.Active = true
TextLabel.BackgroundColor3 = Color3.fromRGB(119, 124, 127)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(119, 124, 127)
TextLabel.Position = UDim2.new(0.327688575, 0, 0.190135613, 0)
TextLabel.Size = UDim2.new(0, 50, 0, 20)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Murch's GUI"
TextLabel.TextColor3 = Color3.fromRGB(187, 255, 253)
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(187, 255, 253)
TextLabel.TextWrapped = true

-- ScrollingFrame ayarları
ScrollingFrame.Parent = Frame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
ScrollingFrame.BackgroundTransparency = 0.500
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(-0.00086286955, 0, 0.999025285, 0)
ScrollingFrame.Selectable = false
ScrollingFrame.Size = UDim2.new(0, 153, 0, 194)
ScrollingFrame.CanvasPosition = Vector2.new(0, 150)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 60, 0)
ScrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
ScrollingFrame.ScrollBarThickness = 10

-- ESPButton ayarları
ESPButton.Name = "ESPButton"
ESPButton.Parent = ScrollingFrame
ESPButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Position = UDim2.new(0.0466145016, 0, 0.00465609878, 0)
ESPButton.Size = UDim2.new(0, 136, 0, 27)
ESPButton.Style = Enum.ButtonStyle.RobloxRoundButton
ESPButton.Font = Enum.Font.SourceSans
ESPButton.Text = "ESP"
ESPButton.TextColor3 = Color3.fromRGB(131, 192, 219)
ESPButton.TextSize = 16.000
ESPButton.TextWrapped = true

-- AuraButton ayarları
AuraButton.Name = "AuraButton"
AuraButton.Parent = ScrollingFrame
AuraButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AuraButton.Position = UDim2.new(0.0531504489, 0, 0.0213227645, 0)
AuraButton.Size = UDim2.new(0, 136, 0, 27)
AuraButton.Style = Enum.ButtonStyle.RobloxRoundButton
AuraButton.Font = Enum.Font.SourceSans
AuraButton.Text = "Aura"
AuraButton.TextColor3 = Color3.fromRGB(131, 192, 219)
AuraButton.TextSize = 16.000
AuraButton.TextWrapped = true

-- FullBrightButton ayarları
FullBrightButton.Name = "FullBrightButton"
FullBrightButton.Parent = ScrollingFrame
FullBrightButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FullBrightButton.Position = UDim2.new(0.0531504489, 0, 0.0384944826, 0)
FullBrightButton.Size = UDim2.new(0, 136, 0, 27)
FullBrightButton.Style = Enum.ButtonStyle.RobloxRoundButton
FullBrightButton.Font = Enum.Font.SourceSans
FullBrightButton.Text = "FullBright"
FullBrightButton.TextColor3 = Color3.fromRGB(131, 192, 219)
FullBrightButton.TextSize = 16.000
FullBrightButton.TextWrapped = true

-- InvisibleButton ayarları
InvisibleButton.Name = "InvisibleButton"
InvisibleButton.Parent = ScrollingFrame
InvisibleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InvisibleButton.Position = UDim2.new(0.0531504489, 0, 0.0556662008, 0)
InvisibleButton.Size = UDim2.new(0, 136, 0, 27)
InvisibleButton.Style = Enum.ButtonStyle.RobloxRoundButton
InvisibleButton.Font = Enum.Font.SourceSans
InvisibleButton.Text = "Invisible"
InvisibleButton.TextColor3 = Color3.fromRGB(131, 192, 219)
InvisibleButton.TextSize = 16.000
InvisibleButton.TextWrapped = true

-- UIGradient ayarları
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(91, 91, 91)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Parent = Frame

-- ESP fonksiyonunu bağla
ESPButton.MouseButton1Down:connect(function()
    for i, v in pairs(game:GetService("Workspace").TempMap.Main.MurchsCase:GetChildren()) do
        if v:IsA("MeshPart") then
            if not v:FindFirstChild("BillboardGui") then
                local billboardGui = Instance.new("BillboardGui", v)
                billboardGui.Name = "ESP"
                billboardGui.Size = UDim2.new(1, 0, 1, 0)
                billboardGui.AlwaysOnTop = true

                local frame = Instance.new("Frame", billboardGui)
                frame.Size = UDim2.new(3, 0, 3, 0)
                frame.BackgroundTransparency = 0.5
                frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

-- Aura fonksiyonunu bağla
AuraButton.MouseButton1Click:Connect(function()
    _G.AuraOn = not _G.AuraOn
    while _G.AuraOn and wait(0.1) do
        for i, v in pairs(game:GetService("Workspace").TempMap.Main.MurchsCase:GetChildren()) do
            if v.Name == "Case" then
                fireproximityprompt(v.CasePrompt)
            end
        end
    end
end)

-- FullBright fonksiyonunu bağla
FullBrightButton.MouseButton1Click:Connect(function()
    while wait(0.1) do
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").FogEnd = 100000
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

-- Invisible fonksiyonunu bağla
InvisibleButton.MouseButton1Click:Connect(function()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("MeshPart") or v:IsA("Part") then
            v.Transparency = 1
        elseif v:IsA("Accessory") then
            v.Handle.Transparency = 1
        end
    end
end)
