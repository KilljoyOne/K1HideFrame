local frame = CreateFrame("Frame")

local function HideRaidManager()
    if CompactRaidFrameManager then
        CompactRaidFrameManager:UnregisterAllEvents()
        CompactRaidFrameManager:Hide()
        
        -- Prevent Blizzard's layout engines from re-showing the frame
        if not CompactRaidFrameManager._hooked then
            hooksecurefunc(CompactRaidFrameManager, "Show", function(self)
                self:Hide()
            end)
            CompactRaidFrameManager._hooked = true
        end
    end
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:SetScript("OnEvent", function(self, event, ...)
    HideRaidManager()
end)
