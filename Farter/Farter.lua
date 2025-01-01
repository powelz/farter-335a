-- Declare variables globally so they're available in the event handler
local playRandom = false  -- Default: no randomization
local randomChance = 0.5  -- Default: 50% chance (will be updated by slider)

-- Function to play the sound when a spell is successfully cast
local function OnEvent(self, event, unit, spell)
    if event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" then
        -- Play the sound based on the checkbox setting
        if playRandom then
            -- Generate a random number between 0 and 1, and compare with the random chance
            local randomValue = math.random() -- Generates a random number between 0 and 1
            if randomValue < randomChance then
                PlaySoundFile("Interface\\AddOns\\Farter\\sounds\\fart.mp3")
            end
        else
            PlaySoundFile("Interface\\AddOns\\Farter\\sounds\\fart.mp3")
        end
    end
end

-- Create a frame to listen for events
local frame = CreateFrame("Frame")

-- Register the event for spellcast success
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

-- Set the script to run when the event is triggered
frame:SetScript("OnEvent", OnEvent)

-- AddOn Configuration Panel (Interface Options)
local function CreateOptionsPanel()
    -- Create the main panel for the AddOn settings
    local panel = CreateFrame("Frame", "FarterOptionsPanel", UIParent)
    panel.name = "Farter"
    InterfaceOptions_AddCategory(panel)  -- Add the panel to the Interface Options

    -- Title Text
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Farter Sound Settings")

    -- Create the checkbox for randomization
    local randomizeCheckbox = CreateFrame("CheckButton", "FarterRandomizeCheckbox", panel, "InterfaceOptionsCheckButtonTemplate")
    randomizeCheckbox:SetSize(26, 26)
    randomizeCheckbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -20)
    randomizeCheckbox:SetChecked(playRandom)
    
    -- Access the checkbox's label text by using its name
    local checkboxText = _G["FarterRandomizeCheckboxText"]  -- Use the name explicitly
    if checkboxText then
        checkboxText:SetText("Enable Randomization")
    end
    
    randomizeCheckbox:SetScript("OnClick", function()
        playRandom = randomizeCheckbox:GetChecked()
    end)

    -- Create the slider for minimum random chance
    local randomChanceSlider = CreateFrame("Slider", nil, panel, "OptionsSliderTemplate")
    randomChanceSlider:SetSize(160, 20)
    randomChanceSlider:SetPoint("TOPLEFT", randomizeCheckbox, "BOTTOMLEFT", 0, -20)
    randomChanceSlider:SetMinMaxValues(0, 100)
    randomChanceSlider:SetValue(randomChance * 100)  -- Initialize with current randomChance * 100
    randomChanceSlider:SetValueStep(1)

    -- Create a label for the slider that will update based on the slider's value
    local sliderLabel = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sliderLabel:SetPoint("LEFT", randomChanceSlider, "RIGHT", 10, 0)
    sliderLabel:SetText(string.format("Min Chance: %d%%", randomChance * 100))

    -- Handle slider value change
    randomChanceSlider:SetScript("OnValueChanged", function(self, value)
        -- We make sure the value respects the step size by rounding the value
        local roundedValue = math.floor(value + 0.5)  -- Round to the nearest integer
        randomChance = roundedValue / 100  -- Update randomChance based on the slider value
        sliderLabel:SetText(string.format("Min Chance: %d%%", roundedValue))  -- Update label text
        randomChanceSlider:SetValue(roundedValue)  -- Set the slider to the rounded value
    end)

    -- Update panel when initialized
    randomChanceSlider:SetScript("OnShow", function()
        randomChanceSlider:SetValue(randomChance * 100)
    end)
end

-- Call the function to create the options panel
CreateOptionsPanel()

-- Show the GUI
-- We no longer need to create a standalone GUI for the sound randomizer since it's now in the Interface Options
