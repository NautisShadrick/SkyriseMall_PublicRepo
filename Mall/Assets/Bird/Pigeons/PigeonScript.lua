--!SerializeField
local Poop : GameObject = nil
--!SerializeField
local FlyDirTransform : GameObject = nil
--!SerializeField
local RandomizeRot : boolean = true

local Speed = 6
local currentSpeed = Speed

local spooked = false

local lifeTime = 3
local currentLifeTime = lifeTime

local myTransform = self.transform
local spawnPos = Vector3.new(0,0,0)

bannerbird = false

function SetStartPos(newPos)
    spawnPos = newPos
end 

function RandomRot(randRot)
    if(randRot)then self.transform.localEulerAngles = Vector3.new(0,math.random(-135,-45),0) end
end

RandomRot(RandomizeRot)

--[[
self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    spooked = true
    self.gameObject:GetComponent(AudioSource):Play()
    if(self.transform.localPosition.y > 1) then
        Poop.transform.parent = self.transform.parent
        Poop.transform.localScale = Vector3.new(1,1,1)
        Poop:GetComponent(ParticleSystem):Play()
        Poop:GetComponent(AudioSource):PlayDelayed(0.75)
    end
end)
--]]

self.OnTriggerEnter:Connect(function(other : Collider)
    if(self.transform.localPosition.y > 1) then
        Poop.transform.parent = self.transform.parent
        Poop.transform.localScale = Vector3.new(1,1,1)
        Poop:GetComponent(ParticleSystem):Play()
        Poop:GetComponent(AudioSource):PlayDelayed(0.75)
        bannerbird = true
    end
    spooked = true
    self.gameObject:GetComponent(AudioSource):Play()
end)

self.Update:Connect(function()
    if(spooked) then 
        self.gameObject:GetComponent(Animator):SetTrigger("Spooked")
        myTransform.position = myTransform.position + FlyDirTransform.transform.forward * currentSpeed * Time.deltaTime
        currentLifeTime = currentLifeTime - Time.deltaTime 
    end
    if(currentLifeTime < 0) then 
        Object.Destroy(self.transform.gameObject)
        if(bannerbird)then
            self.transform.parent:GetComponent("PigeonSpawner").UpdateBirdCount(-1)
        else
            self.transform.parent:GetComponent("PigeonSpawner").UpdateBannerBirdCount(-1)
        end
    end
end)