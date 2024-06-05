-- GUI kütüphanesi
local GUI = {}

-- Yeni bir GUI kategorisi oluşturur
function GUI.newCategory(parent, position, size, title)
    local categoryFrame = Instance.new("Frame")
    categoryFrame.Parent = parent
    categoryFrame.Position = position
    categoryFrame.Size = size
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = categoryFrame
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Category"
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    return categoryFrame
end

-- Yeni bir etiket oluşturur
function GUI.newLabel(parent, position, size, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Position = position
    label.Size = size
    label.BackgroundTransparency = 1
    label.Text = text or ""
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    return label
end

-- Yeni bir metin kutusu oluşturur
function GUI.newTextBox(parent, position, size, text, onChanged)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.Position = position
    textBox.Size = size
    textBox.Text = text or ""
    textBox.FocusLost:Connect(function(enterPressed)
        if onChanged then
            onChanged(textBox.Text, enterPressed)
        end
    end)
    return textBox
end

-- Yeni bir buton oluşturur
function GUI.newButton(parent, position, size, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Position = position
    button.Size = size
    button.Text = text or ""
    button.MouseButton1Click:Connect(onClick)
    return button
end

-- Yeni bir toggle butonu oluşturur
function GUI.newToggle(parent, position, size, text, defaultValue, onToggle)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = parent
    toggleButton.Position = position
    toggleButton.Size = size
    toggleButton.Text = text or ""
    toggleButton.AutoButtonColor = false
    
    local toggleValue = Instance.new("BoolValue")
    toggleValue.Name = "ToggleValue"
    toggleValue.Value = defaultValue or false
    toggleValue.Parent = toggleButton
    
    toggleButton.MouseButton1Click:Connect(function()
        toggleValue.Value = not toggleValue.Value
        onToggle(toggleValue.Value)
    end)
    
    return toggleButton
end

return GUI
