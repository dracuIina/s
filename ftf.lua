--!native
--!optimize 2

local tc = game.Players.LocalPlayer.PlayerGui.ScreenGui.TimingCircle
local base = tc.TimingBase
local pin = tc.TimingPin
local pressed = false

while true do
    task.wait(0.016)
    local baseRot = memory.readf32(base, 392)
    local pinRot = memory.readf32(pin, 392)

    if baseRot > 0 then
        local diff = pinRot - baseRot
        if diff >= 0 and diff <= 20 and not pressed then
            keypress(0x45)
            task.wait(0.05)
            keyrelease(0x45)
            pressed = true
        end
    else
        pressed = false
    end
end
