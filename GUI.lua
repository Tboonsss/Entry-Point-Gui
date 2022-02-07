local adwa = Instance.new("ScreenGui")
local lolwe = Instance.new("Frame")
local ewqre = Instance.new("Frame")
local Fly = Instance.new("TextButton")
local Animations = Instance.new("TextButton")
local Fling = Instance.new("TextButton")
local Admin = Instance.new("TextButton")
local Noclip = Instance.new("TextButton")
local Bypass = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
 
 
--Properties:
 
adwa.Name = "adwa"
adwa.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
adwa.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
lolwe.Name = "lolwe"
lolwe.Parent = adwa
lolwe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
lolwe.BorderSizePixel = 0
lolwe.Position = UDim2.new(0.0529355146, 0, 0.308764935, 0)
lolwe.Size = UDim2.new(0, 355, 0, 213)
lolwe.Draggable = true
lolwe.Active = true
 
ewqre.Name = "ewqre"
ewqre.Parent = lolwe
ewqre.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ewqre.BorderSizePixel = 0
ewqre.Size = UDim2.new(0, 355, 0, 23)
 
Fly.Name = "Aimbot"
Fly.Parent = lolwe
Fly.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.102112678, 0, 0.234741777, 0)
Fly.Size = UDim2.new(0, 140, 0, 100)
Fly.Font = Enum.Font.Cartoon
Fly.Text = "Aimbot"
Fly.TextColor3 = Color3.fromRGB(244, 0, 0)
Fly.TextSize = 20.000
Fly.MouseButton1Down:connect(function()
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = true
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

_G.CircleSides = 64 -- How many sides the FOV circle would have.
_G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
_G.CircleTransparency = 0.7 -- Transparency of the circle.
_G.CircleRadius = 80 -- The radius of the circle / FOV.
_G.CircleFilled = false -- Determines whether or not the circle is filled.
_G.CircleVisible = true -- Determines whether or not the circle is visible.
_G.CircleThickness = 0 -- The thickness of the circle.

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
	local MaximumDistance = _G.CircleRadius
	local Target = nil

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness

    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
end)
 

 
Fling.Name = "ESP"
Fling.Parent = lolwe
Fling.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Fling.BorderSizePixel = 0
Fling.Position = UDim2.new(0.502112678, 0, 0.234741777, 0)
Fling.Size = UDim2.new(0, 140, 0, 100)
Fling.Font = Enum.Font.Cartoon
Fling.Text = "ESP"
Fling.TextColor3 = Color3.fromRGB(244, 0, 0)
Fling.TextSize = 20.000
Fling.MouseButton1Down:connect(function()
    local color = BrickColor.new(50,0,250)
local transparency = .8

local Players = game:GetService("Players")
local function _ESP(c)
  repeat wait() until c.PrimaryPart ~= nil
  for i,p in pairs(c:GetChildren()) do
    if p.ClassName == "Part" or p.ClassName == "MeshPart" then
      if p:FindFirstChild("shit") then p.shit:Destroy() end
      local a = Instance.new("BoxHandleAdornment",p)
      a.Name = "shit"
      a.Size = p.Size
      a.Color = color
      a.Transparency = transparency
      a.AlwaysOnTop = true    
      a.Visible = true    
      a.Adornee = p
      a.ZIndex = true    

    end
  end
end
local function ESP()
  for i,v in pairs(Players:GetChildren()) do
    if v ~= game.Players.LocalPlayer then
      if v.Character then
        _ESP(v.Character)
      end
      v.CharacterAdded:Connect(function(chr)
        _ESP(chr)
      end)
    end
  end
  Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(chr)
      _ESP(chr)
    end)  
  end)
end
ESP()
end)
 

TextLabel.Parent = lolwe
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.287323952, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 151, 0, 23)
TextLabel.Font = Enum.Font.Cartoon
TextLabel.Text = "entry point"
TextLabel.TextColor3 = Color3.fromRGB(244, 0, 0)
TextLabel.TextSize = 14.000
