-- ==========================================================
--  ██╗  ██████╗ ██████╗  █████╗ 
--  ██║  ██╔══██╗██╔══██╗██╔══██╗
--  ██║  ██████╔╝██████╔╝███████║
--  ██║  ██╔═══╝ ██╔═══╝ ██╔══██║
--  ███████╗██║     ██║     ██║  ██║
--  ╚══════╝╚═╝     ╚═╝     ╚═╝  ╚═╝
--  РЕПОЗИТОРНЫЙ СКРИПТ (ВСЁ В ОДНОМ)
--  ВСТАВИТЬ В StarterPlayerScripts (LocalScript)
-- ==========================================================

local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ========== ⚠️ ТУТ ВСТАВЛЯЕШЬ СВОИ ID ИЗ ROBLOX LIBRARY ==========
-- НАЗВАНИЯ ФАЙЛОВ ТОЧНО КАК ТЫ СКАЗАЛ:
local CONFIG = {
    SONG_ID = "1838047120",      -- ID ДЛЯ bankomat-melstroi_uUdPD2C.mp3
    FAA_ID = "1838047120",       -- ID ДЛЯ faaah.mp3
    NOTIFY_ID = "1838047120",    -- ID ДЛЯ fears-to-fathom-notification-sound.mp3
    SKY_ID = "8732483928",       -- ID ДЛЯ сатоши on TikTok.jpg
    CIRCLE_ID = "8732483929",    -- ID ДЛЯ Kitsune (@alicealexia) on Tumblr.jpg
}

-- ========== СОЗДАНИЕ GUI ==========
local gui = Instance.new("ScreenGui")
gui.Name = "JopaGui"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- ========== ГЛАВНАЯ РАМКА ==========
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 360, 0, 500)
mainFrame.Position = UDim2.new(0.5, -180, 0.5, -250)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 24)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 50, 100)
mainFrame.ClipsDescendants = true
mainFrame.Parent = gui

-- Скругление
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- Неоновое свечение
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 24, 1, 24)
glow.Position = UDim2.new(0, -12, 0, -12)
glow.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
glow.BackgroundTransparency = 0.8
glow.BorderSizePixel = 0
glow.ZIndex = 0
glow.Parent = mainFrame
local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 20)
glowCorner.Parent = glow

-- ========== АНИМАЦИЯ ПОЯВЛЕНИЯ ==========
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 360, 0, 500),
    Position = UDim2.new(0.5, -180, 0.5, -250)
}):Play()

-- ========== ЗАГОЛОВОК ==========
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 12)
title.BackgroundTransparency = 1
title.Text = "✦ JOPA ✦"
title.TextColor3 = Color3.fromRGB(255, 70, 120)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Подзаголовок
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 22)
subtitle.Position = UDim2.new(0, 0, 0, 58)
subtitle.BackgroundTransparency = 1
subtitle.Text = "⚡ СИСТЕМА АКТИВИРОВАНА ⚡"
subtitle.TextColor3 = Color3.fromRGB(140, 140, 180)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = mainFrame

-- Мерцание подзаголовка
spawn(function()
    while wait(0.8) do
        subtitle.TextColor3 = Color3.fromRGB(200, 200, 255)
        wait(0.3)
        subtitle.TextColor3 = Color3.fromRGB(140, 140, 180)
    end
end)

-- ========== КНОПКИ ==========
local btnData = {
    {name = "Song", text = "🎵 SONG BURMALDA", y = 0.19, color = Color3.fromRGB(255, 70, 120)},
    {name = "Sky", text = "🌌 SUPERSKY", y = 0.33, color = Color3.fromRGB(70, 180, 255)},
    {name = "Circles", text = "🌀 KRYZOCHKI", y = 0.47, color = Color3.fromRGB(180, 70, 255)},
    {name = "Faaa", text = "🔊 FAAA", y = 0.61, color = Color3.fromRGB(255, 200, 50)},
    {name = "Notify", text = "📢 NOTIFICATION", y = 0.75, color = Color3.fromRGB(50, 255, 200)},
}

local buttons = {}

for _, b in pairs(btnData) do
    local btn = Instance.new("TextButton")
    btn.Name = b.name
    btn.Size = UDim2.new(0.85, 0, 0, 44)
    btn.Position = UDim2.new(0.075, 0, b.y, 0)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 2
    btn.BorderColor3 = b.color
    btn.TextColor3 = Color3.fromRGB(210, 210, 230)
    btn.Text = b.text
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = mainFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    -- Анимация наведения
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.05,
            BackgroundColor3 = Color3.fromRGB(50, 50, 80)
        }):Play()
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.3,
            BackgroundColor3 = Color3.fromRGB(25, 25, 45)
        }):Play()
        btn.TextColor3 = Color3.fromRGB(210, 210, 230)
    end)
    
    -- Анимация нажатия
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0.83, 0, 0, 40),
            Position = UDim2.new(0.085, 0, b.y + 0.005, 0)
        }):Play()
    end)
    
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12, Enum.EasingStyle.Back), {
            Size = UDim2.new(0.85, 0, 0, 44),
            Position = UDim2.new(0.075, 0, b.y, 0)
        }):Play()
    end)
    
    buttons[b.name] = btn
end

-- ========== ЗВУКИ ==========
local soundService = game:GetService("SoundService")

local function getSound(id, name)
    local s = soundService:FindFirstChild(name)
    if not s then
        s = Instance.new("Sound")
        s.SoundId = "rbxassetid://" .. id
        s.Name = name
        s.Parent = soundService
    end
    return s
end

-- ========== ПЕРЕМЕННЫЕ ==========
local circles = {}
local skyActive = false
local songActive = false

-- ========== ФУНКЦИЯ 1: SONG BURMALDA ==========
local function toggleSong()
    songActive = not songActive
    local s = getSound(CONFIG.SONG_ID, "bankomat-melstroi_uUdPD2C")
    if songActive then
        s:Play()
        spawn(function()
            while songActive do
                mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 50)
                wait(0.15)
                mainFrame.BorderColor3 = Color3.fromRGB(255, 50, 100)
                wait(0.15)
            end
        end)
    else
        s:Stop()
        mainFrame.BorderColor3 = Color3.fromRGB(255, 50, 100)
    end
end

-- ========== ФУНКЦИЯ 2: SUPERSKY ==========
local function toggleSky()
    skyActive = not skyActive
    local lighting = game:GetService("Lighting")
    if skyActive then
        local sky = Instance.new("Sky")
        sky.Name = "JopaSky"
        sky.Parent = lighting
        sky.SkyboxBk = "rbxassetid://" .. CONFIG.SKY_ID
        sky.SkyboxDn = "rbxassetid://" .. CONFIG.SKY_ID
        sky.SkyboxFt = "rbxassetid://" .. CONFIG.SKY_ID
        sky.SkyboxLf = "rbxassetid://" .. CONFIG.SKY_ID
        sky.SkyboxRt = "rbxassetid://" .. CONFIG.SKY_ID
        sky.SkyboxUp = "rbxassetid://" .. CONFIG.SKY_ID
        lighting.Ambient = Color3.fromRGB(0, 0, 0)
        lighting.Brightness = 0
    else
        for _, child in pairs(lighting:GetChildren()) do
            if child.Name == "JopaSky" then child:Destroy() end
        end
        lighting.Ambient = Color3.fromRGB(127, 127, 127)
        lighting.Brightness = 2
    end
end

-- ========== ФУНКЦИЯ 3: KRYZOCHKI ==========
local function toggleCircles()
    if #circles > 0 then
        for _, p in pairs(circles) do p:Destroy() end
        circles = {}
        return
    end
    
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for i = 1, 10 do
        local angle = (i / 10) * math.pi * 2
        local radius = 7
        local part = Instance.new("Part")
        part.Size = Vector3.new(2.2, 0.15, 2.2)
        part.Position = root.Position + Vector3.new(math.cos(angle)*radius, 1.5, math.sin(angle)*radius)
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 0.1
        part.Material = Enum.Material.Neon
        part.BrickColor = BrickColor.new("Bright blue")
        part.Parent = workspace
        
        local decal = Instance.new("Decal")
        decal.Texture = "rbxassetid://" .. CONFIG.CIRCLE_ID
        decal.Face = Enum.NormalId.Top
        decal.Parent = part
        
        local light = Instance.new("PointLight")
        light.Parent = part
        light.Range = 6
        light.Brightness = 2.5
        light.Color = Color3.fromRGB(150, 50, 255)
        
        table.insert(circles, part)
    end
end

-- ========== ФУНКЦИЯ 4: FAAA ==========
local function playFaa()
    local s = getSound(CONFIG.FAA_ID, "faaah")
    s:Play()
end

-- ========== ФУНКЦИЯ 5: NOTIFICATION ==========
local function playNotify()
    local s = getSound(CONFIG.NOTIFY_ID, "fears-to-fathom-notification-sound")
    s:Play()
    
    local notify = Instance.new("TextLabel")
    notify.Size = UDim2.new(0, 300, 0, 50)
    notify.Position = UDim2.new(0.5, -150, 0.9, 0)
    notify.AnchorPoint = Vector2.new(0.5, 0.5)
    notify.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notify.BackgroundTransparency = 0.5
    notify.TextColor3 = Color3.fromRGB(255, 70, 120)
    notify.Text = "🔔 УВЕДОМЛЕНИЕ АКТИВИРОВАНО!"
    notify.TextScaled = true
    notify.Font = Enum.Font.GothamBold
    notify.BorderSizePixel = 2
    notify.BorderColor3 = Color3.fromRGB(255, 70, 120)
    notify.Parent = gui
    local nCorner = Instance.new("UICorner")
    nCorner.CornerRadius = UDim.new(0, 10)
    nCorner.Parent = notify
    wait(2.5)
    notify:Destroy()
end

-- ========== ПРИВЯЗКА КНОПОК ==========
buttons["Song"].MouseButton1Click:Connect(toggleSong)
buttons["Sky"].MouseButton1Click:Connect(toggleSky)
buttons["Circles"].MouseButton1Click:Connect(toggleCircles)
buttons["Faaa"].MouseButton1Click:Connect(playFaa)
buttons["Notify"].MouseButton1Click:Connect(playNotify)

-- ========== АНИМАЦИЯ КРУГОВ ==========
RunService.RenderStepped:Connect(function()
    if #circles > 0 then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            for i, part in pairs(circles) do
                local angle = (i / #circles) * math.pi * 2 + tick() * 0.5
                local radius = 7 + math.sin(tick() * 0.6 + i) * 1.5
                part.Position = root.Position + Vector3.new(
                    math.cos(angle) * radius,
                    1.5 + math.sin(tick() * 1.2 + i) * 0.6,
                    math.sin(angle) * radius
                )
            end
        end
    end
end)

-- ========== АВТО-УВЕДОМЛЕНИЕ ==========
wait(1.5)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "JOPA",
    Text = "✅ GUI ЗАГРУЖЕН, ВСЁ ФУНКЦИОНИРУЕТ!",
    Duration = 3
})
