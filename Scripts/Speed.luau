local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.WalkSpeed = 23
		humanoid.JumpPower = 50
		humanoid.JumpHeight = 7.2
		humanoid.UseJumpPower = true
	end)
end)