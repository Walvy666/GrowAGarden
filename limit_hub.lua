--[[
    LimitHub GUI
    Dibuat oleh AI
]]

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- GUI Elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LimitHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.BorderSizePixel = 1
MainFrame.Size = UDim2.new(0, 700, 0, 400)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -200)
MainFrame.Active = true
MainFrame.Draggable = true

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "LimitHub - Grow A Garden V4.0 [Freemium]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CloseButton.BackgroundTransparency = 1
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.Size = UDim2.new(0, 60, 1, -30)
Sidebar.Position = UDim2.new(0, 0, 0, 30)
Sidebar.BorderSizePixel = 0

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.FillDirection = Enum.FillDirection.Vertical
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createSidebarButton(name, icon, order)
    local button = Instance.new("ImageButton")
    button.Name = name
    button.Parent = Sidebar
    button.LayoutOrder = order
    button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    button.BackgroundTransparency = 1
    button.Size = UDim2.new(0, 40, 0, 40)
    button.Image = "rbxassetid://" .. icon

    return button
end

local HomeButton = createSidebarButton("HomeButton", "5128455829", 1) -- Example icon
local MainButton = createSidebarButton("MainButton", "5128455829", 2)
local PetsButton = createSidebarButton("PetsButton", "5128455829", 3)
-- ... Tambahkan tombol lain sesuai kebutuhan
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, -60, 1, -30)
ContentFrame.Position = UDim2.new(0, 60, 0, 30)
ContentFrame.BorderSizePixel = 0

local HomePage = Instance.new("Frame")
HomePage.Name = "HomePage"
HomePage.Parent = ContentFrame
HomePage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HomePage.BackgroundTransparency = 1
HomePage.Size = UDim2.new(1, 0, 1, 0)
HomePage.Visible = true

local HomeLayout = Instance.new("UIListLayout")
HomeLayout.Parent = HomePage
HomeLayout.FillDirection = Enum.FillDirection.Vertical
HomeLayout.SortOrder = Enum.SortOrder.LayoutOrder
HomeLayout.Padding = UDim.new(0, 15)

local InfoSection = Instance.new("Frame")
InfoSection.Name = "InfoSection"
InfoSection.Parent = HomePage
InfoSection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InfoSection.BorderSizePixel = 0
InfoSection.Size = UDim2.new(1, -20, 0, 100)
InfoSection.Position = UDim2.new(0.5, 0, 0, 0)
InfoSection.LayoutOrder = 1

-- ... (Tambahkan konten untuk InfoSection)

local PerformanceSection = Instance.new("Frame")
PerformanceSection.Name = "PerformanceSection"
PerformanceSection.Parent = HomePage
PerformanceSection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PerformanceSection.BorderSizePixel = 0
PerformanceSection.Size = UDim2.new(1, -20, 0, 150)
PerformanceSection.Position = UDim2.new(0.5, 0, 0, 0)
PerformanceSection.LayoutOrder = 2

-- ... (Tambahkan konten untuk PerformanceSection)
local function createToggle(parent, text)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, 0, 0, 40)

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0.8, 0, 1, 0)
    label.Font = Enum.Font.SourceSans
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local switch = Instance.new("TextButton")
    switch.Parent = frame
    switch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    switch.Size = UDim2.new(0, 50, 0, 20)
    switch.Position = UDim2.new(1, -60, 0.5, -10)
    switch.Text = ""

    local toggled = false
    switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            switch.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
        else
            switch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
    end)

    return frame, switch
end

createToggle(PerformanceSection, "Hide Notification")
createToggle(PerformanceSection, "Hide Backpack")
createToggle(PerformanceSection, "FPS Booster")


-- Functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame.Size = UDim2.new(0, 700, 0, 30)
    else
        MainFrame.Size = UDim2.new(0, 700, 0, 400)
    end
end)
