local players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coin = Instance.new("IntValue")
	coin.Parent = leaderstats
	coin.Name = "Coins"
	coin.Value = 0

	local level = Instance.new("IntValue")
	level.Parent = leaderstats
	level.Name = "Level"
	level.Value = 1


end)