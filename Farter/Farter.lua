-- Function to play the sound when a spell is successfully cast
local function OnEvent(self, event, unit, spell)
	if event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" then
		-- Play the custom sound
		PlaySoundFile("Interface\\AddOns\\Farter\\sounds\\fart.mp3")
	end
end

-- Create a frame to listen for events
local frame = CreateFrame("Frame")

-- Register the event for spellcast success
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

-- Set the script to run when the event is triggered
frame:SetScript("OnEvent", OnEvent)
