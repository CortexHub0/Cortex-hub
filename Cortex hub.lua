local Cortibi = {}

function Cortibi:MakeWindow(config)
    local window = {
        Name = config.Name or "Window",
        HidePremium = config.HidePremium or false,
        SaveConfig = config.SaveConfig or false,
        ConfigFolder = config.ConfigFolder or "CortibiConfig",
        Tabs = {},
        Init = function(self)
            print("Window initialized")
        end
    }

    function window:MakeTab(tabConfig)
        local tab = {
            Name = tabConfig.Name or "Tab",
            PremiumOnly = tabConfig.PremiumOnly or false,
            Sections = {},
            AddSection = function(self, sectionConfig)
                local section = {
                    Name = sectionConfig.Name or "Section",
                    Items = {},
                    AddButton = function(self, buttonConfig)
                        local button = {
                            Name = buttonConfig.Name or "Button",
                            Callback = buttonConfig.Callback or function() end
                        }
                        table.insert(self.Items, button)
                        return button
                    end,
                    -- Add other item types here
                }
                table.insert(self.Sections, section)
                return section
            end
        }
        table.insert(self.Tabs, tab)
        return tab
    end

    return window
end

-- Example usage:
local myWindow = Cortibi:MakeWindow({
    Name = "MyGUI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MyGUIConfig"
})

local mainTab = myWindow:MakeTab({
    Name = "Main",
    PremiumOnly = false
})

local mainSection = mainTab:AddSection({
    Name = "Main"
})

local myButton = mainSection:AddButton({
    Name = "Click Me!",
    Callback = function()
        print("Button clicked!")
    end
})

myWindow:Init()
