--!SerializeField
local Escalator : GameObject = nil

--!SerializeField
local Forward : boolean = true

self.OnTriggerEnter:Connect(function(other : Collider)
    if(other.gameObject.tag == "localPlayer" or other.gameObject.tag == "Player")then
        Escalator.gameObject:GetComponent(Animator):SetBool("Forward", Forward)
    end
end)