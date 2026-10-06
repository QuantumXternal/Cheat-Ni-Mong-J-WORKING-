local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local BASE_URL = "https://raw.githubusercontent.com/QuantumXternal/Cheat-Ni-Mong-J-WORKING-/refs/heads/main/"
local VERSIONS = {
    { Name = "V1", File = "StealAnEgg.deob.lua", Note = "Stable" },
    { Name = "V2", File = "StealAnEggV2.deob.lua", Note = "Latest" },
    { Name = "V3", File = "StealAnEggV3.deob.lua", Note = "Experimental" },
    { Name = "V4", File = "StealAnEggV4.deob.lua", Note = "Newest" },
    { Name = "V5", File = "StealAnEggV5.deob.lua", Note = "Beta" },
    { Name = "V6", File = "StealAnEggV6.deob.lua", Note = "Alpha" },
}

local BG = Color3.fromRGB(13, 7, 12)
local CARD = Color3.fromRGB(26, 14, 22)
local ACCENT = Color3.fromRGB(255, 46, 99)
local MAUVE = Color3.fromRGB(123, 45, 91)
local TEXT = Color3.fromRGB(255, 240, 245)
local MUTED = Color3.fromRGB(196, 154, 168)
local STROKE = Color3.fromRGB(74, 26, 46)

local GLASS_TRANSPARENCY = 0.2
local function applyGlass(surface)
    if surface:GetAttribute("QuantumGlassApplied") == true then
        return
    end
    surface:SetAttribute("QuantumGlassApplied", true)
    surface.BackgroundTransparency = GLASS_TRANSPARENCY
    -- A TextButton renders its own .Text through the same pass as its fill,
    -- so an alpha-bearing UIGradient would fade its label along with the
    -- background (version rows are safe: their text lives in child labels,
    -- but Yes/No draw "Yes"/"No" via .Text). Skip the sheen there.
    -- Same for CanvasGroup: it flattens its whole subtree before
    -- compositing, so a gradient would multiply across every child (text,
    -- buttons) instead of tinting only the fill. Frost on groups comes
    -- from translucency + inner stroke + shadow only. Never re-add a
    -- gradient to either case.
    local hasOwnText = surface:IsA("TextButton") and surface.Text ~= nil and surface.Text ~= ""
    if not hasOwnText and not surface:IsA("CanvasGroup") then
        local sheenG = Instance.new("UIGradient")
        sheenG.Rotation = 90
        sheenG.Color = ColorSequence.new(Color3.new(1, 1, 1))
        sheenG.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.88),
            NumberSequenceKeypoint.new(1, 1),
        })
        sheenG.Parent = surface
    end
    local inner = Instance.new("UIStroke")
    inner.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    inner.Color = Color3.new(1, 1, 1)
    inner.Transparency = 0.65
    inner.Thickness = 1
    inner.Parent = surface
end

local function resolveParent()
    if typeof(gethui) == "function" then
        local ok, result = pcall(gethui)
        if ok and typeof(result) == "Instance" then
            return result
        end
    end
    return CoreGui
end

local parent = resolveParent()

do
    local ok, problem = pcall(function()
        local probe = Instance.new("ScreenGui")
        probe.Name = "QuantumVersionLoaderProbe"
        probe.Parent = parent
        probe:Destroy()
    end)
    if not ok then
        error("Quantum Version Loader needs UI write access: " .. tostring(problem), 0)
    end
end

pcall(function()
    local old = parent:FindFirstChild("QuantumVersionLoader")
    if old then
        old:Destroy()
    end
end)

local connections = {}
local destroyed = false

local blurEffect = nil
pcall(function()
    local lighting = game:GetService("Lighting")
    local old = lighting:FindFirstChild("QuantumLoaderBlur")
    if old then
        old:Destroy()
    end
    local blur = Instance.new("BlurEffect")
    blur.Name = "QuantumLoaderBlur"
    blur.Size = 8
    blur.Parent = lighting
    blurEffect = blur
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "QuantumVersionLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999

local function track(connection)
    table.insert(connections, connection)
    return connection
end

local function destroy()
    if destroyed then
        return
    end
    destroyed = true
    for _, connection in ipairs(connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(connections)
    pcall(function()
        if blurEffect ~= nil then
            blurEffect:Destroy()
        end
        blurEffect = nil
    end)
    pcall(function()
        screenGui:Destroy()
    end)
end

local backdrop = Instance.new("TextButton")
backdrop.Name = "Backdrop"
backdrop.AutoButtonColor = false
backdrop.BackgroundColor3 = Color3.new(0, 0, 0)
backdrop.BackgroundTransparency = 0.3
backdrop.BorderSizePixel = 0
backdrop.Size = UDim2.fromScale(1, 1)
backdrop.Text = ""
backdrop.Parent = screenGui

local card = Instance.new("Frame")
card.Name = "Card"
card.AnchorPoint = Vector2.new(0.5, 0.5)
card.BackgroundColor3 = CARD
card.BorderSizePixel = 0
card.Position = UDim2.fromScale(0.5, 0.5)
card.Size = UDim2.fromOffset(300, 330)
card.Parent = screenGui

local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 16)
cardCorner.Parent = card

local cardStroke = Instance.new("UIStroke")
cardStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
cardStroke.Color = STROKE
cardStroke.Thickness = 1.5
cardStroke.Parent = card

applyGlass(card)

local shadowBack = Instance.new("Frame")
shadowBack.Name = "ShadowBack"
shadowBack.BackgroundColor3 = Color3.new(0, 0, 0)
shadowBack.BackgroundTransparency = 0.85
shadowBack.BorderSizePixel = 0
shadowBack.Position = UDim2.new(0, 0, 0, 8)
shadowBack.Size = UDim2.new(1, 0, 1, 0)
shadowBack.ZIndex = 0
shadowBack.Parent = card

local shadowBackCorner = Instance.new("UICorner")
shadowBackCorner.CornerRadius = UDim.new(0, 16)
shadowBackCorner.Parent = shadowBack

local shadowFront = Instance.new("Frame")
shadowFront.Name = "ShadowFront"
shadowFront.BackgroundColor3 = Color3.new(0, 0, 0)
shadowFront.BackgroundTransparency = 0.75
shadowFront.BorderSizePixel = 0
shadowFront.Position = UDim2.new(0, 0, 0, 4)
shadowFront.Size = UDim2.new(1, 0, 1, 0)
shadowFront.ZIndex = 0
shadowFront.Parent = card

local shadowFrontCorner = Instance.new("UICorner")
shadowFrontCorner.CornerRadius = UDim.new(0, 16)
shadowFrontCorner.Parent = shadowFront

local divider = Instance.new("Frame")
divider.Name = "Divider"
divider.BackgroundColor3 = STROKE
divider.BackgroundTransparency = 0.35
divider.BorderSizePixel = 0
divider.AnchorPoint = Vector2.new(0.5, 0)
divider.Position = UDim2.new(0.5, 0, 0, 71)
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Parent = card

local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Position = UDim2.new(0, 20, 0, 16)
title.Size = UDim2.new(1, -84, 0, 30)
title.Text = "Quantum Version Loader"
title.TextColor3 = TEXT
title.TextSize = 19
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextTruncate = Enum.TextTruncate.AtEnd
title.Parent = card

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.GothamMedium
subtitle.Position = UDim2.new(0, 20, 0, 46)
subtitle.Size = UDim2.new(1, -84, 0, 18)
subtitle.Text = "Choose version"
subtitle.TextColor3 = MUTED
subtitle.TextSize = 13
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextTruncate = Enum.TextTruncate.AtEnd
subtitle.Parent = card

local status = Instance.new("TextLabel")
status.Name = "Status"
status.BackgroundTransparency = 1
status.Font = Enum.Font.GothamMedium
status.Position = UDim2.new(0, 0, 1, -32)
status.Size = UDim2.new(1, 0, 0, 20)
status.Text = ""
status.TextColor3 = MUTED
status.TextSize = 13
status.TextXAlignment = Enum.TextXAlignment.Center
status.TextTruncate = Enum.TextTruncate.AtEnd
status.Parent = card

local closeButton = Instance.new("TextButton")
closeButton.Name = "Close"
closeButton.AutoButtonColor = false
closeButton.BackgroundColor3 = MAUVE
closeButton.BorderSizePixel = 0
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.Position = UDim2.new(1, -12, 0, 12)
closeButton.Size = UDim2.fromOffset(28, 28)
closeButton.Font = Enum.Font.GothamBold
closeButton.Text = "X"
closeButton.TextColor3 = TEXT
closeButton.TextSize = 15
closeButton.Parent = card

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local dragStrip = Instance.new("TextButton")
dragStrip.Name = "DragStrip"
dragStrip.AutoButtonColor = false
dragStrip.BackgroundTransparency = 1
dragStrip.BorderSizePixel = 0
dragStrip.Position = UDim2.new(0, 0, 0, 0)
dragStrip.Size = UDim2.new(1, -52, 0, 70)
dragStrip.Text = ""
dragStrip.Active = true
dragStrip.ZIndex = 4
dragStrip.Parent = card

local dragging = false
local dragStart = nil
local cardStart = nil

local function clampCardPosition(position)
    local camera = workspace.CurrentCamera
    local viewport = camera and camera.ViewportSize or Vector2.new(1280, 720)
    if viewport.X < 1 or viewport.Y < 1 then
        viewport = Vector2.new(1280, 720)
    end
    local centerX = viewport.X * 0.5 + position.X.Offset
    local centerY = viewport.Y * 0.5 + position.Y.Offset
    centerX = math.clamp(centerX, 40, math.max(41, viewport.X - 40))
    centerY = math.clamp(centerY, 20, math.max(21, viewport.Y - 20))
    return UDim2.new(position.X.Scale, centerX - viewport.X * 0.5, position.Y.Scale, centerY - viewport.Y * 0.5)
end

track(dragStrip.InputBegan:Connect(function(input)
    if destroyed then
        return
    end
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        cardStart = card.Position
    end
end))

track(UserInputService.InputChanged:Connect(function(input)
    if not dragging or destroyed then
        return
    end
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        if dragStart == nil or cardStart == nil then
            return
        end
        local delta = input.Position - dragStart
        card.Position = clampCardPosition(UDim2.new(
            cardStart.X.Scale,
            cardStart.X.Offset + delta.X,
            cardStart.Y.Scale,
            cardStart.Y.Offset + delta.Y
        ))
    end
end))

track(UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragStart = nil
        cardStart = nil
    end
end))

local listFrame = Instance.new("ScrollingFrame")
listFrame.Name = "VersionList"
listFrame.BackgroundTransparency = 1
listFrame.BorderSizePixel = 0
listFrame.AnchorPoint = Vector2.new(0.5, 0)
listFrame.Position = UDim2.new(0.5, 0, 0, 78)
listFrame.Size = UDim2.new(1, -40, 1, -(78 + 44))
listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
listFrame.ScrollingDirection = Enum.ScrollingDirection.Y
listFrame.ScrollingEnabled = true
listFrame.ScrollBarThickness = 8
listFrame.ScrollBarImageColor3 = ACCENT
listFrame.ScrollBarImageTransparency = 0
listFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
listFrame.Parent = card

local listPadding = Instance.new("UIPadding")
listPadding.PaddingTop = UDim.new(0, 5)
listPadding.PaddingBottom = UDim.new(0, 5)
listPadding.PaddingLeft = UDim.new(0, 5)
listPadding.PaddingRight = UDim.new(0, 14)
listPadding.Parent = listFrame

local scrollTrack = Instance.new("Frame")
scrollTrack.Name = "ScrollTrack"
scrollTrack.AnchorPoint = Vector2.new(1, 0)
scrollTrack.BackgroundColor3 = Color3.new(0, 0, 0)
scrollTrack.BackgroundTransparency = 0.5
scrollTrack.BorderSizePixel = 0
scrollTrack.Position = UDim2.new(1, -20, 0, 78)
scrollTrack.Size = UDim2.new(0, 8, 1, -(78 + 44))
scrollTrack.ZIndex = 0
scrollTrack.Parent = card

local scrollTrackCorner = Instance.new("UICorner")
scrollTrackCorner.CornerRadius = UDim.new(1, 0)
scrollTrackCorner.Parent = scrollTrack

track(listFrame.MouseEnter:Connect(function()
    if destroyed then
        return
    end
    TweenService:Create(listFrame, TweenInfo.new(0.15), { ScrollBarThickness = 10 }):Play()
end))

track(listFrame.MouseLeave:Connect(function()
    if destroyed then
        return
    end
    TweenService:Create(listFrame, TweenInfo.new(0.15), { ScrollBarThickness = 8 }):Play()
end))

local listLayout = Instance.new("UIListLayout")
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = listFrame

local ROW_MIN = 44
local ROW_PAD = 10
local rowHeight = ROW_MIN
do
    local count = math.max(#VERSIONS, 1)
    local visibleH = 330 - 78 - 44 - 5 - 5
    local fit = math.floor((visibleH - ROW_PAD * (count - 1)) / count)
    if fit > ROW_MIN then
        rowHeight = fit
    end
end

local DIM_BG = Color3.fromRGB(52, 28, 44)
local PRESS_BG = Color3.fromRGB(176, 32, 70)

local buttons = {}
local rows = {}

local function setBusy(busy, activeIndex)
    for index, row in ipairs(rows) do
        local button = row.button
        button.AutoButtonColor = false
        button.Active = not busy
        row.busy = busy
        if busy then
            button.BackgroundColor3 = DIM_BG
            row.name.TextTransparency = 0.4
            row.note.TextTransparency = 0.4
            row.chev.TextTransparency = 0.4
            if index == activeIndex then
                row.note.Text = "Loading..."
            end
        else
            button.BackgroundColor3 = ACCENT
            row.name.TextTransparency = 0
            row.note.TextTransparency = 0
            row.chev.TextTransparency = 0
            row.note.Text = VERSIONS[index].Note
        end
    end
    closeButton.Active = not busy
end

local function loadVersion(entry, entryIndex)
    if destroyed then
        return
    end
    setBusy(true, entryIndex)
    status.Text = "Loading " .. entry.Name .. "..."
    local url = BASE_URL .. entry.File
    local source = nil
    for _ = 1, 3 do
        local ok, result = pcall(game.HttpGet, game, url)
        if ok and type(result) == "string" and result ~= "" then
            source = result
            break
        end
        task.wait(0.5)
    end
    if type(source) ~= "string" or source == "" then
        status.Text = "Failed to load " .. entry.Name .. ", try again"
        setBusy(false)
        return
    end
    local chunk, err = loadstring(source)
    if not chunk then
        status.Text = "Failed to load " .. entry.Name .. ": " .. tostring(err)
        setBusy(false)
        return
    end
    destroy()
    chunk()
end

for index, entry in ipairs(VERSIONS) do
    local button = Instance.new("TextButton")
    button.Name = "Version" .. entry.Name
    button.AutoButtonColor = false
    button.BackgroundColor3 = ACCENT
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, 0, 0, rowHeight)
    button.LayoutOrder = index
    button.Text = ""
    button.Active = true
    button.Parent = listFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Color = MAUVE
    stroke.Thickness = 1
    stroke.Parent = button

    applyGlass(button)

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "Name"
    nameLabel.BackgroundTransparency = 1
    nameLabel.BorderSizePixel = 0
    nameLabel.Position = UDim2.new(0, 14, 0, 4)
    nameLabel.Size = UDim2.new(1, -48, 0, 20)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = entry.Name
    nameLabel.TextColor3 = TEXT
    nameLabel.TextSize = 16
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = button

    local noteLabel = Instance.new("TextLabel")
    noteLabel.Name = "Note"
    noteLabel.BackgroundTransparency = 1
    noteLabel.BorderSizePixel = 0
    noteLabel.Position = UDim2.new(0, 14, 0, 24)
    noteLabel.Size = UDim2.new(1, -48, 0, 15)
    noteLabel.Font = Enum.Font.GothamMedium
    noteLabel.Text = entry.Note
    noteLabel.TextColor3 = MUTED
    noteLabel.TextSize = 12
    noteLabel.TextXAlignment = Enum.TextXAlignment.Left
    noteLabel.TextTruncate = Enum.TextTruncate.AtEnd
    noteLabel.Parent = button

    local chevLabel = Instance.new("TextLabel")
    chevLabel.Name = "Chev"
    chevLabel.BackgroundTransparency = 1
    chevLabel.BorderSizePixel = 0
    chevLabel.AnchorPoint = Vector2.new(1, 0.5)
    chevLabel.Position = UDim2.new(1, -12, 0.5, 0)
    chevLabel.Size = UDim2.fromOffset(20, 20)
    chevLabel.Font = Enum.Font.GothamBold
    chevLabel.Text = ">"
    chevLabel.TextColor3 = MUTED
    chevLabel.TextSize = 18
    chevLabel.Parent = button

    local row = {
        button = button,
        name = nameLabel,
        note = noteLabel,
        chev = chevLabel,
        hovering = false,
        pressed = false,
        busy = false,
    }
    rows[index] = row
    table.insert(buttons, button)
    track(button.Activated:Connect(function()
        loadVersion(entry, index)
    end))
    track(button.MouseEnter:Connect(function()
        row.hovering = true
        if row.busy or row.pressed or destroyed then
            return
        end
        TweenService:Create(button, TweenInfo.new(0.12), { BackgroundColor3 = MAUVE }):Play()
    end))
    track(button.MouseLeave:Connect(function()
        row.hovering = false
        row.pressed = false
        if row.busy or destroyed then
            return
        end
        TweenService:Create(button, TweenInfo.new(0.12), { BackgroundColor3 = ACCENT }):Play()
    end))
    track(button.MouseButton1Down:Connect(function()
        row.pressed = true
        if row.busy or destroyed then
            return
        end
        TweenService:Create(button, TweenInfo.new(0.08), { BackgroundColor3 = PRESS_BG }):Play()
    end))
    track(button.MouseButton1Up:Connect(function()
        row.pressed = false
        if row.busy or destroyed then
            return
        end
        local target = ACCENT
        if row.hovering then
            target = MAUVE
        end
        TweenService:Create(button, TweenInfo.new(0.12), { BackgroundColor3 = target }):Play()
    end))
end

local modalVeil = nil
local modalCard = nil

local function closeModal()
    if modalVeil == nil then
        return
    end
    local veil = modalVeil
    local group = modalCard
    modalVeil = nil
    modalCard = nil
    if destroyed then
        pcall(function()
            veil:Destroy()
        end)
        return
    end
    if group ~= nil then
        local outTween = TweenService:Create(group, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 })
        outTween:Play()
        task.spawn(function()
            outTween.Completed:Wait()
            if destroyed then
                return
            end
            pcall(function()
                veil:Destroy()
            end)
        end)
    else
        pcall(function()
            veil:Destroy()
        end)
    end
end

local function openModal()
    if destroyed or modalVeil ~= nil then
        return
    end
    local veil = Instance.new("TextButton")
    veil.Name = "ExitVeil"
    veil.AutoButtonColor = false
    veil.BackgroundColor3 = Color3.new(0, 0, 0)
    veil.BackgroundTransparency = 0.4
    veil.BorderSizePixel = 0
    veil.Size = UDim2.fromScale(1, 1)
    veil.Text = ""
    veil.Active = true
    veil.ZIndex = 50
    veil.Parent = screenGui

    local group = Instance.new("CanvasGroup")
    group.Name = "ExitModal"
    group.AnchorPoint = Vector2.new(0.5, 0.5)
    group.BackgroundColor3 = CARD
    group.BorderSizePixel = 0
    group.Position = UDim2.fromScale(0.5, 0.5)
    group.Size = UDim2.fromOffset(240, 170)
    group.GroupTransparency = 1
    group.ZIndex = 51
    group.Parent = veil

    local groupCorner = Instance.new("UICorner")
    groupCorner.CornerRadius = UDim.new(0, 14)
    groupCorner.Parent = group

    local groupStroke = Instance.new("UIStroke")
    groupStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    groupStroke.Color = STROKE
    groupStroke.Thickness = 1.5
    groupStroke.Parent = group

    applyGlass(group)
    group.BackgroundTransparency = 0.12

    local modalShadow = Instance.new("Frame")
    modalShadow.Name = "Shadow"
    modalShadow.BackgroundColor3 = Color3.new(0, 0, 0)
    modalShadow.BackgroundTransparency = 0.8
    modalShadow.BorderSizePixel = 0
    modalShadow.Position = UDim2.new(0, 0, 0, 5)
    modalShadow.Size = UDim2.new(1, 0, 1, 0)
    modalShadow.ZIndex = 0
    modalShadow.Parent = group

    local modalShadowCorner = Instance.new("UICorner")
    modalShadowCorner.CornerRadius = UDim.new(0, 14)
    modalShadowCorner.Parent = modalShadow

    local groupScale = Instance.new("UIScale")
    groupScale.Scale = 0.95
    groupScale.Parent = group

    local headline = Instance.new("TextLabel")
    headline.Name = "Headline"
    headline.BackgroundTransparency = 1
    headline.Position = UDim2.new(0, 16, 0, 14)
    headline.Size = UDim2.new(1, -32, 0, 56)
    headline.Font = Enum.Font.GothamBold
    headline.Text = "Are you sure you want to exit Quantum Loader?"
    headline.TextColor3 = TEXT
    headline.TextSize = 15
    headline.TextWrapped = true
    headline.TextXAlignment = Enum.TextXAlignment.Center
    headline.TextYAlignment = Enum.TextYAlignment.Center
    headline.TextTransparency = 0
    headline.Parent = group

    local explainer = Instance.new("TextLabel")
    explainer.Name = "Explainer"
    explainer.BackgroundTransparency = 1
    explainer.Position = UDim2.new(0, 16, 0, 72)
    explainer.Size = UDim2.new(1, -32, 0, 18)
    explainer.Font = Enum.Font.GothamMedium
    explainer.Text = "The loader will close and no version will load."
    explainer.TextColor3 = MUTED
    explainer.TextSize = 12
    explainer.TextWrapped = true
    explainer.TextXAlignment = Enum.TextXAlignment.Center
    explainer.TextTransparency = 0
    explainer.Parent = group

    local yesButton = Instance.new("TextButton")
    yesButton.Name = "Yes"
    yesButton.AutoButtonColor = false
    yesButton.BackgroundColor3 = Color3.fromRGB(150, 25, 63)
    yesButton.BorderSizePixel = 0
    yesButton.AnchorPoint = Vector2.new(0, 1)
    yesButton.Position = UDim2.new(0, 12, 1, -12)
    yesButton.Size = UDim2.new(0.5, -18, 0, 36)
    yesButton.Font = Enum.Font.GothamBold
    yesButton.Text = "Yes"
    yesButton.TextColor3 = Color3.new(1, 1, 1)
    yesButton.TextSize = 17
    yesButton.TextTransparency = 0
    yesButton.Parent = group

    local yesCorner = Instance.new("UICorner")
    yesCorner.CornerRadius = UDim.new(0, 10)
    yesCorner.Parent = yesButton

    applyGlass(yesButton)

    local yesStroke = Instance.new("UIStroke")
    yesStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    yesStroke.Color = STROKE
    yesStroke.Thickness = 1
    yesStroke.Parent = yesButton

    local noButton = Instance.new("TextButton")
    noButton.Name = "No"
    noButton.AutoButtonColor = false
    noButton.BackgroundColor3 = CARD
    noButton.BorderSizePixel = 0
    noButton.AnchorPoint = Vector2.new(1, 1)
    noButton.Position = UDim2.new(1, -12, 1, -12)
    noButton.Size = UDim2.new(0.5, -18, 0, 36)
    noButton.Font = Enum.Font.GothamBold
    noButton.Text = "No"
    noButton.TextColor3 = Color3.new(1, 1, 1)
    noButton.TextSize = 17
    noButton.TextTransparency = 0
    noButton.Parent = group

    local noCorner = Instance.new("UICorner")
    noCorner.CornerRadius = UDim.new(0, 10)
    noCorner.Parent = noButton

    local noStroke = Instance.new("UIStroke")
    noStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    noStroke.Color = MAUVE
    noStroke.Thickness = 1.5
    noStroke.Parent = noButton

    applyGlass(noButton)

    track(yesButton.Activated:Connect(function()
        destroy()
    end))
    track(noButton.Activated:Connect(function()
        closeModal()
    end))

    modalVeil = veil
    modalCard = group
    TweenService:Create(group, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
    TweenService:Create(groupScale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
end

track(closeButton.Activated:Connect(function()
    openModal()
end))

screenGui.Parent = parent
