-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WalvyGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Membuat Frame latar belakang
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "Background"
backgroundFrame.Parent = screenGui
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
backgroundFrame.Size = UDim2.new(0, 400, 0, 200) -- Ukuran frame
backgroundFrame.Position = UDim2.new(0.5, -200, 0.5, -100) -- Posisi di tengah
backgroundFrame.BorderSizePixel = 0

-- Membuat TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "WalvyText"
textLabel.Parent = backgroundFrame
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Mengisi seluruh frame
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
textLabel.BackgroundTransparency = 1 -- Transparan
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Putih
textLabel.Text = "walvy lua"
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 30
textLabel.TextWrapped = true
