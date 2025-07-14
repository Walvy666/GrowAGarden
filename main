-- Walvy Community Hub v1.0 for Grow a Garden
-- Developer: WALVYKER 24

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Window
local Window = Rayfield:CreateWindow({
    Name = "Walvy Community Hub | Grow a Garden V4.0",
    LoadingTitle = "Walvy Community Hub",
    LoadingSubtitle = "By WALVYKER 24",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WalvyHubConfig",
        FileName = "WalvySettings"
    },
    Discord = {
        Enabled = true,
        Invite = "yourdiscord", -- ganti dengan invite servermu
        RememberJoins = true
    },
    KeySystem = false
})

-- Tab: Home
local HomeTab = Window:CreateTab("🏠 Home", nil)

HomeTab:CreateParagraph({Title = "Welcome to Walvy Community Hub", Content = "Join our Discord Server for dupes or information!\nCopy the invite code and paste on browser.\nJoin now!"})

HomeTab:CreateButton({
    Name = "📎 Copy Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/yourdiscord") -- ganti dengan link Discord servermu
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord invite copied to clipboard.",
            Duration = 4
        })
    end,
})

-- Section: Performance
HomeTab:CreateSection("Performance")

HomeTab:CreateToggle({
    Name = "Hide Notification",
    CurrentValue = false,
    Callback = function(Value)
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Notification, not Value)
    end
})

HomeTab:CreateToggle({
    Name = "Hide Backpack",
    CurrentValue = false,
    Callback = function(Value)
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, not Value)
    end
})

HomeTab:CreateButton({
    Name = "FPS Booster",
    Callback = function()
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") then
                v.Transparency = 1
            end
        end
        setfpscap(60)
        Rayfield:Notify({
            Title = "FPS Booster Activated",
            Content = "Performance improved!",
            Duration = 4
        })
    end
})

-- Set FPS Section
HomeTab:CreateSlider({
    Name = "Set FPS",
    Range = {10, 300},
    Increment = 10,
    CurrentValue = 60,
    Callback = function(Value)
        setfpscap(Value)
    end,
})

-- Tab: Main
local MainTab = Window:CreateTab("🌾 Main", nil)

MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        while _G.AutoFarm do
            -- Contoh fungsi AutoFarm Grow a Garden (ganti sesuai game)
            game:GetService("ReplicatedStorage").Events.Farm:FireServer()
            task.wait(0.5)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoSell = Value
        while _G.AutoSell do
            game:GetService("ReplicatedStorage").Events.Sell:FireServer()
            task.wait(1)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Water Plants",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoWater = Value
        while _G.AutoWater do
            game:GetService("ReplicatedStorage").Events.Water:FireServer()
            task.wait(2)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Collect Items",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoCollect = Value
        while _G.AutoCollect do
            for _, item in pairs(game:GetService("Workspace").Drops:GetChildren()) do
                if item:IsA("Part") and item:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 1)
                end
            end
            task.wait(0.5)
        end
    end
})

-- Tab: Pets
local PetsTab = Window:CreateTab("🐾 Pets", nil)

PetsTab:CreateToggle({
    Name = "Auto Equip Best Pets",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoEquip = Value
        while _G.AutoEquip do
            game:GetService("ReplicatedStorage").Events.EquipBestPets:FireServer()
            task.wait(5)
        end
    end
})

PetsTab:CreateToggle({
    Name = "Auto Hatch Egg",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoHatch = Value
        while _G.AutoHatch do
            game:GetService("ReplicatedStorage").Events.HatchEgg:FireServer("Basic Egg") -- ganti nama telur jika berbeda
            task.wait(2)
        end
    end
})

PetsTab:CreateDropdown({
    Name = "Choose Egg",
    Options = {"Basic Egg", "Golden Egg", "Mystic Egg"},
    CurrentOption = "Basic Egg",
    Callback = function(Option)
        _G.SelectedEgg = Option
    end,
})

PetsTab:CreateButton({
    Name = "Hatch Selected Egg Once",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.HatchEgg:FireServer(_G.SelectedEgg or "Basic Egg")
    end,
})

-- Tab: Shop
local ShopTab = Window:CreateTab("🛒 Shop", nil)

ShopTab:CreateToggle({
    Name = "Auto Buy Tools",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoTool = Value
        while _G.AutoTool do
            game:GetService("ReplicatedStorage").Events.BuyTool:FireServer("Best")
            task.wait(2)
        end
    end
})

ShopTab:CreateToggle({
    Name = "Auto Buy Seeds",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoSeeds = Value
        while _G.AutoSeeds do
            game:GetService("ReplicatedStorage").Events.BuySeeds:FireServer("Best")
            task.wait(2)
        end
    end
})

ShopTab:CreateToggle({
    Name = "Auto Upgrade Backpack",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoBackpack = Value
        while _G.AutoBackpack do
            game:GetService("ReplicatedStorage").Events.UpgradeBackpack:FireServer()
            task.wait(3)
        end
    end
})

-- Tab: Teleport
local TeleportTab = Window:CreateTab("🧭 Teleport", nil)

local locations = {
    ["Spawn"] = Vector3.new(0, 3, 0),
    ["Shop"] = Vector3.new(100, 3, 0),
    ["Garden"] = Vector3.new(-50, 3, 25),
    ["Pet Area"] = Vector3.new(75, 3, 50)
}

for name, pos in pairs(locations) do
    TeleportTab:CreateButton({
        Name = "Teleport to "..name,
        Callback = function()
            game.Players.LocalPlayer.Character:MoveTo(pos)
        end
    })
end

-- Tab: ESP / Dialog UI
local ESPTab = Window:CreateTab("🕵️ ESP/Dialog UI", nil)

ESPTab:CreateButton({
    Name = "Enable NPC Dialog UI",
    Callback = function()
        for _, npc in pairs(workspace:GetChildren()) do
            if npc:FindFirstChild("Head") then
                local Billboard = Instance.new("BillboardGui", npc.Head)
                Billboard.Size = UDim2.new(0, 100, 0, 40)
                Billboard.AlwaysOnTop = true

                local TextLabel = Instance.new("TextLabel", Billboard)
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = npc.Name
                TextLabel.TextColor3 = Color3.new(1,1,1)
                TextLabel.BackgroundTransparency = 1
            end
        end
    end
})

-- Tab: Settings
local SettingsTab = Window:CreateTab("⚙️ Settings", nil)

SettingsTab:CreateDropdown({
    Name = "Theme Color",
    Options = {"Dark", "Blue", "Red", "Green", "Purple"},
    CurrentOption = "Dark",
    Callback = function(Option)
        -- Tambah fungsional jika ingin mengubah UI warna
        Rayfield:Notify({Title = "Theme", Content = Option.." theme selected!"})
    end,
})

SettingsTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})

SettingsTab:CreateParagraph({Title = "Credits", Content = "Script by WALVYKER 24\nInspired by LimitHub"})
