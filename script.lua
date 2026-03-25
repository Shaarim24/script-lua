-- ================================
-- UPDATED KEY SYSTEM (2 DAY + REUSABLE)
-- ================================

local KEY_SYSTEM = {
    permanentKey = "SHAARIM-DEV-2026",

    keys = {
        "KEY-ABC-123",
        "KEY-XYZ-789",
        "KEY-HELLO-2026"
    }
}

local function checkKey(input)
    if input == KEY_SYSTEM.permanentKey then
        return true
    end

    for _, key in ipairs(KEY_SYSTEM.keys) do
        if input == key then
            return true
        end
    end

    return false
end

-- ================================
-- GUI
-- ================================

local Players = game:GetService("Players")

local player = Players.LocalPlayer
if not player then
    repeat task.wait() until Players.LocalPlayer
    player = Players.LocalPlayer
end
repeat task.wait() until player:FindFirstChild("PlayerGui")
local gui = player.PlayerGui

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystemGUI"
keyGui.Parent = gui

local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(80, 80, 80)
frameStroke.Parent = frame
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Parent = keyGui

local box = Instance.new("TextBox")

box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
box.TextColor3 = Color3.fromRGB(255,255,255)

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 6)
boxCorner.Parent = box
box.Size = UDim2.new(0.8, 0, 0, 40)
box.Position = UDim2.new(0.1, 0, 0.2, 0)
box.PlaceholderText = "Enter Key..."
box.Text = ""
box.Parent = frame

local button = Instance.new("TextButton")
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.8, 0, 0, 30)
getKeyButton.Position = UDim2.new(0.1, 0, 0.45, 0)
getKeyButton.Text = "Get Key (One Time)"
getKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getKeyButton.TextColor3 = Color3.fromRGB(255,255,255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Parent = frame
button.Size = UDim2.new(0.8, 0, 0, 40)
button.Position = UDim2.new(0.1, 0, 0.7, 0)
button.Text = "Submit"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0.85, 0)
status.Text = ""
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255, 0, 0)
status.Parent = frame

local unlocked = false

-- SUBMIT BUTTON
button.Activated:Connect(function()
    if checkKey(box.Text) then
        unlocked = true
        keyGui:Destroy()
    else
        status.Text = "Invalid Key"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- GET KEY BUTTON
getKeyButton.Activated:Connect(function()
    local link = "https://link-center.net/4557219/NL1QgR0dIAJX"

    if setclipboard then
        setclipboard(link)
    end

    -- POPUP MESSAGE
    local popup = Instance.new("TextLabel")
    popup.Size = UDim2.new(0, 250, 0, 50)
    popup.Position = UDim2.new(0.5, -125, 0.2, 0)
    popup.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    popup.TextColor3 = Color3.fromRGB(0, 255, 0)
    popup.Text = "Key link copied!"
    popup.Parent = keyGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = popup

    task.delay(2, function()
        popup:Destroy()
    end)
end)

repeat task.wait() until unlocked

-- ================================
-- YOUR ORIGINAL SCRIPT STARTS BELOW
-- ================================

-- (PASTE YOUR ORIGINAL SCRIPT BELOW THIS LINE)


local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local function getCamera()
    local cam = workspace.CurrentCamera
    if cam then
        camera = cam
    end
    return camera
end

local cfg = {
    snowOn      = true,
    count       = 90,
    speed       = 2,
    size        = 4,
    sway        = 7,
    glow        = 4,
    twinkle     = 6,
    glowOn      = false,
    glowColor   = Color3.fromRGB(180,0,255),
    glowBright  = 2,
    glowRange   = 10,
    espOn       = false,
    handsGlowOn = false,
    handsColor  = Color3.fromRGB(0,200,255),
    handsBright = 3,
    handsRange  = 8,
    gameSkinOn  = false,
    gameSkinName = "Default",
    -- Aimbot config
    aimbotOn       = false,
    aimPart        = "Head",
    fov            = 200,
    fovVisible     = true,
    smoothness     = 0.25,
    preferBodyAim  = false,
    teamCheck      = true,
    wallCheck      = true,
    debugAimbot    = false,
    targetLocked   = nil,
    thirdPerson    = false,
    -- third-person camera settings
    thirdPersonDist   = 12,
    thirdPersonFarDist = 18,
    thirdPersonFarMode = false,
    thirdPersonHeight = 2.5,
    thirdPersonSmooth = 0.85,
    thirdPersonLowEnd = true,
}

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- HANDS / TOOL GLOW
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local handsLights   = {}
local rainbowActive = false
local rainbowConn   = nil

local function clearHandsLights()
    for _,l in ipairs(handsLights) do
        pcall(function() if l and l.Parent then l:Destroy() end end)
    end
    handsLights = {}
end

local function makeLight(parent)
    if not parent or not parent:IsA("BasePart") then return end
    local l = Instance.new("PointLight")
    l.Color = cfg.handsColor
    l.Brightness = cfg.handsBright
    l.Range = cfg.handsRange
    l.Parent = parent
    table.insert(handsLights, l)
end

local function applyHandsGlow()
    clearHandsLights()
    if not cfg.handsGlowOn then return end
    local char = player.Character; if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then makeLight(hrp) end
    
    for _,part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            local n = part.Name:lower()
            if n:find("arm") or n:find("hand") or n:find("wrist") then makeLight(part) end
        end
    end
    for _,tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            for _,part in ipairs(tool:GetDescendants()) do
                if part:IsA("BasePart") then makeLight(part) end
            end
        end
    end
end

-- BLOX STRIKE GAME SKIN CHANGER
local bsSkinCache = {}
local bsSkinTemplateByName = {}
local bsSkinTemplateIndex = {}
local bsSkinOptions = {"Default"}
local bsSkinQueued = false
local bsTemplatesScanned = false
local bsCamConn = nil
local bsWorldConn = nil
local bsBackpackConn = nil
local bsBackpackSwapConn = nil
local bsCharConn = nil

local function bsHasVisuals(root)
    if not root then return false end
    return root:FindFirstChildWhichIsA("BasePart", true) ~= nil
        or root:FindFirstChildWhichIsA("Decal", true) ~= nil
        or root:FindFirstChildWhichIsA("Texture", true) ~= nil
        or root:FindFirstChildWhichIsA("SpecialMesh", true) ~= nil
        or root:FindFirstChildWhichIsA("SurfaceAppearance", true) ~= nil
end

local function bsIsSkinContainer(name)
    local n = string.lower(name or "")
    return n:find("skin")
        or n:find("camo")
        or n:find("finish")
        or n:find("paint")
        or n:find("wrap")
        or n:find("cosmetic")
        or n:find("inventory")
        or n:find("loadout")
end

local function bsIsWeaponLikeName(name)
    local n = string.lower(name or "")
    return n:find("weapon")
        or n:find("gun")
        or n:find("rifle")
        or n:find("pistol")
        or n:find("knife")
        or n:find("sniper")
        or n:find("viewmodel")
        or n:find("vm")
end

local function bsIsTargetCandidate(obj)
    if not obj then return false end
    if obj:IsA("Tool") then
        return bsHasVisuals(obj)
    end
    if obj:IsA("Model") then
        if obj:FindFirstChildOfClass("Humanoid") then return false end
        if not bsHasVisuals(obj) then return false end
        local cam = getCamera()
        if cam and obj:IsDescendantOf(cam) then
            return true
        end
        return bsIsWeaponLikeName(obj.Name)
    end
    return false
end

local function refreshBloxStrikeSkinTemplates()
    bsSkinTemplateByName = {}
    bsSkinTemplateIndex = {}
    bsTemplatesScanned = true

    for _,root in ipairs({ReplicatedStorage}) do
        if root then
            for _,obj in ipairs(root:GetDescendants()) do
                if (obj:IsA("Folder") or obj:IsA("Model")) and bsIsSkinContainer(obj.Name) then
                    for _,child in ipairs(obj:GetChildren()) do
                        if (child:IsA("Folder") or child:IsA("Model")) and bsHasVisuals(child) then
                            bsSkinTemplateByName[child.Name] = bsSkinTemplateByName[child.Name] or child
                        end
                    end
                end
            end
        end
    end

    -- Fallback: if no dedicated skin folders were detected, use live tool visuals as templates.
    if next(bsSkinTemplateByName) == nil then
        local function registerLiveTarget(target, prefix)
            if not bsIsTargetCandidate(target) then return end
            local name = (prefix or "Live ") .. target.Name
            bsSkinTemplateByName[name] = bsSkinTemplateByName[name] or target
        end
        local char = player.Character
        if char then
            for _,obj in ipairs(char:GetDescendants()) do
                if bsIsTargetCandidate(obj) then registerLiveTarget(obj, "Live ") end
            end
        end
        local backpack = player:FindFirstChildOfClass("Backpack")
        if backpack then
            for _,obj in ipairs(backpack:GetDescendants()) do
                if bsIsTargetCandidate(obj) then registerLiveTarget(obj, "Live ") end
            end
        end
        local cam = getCamera()
        if cam then
            for _,obj in ipairs(cam:GetDescendants()) do
                if bsIsTargetCandidate(obj) then
                    registerLiveTarget(obj, "LiveVM ")
                else
                    local tool = obj:FindFirstAncestorOfClass("Tool")
                    if tool then registerLiveTarget(tool, "LiveVM ") end
                end
            end
        end
    end

    local names = {"Default"}
    local tmp = {}
    for name,_ in pairs(bsSkinTemplateByName) do
        table.insert(tmp, name)
    end
    table.sort(tmp, function(a, b) return string.lower(a) < string.lower(b) end)
    for _,name in ipairs(tmp) do
        table.insert(names, name)
    end
    bsSkinOptions = names
    if cfg.debugAimbot then
        print("[SKIN] Detected skin templates:", #tmp)
    end
end

local function getBloxStrikeSkinOptions()
    return bsSkinOptions
end

local function bsCacheObject(obj)
    if not obj or bsSkinCache[obj] then return end
    if obj:IsA("BasePart") then
        local data = {
            kind = "BasePart",
            Color = obj.Color,
            Material = obj.Material,
            MaterialVariant = obj.MaterialVariant,
            Reflectance = obj.Reflectance,
        }
        if obj:IsA("MeshPart") then
            data.TextureID = obj.TextureID
        end
        bsSkinCache[obj] = data
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        bsSkinCache[obj] = {
            kind = obj.ClassName,
            Color3 = obj.Color3,
            Transparency = obj.Transparency,
            Texture = obj.Texture,
        }
    elseif obj:IsA("SpecialMesh") then
        bsSkinCache[obj] = {
            kind = "SpecialMesh",
            TextureId = obj.TextureId,
            VertexColor = obj.VertexColor,
        }
    elseif obj:IsA("SurfaceAppearance") then
        bsSkinCache[obj] = {
            kind = "SurfaceAppearance",
            ColorMap = obj.ColorMap,
            MetalnessMap = obj.MetalnessMap,
            NormalMap = obj.NormalMap,
            RoughnessMap = obj.RoughnessMap,
        }
    end
end

local function restoreBloxStrikeSkins()
    for obj,data in pairs(bsSkinCache) do
        if obj and obj.Parent and data then
            pcall(function()
                if data.kind == "BasePart" then
                    obj.Color = data.Color
                    obj.Material = data.Material
                    obj.MaterialVariant = data.MaterialVariant or ""
                    obj.Reflectance = data.Reflectance
                    if obj:IsA("MeshPart") and data.TextureID ~= nil then
                        obj.TextureID = data.TextureID
                    end
                elseif data.kind == "Decal" or data.kind == "Texture" then
                    obj.Color3 = data.Color3
                    obj.Transparency = data.Transparency
                    obj.Texture = data.Texture
                elseif data.kind == "SpecialMesh" then
                    obj.TextureId = data.TextureId
                    obj.VertexColor = data.VertexColor
                elseif data.kind == "SurfaceAppearance" then
                    obj.ColorMap = data.ColorMap
                    obj.MetalnessMap = data.MetalnessMap
                    obj.NormalMap = data.NormalMap
                    obj.RoughnessMap = data.RoughnessMap
                end
            end)
        end
    end
    bsSkinCache = {}
end

local function bsGetTemplateIndex(template)
    local idx = bsSkinTemplateIndex[template]
    if idx then return idx end
    idx = {byKey = {}, part=nil, decal=nil, tex=nil, mesh=nil, surf=nil}
    for _,obj in ipairs(template:GetDescendants()) do
        if obj:IsA("BasePart") then
            idx.part = idx.part or obj
            idx.byKey["BasePart|" .. obj.Name] = idx.byKey["BasePart|" .. obj.Name] or obj
        elseif obj:IsA("Decal") then
            idx.decal = idx.decal or obj
            idx.byKey["Decal|" .. obj.Name] = idx.byKey["Decal|" .. obj.Name] or obj
        elseif obj:IsA("Texture") then
            idx.tex = idx.tex or obj
            idx.byKey["Texture|" .. obj.Name] = idx.byKey["Texture|" .. obj.Name] or obj
        elseif obj:IsA("SpecialMesh") then
            idx.mesh = idx.mesh or obj
            idx.byKey["SpecialMesh|" .. obj.Name] = idx.byKey["SpecialMesh|" .. obj.Name] or obj
        elseif obj:IsA("SurfaceAppearance") then
            idx.surf = idx.surf or obj
            idx.byKey["SurfaceAppearance|" .. obj.Name] = idx.byKey["SurfaceAppearance|" .. obj.Name] or obj
        end
    end
    bsSkinTemplateIndex[template] = idx
    return idx
end

local function bsResolveTargetTemplate(target, selectedTemplate)
    if not target or not selectedTemplate then return nil end
    if bsHasVisuals(selectedTemplate) then return selectedTemplate end
    local exact = selectedTemplate:FindFirstChild(target.Name, true)
    if exact and (exact:IsA("Folder") or exact:IsA("Model")) and bsHasVisuals(exact) then
        return exact
    end
    for _,child in ipairs(selectedTemplate:GetChildren()) do
        if (child:IsA("Folder") or child:IsA("Model")) and bsHasVisuals(child) then
            return child
        end
    end
    return nil
end

local function bsApplyVisual(target, source)
    bsCacheObject(target)
    if target:IsA("BasePart") and source:IsA("BasePart") then
        target.Color = source.Color
        target.Material = source.Material
        target.MaterialVariant = source.MaterialVariant
        target.Reflectance = source.Reflectance
        if target:IsA("MeshPart") and source:IsA("MeshPart") then
            target.TextureID = source.TextureID
        end
    elseif target:IsA("Decal") and source:IsA("Decal") then
        target.Color3 = source.Color3
        target.Transparency = source.Transparency
        target.Texture = source.Texture
    elseif target:IsA("Texture") and source:IsA("Texture") then
        target.Color3 = source.Color3
        target.Transparency = source.Transparency
        target.Texture = source.Texture
    elseif target:IsA("SpecialMesh") and source:IsA("SpecialMesh") then
        target.TextureId = source.TextureId
        target.VertexColor = source.VertexColor
    elseif target:IsA("SurfaceAppearance") and source:IsA("SurfaceAppearance") then
        target.ColorMap = source.ColorMap
        target.MetalnessMap = source.MetalnessMap
        target.NormalMap = source.NormalMap
        target.RoughnessMap = source.RoughnessMap
    end
end

local function bsApplyToTarget(target, selectedTemplate)
    if not bsIsTargetCandidate(target) then return end
    local tpl = bsResolveTargetTemplate(target, selectedTemplate)
    if not tpl then return end
    local idx = bsGetTemplateIndex(tpl)

    for _,obj in ipairs(target:GetDescendants()) do
        local source = nil
        if obj:IsA("BasePart") then
            source = idx.byKey["BasePart|" .. obj.Name] or idx.part
        elseif obj:IsA("Decal") then
            source = idx.byKey["Decal|" .. obj.Name] or idx.decal
        elseif obj:IsA("Texture") then
            source = idx.byKey["Texture|" .. obj.Name] or idx.tex
        elseif obj:IsA("SpecialMesh") then
            source = idx.byKey["SpecialMesh|" .. obj.Name] or idx.mesh
        elseif obj:IsA("SurfaceAppearance") then
            source = idx.byKey["SurfaceAppearance|" .. obj.Name] or idx.surf
        end
        if source then
            pcall(function() bsApplyVisual(obj, source) end)
        end
    end
end

local function applyBloxStrikeSkinNow()
    restoreBloxStrikeSkins()
    if not cfg.gameSkinOn then return end
    if cfg.gameSkinName == "Default" then return end

    if not bsTemplatesScanned then
        refreshBloxStrikeSkinTemplates()
    end

    local selected = bsSkinTemplateByName[cfg.gameSkinName]
    if not selected then
        refreshBloxStrikeSkinTemplates()
        selected = bsSkinTemplateByName[cfg.gameSkinName]
    end
    if not selected then return end

    local char = player.Character
    if char then
        for _,obj in ipairs(char:GetDescendants()) do
            if bsIsTargetCandidate(obj) then
                bsApplyToTarget(obj, selected)
            end
        end
    end
    local backpack = player:FindFirstChildOfClass("Backpack")
    if backpack then
        for _,obj in ipairs(backpack:GetDescendants()) do
            if bsIsTargetCandidate(obj) then
                bsApplyToTarget(obj, selected)
            end
        end
    end
    local cam = getCamera()
    if cam then
        for _,obj in ipairs(cam:GetDescendants()) do
            if bsIsTargetCandidate(obj) then
                bsApplyToTarget(obj, selected)
            else
                local tool = obj:FindFirstAncestorOfClass("Tool")
                if tool then
                    bsApplyToTarget(tool, selected)
                end
            end
        end
    end
end

local function queueApplyBloxStrikeSkin()
    if not cfg.gameSkinOn then return end
    if bsSkinQueued then return end
    bsSkinQueued = true
    task.defer(function()
        bsSkinQueued = false
        if cfg.gameSkinOn then
            applyBloxStrikeSkinNow()
        end
    end)
end

local function bindBloxStrikeSkinHooks()
    if bsCamConn then bsCamConn:Disconnect(); bsCamConn = nil end
    if bsWorldConn then bsWorldConn:Disconnect(); bsWorldConn = nil end
    if bsBackpackConn then bsBackpackConn:Disconnect(); bsBackpackConn = nil end
    if bsBackpackSwapConn then bsBackpackSwapConn:Disconnect(); bsBackpackSwapConn = nil end
    if bsCharConn then bsCharConn:Disconnect(); bsCharConn = nil end

    local cam = getCamera()
    if cam then
        bsCamConn = cam.DescendantAdded:Connect(function()
            queueApplyBloxStrikeSkin()
        end)
    end
    -- Avoid workspace-wide hooks; they are noisy and can lag in big maps.
    bsWorldConn = nil
    local backpack = player:FindFirstChildOfClass("Backpack")
    if backpack then
        bsBackpackConn = backpack.DescendantAdded:Connect(function(desc)
            local tool = desc:IsA("Tool") and desc or desc:FindFirstAncestorOfClass("Tool")
            if tool then
                queueApplyBloxStrikeSkin()
            end
        end)
    end
    bsBackpackSwapConn = player.ChildAdded:Connect(function(child)
        if child and child.Name == "Backpack" then
            bindBloxStrikeSkinHooks()
            queueApplyBloxStrikeSkin()
        end
    end)
    bsCharConn = player.CharacterAdded:Connect(function(char)
        char.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                task.wait(0.1)
                queueApplyBloxStrikeSkin()
            end
        end)
        queueApplyBloxStrikeSkin()
    end)
end

bindBloxStrikeSkinHooks()
local function hookLocalCharacterVisuals(char)
    if not char then return end
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.wait(0.1)
            if cfg.handsGlowOn then applyHandsGlow() end
            if cfg.gameSkinOn then queueApplyBloxStrikeSkin() end
        end
    end)
    char.ChildRemoved:Connect(function(child)
        if child:IsA("Tool") then
            task.wait(0.1)
            if cfg.handsGlowOn then applyHandsGlow() end
            if cfg.gameSkinOn then queueApplyBloxStrikeSkin() end
        end
    end)
end

player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if cfg.handsGlowOn then applyHandsGlow() end
    if cfg.gameSkinOn then queueApplyBloxStrikeSkin() end
    hookLocalCharacterVisuals(char)
end)

if player.Character then
    hookLocalCharacterVisuals(player.Character)
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- LETTERBOX BARS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local barsGui = Instance.new("ScreenGui")
barsGui.Name = "LetterboxBars"; barsGui.IgnoreGuiInset = true
barsGui.ResetOnSpawn = false; barsGui.Parent = gui

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,0); topBar.Position=UDim2.new(0,0,0,0)
topBar.BackgroundColor3 = Color3.fromRGB(0,0,0); topBar.BorderSizePixel=0; topBar.ZIndex=50
topBar.Parent = barsGui

local botBar = Instance.new("Frame")
botBar.Size = UDim2.new(1,0,0,0); botBar.AnchorPoint = Vector2.new(0,1)
botBar.Position = UDim2.new(0,0,1,0)
botBar.BackgroundColor3 = Color3.fromRGB(0,0,0); botBar.BorderSizePixel=0; botBar.ZIndex=50
botBar.Parent = barsGui

local leftBar = Instance.new("Frame")
leftBar.Size = UDim2.new(0,0,1,0); leftBar.Position=UDim2.new(0,0,0,0)
leftBar.BackgroundColor3 = Color3.fromRGB(0,0,0); leftBar.BorderSizePixel=0; leftBar.ZIndex=50
leftBar.Parent = barsGui

local rightBar = Instance.new("Frame")
rightBar.Size = UDim2.new(0,0,1,0); rightBar.AnchorPoint=Vector2.new(1,0)
rightBar.Position = UDim2.new(1,0,0,0)
rightBar.BackgroundColor3 = Color3.fromRGB(0,0,0); rightBar.BorderSizePixel=0; rightBar.ZIndex=50
rightBar.Parent = barsGui

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- PLAYER GLOW
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local appliedGlows = {}

local function removePlayerGlow(p)
    if appliedGlows[p] then
        local d = appliedGlows[p]
        if d.highlight and d.highlight.Parent then d.highlight:Destroy() end
        if d.light and d.light.Parent then d.light:Destroy() end
        appliedGlows[p] = nil
    end
end

local function applyPlayerGlow(p)
    removePlayerGlow(p)
    if not cfg.glowOn then return end
    local char = p.Character; if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    
    local hl = Instance.new("Highlight")
    hl.Adornee = char; hl.OutlineColor = cfg.glowColor; hl.FillColor = cfg.glowColor
    hl.OutlineTransparency = 0.3; hl.FillTransparency = 0.88; hl.Parent = char
    
    local light = Instance.new("PointLight")
    light.Color = cfg.glowColor; light.Brightness = cfg.glowBright
    light.Range = cfg.glowRange; light.Parent = hrp
    
    appliedGlows[p] = {highlight=hl, light=light}
end

local function applyAllGlows()
    for _,p in ipairs(Players:GetPlayers()) do applyPlayerGlow(p) end
end
local function removeAllGlows()
    for _,p in ipairs(Players:GetPlayers()) do removePlayerGlow(p) end
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- ESP
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local espGlows = {}
local espFillColor    = Color3.fromRGB(255,50,50)
local espOutlineColor = Color3.fromRGB(255,255,255)
local espFillTrans    = 0.5
local espOutlineTrans = 0.0

local function findCharInWorkspace(p)
    if p.Character then
        local c = p.Character
        if c:IsDescendantOf(workspace) and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Head") or c:FindFirstChildOfClass("Humanoid")) then
            return c
        end
    end
    for _,obj in ipairs(workspace:GetChildren()) do
        if obj.Name:sub(1,3) == "BAC" then
            local chars = obj:FindFirstChild("Characters")
            if chars then
                for _,teamFolder in ipairs(chars:GetChildren()) do
                    local c = teamFolder:FindFirstChild(p.Name)
                    if c then return c end
                end
            end
        end
    end
    if p.Character then
        return p.Character
    end
    return nil
end

local function getTeamFromChar(p, char)
    if p and p.Team then return p.Team.Name end

    if not char then return nil end
    local folder = char.Parent
    if not folder then return nil end
    if folder.Name == "Terrorists" then return "T" end
    if folder.Name == "Counter-Terrorists" then return "CT" end
    
    local hl = char:FindFirstChildOfClass("Highlight")
    if not hl then return nil end
    
    local CT_COLOR=Color3.new(1,0.862745,0.196078)
    local T_COLOR=Color3.new(0,0.294118,0.784314)
    local function colorClose(a,b) return math.abs(a.R-b.R)<0.05 and math.abs(a.G-b.G)<0.05 and math.abs(a.B-b.B)<0.05 end
    
    if colorClose(hl.OutlineColor,CT_COLOR) then return "CT" end
    if colorClose(hl.OutlineColor,T_COLOR) then return "T" end
    return nil
end

local function getTeam(p)
    return getTeamFromChar(p, findCharInWorkspace(p))
end

local function isEnemy(p)
    if p == player then return false end
    local myTeam = getTeam(player)
    local theirTeam = getTeam(p)
    if not myTeam or not theirTeam then return true end -- Defaults to Enemy if Teams aren't accessible/FFA
    return myTeam ~= theirTeam
end

local function removeESP(p)
    if espGlows[p] then
        if espGlows[p].hl and espGlows[p].hl.Parent then espGlows[p].hl:Destroy() end
        espGlows[p] = nil
    end
end

local function applyESP(p)
    removeESP(p)
    if not cfg.espOn then return end
    if p == player then return end
    if cfg.teamCheck and not isEnemy(p) then return end
    local char = findCharInWorkspace(p)
    if not char then return end
    
    local hl = Instance.new("Highlight")
    hl.Adornee = char; hl.FillColor = espFillColor; hl.OutlineColor = espOutlineColor
    hl.FillTransparency = espFillTrans; hl.OutlineTransparency = espOutlineTrans
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Parent = char
    espGlows[p] = {hl=hl}
end

local function applyAllESP()
    for _,p in ipairs(Players:GetPlayers()) do applyESP(p) end
end
local function removeAllESP()
    for _,p in ipairs(Players:GetPlayers()) do removeESP(p) end
end
local function refreshESPVisuals(rebuildAll)
    for p,d in pairs(espGlows) do
        local hl = d and d.hl
        if hl and hl.Parent then
            hl.FillColor = espFillColor
            hl.OutlineColor = espOutlineColor
            hl.FillTransparency = espFillTrans
            hl.OutlineTransparency = espOutlineTrans
        else
            espGlows[p] = nil
        end
    end
    if rebuildAll and cfg.espOn then
        applyAllESP()
    end
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- AIMBOT SYSTEM
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local aimbotConnection = nil
local aimbotCameraConn = nil
local fovCircle = nil
local _prevCameraType = nil
local _prevCameraSubject = nil
-- third-person camera state
local _prevCameraType_tp = nil
local _prevCameraSubject_tp = nil
local thirdPersonConn = nil
local thirdPersonHeartbeatConn = nil
local thirdPersonRenderConn = nil
local thirdPersonSubjectConn = nil
-- third-person debug throttle (diagnostics only)
local tpDebugAccum = 0
local tpDebugInterval = 0.5
local tpSmoothedCFrame = nil
-- third-person input state
local tpYaw = 0
local tpPitch = 0
local tpInputConn = nil
local tpSensitivity = 0.006
local tpTransparencyCache = {}
local tpLookAtSmoothed = nil
local aimbotScanAccum = 0
local tpCharParts = {}
local tpCameraParts = {}

local function setThirdPersonLTM(part, desired)
    if not part or not part.Parent then return end
    if tpTransparencyCache[part] == nil then
        tpTransparencyCache[part] = part.LocalTransparencyModifier
    end
    if part.LocalTransparencyModifier ~= desired then
        part.LocalTransparencyModifier = desired
    end
end

local function refreshThirdPersonPartCaches()
    tpCharParts = {}
    tpCameraParts = {}

    local char = player.Character
    if char then
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("BasePart") then
                table.insert(tpCharParts, obj)
            end
        end
    end

    local cam = getCamera()
    if cam then
        for _, obj in ipairs(cam:GetDescendants()) do
            if obj:IsA("BasePart") then
                table.insert(tpCameraParts, obj)
            end
        end
    end
end

local function applyThirdPersonVisibility()
    if #tpCharParts == 0 and #tpCameraParts == 0 then
        refreshThirdPersonPartCaches()
    end

    local refreshNeeded = false

    for _, obj in ipairs(tpCharParts) do
        if obj and obj.Parent then
            -- Hide first-person style hands/arms/tools while keeping rest of character visible.
            local n = obj.Name:lower()
            local isHandLike = n:find("hand") or n:find("arm") or n:find("glove") or n:find("wrist")
            local isToolPart = obj:FindFirstAncestorOfClass("Tool") ~= nil
            local desired = (isHandLike or isToolPart) and 1 or 0
            setThirdPersonLTM(obj, desired)
        else
            refreshNeeded = true
        end
    end

    for _, obj in ipairs(tpCameraParts) do
        if obj and obj.Parent then
            -- Hide viewmodel/camera parts so first-person overlay does not show.
            setThirdPersonLTM(obj, 1)
        else
            refreshNeeded = true
        end
    end

    if refreshNeeded then
        refreshThirdPersonPartCaches()
    end
end

local function restoreLocalCharacterVisibility()
    for part, oldValue in pairs(tpTransparencyCache) do
        if part and part.Parent then
            pcall(function()
                part.LocalTransparencyModifier = oldValue
            end)
        end
    end
    tpTransparencyCache = {}
    tpCharParts = {}
    tpCameraParts = {}
end

local function buildWallCheckRayParams(myChar, cam)
    local rayParams = RaycastParams.new()
    local ignore = cam and {myChar, cam} or {myChar}
    rayParams.FilterDescendantsInstances = ignore
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    return rayParams
end

local function hasClearLineOfSight(rayParams, origin, targetPart, targetChar)
    local dir = targetPart.Position - origin
    if dir.Magnitude <= 0.001 then return true end
    local raycast = workspace:Raycast(origin, dir, rayParams)
    if not raycast then return true end
    return raycast.Instance and raycast.Instance:IsDescendantOf(targetChar)
end

local function getPreferredAimPart(targetChar)
    if not targetChar then return nil end
    return targetChar:FindFirstChild("Head")
        or targetChar:FindFirstChild(cfg.aimPart)
        or targetChar:FindFirstChild("UpperTorso")
        or targetChar:FindFirstChild("HumanoidRootPart")
        or targetChar:FindFirstChild("Torso")
end

local function getAimbotAimPosition(targetPart)
    if not targetPart then return nil end
    local targetChar = targetPart.Parent
    local aimPart = targetChar and getPreferredAimPart(targetChar) or targetPart
    local aimPos = (aimPart or targetPart).Position

    if targetChar then
        local velPart = targetChar:FindFirstChild("HumanoidRootPart")
        if velPart then
            local lead = cfg.thirdPerson and 0.012 or 0
            aimPos = aimPos + (velPart.AssemblyLinearVelocity * lead)
        end
    end

    return aimPos
end

local canRedirectNow

local function alignLocalCharacterToAim(aimPos, alpha)
    -- Some gun systems fire from muzzle orientation, so rotate gently only while firing.
    local char = player.Character
    if not char or not aimPos then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    if not canRedirectNow() then
        hum.AutoRotate = true
        return
    end
    hum.AutoRotate = false

    local flatDir = Vector3.new(aimPos.X - hrp.Position.X, 0, aimPos.Z - hrp.Position.Z)
    if flatDir.Magnitude <= 0.001 then return end

    local desired = CFrame.lookAt(hrp.Position, hrp.Position + flatDir.Unit)
    local blend = math.clamp(alpha or 0.75, 0.35, 1)
    hrp.CFrame = hrp.CFrame:Lerp(desired, blend)
end

local isFiring = false
local lastFireAt = 0
local fireWindow = 0.22
local lastShotPatchDebug = 0

canRedirectNow = function()
    if isFiring then return true end
    return (tick() - lastFireAt) <= fireWindow
end

local function isLikelyShootRemote(remote)
    if not remote or not (remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction")) then return false end
    local name = (remote.Name or ""):lower()
    if name:find("shoot") or name:find("fire") or name:find("bullet") or name:find("hit") or name:find("ray") or name:find("weapon") or name:find("gun") or name:find("damage") then
        return true
    end
    local parent = remote.Parent
    if parent then
        local pname = (parent.Name or ""):lower()
        if pname:find("weapon") or pname:find("gun") or pname:find("fire") or pname:find("shoot") then
            return true
        end
    end
    return false
end

local function hasShotLikeArgs(args)
    local vecCount = 0
    for _,arg in ipairs(args) do
        local t = typeof(arg)
        if t == "Ray" or t == "CFrame" then
            return true
        end
        if t == "Vector3" and arg.Magnitude > 1 then
            vecCount = vecCount + 1
        end
    end
    return vecCount >= 2
end

local function tryPatchShotRemoteArgs(remote, args)
    if not cfg.aimbotOn then return false end
    if not canRedirectNow() then return false end
    if not isLikelyShootRemote(remote) and not hasShotLikeArgs(args) then return false end

    local targetPart = cfg.targetLocked
    if not targetPart or not targetPart.Parent then return false end
    local targetHum = targetPart.Parent:FindFirstChildOfClass("Humanoid")
    if targetHum and targetHum.Health <= 0 then return false end

    local cam = getCamera()
    if not cam then return false end
    local origin = cam.CFrame.Position
    local aimPos = getAimbotAimPosition(targetPart) or targetPart.Position
    local toTarget = aimPos - origin
    if toTarget.Magnitude <= 0.001 then return false end
    local dirUnit = toTarget.Unit

    local patched = false
    local localChar = player.Character
    local localHead = localChar and localChar:FindFirstChild("Head")
    local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
    local function isOriginLike(v)
        if (v - origin).Magnitude <= 8 then return true end
        if localHead and (v - localHead.Position).Magnitude <= 8 then return true end
        if localRoot and (v - localRoot.Position).Magnitude <= 8 then return true end
        return false
    end
    for i,arg in ipairs(args) do
        local t = typeof(arg)
        if t == "Ray" then
            local mag = arg.Direction.Magnitude
            if mag <= 1 then mag = math.max(toTarget.Magnitude + 5, 750) end
            args[i] = Ray.new(arg.Origin, dirUnit * mag)
            patched = true
        elseif t == "Vector3" then
            local mag = arg.Magnitude
            if mag > 0.001 and mag <= 1.5 then
                args[i] = dirUnit
                patched = true
            elseif not isOriginLike(arg) and localHead and (arg - aimPos).Magnitude <= 20 then
                args[i] = aimPos
                patched = true
            end
        elseif t == "CFrame" then
            args[i] = CFrame.lookAt(arg.Position, aimPos)
            patched = true
        end
    end
    if patched and cfg.debugAimbot then
        local now = tick()
        if (now - lastShotPatchDebug) > 0.25 then
            print("[AIMBOT] Patched FireServer:", remote:GetFullName())
            lastShotPatchDebug = now
        end
    end
    return patched
end

local silentAimHooked = false
local function getRedirectedShotDirection(origin, direction)
    if not cfg.aimbotOn then return nil end
    if not canRedirectNow() then return nil end
    local targetPart = cfg.targetLocked
    if not targetPart or not targetPart.Parent then return nil end

    local targetHum = targetPart.Parent:FindFirstChildOfClass("Humanoid")
    if targetHum and targetHum.Health <= 0 then return nil end

    local aimPos = getAimbotAimPosition(targetPart) or targetPart.Position
    local toTarget = aimPos - origin
    if toTarget.Magnitude <= 0.001 then return nil end

    local dirMag = direction.Magnitude
    local targetDist = toTarget.Magnitude
    if dirMag <= 1 then
        dirMag = math.max(targetDist + 5, 750)
    elseif dirMag < targetDist then
        dirMag = targetDist + 5
    end
    dirMag = math.clamp(dirMag, 10, 10000)
    return toTarget.Unit * dirMag
end

local function installSilentAimHook()
    if silentAimHooked then return end
    if not newcclosure then return end

    local _checkcaller = checkcaller or function() return false end
    local _getnamecallmethod = getnamecallmethod or function() return nil end
    if hookmetamethod then
        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = _getnamecallmethod()
            local args = {...}

            if not _checkcaller() then
                if method == "FireServer" and typeof(self) == "Instance" and self:IsA("RemoteEvent") then
                    if tryPatchShotRemoteArgs(self, args) then
                        return oldNamecall(self, table.unpack(args))
                    end
                elseif method == "InvokeServer" and typeof(self) == "Instance" and self:IsA("RemoteFunction") then
                    if tryPatchShotRemoteArgs(self, args) then
                        return oldNamecall(self, table.unpack(args))
                    end
                end

                if self == workspace then
                    if method == "Raycast" and typeof(args[1]) == "Vector3" and typeof(args[2]) == "Vector3" then
                        local redirected = getRedirectedShotDirection(args[1], args[2])
                        if redirected then
                            args[2] = redirected
                            return oldNamecall(self, table.unpack(args))
                        end
                    elseif (method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist")
                        and typeof(args[1]) == "Ray" then
                        local ray = args[1]
                        local redirected = getRedirectedShotDirection(ray.Origin, ray.Direction)
                        if redirected then
                            args[1] = Ray.new(ray.Origin, redirected)
                            return oldNamecall(self, table.unpack(args))
                        end
                    end
                end
            end

            return oldNamecall(self, ...)
        end))

        local oldIndex
        oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
            if not _checkcaller() and self == mouse and cfg.aimbotOn then
                local targetPart = cfg.targetLocked
                if targetPart and targetPart.Parent then
                    local hum = targetPart.Parent:FindFirstChildOfClass("Humanoid")
                    if not hum or hum.Health > 0 then
                        local cam = getCamera()
                        local origin = cam and cam.CFrame.Position or Vector3.zero
                        local aimPos = getAimbotAimPosition(targetPart) or targetPart.Position
                        local dir = aimPos - origin
                        local dirUnit = dir.Magnitude > 0.001 and dir.Unit or Vector3.new(0, 0, -1)
                        if key == "Hit" then
                            return CFrame.lookAt(aimPos, aimPos + dirUnit)
                        elseif key == "Target" then
                            return targetPart
                        elseif key == "UnitRay" then
                            return Ray.new(origin, dirUnit)
                        elseif key == "Origin" then
                            return origin
                        end
                    end
                end
            end
            return oldIndex(self, key)
        end))
    end

    if hookfunction then
        pcall(function()
            local oldRaycast
            oldRaycast = hookfunction(workspace.Raycast, newcclosure(function(self, origin, direction, rayParams)
                if _checkcaller() then
                    return oldRaycast(self, origin, direction, rayParams)
                end
                if typeof(origin) == "Vector3" and typeof(direction) == "Vector3" then
                    local redirected = getRedirectedShotDirection(origin, direction)
                    if redirected then
                        return oldRaycast(self, origin, redirected, rayParams)
                    end
                end
                return oldRaycast(self, origin, direction, rayParams)
            end))
        end)
    end

    silentAimHooked = true
    if cfg.debugAimbot then
        print("[AIMBOT] Silent aim ray redirect hook active")
    end
end
-- Disabled for the reference-style aimbot path below.

local function getClosestEnemy()
    local fovLimit = cfg.fov * (cfg.thirdPerson and 1.35 or 1)
    local closest, closestDist = nil, fovLimit
    local myChar = player.Character
    if not myChar then return nil end
    local cam = getCamera()
    if not cam then return nil end

    local rayParams = buildWallCheckRayParams(myChar, cam)
    local rayOrigin = cam.CFrame.Position

    local mousePos
    if cfg.thirdPerson or UIS.MouseBehavior == Enum.MouseBehavior.LockCenter then
        local vs = cam.ViewportSize
        mousePos = Vector2.new(vs.X * 0.5, vs.Y * 0.5)
    else
        mousePos = UIS:GetMouseLocation()
    end

    for _, p in ipairs(Players:GetPlayers()) do
        if p == player then continue end
        local targetChar = findCharInWorkspace(p)
        if not targetChar then continue end

        if cfg.teamCheck and not isEnemy(p) then continue end

        local targetPart = getPreferredAimPart(targetChar)

        if not targetPart then continue end
        local hum = targetChar:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health <= 0 then continue end

        local screenPos, onScreen = cam:WorldToViewportPoint(targetPart.Position)
        if not onScreen then continue end

        local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude

        if cfg.wallCheck and not hasClearLineOfSight(rayParams, rayOrigin, targetPart, targetChar) then
            continue
        end

        local hasESP = espGlows[p] ~= nil
        local effectiveDist = hasESP and (dist * 0.5) or dist

        if effectiveDist <= closestDist then
            closest = targetPart
            closestDist = effectiveDist
        end
    end

    return closest
end

local function getAimScreenPos(cam)
    if not cam then return UIS:GetMouseLocation() end
    if cfg.thirdPerson or UIS.MouseBehavior == Enum.MouseBehavior.LockCenter then
        local vs = cam.ViewportSize
        return Vector2.new(vs.X * 0.5, vs.Y * 0.5)
    end
    return UIS:GetMouseLocation()
end

local function isTargetStillValid(targetPart)
    if not targetPart or not targetPart.Parent then return false end
    local targetChar = targetPart.Parent
    targetPart = getPreferredAimPart(targetChar) or targetPart

    local hum = targetChar:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health <= 0 then return false end

    local targetPlayer = Players:GetPlayerFromCharacter(targetChar) or Players:FindFirstChild(targetChar.Name)
    if cfg.teamCheck and targetPlayer and not isEnemy(targetPlayer) then
        return false
    end

    local cam = getCamera()
    if not cam then return false end
    local screenPos, onScreen = cam:WorldToViewportPoint(targetPart.Position)
    if not onScreen then return false end

    if cfg.wallCheck then
        local myChar = player.Character
        if not myChar then return false end
        local rayParams = buildWallCheckRayParams(myChar, cam)
        if not hasClearLineOfSight(rayParams, cam.CFrame.Position, targetPart, targetChar) then
            return false
        end
    end

    local aimPos = getAimScreenPos(cam)
    local dist = (Vector2.new(screenPos.X, screenPos.Y) - aimPos).Magnitude
    local validFov = cfg.fov * (cfg.thirdPerson and 1.5 or 1.2)
    return dist <= validFov
end

local function createFOVCircle()
    if fovCircle then fovCircle:Destroy() end
    local screenGui = gui:FindFirstChild("AimbotFOV")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "AimbotFOV"; screenGui.Parent = gui
        screenGui.IgnoreGuiInset = true
    end
    
    fovCircle = Instance.new("Frame")
    fovCircle.Size = UDim2.new(0, cfg.fov * 2, 0, cfg.fov * 2)
    fovCircle.BackgroundTransparency = 1
    fovCircle.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = fovCircle
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 50, 50)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.2
    stroke.Parent = fovCircle
end

local function toggleAimbot(enabled)
    -- Clean up any previous connections or renderstep bindings safely
    if aimbotConnection then pcall(function() aimbotConnection:Disconnect() end); aimbotConnection = nil end
    if aimbotCameraConn then pcall(function() RS:UnbindFromRenderStep(aimbotCameraConn) end); aimbotCameraConn = nil end

    if enabled then
        -- save previous camera state (don't force Scriptable so player input still works)
        pcall(function()
              local cam = getCamera()
              if cam then
                  _prevCameraType = cam.CameraType
                  _prevCameraSubject = cam.CameraSubject
                  if not cfg.thirdPerson then
                      local myChar = player.Character
                      local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                      cam.CameraType = Enum.CameraType.Custom
                      if myHum then cam.CameraSubject = myHum end
                  end
              end
        end)

        -- Reference-style lock: reacquire every frame and lerp camera directly to target.
        if aimbotCameraConn then pcall(function() RS:UnbindFromRenderStep(aimbotCameraConn) end) end
        local aName = "SnowFX_AimbotCamera"
        local aPriority = Enum.RenderPriority.Camera.Value
        RS:BindToRenderStep(aName, aPriority, function()
            local target = getClosestEnemy()
            if target and target.Parent then
                cfg.targetLocked = target
                if cfg.debugAimbot then
                    local tp = Players:GetPlayerFromCharacter(target.Parent)
                    print("[AIMBOT] Target found:", tp and tp.Name or "Unknown", "part=", target.Name)
                end
            else
                if cfg.debugAimbot then print("[AIMBOT] No valid target") end
                cfg.targetLocked = nil
                local myChar = player.Character
                if myChar then
                    local mh = myChar:FindFirstChildOfClass("Humanoid")
                    if mh then mh.AutoRotate = true end
                end
            end

            -- apply camera smoothing toward target (preserve player camera input)
            if cfg.targetLocked and cfg.targetLocked.Parent then
                if not cfg.thirdPerson then
                    local cam = getCamera()
                    if not cam then return end
                    local myChar = player.Character
                    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                    if cam.CameraType ~= Enum.CameraType.Custom then
                        cam.CameraType = Enum.CameraType.Custom
                    end
                    if myHum and cam.CameraSubject ~= myHum then
                        cam.CameraSubject = myHum
                    end
                    if myHum then
                        myHum.AutoRotate = true
                    end
                    local currentCFrame = cam.CFrame
                    local aimPos = getAimbotAimPosition(cfg.targetLocked) or cfg.targetLocked.Position
                    local targetCFrame = CFrame.lookAt(currentCFrame.Position, aimPos)
                    local smoothAlpha = math.clamp(cfg.smoothness or 0.25, 0.05, 0.5)
                    local smoothCFrame = currentCFrame:Lerp(targetCFrame, smoothAlpha)
                    cam.CFrame = smoothCFrame
                end
            end
        end)
        aimbotCameraConn = aName
        if cfg.debugAimbot then print("[AIMBOT] Bound renderstep:", aimbotCameraConn, "priority=", aPriority) end

        if cfg.fovVisible then createFOVCircle() end
    else
        cfg.targetLocked = nil
        if fovCircle then fovCircle:Destroy(); fovCircle = nil end
        if aimbotConnection then pcall(function() aimbotConnection:Disconnect() end); aimbotConnection = nil end
        if aimbotCameraConn then pcall(function() RS:UnbindFromRenderStep(aimbotCameraConn) end); if cfg.debugAimbot then print("[AIMBOT] Unbound renderstep:", aimbotCameraConn) end; aimbotCameraConn = nil end
        -- restore camera control (don't override third-person)
        pcall(function()
            if not cfg.thirdPerson then
                local cam = getCamera()
                if cam then
                    if _prevCameraType then
                        cam.CameraType = _prevCameraType
                        _prevCameraType = nil
                    else
                        cam.CameraType = Enum.CameraType.Custom
                    end
                    if _prevCameraSubject then
                        cam.CameraSubject = _prevCameraSubject
                        _prevCameraSubject = nil
                    else
                        local myChar2 = player.Character
                        local myHum2 = myChar2 and myChar2:FindFirstChildOfClass("Humanoid")
                        if myHum2 then cam.CameraSubject = myHum2 end
                    end
                end
            end
        end)
        local myChar = player.Character
        if myChar then
            local mh = myChar:FindFirstChildOfClass("Humanoid")
            if mh then mh.AutoRotate = true end
        end
    end
end

local function getThirdPersonDistance()
    if cfg.thirdPersonFarMode then
        return cfg.thirdPersonFarDist or math.max((cfg.thirdPersonDist or 12) + 6, 16)
    end
    return cfg.thirdPersonDist or 12
end

local function applyThirdPersonCamera(dt)
    if not cfg.thirdPerson then return end
    local char = player.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp then return end

    local cam = getCamera()
    if not cam then return end

    local frameDt = math.max(dt or (1/60), 1/240)
    local mouseDelta = UIS:GetMouseDelta()
    if mouseDelta.X ~= 0 or mouseDelta.Y ~= 0 then
        tpYaw = tpYaw - mouseDelta.X * tpSensitivity
        tpPitch = math.clamp(tpPitch + mouseDelta.Y * tpSensitivity, -1.2, 1.2)
    end

    local distance = getThirdPersonDistance()
    local height = cfg.thirdPersonHeight or 2.5

    local targetPos = hrp.Position + Vector3.new(0, 1.5, 0)
    local desiredLookAtPos = targetPos + (hrp.CFrame.LookVector * math.max(distance, 8))
    if cfg.aimbotOn and cfg.targetLocked and cfg.targetLocked.Parent then
        -- Aim exactly at enemy part while keeping camera position anchored to local character.
        desiredLookAtPos = getAimbotAimPosition(cfg.targetLocked) or cfg.targetLocked.Position
        alignLocalCharacterToAim(desiredLookAtPos, cfg.thirdPersonLowEnd and 0.22 or 0.35)
    else
        if hum then hum.AutoRotate = true end
    end

    if not tpLookAtSmoothed then
        tpLookAtSmoothed = desiredLookAtPos
    end
    local lookBase = (cfg.thirdPersonLowEnd and 0.18 or 0.28)
    local lookAlpha = 1 - math.pow(1 - lookBase, frameDt * 60)
    tpLookAtSmoothed = tpLookAtSmoothed:Lerp(desiredLookAtPos, math.clamp(lookAlpha, 0.02, 1))

    -- Orbit direction from target to camera derived from yaw/pitch.
    local cosPitch = math.cos(tpPitch)
    local offsetDir = Vector3.new(
        -math.sin(tpYaw) * cosPitch,
        math.sin(tpPitch),
        -math.cos(tpYaw) * cosPitch
    )
    local offset = (offsetDir * distance) + Vector3.new(0, height, 0)
    local camPos = hrp.Position + offset

    -- camera collision: raycast from lookAt position toward desired camera position
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {char, cam}
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    local rayDir = camPos - targetPos
    local ray = workspace:Raycast(targetPos, rayDir, rayParams)
    if ray then
        local minDist = math.max(2, distance * 0.2)
        local hitDist = (ray.Position - targetPos).Magnitude
        if hitDist > minDist then
            camPos = ray.Position + ray.Normal * 0.5
        end
    end

    local targetCFrame = CFrame.lookAt(camPos, tpLookAtSmoothed)

    pcall(function()
        cam.CameraType = Enum.CameraType.Scriptable
        -- Ensure the camera subject is set to the humanoid so the local character is rendered
        if hum then pcall(function() cam.CameraSubject = hum end) end
    end)

        local smoothParam = math.clamp(cfg.thirdPersonSmooth or 0.85, 0.05, 1)
        -- Framerate-aware smoothing with higher responsiveness.
        local lerpAlpha = 1 - math.pow(1 - smoothParam, frameDt * 60)

    if not tpSmoothedCFrame then
        tpSmoothedCFrame = cam.CFrame or targetCFrame
    end

    if lerpAlpha >= 0.99 then
        tpSmoothedCFrame = targetCFrame
    else
        tpSmoothedCFrame = tpSmoothedCFrame:Lerp(targetCFrame, lerpAlpha)
    end
    applyThirdPersonVisibility()
    cam.CFrame = tpSmoothedCFrame

    tpDebugAccum = tpDebugAccum + (dt or 0)
    if tpDebugAccum >= tpDebugInterval then
        tpDebugAccum = 0
        if cfg.debugAimbot then
            print("[TP_DEBUG] CameraType:", cam.CameraType, "Subject:", cam.CameraSubject)
            print("[TP_DEBUG] camPos:", tostring(camPos), "lookAt:", tostring(tpLookAtSmoothed))
        end
    end
end

local function toggleThirdPerson(enabled)
    -- Ensure any previous renderstep is removed (use tracked name)
    if thirdPersonConn then pcall(function() RS:UnbindFromRenderStep(thirdPersonConn) end); thirdPersonConn = nil end
    if thirdPersonHeartbeatConn then thirdPersonHeartbeatConn:Disconnect(); thirdPersonHeartbeatConn = nil end
    if thirdPersonRenderConn then thirdPersonRenderConn:Disconnect(); thirdPersonRenderConn = nil end
    if thirdPersonSubjectConn then thirdPersonSubjectConn:Disconnect(); thirdPersonSubjectConn = nil end
    tpSmoothedCFrame = nil
    tpLookAtSmoothed = nil
    tpCharParts = {}
    tpCameraParts = {}

    if enabled and not thirdPersonConn then
        -- Save previous camera state
        pcall(function()
             local cam = getCamera()
             if cam then
                 _prevCameraType_tp = cam.CameraType
                 _prevCameraSubject_tp = cam.CameraSubject
             end
        end)

        local tpName = "SnowFX_ThirdPerson"
        local bindPriority = Enum.RenderPriority.Camera.Value + 1

        -- Initialize yaw/pitch from current camera to avoid large initial jump
        do
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local cam = getCamera()
                if hrp and cam then
                    local backDir = (-cam.CFrame.LookVector)
                    if backDir.Magnitude > 0 then
                        local d = backDir.Unit
                        tpYaw = math.atan2(-d.X, -d.Z)
                        tpPitch = math.clamp(math.asin(d.Y), -1.2, 1.2)
                    end
                end
            end
        end
        RS:BindToRenderStep(tpName, bindPriority, function(dt)
            applyThirdPersonCamera(dt)
        end)
        thirdPersonConn = tpName
        if cfg.debugAimbot then print("[TP] Bound renderstep:", thirdPersonConn, "priority=", bindPriority) end
        if cfg.debugAimbot then print("[TP] Third-person enabled") end
        tpTransparencyCache = {}
        refreshThirdPersonPartCaches()
        applyThirdPersonVisibility()
        thirdPersonHeartbeatConn = player.CharacterAdded:Connect(function()
            task.wait(0.2)
            if cfg.thirdPerson then
                tpTransparencyCache = {}
                refreshThirdPersonPartCaches()
                applyThirdPersonVisibility()
            end
        end)

        -- Keep a single authoritative renderstep. Avoid duplicate RenderStepped/Heartbeat
        -- connections which can conflict with `BindToRenderStep` and cause jitter.

        -- Mouse delta is processed in applyThirdPersonCamera each frame for lower latency.
        if tpInputConn then tpInputConn:Disconnect(); tpInputConn = nil end

        -- If the game swaps CurrentCamera, reset smoothing and reapply camera
        thirdPersonSubjectConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
            tpSmoothedCFrame = nil
            refreshThirdPersonPartCaches()
            applyThirdPersonCamera(0)
            if cfg.debugAimbot then
                print("[TP_DEBUG] CurrentCamera changed; reapplied third-person camera")
            end
        end)

        applyThirdPersonCamera(0)
    else
        -- Unbind and restore previous camera state
        if thirdPersonConn then pcall(function() RS:UnbindFromRenderStep(thirdPersonConn) end); if cfg.debugAimbot then print("[TP] Unbound renderstep:", thirdPersonConn) end; thirdPersonConn = nil end
        if thirdPersonHeartbeatConn then thirdPersonHeartbeatConn:Disconnect(); thirdPersonHeartbeatConn = nil end
        if thirdPersonRenderConn then thirdPersonRenderConn:Disconnect(); thirdPersonRenderConn = nil end
        if thirdPersonSubjectConn then thirdPersonSubjectConn:Disconnect(); thirdPersonSubjectConn = nil end
        if tpInputConn then tpInputConn:Disconnect(); tpInputConn = nil end
        if cfg.debugAimbot then print("[TP] Third-person disabled") end
        pcall(function()
            local cam = getCamera()
            if cam then
                if _prevCameraType_tp then cam.CameraType = _prevCameraType_tp; _prevCameraType_tp = nil end
                if _prevCameraSubject_tp then cam.CameraSubject = _prevCameraSubject_tp; _prevCameraSubject_tp = nil end
            end
        end)
        local myChar = player.Character
        if myChar then
            local mh = myChar:FindFirstChildOfClass("Humanoid")
            if mh then mh.AutoRotate = true end
        end
        restoreLocalCharacterVisibility()
        tpSmoothedCFrame = nil
        tpLookAtSmoothed = nil
        tpCharParts = {}
        tpCameraParts = {}
    end
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- SNOW POOL
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local snowGui=Instance.new("ScreenGui")
snowGui.Name="SnowFX"; snowGui.IgnoreGuiInset=true; snowGui.Parent=gui

local POOL_MAX=500
local pool={}

for i=1,POOL_MAX do
    local halo=Instance.new("Frame")
    halo.AnchorPoint=Vector2.new(0.5,0.5); halo.BackgroundColor3=Color3.fromRGB(190,220,255)
    halo.BackgroundTransparency=1; halo.BorderSizePixel=0; halo.ZIndex=8
    halo.Visible=false; halo.Parent=snowGui
    Instance.new("UICorner",halo).CornerRadius=UDim.new(1,0)
    local core=Instance.new("Frame")
    core.AnchorPoint=Vector2.new(0.5,0.5); core.BackgroundColor3=Color3.fromRGB(255,255,255)
    core.BackgroundTransparency=1; core.BorderSizePixel=0; core.ZIndex=9
    core.Visible=false; core.Parent=snowGui
    Instance.new("UICorner",core).CornerRadius=UDim.new(1,0)
    pool[i]={halo=halo,core=core,x=0,y=0,yVel=0,sway=0,swayAmt=0,
        twinkle=0,twinkleSpd=0,baseHTrans=0.75,depth=1,active=false}
end

local function initFlake(f)
    local depth=math.random(1,3)
    local baseSize=math.max(1,math.round(cfg.size*0.8))
    local coreSize=depth==1 and math.max(1,math.round(baseSize*0.4))
                or depth==2 and math.max(1,math.round(baseSize*0.7)) or baseSize
    local haloSize=math.max(coreSize+1,math.round(coreSize*(1.5+cfg.glow*0.2)))
    local hTrans=math.max(0.45,0.92-cfg.glow*0.045)
    local spd=(0.001+(cfg.speed/10)*0.019+math.random(-1,1)*0.001)*(0.5+depth*0.35)
    f.core.Size=UDim2.new(0,coreSize,0,coreSize); f.halo.Size=UDim2.new(0,haloSize,0,haloSize)
    f.core.BackgroundTransparency=depth==1 and 0.3 or 0.0; f.halo.BackgroundTransparency=hTrans
    f.baseHTrans=hTrans; f.depth=depth; f.yVel=spd; f.swayAmt=cfg.sway*0.00035
    f.sway=math.random()*math.pi*2; f.twinkle=math.random()*math.pi*2
    f.twinkleSpd=math.max(0.1,cfg.twinkle*0.12+0.1)*(math.random(8,14)/10)
    f.x=math.random(); f.y=-0.02-math.random()*0.6
    f.active=true; f.core.Visible=true; f.halo.Visible=true
end

local function deactivate(f)
    f.active=false; f.core.Visible=false; f.halo.Visible=false
end

local function syncCount()
    local target=math.min(cfg.count,POOL_MAX)
    for i=1,POOL_MAX do
        local f=pool[i]
        if i<=target and not f.active then initFlake(f)
        elseif i>target and f.active then deactivate(f) end
    end
end
syncCount()

local t=0
RS.Heartbeat:Connect(function(dt)
    t=t+dt
    local target=math.min(cfg.count,POOL_MAX)
    for i=1,target do
        local f=pool[i]
        if not cfg.snowOn then
            if f.active and f.core.Visible then f.core.Visible=false; f.halo.Visible=false end
        else
            if f.active and not f.core.Visible then f.core.Visible=true; f.halo.Visible=true end
            if not f.active then initFlake(f) end
            f.y=f.y+f.yVel; f.x=f.x+math.sin(t*0.5+f.sway)*f.swayAmt
            f.twinkle=f.twinkle+dt*f.twinkleSpd
            if cfg.twinkle>0 then
                f.halo.BackgroundTransparency=math.clamp(f.baseHTrans+math.sin(f.twinkle)*0.06,0.4,0.95)
            end
            local p=UDim2.new(f.x,0,f.y,0); f.halo.Position=p; f.core.Position=p
            if f.y>1.06 then initFlake(f) end
        end
    end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- GUI  (ImGui-style, red/black, horizontal tabs)
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local screenGui=Instance.new("ScreenGui")
screenGui.Name="SnowConfig_v22"; screenGui.ResetOnSpawn=false; screenGui.Parent=gui

local C={
    bg        = Color3.fromRGB(15,15,15),
    bgDark    = Color3.fromRGB(10,10,10),
    bgPanel   = Color3.fromRGB(20,20,20),
    menubar   = Color3.fromRGB(26,26,26),
    accent    = Color3.fromRGB(220,40,40),
    accentHov = Color3.fromRGB(255,70,70),
    accentDim = Color3.fromRGB(100,18,18),
    text      = Color3.fromRGB(220,220,220),
    textDim   = Color3.fromRGB(140,140,140),
    div       = Color3.fromRGB(55,55,55),
    sliderFg  = Color3.fromRGB(220,40,40),
    sliderBg  = Color3.fromRGB(40,40,40),
    btnBg     = Color3.fromRGB(30,30,30),
    btnHov    = Color3.fromRGB(50,50,50),
}

local panel=Instance.new("Frame")
panel.Size=UDim2.new(0,520,0,0)
panel.AutomaticSize=Enum.AutomaticSize.Y
panel.Position=UDim2.new(0.5,-260,0.06,0)
panel.BackgroundColor3=C.bg; panel.BorderSizePixel=0; panel.Parent=screenGui
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,4)
local winStroke=Instance.new("UIStroke",panel)
winStroke.Color=C.accentDim; winStroke.Thickness=1
local winLayout=Instance.new("UIListLayout",panel)
winLayout.FillDirection=Enum.FillDirection.Vertical
winLayout.SortOrder=Enum.SortOrder.LayoutOrder

-- title bar
local menubar=Instance.new("Frame",panel)
menubar.Size=UDim2.new(1,0,0,28); menubar.BackgroundColor3=C.menubar
menubar.BorderSizePixel=0; menubar.LayoutOrder=1
Instance.new("UICorner",menubar).CornerRadius=UDim.new(0,4)
local mbFill=Instance.new("Frame",menubar)
mbFill.Size=UDim2.new(1,0,0.5,0); mbFill.Position=UDim2.new(0,0,0.5,0)
mbFill.BackgroundColor3=C.menubar; mbFill.BorderSizePixel=0

local appTitle=Instance.new("TextLabel",menubar)
appTitle.Size=UDim2.new(0,220,1,0); appTitle.Position=UDim2.new(0,8,0,0)
appTitle.BackgroundTransparency=1; appTitle.Text="â„  SnowFX v22 + Aimbot"
appTitle.TextColor3=C.accent; appTitle.TextSize=13
appTitle.Font=Enum.Font.GothamBold; appTitle.TextXAlignment=Enum.TextXAlignment.Left

local keyLbl=Instance.new("TextLabel",menubar)
keyLbl.Size=UDim2.new(0,56,0,18); keyLbl.Position=UDim2.new(1,-82,0.5,-9)
keyLbl.BackgroundColor3=C.bgDark; keyLbl.Text="INSERT"
keyLbl.TextColor3=C.textDim; keyLbl.TextSize=10; keyLbl.Font=Enum.Font.Code
Instance.new("UICorner",keyLbl).CornerRadius=UDim.new(0,2)
Instance.new("UIStroke",keyLbl).Color=C.div

local closeBtn=Instance.new("TextButton",menubar)
closeBtn.Size=UDim2.new(0,22,0,22); closeBtn.Position=UDim2.new(1,-25,0.5,-11)
closeBtn.BackgroundColor3=C.accentDim; closeBtn.Text="x"
closeBtn.TextColor3=Color3.fromRGB(255,255,255); closeBtn.TextSize=13
closeBtn.Font=Enum.Font.GothamBold; closeBtn.BorderSizePixel=0
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,3)
closeBtn.MouseEnter:Connect(function() closeBtn.BackgroundColor3=C.accent end)
closeBtn.MouseLeave:Connect(function() closeBtn.BackgroundColor3=C.accentDim end)

-- horizontal tab strip
local tabStrip=Instance.new("Frame",panel)
tabStrip.Size=UDim2.new(1,0,0,26); tabStrip.BackgroundColor3=C.bgDark
tabStrip.BorderSizePixel=0; tabStrip.LayoutOrder=2
local tsl=Instance.new("UIListLayout",tabStrip)
tsl.FillDirection=Enum.FillDirection.Horizontal
tsl.VerticalAlignment=Enum.VerticalAlignment.Center

local tabSep=Instance.new("Frame",panel)
tabSep.Size=UDim2.new(1,0,0,1); tabSep.BackgroundColor3=C.accentDim
tabSep.BorderSizePixel=0; tabSep.LayoutOrder=3

local contentFrame=Instance.new("Frame",panel)
contentFrame.Size=UDim2.new(1,0,0,420); contentFrame.BackgroundColor3=C.bgPanel
contentFrame.BorderSizePixel=0; contentFrame.LayoutOrder=4

local tabNames={"Snow","Player","Visual","Aimbot","Presets"}
local tabBtns={}; local tabPages={}

for i,name in ipairs(tabNames) do
    local btn=Instance.new("TextButton",tabStrip)
    btn.Size=UDim2.new(0,100,1,0)
    btn.BackgroundColor3= i==1 and C.bgPanel or C.bgDark
    btn.BorderSizePixel=0
    btn.Text=" "..name.." "
    btn.TextColor3= i==1 and C.accent or C.textDim
    btn.TextSize=12; btn.Font=Enum.Font.GothamBold
    tabBtns[i]=btn
    local tabLine=Instance.new("Frame",btn)
    tabLine.Size=UDim2.new(1,0,0,2); tabLine.AnchorPoint=Vector2.new(0,1)
    tabLine.Position=UDim2.new(0,0,1,0)
    tabLine.BackgroundColor3= i==1 and C.accent or C.bgDark
    tabLine.BorderSizePixel=0

    local page=Instance.new("ScrollingFrame",contentFrame)
    page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1
    page.BorderSizePixel=0; page.ScrollBarThickness=3
    page.ScrollBarImageColor3=C.accentDim
    page.AutomaticCanvasSize=Enum.AutomaticSize.Y
    page.CanvasSize=UDim2.new(0,0,0,0); page.Visible=i==1
    page.Parent=contentFrame; tabPages[i]=page
    Instance.new("UIListLayout",page).Padding=UDim.new(0,2)
    local lp=Instance.new("UIPadding",page)
    lp.PaddingLeft=UDim.new(0,12); lp.PaddingRight=UDim.new(0,12)
    lp.PaddingTop=UDim.new(0,8); lp.PaddingBottom=UDim.new(0,8)

    btn.MouseButton1Click:Connect(function()
        for j,p in ipairs(tabPages) do
            p.Visible=j==i
            tabBtns[j].TextColor3= j==i and C.accent or C.textDim
            tabBtns[j].BackgroundColor3= j==i and C.bgPanel or C.bgDark
            tabBtns[j]:FindFirstChildOfClass("Frame").BackgroundColor3= j==i and C.accent or C.bgDark
        end
    end)
end

-- â”€â”€ helper widgets â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local function addGap(page,h)
    local g=Instance.new("Frame",page); g.Size=UDim2.new(1,0,0,h or 4); g.BackgroundTransparency=1
end
local function addSectionLabel(page,text)
    addGap(page,6)
    local row=Instance.new("Frame",page); row.Size=UDim2.new(1,0,0,18); row.BackgroundTransparency=1
    local line=Instance.new("Frame",row); line.Size=UDim2.new(1,0,0,1)
    line.Position=UDim2.new(0,0,0.5,0); line.BackgroundColor3=C.div; line.BorderSizePixel=0
    local lbl=Instance.new("TextLabel",row)
    lbl.Size=UDim2.new(0,0,1,0); lbl.AutomaticSize=Enum.AutomaticSize.X
    lbl.BackgroundColor3=C.bgPanel; lbl.BorderSizePixel=0
    lbl.Text="  "..text.."  "; lbl.TextColor3=C.accent; lbl.TextSize=10
    lbl.Font=Enum.Font.GothamBold; lbl.TextXAlignment=Enum.TextXAlignment.Left
end
local function addDivider(page)
    local d=Instance.new("Frame",page)
    d.Size=UDim2.new(1,0,0,1); d.BackgroundColor3=C.div; d.BorderSizePixel=0
end
local function addToggle(page,label,default,onChange)
    local row=Instance.new("Frame",page)
    row.Size=UDim2.new(1,0,0,28); row.BackgroundTransparency=1
    local box=Instance.new("TextButton",row)
    box.Size=UDim2.new(0,16,0,16); box.Position=UDim2.new(0,0,0.5,-8)
    box.BackgroundColor3= default and C.accent or C.sliderBg
    box.BorderSizePixel=0; box.Text=""
    Instance.new("UICorner",box).CornerRadius=UDim.new(0,2)
    Instance.new("UIStroke",box).Color= default and C.accent or C.div
    local tick=Instance.new("TextLabel",box)
    tick.Size=UDim2.new(1,0,1,0); tick.BackgroundTransparency=1
    tick.Text= default and "v" or ""; tick.TextColor3=Color3.fromRGB(255,255,255)
    tick.TextSize=10; tick.Font=Enum.Font.GothamBold
    local lbl=Instance.new("TextLabel",row)
    lbl.Size=UDim2.new(1,-24,1,0); lbl.Position=UDim2.new(0,24,0,0)
    lbl.BackgroundTransparency=1; lbl.Text=label
    lbl.TextColor3=C.text; lbl.TextSize=12; lbl.Font=Enum.Font.Gotham
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    local state=default
    local function refresh()
        box.BackgroundColor3= state and C.accent or C.sliderBg
        box:FindFirstChildOfClass("UIStroke").Color= state and C.accent or C.div
        tick.Text= state and "v" or ""
    end
    box.MouseButton1Click:Connect(function() state=not state; refresh(); onChange(state) end)
end
local function addSlider(page,label,min,max,default,step,fmtFn,onChange)
    local row=Instance.new("Frame",page)
    row.Size=UDim2.new(1,0,0,46); row.BackgroundTransparency=1
    local lbl=Instance.new("TextLabel",row)
    lbl.Size=UDim2.new(0.65,0,0,18); lbl.BackgroundTransparency=1; lbl.Text=label
    lbl.TextColor3=C.text; lbl.TextSize=12; lbl.Font=Enum.Font.Gotham
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    local valLbl=Instance.new("TextLabel",row)
    valLbl.Size=UDim2.new(0.35,0,0,18); valLbl.Position=UDim2.new(0.65,0,0,0)
    valLbl.BackgroundTransparency=1; valLbl.Text=fmtFn(default)
    valLbl.TextColor3=C.accent; valLbl.TextSize=12; valLbl.Font=Enum.Font.GothamBold
    valLbl.TextXAlignment=Enum.TextXAlignment.Right
    local track=Instance.new("Frame",row)
    track.Size=UDim2.new(1,0,0,4); track.Position=UDim2.new(0,0,0,28)
    track.BackgroundColor3=C.sliderBg; track.BorderSizePixel=0
    Instance.new("UICorner",track).CornerRadius=UDim.new(1,0)
    local fill=Instance.new("Frame",track)
    fill.Size=UDim2.new((default-min)/(max-min),0,1,0)
    fill.BackgroundColor3=C.sliderFg; fill.BorderSizePixel=0
    Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)
    local knob=Instance.new("TextButton",track)
    knob.Size=UDim2.new(0,12,0,12)
    knob.Position=UDim2.new((default-min)/(max-min),-6,0.5,-6)
    knob.BackgroundColor3=Color3.fromRGB(210,210,210); knob.Text=""; knob.BorderSizePixel=0; knob.ZIndex=5
    Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)
    local dragging=false
    local function setVal(v)
        v=math.clamp(math.round(v/step)*step,min,max)
        local rel=(v-min)/(max-min)
        fill.Size=UDim2.new(rel,0,1,0); knob.Position=UDim2.new(rel,-6,0.5,-6)
        valLbl.Text=fmtFn(v); onChange(v)
    end
    knob.MouseButton1Down:Connect(function() dragging=true end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
    UIS.InputChanged:Connect(function(i)
        if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
            local rel=math.clamp((mouse.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
            setVal(min+(max-min)*rel) end end)
    track.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=true
            local rel=math.clamp((mouse.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
            setVal(min+(max-min)*rel) end end)
    return setVal
end
local function addDropdown(page,label,options,default,onChange)
    local row=Instance.new("Frame",page)
    row.Size=UDim2.new(1,0,0,28); row.BackgroundTransparency=1
    local lbl=Instance.new("TextLabel",row)
    lbl.Size=UDim2.new(0.4,0,1,0); lbl.BackgroundTransparency=1
    lbl.Text=label; lbl.TextColor3=C.text; lbl.TextSize=12
    lbl.Font=Enum.Font.Gotham; lbl.TextXAlignment=Enum.TextXAlignment.Left
    local dropdown=Instance.new("TextButton",row)
    dropdown.Size=UDim2.new(0.6,0,1,0); dropdown.Position=UDim2.new(0.4,0,0,0)
    dropdown.BackgroundColor3=C.btnBg; dropdown.Text=default
    dropdown.TextColor3=C.text; dropdown.TextSize=12; dropdown.Font=Enum.Font.GothamBold
    dropdown.BorderSizePixel=0
    Instance.new("UICorner",dropdown).CornerRadius=UDim.new(0,3)
    Instance.new("UIPadding",dropdown).PaddingLeft=UDim.new(0,8)
    
    local dropdownOpen=false
    local dropdownList=Instance.new("Frame")
    dropdownList.Size=UDim2.new(0.6,0,0,0); dropdownList.Position=UDim2.new(0.4,0,1,0)
    dropdownList.BackgroundColor3=C.bgDark; dropdownList.Visible=false
    dropdownList.BorderSizePixel=0; dropdownList.Parent=row
    Instance.new("UICorner",dropdownList).CornerRadius=UDim.new(0,3)
    local dll=Instance.new("UIListLayout",dropdownList)
    dll.Padding=UDim.new(0,1)
    
    for _,opt in ipairs(options) do
        local btn=Instance.new("TextButton",dropdownList)
        btn.Size=UDim2.new(1,0,0,24); btn.BackgroundTransparency=1
        btn.Text=opt; btn.TextColor3=C.text; btn.TextSize=11
        btn.Font=Enum.Font.Gotham; btn.TextXAlignment=Enum.TextXAlignment.Left
        Instance.new("UIPadding",btn).PaddingLeft=UDim.new(0,8)
        btn.MouseButton1Click:Connect(function()
            dropdown.Text=opt; dropdownOpen=false
            dropdownList.Visible=false; onChange(opt)
        end)
        btn.MouseEnter:Connect(function() btn.TextColor3=C.accent end)
        btn.MouseLeave:Connect(function() btn.TextColor3=C.text end)
    end
    dropdownList.AutomaticSize=Enum.AutomaticSize.Y
    
    dropdown.MouseButton1Click:Connect(function()
        dropdownOpen=not dropdownOpen
        dropdownList.Visible=dropdownOpen
    end)
end
local function addButton(page,text,color,textColor,onClick)
    local btn=Instance.new("TextButton",page)
    btn.Size=UDim2.new(1,0,0,26); btn.BackgroundColor3=color or C.btnBg
    btn.BorderSizePixel=0; btn.Text=text
    btn.TextColor3=textColor or C.text; btn.TextSize=12
    btn.Font=Enum.Font.Gotham; btn.TextXAlignment=Enum.TextXAlignment.Left
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,3)
    Instance.new("UIStroke",btn).Color=C.div
    local lp=Instance.new("UIPadding",btn); lp.PaddingLeft=UDim.new(0,10)
    local def=color or C.btnBg
    btn.MouseButton1Click:Connect(onClick)
    btn.MouseEnter:Connect(function() btn.BackgroundColor3=C.btnHov end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3=def end)
    return btn
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- TAB 1: SNOW
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local pg1=tabPages[1]
addSectionLabel(pg1,"PARTICLES"); addDivider(pg1)
addToggle(pg1,"Enable snow",true,function(v)
    cfg.snowOn=v
    if v then
        for i=1,math.min(cfg.count,POOL_MAX) do
            if not pool[i].active then initFlake(pool[i])
            else pool[i].core.Visible=true; pool[i].halo.Visible=true end
        end
    end
end)
local setCount = addSlider(pg1,"Count",50,500,90,10,function(v) return tostring(v) end,
    function(v) cfg.count=v; syncCount() end)
local setSpeed = addSlider(pg1,"Fall speed",1,10,2,1,function(v) return tostring(v) end,
    function(v) cfg.speed=v
        for i=1,math.min(cfg.count,POOL_MAX) do if pool[i].active then initFlake(pool[i]) end end end)
local setSize = addSlider(pg1,"Flake size",1,10,4,1,function(v) return tostring(v) end,
    function(v) cfg.size=v
        for i=1,math.min(cfg.count,POOL_MAX) do if pool[i].active then initFlake(pool[i]) end end end)
local setSway = addSlider(pg1,"Sway",0,10,7,1,function(v) return tostring(v) end,
    function(v) cfg.sway=v
        for _,f in ipairs(pool) do if f.active then f.swayAmt=v*0.00035 end end end)
addSectionLabel(pg1,"GLOW"); addDivider(pg1)
local setGlow = addSlider(pg1,"Glow strength",0,10,4,1,function(v) return tostring(v) end,
    function(v) cfg.glow=v
        for i=1,math.min(cfg.count,POOL_MAX) do if pool[i].active then initFlake(pool[i]) end end end)
local setTwink = addSlider(pg1,"Twinkle speed",0,10,6,1,function(v) return tostring(v) end,
    function(v) cfg.twinkle=v
        for _,f in ipairs(pool) do
            if f.active then f.twinkleSpd=math.max(0.1,v*0.12+0.1)*(math.random(8,14)/10) end
        end end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- TAB 2: PLAYER
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local pg2=tabPages[2]

addSectionLabel(pg2,"GAME SKINS QUICK"); addDivider(pg2)
addToggle(pg2,"Enable game skin changer (quick)",false,function(v)
    cfg.gameSkinOn = v
    if v then
        refreshBloxStrikeSkinTemplates()
        queueApplyBloxStrikeSkin()
    else
        restoreBloxStrikeSkins()
    end
end)
addButton(pg2,"Refresh game skins (quick)",nil,nil,function()
    refreshBloxStrikeSkinTemplates()
    if cfg.gameSkinOn then
        queueApplyBloxStrikeSkin()
    end
end)
addButton(pg2,"Next game skin (quick)",nil,nil,function()
    local opts = getBloxStrikeSkinOptions()
    if #opts <= 1 then
        refreshBloxStrikeSkinTemplates()
        opts = getBloxStrikeSkinOptions()
    end
    local idx = 1
    for i,name in ipairs(opts) do
        if name == cfg.gameSkinName then
            idx = i
            break
        end
    end
    idx = (idx % #opts) + 1
    cfg.gameSkinName = opts[idx]
    if cfg.gameSkinOn then
        queueApplyBloxStrikeSkin()
    end
end)

addSectionLabel(pg2,"PLAYER GLOW"); addDivider(pg2)
addToggle(pg2,"Enable glow (all players)",false,function(v)
    cfg.glowOn=v; if v then applyAllGlows() else removeAllGlows() end
end)
addSlider(pg2,"Light brightness",1,8,2,1,function(v) return tostring(v) end,
    function(v) cfg.glowBright=v
        for _,d in pairs(appliedGlows) do
            if d.light and d.light.Parent then d.light.Brightness=v end end end)
addSlider(pg2,"Light range",3,30,10,1,function(v) return tostring(v) end,
    function(v) cfg.glowRange=v
        for _,d in pairs(appliedGlows) do
            if d.light and d.light.Parent then d.light.Range=v end end end)
addSlider(pg2,"Outline opacity",1,10,7,1,function(v) return tostring(v) end,
    function(v)
        local trans=1-(v/10)
        for _,d in pairs(appliedGlows) do
            if d.highlight and d.highlight.Parent then d.highlight.OutlineTransparency=trans end end end)
addSlider(pg2,"Fill opacity",0,5,1,1,function(v) return tostring(v) end,
    function(v)
        local trans=1-(v/10)*0.3
        for _,d in pairs(appliedGlows) do
            if d.highlight and d.highlight.Parent then d.highlight.FillTransparency=trans end end end)

addSectionLabel(pg2,"GLOW COLOR"); addDivider(pg2)
local glowColors={
    {name="Purple", color=Color3.fromRGB(180,0,255)},
    {name="Blue",   color=Color3.fromRGB(0,100,255)},
    {name="Cyan",   color=Color3.fromRGB(0,220,255)},
    {name="Red",    color=Color3.fromRGB(255,30,30)},
    {name="Green",  color=Color3.fromRGB(0,255,100)},
    {name="Gold",   color=Color3.fromRGB(255,180,0)},
    {name="Pink",   color=Color3.fromRGB(255,80,180)},
    {name="White",  color=Color3.fromRGB(220,235,255)},
}
for _,gc in ipairs(glowColors) do
    local r=math.floor(gc.color.R*255*0.12)
    local g=math.floor(gc.color.G*255*0.12)
    local b=math.floor(gc.color.B*255*0.12)
    addButton(pg2,gc.name,Color3.fromRGB(r,g,b),gc.color,function()
        cfg.glowColor=gc.color
        for _,d in pairs(appliedGlows) do
            if d.highlight and d.highlight.Parent then
                d.highlight.OutlineColor=gc.color; d.highlight.FillColor=gc.color end
            if d.light and d.light.Parent then d.light.Color=gc.color end
        end
    end)
end

addSectionLabel(pg2,"HANDS / WEAPON GLOW"); addDivider(pg2)
addToggle(pg2,"Enable hands glow",false,function(v)
    cfg.handsGlowOn=v
    if v then applyHandsGlow() else clearHandsLights() end
end)
addSlider(pg2,"Brightness",1,10,3,1,function(v) return tostring(v) end,
    function(v) cfg.handsBright=v
        for _,l in ipairs(handsLights) do if l and l.Parent then l.Brightness=v end end end)
addSlider(pg2,"Range",3,20,8,1,function(v) return tostring(v) end,
    function(v) cfg.handsRange=v
        for _,l in ipairs(handsLights) do if l and l.Parent then l.Range=v end end end)

addSectionLabel(pg2,"HANDS COLOR"); addDivider(pg2)
local handsColorList={
    {name="Cyan  â€”  icy blue",  color=Color3.fromRGB(0,200,255)},
    {name="Purple  â€”  mystic",  color=Color3.fromRGB(180,0,255)},
    {name="Red  â€”  fire",       color=Color3.fromRGB(255,50,20)},
    {name="Green  â€”  toxic",    color=Color3.fromRGB(0,255,80)},
    {name="Gold  â€”  legendary", color=Color3.fromRGB(255,180,0)},
    {name="Pink  â€”  sakura",    color=Color3.fromRGB(255,100,180)},
    {name="White  â€”  holy",     color=Color3.fromRGB(220,235,255)},
    {name="Rainbow  â€”  cycle",  color=nil},
}
for _,hc in ipairs(handsColorList) do
    local displayColor=hc.color or Color3.fromRGB(200,100,255)
    local r=math.floor(displayColor.R*255*0.12)
    local g=math.floor(displayColor.G*255*0.12)
    local b=math.floor(displayColor.B*255*0.12)
    addButton(pg2,hc.name,Color3.fromRGB(r,g,b),displayColor,function()
        if rainbowConn then rainbowConn:Disconnect(); rainbowConn=nil end
        rainbowActive=false
        if hc.color==nil then
            rainbowActive=true
            rainbowConn=RS.Heartbeat:Connect(function()
                if not rainbowActive then return end
                local col=Color3.fromHSV((tick()*0.3)%1,1,1)
                cfg.handsColor=col
                for _,l in ipairs(handsLights) do if l and l.Parent then l.Color=col end end
            end)
        else
            cfg.handsColor=hc.color
            for _,l in ipairs(handsLights) do if l and l.Parent then l.Color=hc.color end end
        end
    end)
end

addSectionLabel(pg2,"BLOX STRIKE SKINS"); addDivider(pg2)
addToggle(pg2,"Enable game skin changer",false,function(v)
    cfg.gameSkinOn = v
    if v then
        refreshBloxStrikeSkinTemplates()
        queueApplyBloxStrikeSkin()
        task.delay(0.35, queueApplyBloxStrikeSkin)
        task.delay(0.9, queueApplyBloxStrikeSkin)
    else
        restoreBloxStrikeSkins()
    end
end)

local skinStatus = Instance.new("TextLabel", pg2)
skinStatus.Size = UDim2.new(1,0,0,24)
skinStatus.BackgroundTransparency = 1
skinStatus.TextColor3 = C.textDim
skinStatus.TextSize = 12
skinStatus.Font = Enum.Font.Gotham
skinStatus.TextXAlignment = Enum.TextXAlignment.Left

local function refreshSkinStatusText()
    local opts = getBloxStrikeSkinOptions()
    local foundCount = math.max(#opts - 1, 0)
    skinStatus.Text = "Selected: " .. tostring(cfg.gameSkinName) .. " | Found: " .. tostring(foundCount)
end
refreshSkinStatusText()

addButton(pg2,"Refresh detected game skins",nil,nil,function()
    refreshBloxStrikeSkinTemplates()
    local opts = getBloxStrikeSkinOptions()
    local exists = false
    for _,name in ipairs(opts) do
        if name == cfg.gameSkinName then
            exists = true
            break
        end
    end
    if not exists then
        cfg.gameSkinName = "Default"
    end
    refreshSkinStatusText()
    if cfg.gameSkinOn then
        queueApplyBloxStrikeSkin()
        task.delay(0.35, queueApplyBloxStrikeSkin)
    end
end)

addButton(pg2,"Next game skin",nil,nil,function()
    local opts = getBloxStrikeSkinOptions()
    if #opts <= 1 then
        refreshBloxStrikeSkinTemplates()
        opts = getBloxStrikeSkinOptions()
    end
    local idx = 1
    for i,name in ipairs(opts) do
        if name == cfg.gameSkinName then
            idx = i
            break
        end
    end
    idx = (idx % #opts) + 1
    cfg.gameSkinName = opts[idx]
    refreshSkinStatusText()
    if cfg.gameSkinOn then
        queueApplyBloxStrikeSkin()
        task.delay(0.35, queueApplyBloxStrikeSkin)
    end
end)

addSectionLabel(pg2,"ESP â€” ENEMIES ONLY"); addDivider(pg2)
addToggle(pg2,"Enable ESP (enemies only)",false,function(v)
    cfg.espOn=v; if v then applyAllESP() else removeAllESP() end
end)
addSlider(pg2,"ESP fill opacity",0,10,5,1,function(v) return tostring(v) end,
    function(v)
        espFillTrans=1-(v/10)*0.8
        refreshESPVisuals(false)
    end)
addSlider(pg2,"ESP outline opacity",0,10,10,1,function(v) return tostring(v) end,
    function(v)
        espOutlineTrans=1-(v/10)
        refreshESPVisuals(false)
    end)

addSectionLabel(pg2,"ESP COLOR"); addDivider(pg2)
local espColors={
    {name="Red  â€”  enemy",      fill=Color3.fromRGB(255,50,50),   outline=Color3.fromRGB(255,255,255)},
    {name="Green  â€”  friendly", fill=Color3.fromRGB(50,255,100),  outline=Color3.fromRGB(255,255,255)},
    {name="Purple  â€”  stealth", fill=Color3.fromRGB(150,0,255),   outline=Color3.fromRGB(200,150,255)},
    {name="Blue  â€”  cool",      fill=Color3.fromRGB(50,100,255),  outline=Color3.fromRGB(150,200,255)},
    {name="Gold  â€”  highlight", fill=Color3.fromRGB(255,180,0),   outline=Color3.fromRGB(255,230,100)},
    {name="White  â€”  ghost",    fill=Color3.fromRGB(220,220,220), outline=Color3.fromRGB(255,255,255)},
    {name="Cyan  â€”  neon",      fill=Color3.fromRGB(0,220,255),   outline=Color3.fromRGB(150,240,255)},
    {name="Pink  â€”  pastel",    fill=Color3.fromRGB(255,100,180), outline=Color3.fromRGB(255,200,220)},
}
for _,ec in ipairs(espColors) do
    local r=math.floor(ec.fill.R*255*0.12)
    local g=math.floor(ec.fill.G*255*0.12)
    local b=math.floor(ec.fill.B*255*0.12)
    local fill = ec.fill
    local outline = ec.outline
    addButton(pg2,ec.name,Color3.fromRGB(r,g,b),ec.fill,function()
        espFillColor=fill; espOutlineColor=outline
        refreshESPVisuals(true)
    end)
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- TAB 4: AIMBOT
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local pg4=tabPages[4]

addSectionLabel(pg4,"AIMBOT MAIN"); addDivider(pg4)
addToggle(pg4,"Enable aimbot",false,function(v)
    cfg.aimbotOn=v
    toggleAimbot(v)
end)
addDropdown(pg4,"Aim part",{"Head","HumanoidRootPart","UpperTorso","Center"},"Head",function(v)
    cfg.aimPart=v=="Center" and "HumanoidRootPart" or v
end)

addSectionLabel(pg4,"AIM SETTINGS"); addDivider(pg4)
local setFov=addSlider(pg4,"FOV radius",50,500,200,10,function(v) return tostring(v) end,
    function(v) 
        cfg.fov=v
        if fovCircle then
            fovCircle.Size=UDim2.new(0,v*2,0,v*2)
        end
    end)
addToggle(pg4,"Prefer body hitreg",false,function(v) cfg.preferBodyAim=v end)
addToggle(pg4,"Show FOV circle",true,function(v)
    cfg.fovVisible=v
    if cfg.aimbotOn then
        if v then createFOVCircle() else if fovCircle then fovCircle:Destroy(); fovCircle=nil end end
    end
end)
addSlider(pg4,"Smoothness",0.05,0.5,0.25,0.01,function(v) return string.format("%.2f",v) end,
    function(v) cfg.smoothness=v end)
addToggle(pg4,"Team check",true,function(v) cfg.teamCheck=v end)
addToggle(pg4,"Wall check",true,function(v) cfg.wallCheck=v end)

addSectionLabel(pg4,"STATUS"); addDivider(pg4)
local statusLabel=Instance.new("TextLabel",pg4)
statusLabel.Size=UDim2.new(1,0,0,24); statusLabel.BackgroundTransparency=1
statusLabel.Text="Status: Idle"; statusLabel.TextColor3=C.textDim
statusLabel.TextSize=12; statusLabel.Font=Enum.Font.GothamBold
statusLabel.TextXAlignment=Enum.TextXAlignment.Center

-- Update status label
local statusAccum = 0
RS.Heartbeat:Connect(function(dt)
    statusAccum = statusAccum + math.max(dt or 0, 0)
    if statusAccum < 0.12 then return end
    statusAccum = 0
    if cfg.targetLocked then
        local targetPlayer = Players:GetPlayerFromCharacter(cfg.targetLocked.Parent)
        statusLabel.Text = targetPlayer and ("Locked: " .. targetPlayer.Name) or "Locked: Unknown"
        statusLabel.TextColor3 = C.accent
    else
        statusLabel.Text = "Status: Searching..."
        statusLabel.TextColor3 = C.textDim
    end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- TAB 3: VISUAL
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local pg3=tabPages[3]
addSectionLabel(pg3,"THIRD-PERSON CAMERA"); addDivider(pg3)

local tpHint=Instance.new("TextLabel",pg3)
tpHint.Size=UDim2.new(1,0,0,24); tpHint.BackgroundTransparency=1
tpHint.Text="Third-person toggle key: X"
tpHint.TextColor3=C.accent; tpHint.TextSize=12; tpHint.Font=Enum.Font.GothamBold
tpHint.TextXAlignment=Enum.TextXAlignment.Left
addToggle(pg3,"Far camera distance",false,function(v)
    cfg.thirdPersonFarMode=v
end)
addSlider(pg3,"Close distance",6,16,12,1,function(v) return tostring(v) end,
    function(v) cfg.thirdPersonDist=v end)
addSlider(pg3,"Far distance",10,28,18,1,function(v) return tostring(v) end,
    function(v) cfg.thirdPersonFarDist=v end)
addToggle(pg3,"Low-end optimize",true,function(v)
    cfg.thirdPersonLowEnd=v
end)
addSlider(pg3,"Third-person smooth",0.3,1,0.85,0.05,function(v) return string.format("%.2f",v) end,
    function(v) cfg.thirdPersonSmooth=v end)


-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- TAB 5: PRESETS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local pg5=tabPages[5]
local function applySnowPreset(count,speed,size,sway,glow,twinkle)
    cfg.count=count; cfg.speed=speed; cfg.size=size
    cfg.sway=sway; cfg.glow=glow; cfg.twinkle=twinkle
    setCount(count); setSpeed(speed); setSize(size)
    setSway(sway); setGlow(glow); setTwink(twinkle)
    syncCount()
    for i=1,math.min(count,POOL_MAX) do
        if pool[i].active then initFlake(pool[i]) end end
end
addSectionLabel(pg5,"SNOW PRESETS"); addDivider(pg5)
addButton(pg5,"Gentle drift  â€”  default, calm",nil,nil,function()
    applySnowPreset(90,2,4,7,4,6) end)
addButton(pg5,"Snowstorm  â€”  drifty but fast",nil,nil,function()
    applySnowPreset(250,9,4,7,6,4) end)
addButton(pg5,"Blizzard  â€”  dense, fast, heavy",nil,nil,function()
    applySnowPreset(450,9,3,2,8,3) end)
addButton(pg5,"Starfall  â€”  tiny, fast, glowy",nil,nil,function()
    applySnowPreset(300,7,2,1,9,2) end)
addDivider(pg5); addGap(pg5,2)
addButton(pg5,"Reset everything to default",Color3.fromRGB(30,10,10),Color3.fromRGB(220,80,80),function()
    applySnowPreset(90,2,4,7,4,6)
    cfg.glowOn=false; removeAllGlows()
    cfg.espOn=false; removeAllESP()
    cfg.handsGlowOn=false; clearHandsLights()
    cfg.gameSkinOn=false
    cfg.gameSkinName="Default"
    restoreBloxStrikeSkins()
    if cfg.aimbotOn then toggleAimbot(false) end
    cfg.aimbotOn=false
    cfg.smoothness=0.25
    cfg.preferBodyAim=false
    cfg.wallCheck=true
    cfg.thirdPersonFarMode=false
    cfg.thirdPersonDist=12
    cfg.thirdPersonFarDist=18
    cfg.thirdPersonSmooth=0.85
    cfg.thirdPersonLowEnd=true
    if rainbowConn then rainbowConn:Disconnect(); rainbowConn=nil end
    rainbowActive=false
    topBar.Size=UDim2.new(1,0,0,0); botBar.Size=UDim2.new(1,0,0,0)
    leftBar.Size=UDim2.new(0,0,1,0); rightBar.Size=UDim2.new(0,0,1,0)
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- PLAYER HOOKS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local function hookPlayer(p)
    p.CharacterAdded:Connect(function()
        task.wait(0.5)
        if cfg.glowOn then applyPlayerGlow(p) end
        if cfg.espOn  then applyESP(p) end
        task.wait(2)
        if cfg.espOn then
            if isEnemy(p) then applyESP(p) else removeESP(p) end
        end
    end)
    p:GetPropertyChangedSignal("Team"):Connect(function()
        task.wait(0.1)
        if cfg.espOn then
            if isEnemy(p) then applyESP(p) else removeESP(p) end
        end
    end)
end
Players.PlayerAdded:Connect(function(p) hookPlayer(p) end)
for _,p in ipairs(Players:GetPlayers()) do 
    hookPlayer(p) 
    -- Automatically set hooks for already active characters seamlessly
    if p.Character then 
        task.spawn(function()
            if cfg.glowOn then applyPlayerGlow(p) end
            if cfg.espOn and isEnemy(p) then applyESP(p) end
        end)
    end
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- DRAG + TOGGLE
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local dragging,dragStart,panelStart
menubar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true; dragStart=i.Position; panelStart=panel.Position 
    end
end)

UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then 
        isFiring=false
        dragging=false 
    end
end)

UIS.InputChanged:Connect(function(i)
    if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
        local delta=i.Position-dragStart
        panel.Position=UDim2.new(
            panelStart.X.Scale,panelStart.X.Offset+delta.X,
            panelStart.Y.Scale,panelStart.Y.Offset+delta.Y)
    end
end)

closeBtn.MouseButton1Click:Connect(function() panel.Visible=false end)
mouse.Button1Down:Connect(function()
    isFiring = true
    lastFireAt = tick()
end)
mouse.Button1Up:Connect(function()
    isFiring = false
end)
UIS.InputBegan:Connect(function(i,gp)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        isFiring=true
        lastFireAt=tick()
    end
    if UIS:GetFocusedTextBox() then return end
    if i.KeyCode==Enum.KeyCode.X then
        cfg.thirdPerson = not cfg.thirdPerson
        toggleThirdPerson(cfg.thirdPerson)
        return
    end
    if gp then return end
    if i.KeyCode==Enum.KeyCode.Insert then
        panel.Visible=not panel.Visible
    end
end)

-- ESP refresh loop
task.spawn(function()
    while true do
        task.wait(2)
        if cfg.espOn then applyAllESP() end
    end
end)

-- Blox Strike skin refresher for games that rebuild weapons after equip/spawn.
task.spawn(function()
    while true do
        task.wait(2.0)
        if cfg.gameSkinOn then
            queueApplyBloxStrikeSkin()
        end
    end
end)

-- FOV circle update loop (tracks current aim reference)
RS.Heartbeat:Connect(function()
    if fovCircle and cfg.fovVisible and cfg.aimbotOn then
        fovCircle.Size=UDim2.new(0,cfg.fov*2,0,cfg.fov*2)
        local cam = getCamera()
        local mPos
        if cam and (cfg.thirdPerson or cfg.aimbotOn or UIS.MouseBehavior == Enum.MouseBehavior.LockCenter) then
            local vs = cam.ViewportSize
            mPos = Vector2.new(vs.X * 0.5, vs.Y * 0.5)
        else
            mPos = UIS:GetMouseLocation()
        end
        fovCircle.Position=UDim2.new(0, mPos.X - cfg.fov, 0, mPos.Y - cfg.fov)
    end
end)

print("âœ… SNOW FX GUI v22 + AIMBOT â€” INSERT menu toggle | X third-person toggle")
print("ESP enemies only | Glow colors | Hands glow + Rainbow | Third-person camera | FOV aimbot")
print("[SKIN] Blox Strike skin changer loaded. Use Player tab -> GAME SKINS QUICK.")


