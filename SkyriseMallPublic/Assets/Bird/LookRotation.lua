--!SerializeField
local objectToRotate : GameObject = nil -- The object that will rotate to look at another object.
--!SerializeField
local targetObject : GameObject = nil -- The target object to look at.

self.Update:Connect(function()
    if objectToRotate ~= nil and targetObject ~= nil then
        LookAtTarget()
    end
end)

function LookAtTarget()
    -- Calculate the direction from the object to the target.
    local direction = targetObject.transform.position - objectToRotate.transform.position
    
    -- Set the rotation of the object to rotate towards the target object.
    -- Quaternion.LookRotation creates a rotation that looks along a vector with the up-vector set to Vector3.up.
    objectToRotate.transform.rotation = Quaternion.LookRotation(direction, Vector3.up)
end
