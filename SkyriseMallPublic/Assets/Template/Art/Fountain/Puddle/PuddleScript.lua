--!SerializeField
local particle : ParticleSystem = nil

self.OnTriggerEnter:Connect(function(other : Collider)
    particle:GetComponent(ParticleSystem):Play()
    self.gameObject:GetComponent(AudioSource):Play()
end)