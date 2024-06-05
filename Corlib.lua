-- Uçma arayüzü oluşturuluyor
local FlyGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local button = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

-- Arayüzün özellikleri ayarlanıyor
FlyGui.Name = "FlyGui"
FlyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = FlyGui
Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0685602352, 0, 0.168769717, 0)
Frame.Size = UDim2.new(0.264544547, 0, 0.100000024, 0)

button.Parent = Frame
button.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
button.BorderSizePixel = 0
button.Position = UDim2.new(0.06324628, 0, 0.400667697, 0)
button.Size = UDim2.new(0.871157169, 0, 0.495614201, 0)
button.Font = Enum.Font.ArialBold
button.Text = "Uçmayı Başlat"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.TextSize = 14.000
button.TextStrokeTransparency = 0.000
button.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Size = UDim2.new(0, 86, 0, 24)
TextLabel.Font = Enum.Font.Oswald
TextLabel.Text = "Made by 7alexv7"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Belirli bir oyuncunun belirli bir metni chat'e gönderme fonksiyonu
local function sendChatMessage(player, message)
    local chatRemote = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest")
    if chatRemote then
        chatRemote:FireServer(message, "All")
    end
end

-- Uçma işlevini başlatan butona tıklandığında
button.MouseButton1Click:Connect(function()
    if flying then
        flying = false
        button.Text = "Uçmayı Başlat"
        -- Uçmayı durdurma mesajını chat'e yazma
        sendChatMessage(game.Players.LocalPlayer, "?sudo unfly")
    else
        flying = true
        Fly()
        button.Text = "Uçmayı Durdur"
        -- Uçmayı başlatma mesajını chat'e yazma
        sendChatMessage(game.Players.LocalPlayer, "?sudo fly")
    end
end)

local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0
local bg = nil
local bv = nil

--Actual flying
function Fly()
    game.StarterGui:SetCore("SendNotification", {Title="Fly Activated"; Text="WeAreDevs.net"; Duration=1;})
    bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame
    bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0,0.1,0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    repeat wait()
        plr.Character.Humanoid.PlatformStand = true
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = speed+.5+(speed/maxspeed)
            if speed > maxspeed then
                speed = maxspeed
            end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
            speed = speed-1
            if speed < 0 then
                speed = 0
            end
        end
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        else
            bv.velocity = Vector3.new(0,0.1,0)
        end
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
    until not flying
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bg = nil
    bv:Destroy()
    bv = nil
    plr.Character.Humanoid.PlatformStand = false
    game.StarterGui:SetCore("SendNotification", {Title="Fly Deactivated"; Text="WeAreDevs.net"; Duration=1;})
end

-- Tuş kontrolleri
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        Frame.Visible = not Frame.Visible
    elseif input.KeyCode == Enum.KeyCode.W then
        ctrl.f = 1
    elseif input.KeyCode == Enum.KeyCode.S then
        ctrl.b = -1
    elseif input.KeyCode == Enum.KeyCode.A then
                    ctrl.l = -1
    elseif input.KeyCode == Enum.KeyCode.D then
        ctrl.r = 1
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        ctrl.f = 0
    elseif input.KeyCode == Enum.KeyCode.S then
        ctrl.b = 0
    elseif input.KeyCode == Enum.KeyCode.A then
        ctrl.l = 0
    elseif input.KeyCode == Enum.KeyCode.D then
        ctrl.r = 0
    end
end)

-- Uçma işlevini başlat
Fly()
