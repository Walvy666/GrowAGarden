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
