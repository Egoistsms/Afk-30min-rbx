setfpscap(7)
local afkTime = 30 * 60

game.Players.CharacterAdded:Connect(function(character)
  local player = character.Parent
  local lastMove = tick()

  character.LastMovementTime.Changed:Connect(function()
    lastMove = tick()
  end)

  player:Chat("Execute!")

  while wait(1) do
    if tick() - lastMove >= afkTime then
      player:Kick("Execute Breakable!")
      break
    end
  end
end)
