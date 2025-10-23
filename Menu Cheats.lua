--Bitch
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Enhanced cleanup function
local function cleanupExistingGUI()
    pcall(function()
        local existingGUI = player.PlayerGui:FindFirstChild("VipGUI")
        if existingGUI then
            existingGUI:Destroy()
        end
        
        -- Also cleanup any orphaned blur effects
        local lighting = game:GetService("Lighting")
        for _, effect in pairs(lighting:GetChildren()) do
            if effect:IsA("BlurEffect") and effect.Name == "VipBlur" then
                effect:Destroy()
            end
        end
    end)
end

cleanupExistingGUI()

-- Wait for PlayerGui to be ready
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "VipGUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- Blur effect with error handling and proper naming
local blur = nil
pcall(function()
    blur = Instance.new("BlurEffect")
    blur.Name = "VipBlur"
    blur.Size = 0
    blur.Enabled = false
    blur.Parent = game:GetService("Lighting")
end)

-- Main logo button (improved design)
local logo = Instance.new("Frame")
logo.Size = UDim2.new(0, 50, 0, 50)
logo.Position = UDim2.new(0, 20, 0, 100)
logo.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
logo.Active = true
logo.Parent = gui

-- Logo styling
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 12)
logoCorner.Parent = logo

local logoStroke = Instance.new("UIStroke")
logoStroke.Color = Color3.fromRGB(238, 130, 238)
logoStroke.Thickness = 2
logoStroke.Parent = logo

-- Logo gradient background
local logoGradient = Instance.new("UIGradient")
logoGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 80, 30)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 60, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 40, 15))
}
logoGradient.Rotation = 45
logoGradient.Parent = logo

-- Logo clickable button (fixed for dragging)
local logoButton = Instance.new("TextButton")
logoButton.Size = UDim2.new(1, 0, 1, 0)
logoButton.Position = UDim2.new(0, 0, 0, 0)
logoButton.BackgroundTransparency = 1
logoButton.Text = ""
logoButton.Active = false -- Important: Set to false to allow dragging
logoButton.Parent = logo

-- Logo icon
local logoIcon = Instance.new("TextLabel")
logoIcon.Size = UDim2.new(1, 0, 0.6, 0)
logoIcon.Position = UDim2.new(0, 0, 0, 0)
logoIcon.BackgroundTransparency = 1
logoIcon.Text = "O_O"
logoIcon.TextColor3 = Color3.fromRGB(238, 130, 238)
logoIcon.Font = Enum.Font.GothamBold
logoIcon.TextSize = 24
logoIcon.TextXAlignment = Enum.TextXAlignment.Center
logoIcon.TextYAlignment = Enum.TextYAlignment.Center
logoIcon.Parent = logo

-- Logo text
local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 0.4, 0)
logoText.Position = UDim2.new(0, 0, 0.6, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "Venn"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 12
logoText.TextXAlignment = Enum.TextXAlignment.Center
logoText.TextYAlignment = Enum.TextYAlignment.Center
logoText.Parent = logo

-- Logo glow effect
local logoGlow = Instance.new("Frame")
logoGlow.Size = UDim2.new(1, 20, 1, 20)
logoGlow.Position = UDim2.new(0, -10, 0, -10)
logoGlow.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
logoGlow.BackgroundTransparency = 0.9
logoGlow.ZIndex = -1
logoGlow.Parent = logo

local logoGlowCorner = Instance.new("UICorner")
logoGlowCorner.CornerRadius = UDim.new(0, 20)
logoGlowCorner.Parent = logoGlow

-- Main menu frame (with minimum size constraints)
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 420, 0, 280)
menu.Position = UDim2.new(0.5, -210, 0.5, -140)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menu.Visible = false
menu.Active = true
menu.Parent = gui

-- Menu styling
local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 12)
menuCorner.Parent = menu

local menuStroke = Instance.new("UIStroke")
menuStroke.Color = Color3.fromRGB(238, 130, 238)
menuStroke.Thickness = 2
menuStroke.Parent = menu

-- Menu gradient
local menuGradient = Instance.new("UIGradient")
menuGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
}
menuGradient.Rotation = 90
menuGradient.Parent = menu

-- Resize handle (bottom-right corner) - Fixed with proper resize icon
local resizeHandle = Instance.new("Frame")
resizeHandle.Size = UDim2.new(0, 20, 0, 20)
resizeHandle.Position = UDim2.new(1, -20, 1, -20)
resizeHandle.BackgroundTransparency = 1
resizeHandle.Parent = menu

-- Resize lines (proper resize indicator)
local resizeLine1 = Instance.new("Frame")
resizeLine1.Size = UDim2.new(0, 12, 0, 2)
resizeLine1.Position = UDim2.new(0, 4, 0, 14)
resizeLine1.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
resizeLine1.BorderSizePixel = 0
resizeLine1.Parent = resizeHandle

local resizeLine2 = Instance.new("Frame")
resizeLine2.Size = UDim2.new(0, 8, 0, 2)
resizeLine2.Position = UDim2.new(0, 8, 0, 10)
resizeLine2.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
resizeLine2.BorderSizePixel = 0
resizeLine2.Parent = resizeHandle

local resizeLine3 = Instance.new("Frame")
resizeLine3.Size = UDim2.new(0, 4, 0, 2)
resizeLine3.Position = UDim2.new(0, 12, 0, 6)
resizeLine3.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
resizeLine3.BorderSizePixel = 0
resizeLine3.Parent = resizeHandle

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 40)
title.Position = UDim2.new(0, 40, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Menu ~_~"
title.TextColor3 = Color3.fromRGB(238, 130, 238)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = menu

-- Close button (X style)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = menu

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 4)
closeBtnCorner.Parent = closeBtn

-- Minimize button (- style)
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 5)
minBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 20
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = menu

local minBtnCorner = Instance.new("UICorner")
minBtnCorner.CornerRadius = UDim.new(0, 4)
minBtnCorner.Parent = minBtn

-- Sidebar
local side = Instance.new("Frame")
side.Size = UDim2.new(0, 110, 1, -50)
side.Position = UDim2.new(0, 10, 0, 50)
side.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
side.Parent = menu

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 8)
sideCorner.Parent = side

-- Cheat button
local cheatBtn = Instance.new("TextButton")
cheatBtn.Size = UDim2.new(1, -10, 0, 40)
cheatBtn.Position = UDim2.new(0, 5, 0, 10)
cheatBtn.Text = "🎮 Cheat"
cheatBtn.BackgroundColor3 = Color3.fromRGB(238, 130, 238)
cheatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
cheatBtn.Font = Enum.Font.GothamBold
cheatBtn.TextSize = 14
cheatBtn.Parent = side

local cheatBtnCorner = Instance.new("UICorner")
cheatBtnCorner.CornerRadius = UDim.new(0, 8)
cheatBtnCorner.Parent = cheatBtn

-- Device button (new)
local deviceBtn = Instance.new("TextButton")
deviceBtn.Size = UDim2.new(1, -10, 0, 40)
deviceBtn.Position = UDim2.new(0, 5, 0, 60)
deviceBtn.Text = "📱 Device"
deviceBtn.BackgroundColor3 = Color3.fromRGB(238, 130, 238)
deviceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
deviceBtn.Font = Enum.Font.GothamBold
deviceBtn.TextSize = 14
deviceBtn.Parent = side

local deviceBtnCorner = Instance.new("UICorner")
deviceBtnCorner.CornerRadius = UDim.new(0, 8)
deviceBtnCorner.Parent = deviceBtn

-- Clear button (moved down)
local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(1, -10, 0, 40)
clearBtn.Position = UDim2.new(0, 5, 0, 110)
clearBtn.Text = "🧹 Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(238, 130, 238)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 14
clearBtn.Parent = side

local clearBtnCorner = Instance.new("UICorner")
clearBtnCorner.CornerRadius = UDim.new(0, 8)
clearBtnCorner.Parent = clearBtn

-- Back button
local backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(1, -10, 0, 35)
backBtn.Position = UDim2.new(0, 5, 1, -45)
backBtn.BackgroundColor3 = Color3.fromRGB(238, 130, 238)
backBtn.Text = "← Kembali"
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.Font = Enum.Font.Gotham
backBtn.TextSize = 13
backBtn.Visible = false
backBtn.Parent = side

local backBtnCorner = Instance.new("UICorner")
backBtnCorner.CornerRadius = UDim.new(0, 6)
backBtnCorner.Parent = backBtn

-- Content area
local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1, -130, 1, -60)
content.Position = UDim2.new(0, 130, 0, 50)
content.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
content.ScrollBarThickness = 6
content.ScrollBarImageColor3 = Color3.fromRGB(221, 160, 211)
content.CanvasSize = UDim2.new(0, 0, 0, 0)
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.Parent = menu

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = content

local contentLayout = Instance.new("UIListLayout")
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Padding = UDim.new(0, 5)
contentLayout.Parent = content

local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0, 10)
contentPadding.PaddingLeft = UDim.new(0, 10)
contentPadding.PaddingRight = UDim.new(0, 10)
contentPadding.Parent = content

-- Safe GUI clearing function
local function clearContent()
    for _, child in pairs(content:GetChildren()) do
        if child:IsA("GuiObject") and child ~= contentLayout and child ~= contentPadding then
            child:Destroy()
        end
    end
end

-- Create button function with error handling
local function createButton(text, callback, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.BackgroundColor3 = color or Color3.fromRGB(238, 130, 238)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.Gotham
    btn.Parent = content
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    if callback then
        btn.MouseButton1Click:Connect(function()
            pcall(callback) -- Safe callback execution
        end)
    end
    
    return btn
end

-- Server Hop function with enhanced error handling
local function serverHop()
    pcall(function()
        print("🔄 Starting server hop...")
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")
        local placeId = game.PlaceId
        
        -- Notify user
        local notification = Instance.new("Frame")
        notification.Size = UDim2.new(0, 300, 0, 80)
        notification.Position = UDim2.new(0.5, -150, 0, 50)
        notification.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
        notification.Parent = gui
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 8)
        notifCorner.Parent = notification
        
        local notifText = Instance.new("TextLabel")
        notifText.Size = UDim2.new(1, 0, 1, 0)
        notifText.BackgroundTransparency = 1
        notifText.Text = "🔄 Finding new server...\nPlease wait..."
        notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
        notifText.Font = Enum.Font.GothamBold
        notifText.TextSize = 14
        notifText.Parent = notification
        
        -- Try to get server list and teleport
        local success, errorMessage = pcall(function()
            -- Simple server hop - teleport to same place which should find different server
            wait(2) -- Give user time to see notification
            TeleportService:Teleport(placeId, player)
        end)
        
        if not success then
            -- Fallback: Simple rejoin
            print("⚠️ Server hop failed, using rejoin instead")
            notifText.Text = "⚠️ Server hop failed\nRejoining current server..."
            wait(2)
            TeleportService:Teleport(placeId, player)
        end
    end)
end


-- Fly mode menu (Fixed with loadstring)
local function showFlyMenu()
    clearContent()
    currentMenu = "fly"
    
    local flyItems = {
        { 
            label = "✈️ Fly v1 (No Clip)", 
            callback = function()
                print("🚀 Loading Fly No Clip...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/FlyNoClip.txt"))()
            end 
        },
        { 
            label = "✈️ Fly v2 (Safe)", 
            callback = function() 
                print("🚀 Loading Fly Safe...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/FlySafe.txt"))()
            end 
        },
    }

    for _, item in ipairs(flyItems) do
        createButton(item.label, item.callback, Color3.fromRGB(238, 130, 238))
    end
    backBtn.Visible = true
end

-- Speed Run menu with submenu (NEW)
local function showSpeedMenu()
    clearContent()
    currentMenu = "speed"
    
    local speedItems = {
        { 
            label = "⚡ Speed Hack V1", 
            callback = function()
                print("⚡ Loading Speed Hack V1...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/businessmanalex88-stack/BypassWhoAmI/refs/heads/main/Speedrun"))()
            end 
        },
        { 
            label = "⚡ Speed Hack V2", 
            callback = function() 
                print("⚡ Loading Speed Hack V2...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/businessmanalex88-stack/BypassWhoAmI/refs/heads/main/SpeedRunCframe"))()
            end 
        },
    }

    for _, item in ipairs(speedItems) do
        createButton(item.label, item.callback, Color3.fromRGB(238, 130, 238))
    end
    backBtn.Visible = true
end

-- NEW: Infinite Jump menu - FIXED: Now directly loads script
local function showInfiniteJumpMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the InfiniteJump script
    print("🦘 Loading Infinite Jump...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/InfiniteJump.txt"))()
    
    backBtn.Visible = false
end

-- NEW: Fitur Rusuh menu - Contains Walkfling, Fling All, and Partcontroller options
local function showFiturRusuhMenu()
    clearContent()
    currentMenu = "rusuh"
    
    local rusuhItems = {
        { 
            label = "💥 Fling All Player", 
            callback = function()
                print("💥 Loading Fling All Player...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/FlingAll.txt"))()
            end 
        },
        { 
            label = "🚶 Walkfling", 
            callback = function() 
                print("🚶 Loading Walkfling...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Walkflingy.txt"))()
            end 
        },
        { 
            label = "🎮 Partcontroller 1", 
            callback = function() 
                print("🎮 Loading Partcontroller 1...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Part%20controller%201.txt"))()
            end 
        },
        { 
            label = "🎮 Partcontroller 2", 
            callback = function() 
                print("🎮 Loading Partcontroller 2...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Part%20controller%202.txt"))()
            end 
        },
    }

    for _, item in ipairs(rusuhItems) do
        createButton(item.label, item.callback, Color3.fromRGB(238, 130, 238))
    end
    backBtn.Visible = true
end

-- Device menu function (Enhanced with Server Hop and Boost FPS)
local function showDeviceMenu()
    clearContent()
    currentMenu = "device"
    
    local deviceItems = {

        { 
            label = "🔄 Rejoin Server", 
            callback = function()
                print("🔄 Rejoining server...")
                local TeleportService = game:GetService("TeleportService")
                local placeId = game.PlaceId
                TeleportService:Teleport(placeId, player)
            end 
        },
        { 
            label = "🌐 Server Hop", 
            callback = function()
                serverHop()
            end 
        },
        { 
            label = "⚡ Boost FPS", 
            callback = function()
                print("⚡ Loading Boost FPS...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/BoosterFps.txt"))()
            end 
        },
        { 
            label = "👮 Detect Admin", 
            callback = function()
                print("👮 Loading Detect Admin...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/DetectAdmin.txt"))()
            end 
        },
        { 
            label = "🔍 Dex Explorer", 
            callback = function()
                print("🔍 Loading Dex Explorer...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Dex%20Explorer.lua.txt"))()
            end 
        },
    }

    for _, item in ipairs(deviceItems) do
        createButton(item.label, item.callback, Color3.fromRGB(238, 130, 238))
    end
    backBtn.Visible = true
end

-- Hide Name Visual menu - FIXED: Now directly loads script
local function showHideNameMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the HideNameVisual script
    print("🎭 Loading Hide Name Visual...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/HideNameVisual.txt"))()
    
    backBtn.Visible = false
end

-- NEW: Spectate Player menu - FIXED: Now directly loads script
local function showSpectatePlayerMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the Spectate script
    print("👁️ Loading Spectate Player...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Speactate.txt"))()
    
    backBtn.Visible = false
end

-- NEW: Morph menu - FIXED: Now directly loads script
local function showMorphMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the Morph script
    print("🦋 Loading Morph...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Morph.txt"))()
    
    backBtn.Visible = false
end

-- NEW:  Carry menu - FIXED: Now directly loads script
local function showCarryMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the Bypass Carry script
    print("🎒 Loading  Carry...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/BypassCarry.txt"))()
    
    backBtn.Visible = false
end

-- NEW:  RTX menu - FIXED: Now directly loads script
local function showRTXMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the Rtx script
    print("🌟 Loading  RTX...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Rtx.txt"))()
    
    backBtn.Visible = false
end

-- NEW: No Clip menu - FIXED: Now directly loads script
local function showNoClipMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the No Clip Bypass script
    print("👻 Loading No Clip...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/NoClipBypass.txt"))()
    
    backBtn.Visible = false
end

-- NEW: Teleport menu - FIXED: Now directly loads script
local function showTeleportMenu()
    clearContent()
    currentMenu = "main" -- Stay in main menu
    
    -- Directly load the Teleport script
    print("🚀 Loading Teleport...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/Teleport.txt"))()
    
    backBtn.Visible = false
end

local function showCheats()
    clearContent()
    currentMenu = "main"
    
    local items = { 
        { label = "✈️ Fly Mode", callback = showFlyMenu },
        { label = "🦘 Infinite Jump", callback = showInfiniteJumpMenu },
        { label = "💣 Fitur Rusuh", callback = showFiturRusuhMenu },
        { label = "👤 TP to Player", callback = function() 
            print("👤 Loading TP to Player...")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/anslowley/755/refs/heads/main/TpToPlayer.txt"))()
        end },
        { label = "🎭 Hide Name Visual", callback = showHideNameMenu },
        { label = "👁️ Spectate Player", callback = showSpectatePlayerMenu },
        { label = "🦋 Morph", callback = showMorphMenu },
        { label = "🎒  Carry", callback = showCarryMenu },
        { label = "🌟  RTX", callback = showRTXMenu },
        { label = "👻 No Clip", callback = showNoClipMenu },
        { label = "🚀 Teleport", callback = showTeleportMenu },
    }

    for _, item in ipairs(items) do
        createButton(item.label, item.callback, Color3.fromRGB(45, 45, 45))
    end
    backBtn.Visible = false
end

-- Event connections with error handling
local function safeConnect(signal, callback)
    return signal:Connect(function(...)
        pcall(callback, ...)
    end)
end

-- Enhanced dragging system with better error handling
local function makeDraggable(frame)
    pcall(function()
        local dragToggle = false
        local dragStart = nil
        local startPos = nil
        
        -- For menu, use title area. For logo, use the frame itself
        local dragArea = (frame == menu) and title or frame
        
        local dragConnection = nil
        local inputConnection = nil
        
        dragConnection = safeConnect(dragArea.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragToggle = true
                dragStart = input.Position
                startPos = frame.Position
                
                if inputConnection then
                    inputConnection:Disconnect()
                end
                
                inputConnection = safeConnect(input.Changed, function()
                    if input.UserInputState == Enum.UserInputState.End then 
                        dragToggle = false 
                    end
                end)
            end
        end)
        
        safeConnect(UIS.InputChanged, function(input)
            if dragToggle and dragStart and startPos and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(
                    startPos.X.Scale, 
                    startPos.X.Offset + delta.X, 
                    startPos.Y.Scale, 
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end)
end

-- Enhanced resize system with better error handling
local function makeResizable(frame, minWidth, minHeight)
    pcall(function()
        local resizing = false
        local startSize = nil
        local startPos = nil
        local resizeConnection = nil
        
        resizeConnection = safeConnect(resizeHandle.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                resizing = true
                startSize = frame.Size
                startPos = input.Position
                
                safeConnect(input.Changed, function()
                    if input.UserInputState == Enum.UserInputState.End then 
                        resizing = false 
                    end
                end)
            end
        end)
        
        safeConnect(UIS.InputChanged, function(input)
            if resizing and startSize and startPos and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - startPos
                local newWidth = math.max(minWidth or 350, startSize.X.Offset + delta.X)
                local newHeight = math.max(minHeight or 250, startSize.Y.Offset + delta.Y)
                
                frame.Size = UDim2.new(0, newWidth, 0, newHeight)
            end
        end)
    end)
end

-- Current menu tracker
local currentMenu = "main"

-- Button events
safeConnect(cheatBtn.MouseButton1Click, function()
    showCheats()
end)

safeConnect(deviceBtn.MouseButton1Click, function()
    showDeviceMenu()
end)

safeConnect(backBtn.MouseButton1Click, function()
    if currentMenu == "fly" or currentMenu == "hidename" or currentMenu == "rusuh" or currentMenu == "device" or currentMenu == "speed" then
        showCheats()
    else
        showCheats()
    end
end)

-- FIXED CLEAR FUNCTION - Safe cleanup without external scripts
safeConnect(clearBtn.MouseButton1Click, function()
    pcall(function()
        -- Simple hide menu and disable blur
        menu.Visible = false
        logo.Visible = true
        
        if blur then
            blur.Enabled = false
            blur.Size = 0
        end
        
        -- Clear content safely
        clearContent()
        
        print("✅ GUI cleared successfully")
    end)
end)

safeConnect(logoButton.MouseButton1Click, function()
    pcall(function()
        menu.Visible = true
        if blur then
            blur.Enabled = true
            local tween = TweenService:Create(blur, TweenInfo.new(0.3, Enum.EasingStyle.Quad), { Size = 12 })
            tween:Play()
        end
        showCheats()
    end)
end)

safeConnect(minBtn.MouseButton1Click, function()
    pcall(function()
        menu.Visible = false
        if blur then
            blur.Enabled = false
            blur.Size = 0
        end
    end)
end)

safeConnect(closeBtn.MouseButton1Click, function()
    pcall(function()
        menu.Visible = false
        logo.Visible = false
        if blur then
            blur.Enabled = false
            blur.Size = 0
        end
    end)
end)

-- Logo pulsing animation with error handling
local function animateLogo()
    pcall(function()
        if logoGlow and logoIcon then
            local pulseIn = TweenService:Create(logoGlow, 
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), 
                { BackgroundTransparency = 0.7 }
            )
            pulseIn:Play()
            
            local iconPulse = TweenService:Create(logoIcon, 
                TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), 
                { TextSize = 28 }
            )
            iconPulse:Play()
        end
    end)
end

-- Apply dragging and resizing
makeDraggable(menu)
makeDraggable(logo) -- Fixed logo dragging
makeResizable(menu, 350, 250)

-- Start logo animation
animateLogo()

-- Initialize with main menu
showCheats()

-- Enhanced cleanup on player leaving with better error handling
safeConnect(player.AncestryChanged, function()
    if not player.Parent then
        pcall(function()
            -- Cleanup blur effect
            if blur and blur.Parent then
                blur:Destroy()
            end
            
            -- Cleanup GUI
            if gui and gui.Parent then
                gui:Destroy()
            end
            
            -- Additional cleanup for any orphaned effects
            local lighting = game:GetService("Lighting")
            for _, effect in pairs(lighting:GetChildren()) do
                if effect:IsA("BlurEffect") and effect.Name == "VipBlur" then
                    effect:Destroy()
                end
            end
        end)
    end
end)

-- Additional safety: Cleanup on script end
local function onScriptEnd()
    pcall(function()
        if blur and blur.Parent then
            blur:Destroy()
        end
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

-- Register cleanup
game:GetService("RunService").Heartbeat:Connect(function()
    if not gui or not gui.Parent then
        onScriptEnd()
    end
end)

print("✅ Vip GUI v0.5.0.0 loaded successfully!")
print("✨ Updated Features:")
print("  - 💣 NEW: Fitur Rusuh menu added!")
print("  - 💥 Fling All Player moved to Fitur Rusuh")
print("  - 🚶 Walkfling moved to Fitur Rusuh")
print("  - 🎮 NEW: Partcontroller 1 added to Fitur Rusuh")
print("  - 🎮 NEW: Partcontroller 2 added to Fitur Rusuh")
print("  - 🔍 Dex Explorer added to Device menu")
print("  - ✈️ Fly No Clip & Fly Safe functional with loadstring")
print("  - 🌐 Server Hop feature added to Device menu")
print("  - ⚡ Boost FPS added to Device menu")
print("  - 👮 Detect Admin now loads DetectAdmin script")
print("  - 👤 TP to Player now loads TptoPlayer script")
print("  - 🎭 Hide Name Visual now directly loads HideNameVisual script")
print("  - 👁️ Spectate Player now directly loads Spectate script")
print("  - 🦋 Morph now directly loads Morph script")
print("  - 🎒 Carry now directly loads Bypass Carry script")
print("  - 🌟 RTX now directly loads Rtx script")
print("  - 👻 No Clip now directly loads No Clip Bypass script")
print("  - 🚀 Teleport now directly loads Teleport script")
print("  - 🦘 Infinite Jump now directly loads InfiniteJump script")
print("  - 🛡️ Enhanced error handling and memory management")
print("🚀 Ready to use!")
