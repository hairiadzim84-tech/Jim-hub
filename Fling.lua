-- 🎮 JIMHUB FLING — KHUSUS HP / SENTUH LAYAR!
if _G.JimHubHP then return end
_G.JimHubHP = true

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Root

local function UpdateChar()
    task.wait()
    if Player.Character then
        Root = Player.Character:FindFirstChild("HumanoidRootPart")
    end
end
UpdateChar()
Player.CharacterAdded:Connect(UpdateChar)

local function FlingTarget(Char)
    if not Root or not Char then return end
    local TR = Char:FindFirstChild("HumanoidRootPart")
    if not TR then return end
    local BV = Instance.new("BodyVelocity")
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BV.Velocity = (TR.Position - Root.Position).Unit * 900 + Vector3.new(0, 700, 0)
    BV.Parent = TR
    game.Debris:AddItem(BV, 0.4)
end

-- SENTUH/KLIK LAYAR = LEMPAR ORANG YANG DITUNJUK!
Mouse.Button1Down:Connect(function()
    if not Mouse.Target then return end
    local P = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
    if P and P ~= Player and P.Character then
        FlingTarget(P.Character)
    end
end)

-- TOMBOL ON/OFF DI LAYAR
local G = Instance.new("ScreenGui")
G.Parent = game.CoreGui
G.Name = "JimHubHP"

local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(0, 200, 0, 60)
Btn.Position = UDim2.new(0.02, 0, 0.85, 0)
Btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
Btn.Text = "🔘 FLING: OFF"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 18
Btn.Active = true
Btn.Parent = G

local Active = false
Btn.MouseButton1Click:Connect(function()
    Active = not Active
    Btn.Text = Active and "🟢 FLING: ON" or "🔘 FLING: OFF"
    Btn.BackgroundColor3 = Active and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
end)

print("✅ JIMHUB FLING SIAP! Tekan tombol → arahkan ke orang → sentuh layar!")
