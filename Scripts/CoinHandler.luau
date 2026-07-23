local Players = game:GetService("Players")

local coinsFolder = workspace:WaitForChild("Coins")

local RESPAWN_TIME = 5 -- seconds
local function RotateCoin(coin)
	task.spawn(function()
		while coin and coin.Parent do
			coin.CFrame *= CFrame.Angles(0,0,math.rad(2))
			task.wait(0.02)
		end
	end)
end
local function setupCoin(part)
	if not part:IsA("BasePart") then
		return
	end
	RotateCoin(part)
	local collected = false

	part.Touched:Connect(function(hit)

		if collected then
			return
		end

		local character = hit.Parent
		local humanoid = character:FindFirstChild("Humanoid")

		if not humanoid then
			return
		end

		local player = Players:GetPlayerFromCharacter(character)

		if not player then
			return
		end

		collected = true

		player.leaderstats.Coins.Value += 1

		-- Hide the coin
		part.Transparency = 1
		part.CanTouch = false

		task.wait(RESPAWN_TIME)

		-- Show the coin again
		part.Transparency = 0
		part.CanTouch = true

		collected = false
	end)
end

-- Setup all existing coins
for _, coin in ipairs(coinsFolder:GetChildren()) do
	setupCoin(coin)
end

-- Setup new coins added later
coinsFolder.ChildAdded:Connect(setupCoin)
