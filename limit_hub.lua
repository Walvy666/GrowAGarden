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
