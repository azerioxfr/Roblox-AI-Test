-- THIS WAS MADE BY androiddebugbridge on DISCORD
-- DO NOT TAKE CREDIT
-- I DO PAY  FOR THIS
-- WORKING UNIVERSALLY
-- WILL BE OBF SOON

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Request = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Prompt = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Response = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local CopyButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.728902161, 0, 0.328308195, 0)
Frame.Size = UDim2.new(0, 375, 0, 375)

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = Frame

Request.Name = "Request"
Request.Parent = Frame
Request.BackgroundColor3 = Color3.fromRGB(150, 255, 134)
Request.BorderColor3 = Color3.fromRGB(0, 0, 0)
Request.BorderSizePixel = 0
Request.Position = UDim2.new(0.122857146, 0, 0.802857161, 0)
Request.Size = UDim2.new(0, 277, 0, 50)
Request.Font = Enum.Font.SourceSans
Request.Text = "REQUEST"
Request.TextColor3 = Color3.fromRGB(255, 255, 255)
Request.TextScaled = true
Request.TextSize = 14.000
Request.TextStrokeTransparency = 0.000
Request.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 20)
UICorner_2.Parent = Request

Prompt.Name = "Prompt"
Prompt.Parent = Frame
Prompt.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
Prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
Prompt.BorderSizePixel = 0
Prompt.Position = UDim2.new(0.122857146, 0, 0.237142861, 0)
Prompt.Size = UDim2.new(0, 277, 0, 83)
Prompt.Font = Enum.Font.SourceSans
Prompt.PlaceholderText = "PROMPT"
Prompt.Text = ""
Prompt.TextColor3 = Color3.fromRGB(0, 0, 0)
Prompt.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 20)
UICorner_3.Parent = Prompt

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.214285716, 0, 0.0257142857, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "AVERPX'S AI THING"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Response.Name = "Response"
Response.Parent = Frame
Response.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
Response.BorderColor3 = Color3.fromRGB(0, 0, 0)
Response.BorderSizePixel = 0
Response.Position = UDim2.new(0.122857146, 0, 0.519999981, 0)
Response.Size = UDim2.new(0, 277, 0, 79)
Response.Font = Enum.Font.SourceSans
Response.Text = ""
Response.TextColor3 = Color3.fromRGB(255, 255, 255)
Response.TextScaled = true
Response.TextSize = 14.000
Response.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 20)
UICorner_4.Parent = Response

-- Copy Button
CopyButton.Parent = Frame
CopyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CopyButton.BorderSizePixel = 0
CopyButton.Position = UDim2.new(0.122857146, 0, 0.916, 0)
CopyButton.Size = UDim2.new(0, 277, 0, 30)
CopyButton.Font = Enum.Font.SourceSans
CopyButton.Text = "COPY"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextScaled = true

-- Minimize Button
MinimizeButton.Parent = Frame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextScaled = true

-- Draggable Frame Logic
local dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragInput = nil
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragInput then
        update(input)
    end
end)

-- Copying response text to clipboard
CopyButton.MouseButton1Click:Connect(function()
    if Response.Text ~= "" then
        setclipboard(Response.Text)  -- Copies the response to clipboard
    end
end)

-- Minimize Frame
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Frame.Size = isMinimized and UDim2.new(0, 350, 0, 50) or UDim2.new(0, 350, 0, 350)
    Response.Visible = not isMinimized
end)

local HttpService = game:GetService("HttpService")

local function fetchResponse(prompt)
    local body = {
        model = "llama3-8b-8192",
        messages = {
            {role = "user", content = prompt},
            {role = "system", content = "You will always respond with short answers."}
        },
        temperature = 0.2,
        top_p = 0.7,
        max_tokens = 1024,
        stream = false
    }

    local success, response = pcall(function()
        return syn and syn.request or request({
            Url = 'https://api.groq.com/openai/v1/chat/completions',
            Method = "POST",
            Headers = {
                ["Authorization"] = "Bearer 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",
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(body)
        })
    end)

    if success and response.StatusCode == 200 then
        local responseBody = HttpService:JSONDecode(response.Body)
        local messageContent = responseBody.choices[1].message.content
        return messageContent
    else
        return "Request failed! Status: " .. (response and response.StatusCode or "Unknown")
    end
end

Request.MouseButton1Click:Connect(function()
    local prompt = Prompt.Text
    if prompt == "" then
        Response.Text = "Prompt cannot be empty!"
        return
    end

    Response.Text = "Requesting response..."
    local result = fetchResponse(prompt)
    Response.Text = result
end)
