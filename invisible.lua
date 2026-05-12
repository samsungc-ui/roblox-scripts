local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")

local isInvisible = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InvisibleGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 130, 0, 50)
button.Position = UDim2.new(0, 20, 0.5, 0)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "👻 Invisible: OFF"
button.TextSize = 14
button.Font = Enum.Font.GothamBold
button.BorderSizePixel = 0
button.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = button

local function SetInvisible(char, state)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("MeshPart") then
            part.Transparency = state and 1 or 0
        end
    end
end

button.MouseButton1Click:Connect(function()
    isInvisible = not isInvisible
    SetInvisible(character, isInvisible)
    if isInvisible then
        button.Text = "👻 Invisible: ON"
        button.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
    else
        button.Text = "👻 Invisible: OFF"
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    task.wait(0.5)
    isInvisible = false
    button.Text = "👻 Invisible: OFF"
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)
