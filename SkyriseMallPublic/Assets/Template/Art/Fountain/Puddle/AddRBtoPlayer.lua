--!SerializeField
local prefabToSpawn : GameObject = nil

client.PlayerConnected:Connect(function(player)
    player.AvatarInstantiated:Connect(function(player, avatar)
        -- avatar variables
        local newObject = Object.Instantiate(prefabToSpawn)
        local newObjectTran = newObject.transform
        newObjectTran.parent = avatar.transform
        newObjectTran.localPosition = Vector3.new(0,0,0)
        newObjectTran.localEulerAngles = Vector3.new(0,0,0)
        newObjectTran.localScale = Vector3.new(1,1,1)
        if(player == client.localPlayer)then
            newObject.tag = "localPlayer"
        end
    end)
end)