--!SerializeField
local Cam : GameObject = nil
--!SerializeField
local MainMaskVis : LayerMask = nil
--!SerializeField
local MainMaskClick : LayerMask = nil
--!SerializeField
local MyMask : LayerMask = nil
--!SerializeField
local myLayerName : string = "Default"

local AvatarController = require("AvatarControllerOptions")
AvatarController.tapMask = MainMaskClick

function SetAvatarMask(other, layerName)
    visuals = other.transform.parent:GetChild(0)
    for i = 0, visuals.childCount-1 do
        visuals:GetChild(i).gameObject.layer = LayerMask.NameToLayer(layerName)
    end
end

self.OnTriggerEnter:Connect(function(other : Collider)
    if (other.gameObject.tag == "localPlayer") then
        Cam:GetComponent(Camera).cullingMask = MyMask
        AvatarController.tapMask = MyMask
    end
    SetAvatarMask(other, myLayerName)
end)

self.OnTriggerExit:Connect(function(other : Collider)
    if (other.gameObject.tag == "localPlayer") then
        Cam:GetComponent(Camera).cullingMask = MainMaskVis
        AvatarController.tapMask = MainMaskClick
    end
    SetAvatarMask(other, "Default")
end)