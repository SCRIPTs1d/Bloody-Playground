-- Bloody Playground (Safe GUI Injection)
local P = game:GetService("Players")
local LP = P.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Esperar de forma segura a que cargue la interfaz del jugador
local PG = LP:WaitForChild("PlayerGui", 10)
if not PG then return end

local SE = false
local HS = 7
local HT = 1
local OS = {}

local SG = Instance.new("ScreenGui")
SG.Name = "BloodyPlaygroundGui"
SG.ResetOnSpawn = false
SG.Parent = PG

local MF = Instance.new("Frame")
MF.Size = UDim2.new(0, 320, 0, 220)
MF.Position = UDim2.new(0.05, 0, 0.3, 0)
MF.BackgroundColor3 = Color3.fromRGB(80, 30, 120)
MF.BackgroundTransparency = 0.4
MF.BorderSizePixel = 0
MF.Active = true
MF.Draggable = true
MF.Parent = SG

local MC = Instance.new("UICorner")
MC.CornerRadius = UDim.new(0, 16)
MC.Parent = MF

local T = Instance.new("TextLabel")
T.Size = UDim2.new(1, 0, 0, 45)
T.BackgroundTransparency = 1
T.Text = "Bloody Playground"
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.TextSize = 18
T.Font = Enum.Font.SourceSansBold
T.Parent = MF

local TB = Instance.new("TextButton")
TB.Size = UDim2.new(0, 280, 0, 40)
TB.Position = UDim2.new(0, 20, 0, 45)
TB.BackgroundColor3 = Color3.fromRGB(200, 35, 35)
TB.Text = "OFF"
TB.TextColor3 = Color3.fromRGB(255, 255, 255)
TB.TextSize = 16
TB.Font = Enum.Font.SourceSansBold
TB.Parent = MF

local BC = Instance.new("UICorner")
BC.CornerRadius = UDim.new(0, 10)
BC.Parent = TB

local SL = Instance.new("TextLabel")
SL.Size = UDim2.new(1, 0, 0, 20)
SL.Position = UDim2.new(0, 0, 0, 95)
SL.BackgroundTransparency = 1
SL.Text = "Hitbox Size: 7 studs"
SL.TextColor3 = Color3.fromRGB(255, 255, 255)
SL.TextSize = 13
SL.Font = Enum.Font.SourceSans
SL.Parent = MF

local SSF = Instance.new("Frame")
SSF.Size = UDim2.new(0, 280, 0, 8)
SSF.Position = UDim2.new(0, 20, 0, 120)
SSF.BackgroundColor3 = Color3.fromRGB(120, 80, 160)
SSF.BorderSizePixel = 0
SSF.Parent = MF

local SSC = Instance.new("UICorner")
SSC.CornerRadius = UDim.new(0, 4)
SSC.Parent = SSF

local SF = Instance.new("Frame")
SF.Size = UDim2.new(0, 50, 1, 0)
SF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SF.BorderSizePixel = 0
SF.Parent = SSF

local SFC = Instance.new("UICorner")
SFC.CornerRadius = UDim.new(0, 4)
SFC.Parent = SF

local ST = Instance.new("TextButton")
ST.Size = UDim2.new(0, 16, 0, 16)
ST.Position = UDim2.new(0, 42, 0, -4)
ST.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ST.Text = ""
ST.Parent = SSF

local TC = Instance.new("UICorner")
TC.CornerRadius = UDim.new(1, 0)
TC.Parent = ST

local TL = Instance.new("TextLabel")
TL.Size = UDim2.new(1, 0, 0, 20)
TL.Position = UDim2.new(0, 0, 0, 145)
TL.BackgroundTransparency = 1
TL.Text = "Transparency: 1"
TL.TextColor3 = Color3.fromRGB(255, 255, 255)
TL.TextSize = 13
TL.Font = Enum.Font.SourceSans
TL.Parent = MF

local TSF = Instance.new("Frame")
TSF.Size = UDim2.new(0, 280, 0, 8)
TSF.Position = UDim2.new(0, 20, 0, 170)
TSF.BackgroundColor3 = Color3.fromRGB(120, 80, 160)
TSF.BorderSizePixel = 0
TSF.Parent = MF

local TSC = Instance.new("UICorner")
TSC.CornerRadius = UDim.new(0, 4)
TSC.Parent = TSF

local TF = Instance.new("Frame")
TF.Size = UDim2.new(1, 0, 1, 0)
TF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TF.BorderSizePixel = 0
TF.Parent = TSF

local TFC = Instance.new("UICorner")
TFC.CornerRadius = UDim.new(0, 4)
TFC.Parent = TF

local TT = Instance.new("TextButton")
TT.Size = UDim2.new(0, 16, 0, 16)
TT.Position = UDim2.new(1, -12, 0, -4)
TT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TT.Text = ""
TT.Parent = TSF

local TC2 = Instance.new("UICorner")
TC2.CornerRadius = UDim.new(1, 0)
TC2.Parent = TT

TB.MouseButton1Click:Connect(function()
    SE = not SE
    if SE then
        TB.BackgroundColor3 = Color3.fromRGB(35, 185, 35)
        TB.Text = "ON"
    else
        TB.BackgroundColor3 = Color3.fromRGB(200, 35, 35)
        TB.Text = "OFF"
    end
end)

local function Setup(trig, fill, lbl, pref, mn, mx, isT)
    local drag = false
    trig.MouseButton1Down:Connect(function() drag = true end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
    UIS.InputChanged:Connect(function(i)
        if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
            local m = UIS:GetMouseLocation().X
            local l = trig.Parent.AbsolutePosition.X
            local w = trig.Parent.AbsoluteSize.X
            local p = math.clamp((m - l) / w, 0, 1)
            trig.Position = UDim2.new(p, -8, 0, -4)
            fill.Size = UDim2.new(p, 0, 1, 0)
            local v = mn + (p * (mx - mn))
            if isT then
                v = math.floor(v * 100) / 100
                HT = v
                lbl.Text = pref .. ": " .. string.format("%.2f", v)
            else
                v = math.floor(v)
                HS = v
                lbl.Text = pref .. ": " .. v .. " studs"
            end
        end
    end)
end

Setup(ST, SF, SL, "Hitbox Size", 2, 50, false)
Setup(TT, TF, TL, "Transparency", 0, 1, true)

task.spawn(function()
    while true do
        task.wait(0.3)
        for _, p in pairs(P:GetPlayers()) do
            if p ~= LP and p.Character then
                local c = p.Character
                local h = c:FindFirstChild("Head")
                if h and h:IsA("BasePart") then
                    if not OS[p.Name] then OS[p.Name] = h.Size end
                    if SE then
                        h.Size = Vector3.new(HS, HS, HS)
                        h.Transparency = HT
                        h.CanCollide = false
                        h.Massless = true
                    else
                        h.Size = OS[p.Name] or Vector3.new(2, 1, 1)
                        h.Transparency = 0
                    end
                end
            end
        end
    end
end)
