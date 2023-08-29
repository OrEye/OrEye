-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame_3 = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Frame.BackgroundTransparency = 0.450
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0607553348, 0, 0.296296299, 0)
Frame.Size = UDim2.new(0, 535, 0, 465)
Frame.Visible = false

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 535, 0, 14)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0112149529, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 14)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Tython Console"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
Frame_3.BackgroundTransparency = 0.450
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.0112149529, 0, 0.0430107526, 0)
Frame_3.Size = UDim2.new(0, 523, 0, 437)

ScrollingFrame.Parent = Frame_3
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(0, 523, 0, 437) -- Puedes ajustar esta altura para cambiar el tamaño inicial
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 2000) -- Ajusta el tamaño del lienzo

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Función para determinar el número de líneas en el texto
local function GetNumLines(text)
	local numLines = 1
	for _ in text:gmatch("\n") do
		numLines = numLines + 1
	end
	return numLines
end

-- Agrega una sección de información, advertencia o error
local function AddSection(parent, text, textColor)
	local textLabel = TextLabel:Clone()
	textLabel.Parent = parent
	textLabel.Text = text
	textLabel.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
	textLabel.TextSize = 14
	textLabel.TextWrapped = true
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	local numLines = GetNumLines(text)
	textLabel.Size = UDim2.new(1, 0, 0, textLabel.TextBounds.Y * numLines)
	return textLabel
end

-- Agrega secciones de información, advertencia y error


local isOpen = false -- Variable para rastrear si la consola está abierta o cerrada

-- Función para abrir o cerrar la consola
local function ToggleConsole()
	isOpen = not isOpen
	if isOpen then
		Frame.Visible = true
	else
		Frame.Visible = false
	end
end

-- Crear un atajo de teclado para abrir/cerrar la consola (por ejemplo, presionar la tecla `~`)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.F4 then -- Cambia "Tilde" a la tecla de tu elección
			ToggleConsole()
		end
	end
end)



function coInfo(x)
	local infoLabel = AddSection(ScrollingFrame, "INFO: "..x, Color3.fromRGB(0, 208, 255))
end

function coWarn(x)
	local warnLabel = AddSection(ScrollingFrame, "WARN: "..x, Color3.fromRGB(255, 173, 0))
end

function coError(x)
	local errorLabel = AddSection(ScrollingFrame, "ERROR: "..x, Color3.fromRGB(255, 0, 0))
end

function coPrint(x)
	local printLabel = AddSection(ScrollingFrame, x, Color3.fromRGB(255, 255, 255))
end


