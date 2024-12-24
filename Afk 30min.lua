setfpscap(5)

local afkTime = 30 * 60
local lastMove = tick()

game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
    lastMove = tick()
end)

game.Players.CharacterAdded:Connect(function(character)
    local player = game.Players.LocalPlayer
    character:WaitForChild("Humanoid").Running:Connect(function()
        lastMove = tick()
    end)

    while true do
        wait(1)
        if tick() - lastMove >= afkTime then
            player:Kick("This account has been online for 30 minutes")
            break
        end
    end
end)
