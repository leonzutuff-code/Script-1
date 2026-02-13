-- CONFIG
local DISCORD_URL = "https://discord.gg/YJEW6mbGdn"
local KEY_URL = "https://raw.githubusercontent.com/leonzutuff-code/daily-key-xyz/main/key.txt"

-- SERVICES
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local plr = Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")

-- FETCH KEY
local function getOnlineKey()
    local success, result = pcall(function()
        return game:HttpGet(KEY_URL)
    end)

    if success and result then
        return string.gsub(result, "%s+", "")
    end

    return nil
end

-- GUI
local sg = Instance.new("ScreenGui")
sg.Name = "HL5KeySystem"
sg.ResetOnSpawn = false
sg.Parent = pg

-- MAIN FRAME
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0,360,0,210)
main.Position = UDim2.new(0.5,-180,0.5,-105)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "HL5 Scripts"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- CLOSE BUTTON (X)
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0,28,0,28)
closeBtn.Position = UDim2.new(1,-32,0,8)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
closeBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", closeBtn)
closeBtn.MouseButton1Click:Connect(function()
    sg:Destroy()
end)

-- WELCOME
local welcome = Instance.new("TextLabel", main)
welcome.Position = UDim2.new(0,0,0,40)
welcome.Size = UDim2.new(1,0,0,25)
welcome.Text = "Enter your key below"
welcome.Font = Enum.Font.Gotham
welcome.TextSize = 14
welcome.TextColor3 = Color3.fromRGB(180,180,180)
welcome.BackgroundTransparency = 1

-- KEY BOX
local keyBox = Instance.new("TextBox", main)
keyBox.Position = UDim2.new(0.1,0,0,75)
keyBox.Size = UDim2.new(0.8,0,0,32)
keyBox.PlaceholderText = "Enter Key"
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.ClearTextOnFocus = false
Instance.new("UICorner", keyBox)

-- SUBMIT
local submit = Instance.new("TextButton", main)
submit.Position = UDim2.new(0.1,0,0,115)
submit.Size = UDim2.new(0.8,0,0,32)
submit.Text = "Submit"
submit.Font = Enum.Font.GothamBold
submit.TextSize = 14
submit.BackgroundColor3 = Color3.fromRGB(70,70,70)
submit.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", submit)

-- DISCORD (MITTIG)
local discord = Instance.new("TextButton", main)
discord.Position = UDim2.new(0.325,0,0,160)
discord.Size = UDim2.new(0.35,0,0,28)
discord.Text = "Join Discord Server"
discord.Font = Enum.Font.Gotham
discord.TextSize = 12
discord.BackgroundColor3 = Color3.fromRGB(40,40,40)
discord.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", discord)

-- DISCORD FUNKTION
discord.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(DISCORD_URL)
    end)

    StarterGui:SetCore("SendNotification", {
        Title = "HL5 Scripts",
        Text = "Discord link copied!",
        Duration = 3
    })
end)

-- SUBMIT CHECK
submit.MouseButton1Click:Connect(function()
    local onlineKey = getOnlineKey()

    if not onlineKey then
        StarterGui:SetCore("SendNotification", {
            Title = "HL5 Scripts",
            Text = "Key server offline!",
            Duration = 3
        })
        return
    end

    if keyBox.Text == onlineKey then
        StarterGui:SetCore("SendNotification", {
            Title = "HL5 Scripts",
            Text = "Key Correct!",
            Duration = 3
        })

        sg:Destroy()  -- GUI schließen

        -- 🔥 Infinite Yield Script laden 🔥
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

    else
        StarterGui:SetCore("SendNotification", {
            Title = "HL5 Scripts",
            Text = "Wrong Key!",
            Duration = 3
        })
    end
end)