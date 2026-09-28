 
 
getgenv().__QUANTUM_LOADER_ONCE__ = true
 
local TweenService = game:GetService("TweenService")
 
local RunService = game:GetService("RunService")
 
local Lighting = game:GetService("Lighting")
 
local CoreGui = game:GetService("CoreGui")
 
local Quantum_Overlay = CoreGui:FindFirstChild("Quantum_Overlay")
 
Quantum_Overlay:Destroy()
 
local children = Lighting:GetChildren()
 
for i, v in ipairs(children) do
end
 
local BlurEffect = Instance.new("BlurEffect")
 
BlurEffect.Name = "Quantum_OverlayBlur"
 
BlurEffect.Size = 0
 
BlurEffect.Parent = Lighting
 
local tween = TweenService:Create(BlurEffect, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = 12 })
 
tween:Play()
 
local ScreenGui = Instance.new("ScreenGui")
 
ScreenGui.Name = "Quantum_Overlay"
 
ScreenGui.IgnoreGuiInset = true
 
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
ScreenGui.ResetOnSpawn = false
 
ScreenGui.Parent = CoreGui
 
local Frame = Instance.new("Frame", ScreenGui)
 
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 
Frame.BackgroundTransparency = 0.35
 
Frame.Size = UDim2.fromScale(1, 1)
 
local Frame2 = Instance.new("Frame", Frame)
 
Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
 
Frame2.Position = UDim2.fromScale(0.5, 0.5)
 
Frame2.Size = UDim2.new(0, 440, 0, 120)
 
Frame2.BackgroundColor3 = Color3.fromRGB(13, 7, 12)
 
Frame2.BorderSizePixel = 0
 
local UICorner = Instance.new("UICorner", Frame2)
 
UICorner.CornerRadius = UDim.new(0, 14)
 
local UIStroke = Instance.new("UIStroke", Frame2)
 
UIStroke.Thickness = 1.8
 
UIStroke.Transparency = 0.18
 
UIStroke.Color = Color3.fromRGB(255, 46, 99)
 
local UIGradient = Instance.new("UIGradient", Frame2)
 
UIGradient.Rotation = 90
 
UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 14, 24)), ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 7, 12)) })
 
local Frame3 = Instance.new("Frame", Frame2)
 
Frame3.BackgroundTransparency = 1
 
Frame3.Position = UDim2.new(0, 18, 0, 10)
 
Frame3.Size = UDim2.new(1, -36, 0, 22)
 
local ImageLabel = Instance.new("ImageLabel", Frame3)
 
ImageLabel.BackgroundTransparency = 1
 
ImageLabel.Image = "rbxassetid://72030759561614"
 
ImageLabel.Size = UDim2.new(0, 22, 0, 22)
 
local TextLabel = Instance.new("TextLabel", Frame3)
 
TextLabel.BackgroundTransparency = 1
 
TextLabel.Font = Enum.Font.GothamSemibold
 
TextLabel.Text = "Quantum - discord.gg/DvjFNyyjuH"
 
TextLabel.TextSize = 16
 
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
 
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
 
TextLabel.Position = UDim2.new(0, 28, 0, 2)
 
TextLabel.Size = UDim2.new(1, -28, 1, 0)
 
local TextLabel2 = Instance.new("TextLabel", Frame2)
 
TextLabel2.BackgroundTransparency = 1
 
TextLabel2.Font = Enum.Font.GothamSemibold
 
TextLabel2.Text = "creating a private server"
 
TextLabel2.TextSize = 20
 
TextLabel2.TextColor3 = Color3.fromRGB(255, 240, 245)
 
TextLabel2.TextStrokeTransparency = 0.12
 
TextLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
 
TextLabel2.Position = UDim2.new(0, 24, 0, 44)
 
TextLabel2.Size = UDim2.new(1, -48, 0, 24)
 
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
 
local TextLabel3 = Instance.new("TextLabel", Frame2)
 
TextLabel3.BackgroundTransparency = 1
 
TextLabel3.Font = Enum.Font.GothamSemibold
 
TextLabel3.Text = "..."
 
TextLabel3.TextSize = 20
 
TextLabel3.TextColor3 = Color3.fromRGB(255, 46, 99)
 
TextLabel3.TextStrokeTransparency = 0.25
 
TextLabel3.TextStrokeColor3 = Color3.fromRGB(10, 16, 20)
 
TextLabel3.Position = UDim2.new(0, 32, 0, 44)
 
TextLabel3.Size = UDim2.new(0, 80, 0, 24)
 
TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
 
local Frame4 = Instance.new("Frame", Frame2)
 
Frame4.AnchorPoint = Vector2.new(0.5, 1)
 
Frame4.Position = UDim2.new(0.5, 0, 1, -16)
 
Frame4.Size = UDim2.new(1, -48, 0, 8)
 
Frame4.BackgroundColor3 = Color3.fromRGB(26, 14, 22)
 
Frame4.BackgroundTransparency = 0.2
 
Frame4.BorderSizePixel = 0
 
local UICorner2 = Instance.new("UICorner", Frame4)
 
UICorner2.CornerRadius = UDim.new(1, 0)
 
local Frame5 = Instance.new("Frame", Frame4)
 
Frame5.AnchorPoint = Vector2.new(0, 0.5)
 
Frame5.Position = UDim2.new(0, 0, 0.5, 0)
 
Frame5.Size = UDim2.new(0.12, 0, 1, 0)
 
Frame5.BackgroundColor3 = Color3.fromRGB(255, 46, 99)
 
Frame5.BackgroundTransparency = 0.15
 
local UICorner3 = Instance.new("UICorner", Frame5)
 
UICorner3.CornerRadius = UDim.new(1, 0)
 
local UIGradient2 = Instance.new("UIGradient", Frame5)
 
UIGradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(123, 45, 91)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 46, 99)), ColorSequenceKeypoint.new(1, Color3.fromRGB(123, 45, 91)) })
 
UIGradient2.Offset = Vector2.new(-1, 0)
 
local Frame6 = Instance.new("Frame", Frame2)
 
Frame6.AnchorPoint = Vector2.new(0, 0.5)
 
Frame6.Position = UDim2.new(-0.6, 0, 0.6, 0)
 
Frame6.Size = UDim2.new(0.3, 0, 1.2, 0)
 
Frame6.Rotation = -20
 
Frame6.BackgroundTransparency = 1
 
local ImageLabel2 = Instance.new("ImageLabel", Frame6)
 
ImageLabel2.BackgroundTransparency = 1
 
ImageLabel2.Image = "rbxassetid://9149576105"
 
ImageLabel2.ImageTransparency = 0.35
 
ImageLabel2.Size = UDim2.fromScale(1, 1)
 
ImageLabel2.Position = UDim2.fromScale(0.5, 0.5)
 
ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
 
local ImageLabel3 = Instance.new("ImageLabel", Frame2)
 
ImageLabel3.BackgroundTransparency = 1
 
ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
 
ImageLabel3.Position = UDim2.fromScale(0.5, 0.5)
 
ImageLabel3.Size = UDim2.new(1, 30, 1, 30)
 
ImageLabel3.Image = "rbxassetid://6015897843"
 
ImageLabel3.ImageTransparency = 0.3
 
ImageLabel3.ImageColor3 = Color3.fromRGB(13, 7, 12)
 
ImageLabel3.ZIndex = -1
 
local connection = RunService.RenderStepped:Connect(function(deltaTime)
	 
	UIStroke.Color = Color3.fromHSV(0.33557265996932983, 0.6, 1)
	 
	TextLabel3.TextColor3 = Color3.fromHSV(0.33557265996932983, 0.6, 1)
end)
 
task.spawn(function(...)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "..."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ""
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = "."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
	TextLabel3.Text = ".."
	 
	TextLabel3.Position = UDim2.new(0, 32, 0, 44)
	 
	task.wait(0.25)
	 
end)
 
task.spawn(function(...)
	 
	Frame5.Size = UDim2.new(0.12, 0, 1, 0)
	 
	UIGradient2.Offset = Vector2.new(-1, 0)
	 
	local tween2 = TweenService:Create(UIGradient2, TweenInfo.new(1.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Offset = Vector2.new(1, 0) })
	 
	tween2:Play()
	 
	local tween3 = TweenService:Create(Frame5, TweenInfo.new(1.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Size = UDim2.new(1, 0, 1, 0) })
	 
	tween3:Play()
	 
	Frame6.Position = UDim2.new(-0.6, 0, 0.6, 0)
	 
	local tween4 = TweenService:Create(Frame6, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(1.2, 0, 0.6, 0) })
	 
	tween4:Play()
	 
	task.wait(1.45)
	 
	Frame5.Size = UDim2.new(0.12, 0, 1, 0)
	 
	UIGradient2.Offset = Vector2.new(-1, 0)
	 
	local tween5 = TweenService:Create(UIGradient2, TweenInfo.new(1.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Offset = Vector2.new(1, 0) })
	 
	tween5:Play()
	 
	local tween6 = TweenService:Create(Frame5, TweenInfo.new(1.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Size = UDim2.new(1, 0, 1, 0) })
	 
	tween6:Play()
	 
	Frame6.Position = UDim2.new(-0.6, 0, 0.6, 0)
	 
	local tween7 = TweenService:Create(Frame6, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(1.2, 0, 0.6, 0) })
	 
	tween7:Play()
	 
	task.wait(1.45)
	 
end)
 
task.delay(18, function(...)
end)
 
local response = game:HttpGet("https://api.luarmor.net/files/v3/loaders/ebba856a4c173db80fbbe593474df953.lua")
 
loadstring(response)()
 
TextLabel2.Text = "loaded successfully"
 
TextLabel2.TextColor3 = Color3.fromRGB(180, 255, 180)
 
task.delay(2.5, function(...)
	 
	connection:Disconnect()
	 
	local tween8 = TweenService:Create(BlurEffect, TweenInfo.new(0.2), { Size = 0 })
	 
	tween8:Play()
	 
	local tween9 = TweenService:Create(Frame, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
	 
	tween9:Play()
	 
	local tween10 = TweenService:Create(Frame2, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
	 
	tween10:Play()
	 
	task.wait(0.21)
	 
	BlurEffect:Destroy()
	 
	ScreenGui:Destroy()
end)
