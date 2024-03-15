--!SerializeField
local Top : Transform = nil
--!SerializeField
local Bottom : Transform = nil

local moveRequest = Event.new("MoveRequest")
local moveEvent = Event.new("MoveEvent")


function Client()
    self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
        if(client.localPlayer.avatar.transform.position.y < self.transform.position.y)then
            moveRequest:FireServer(Top.position)    
        else
            moveRequest:FireServer(Bottom.position)   
        end
    end)

    moveEvent:Connect(function(player, point)
		if player.avatar then
			player.avatar:MoveTo(point)
		end
	end)
end

function Server()
    moveRequest:Connect(function(player, point)
        if (player.avatar) then
	        --player.avatar.transform.position = point
			moveEvent:FireAllClients(player, point)
	    end
    end)
end

if server then
    Server()
else
    Client()
end