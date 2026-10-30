local frame = CreateFrame("Frame")

local function HideRaidManager()
    if CompactRaidFrameManager then
        CompactRaidFrameManager:UnregisterAllEvents()
        CompactRaidFrameManager:SetAlpha(0)
        
        -- Prevent Blizzard's layout engines from restoring full opacity
        if not CompactRaidFrameManager._hooked then
            hooksecurefunc(CompactRaidFrameManager, "Show", function(self)
                self:SetAlpha(0)
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