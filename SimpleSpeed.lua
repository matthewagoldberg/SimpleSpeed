_G.Enabled = true -- change to false then execute again to turn off
_G.Speed = 100 -- change speed to the number you want


if getgenv().executed then
    print("WS Already Bypassed")
    return
end

getgenv().executed = true

print("WS Bypassed")

local mt = getrawmetatable(game)
setreadonly(mt, false)

local oldindex = mt.__index
mt.__index = newcclosure(function(self, b)
    if b == 'WalkSpeed' then
        return 16
    end
    return oldindex(self, b)
end)

while _G.Enabled and wait() do
    players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
end
local players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character) --every time he spawns
		print("Respawned")
		while _G.Enabled and wait() do
			players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
		end
	end)
end)
