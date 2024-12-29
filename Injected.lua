-- Script to blur the screen and display animated text

local player = game.Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")



-- Create Blur Effect

local blurEffect = Instance.new("BlurEffect")

blurEffect.Size = 0 -- Start with no blur

blurEffect.Parent = game.Lighting



-- Animate Blur Effect

local function animateBlur(targetSize, duration)

    local startTime = tick()

    local startSize = blurEffect.Size

    while tick() - startTime < duration do

        local progress = (tick() - startTime) / duration

        blurEffect.Size = startSize + (targetSize - startSize) * progress

        task.wait()

    end

    blurEffect.Size = targetSize

end



-- Create Screen GUI

local screenGui = Instance.new("ScreenGui")

screenGui.Parent = playerGui



-- Create Text Label

local textLabel = Instance.new("TextLabel")

textLabel.Size = UDim2.new(0.6, 0, 0.2, 0) -- Adjust size

textLabel.Position = UDim2.new(0.2, 0, 0.4, 0) -- Adjust position

textLabel.BackgroundTransparency = 1 -- No background

textLabel.Text = "thanhvn excutor\ninjected" -- Two lines of text

textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text

textLabel.Font = Enum.Font.SourceSansBold -- Font style

textLabel.TextScaled = true -- Auto-scale text

textLabel.TextTransparency = 1 -- Start invisible

textLabel.Parent = screenGui



-- Animate Text Transparency

local function animateTextTransparency(targetTransparency, duration)

    local startTime = tick()

    local startTransparency = textLabel.TextTransparency

    while tick() - startTime < duration do

        local progress = (tick() - startTime) / duration

        textLabel.TextTransparency = startTransparency + (targetTransparency - startTransparency) * progress

        task.wait()

    end

    textLabel.TextTransparency = targetTransparency

end



-- Animation Sequence

animateBlur(24, 1) -- Blur fades in over 1 second

animateTextTransparency(0, 1) -- Text fades in over 1 second

wait(3) -- Keep visible for 3 seconds

animateTextTransparency(1, 1) -- Text fades out over 1 second

animateBlur(0, 1) -- Blur fades out over 1 second



-- Cleanup

blurEffect:Destroy()

screenGui:Destroy()
