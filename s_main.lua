local Weapon = ImportPackage("Onset_Weapon_Patch")

AddCommand("drop", function(player)
    DROP(player)
end)

function CREATE(x, y, z, Weapon_id, Weapon_ammo)

    if Weapon_id == nil or Weapon_id <= 1 then return false end

    local Weapon_Object = CreateObject(Weapon_id + 2 , x +50, y, z - 90)
    SetObjectRotation(Weapon_Object, 90, 180, 0)

    SetObjectPropertyValue(Weapon_Object, "takeable", true)
    SetObjectPropertyValue(Weapon_Object, "weapon_id", Weapon_id)
    SetObjectPropertyValue(Weapon_Object, "weapon_ammo", Weapon_ammo)

    return true
end

AddFunctionExport("create", CREATE)


function DROP(player)
    local Slot = GetPlayerEquippedWeaponSlot(player)
    local Weapon_Player = Weapon.GetWeaponPlayer(player)

    if Weapon_Player[Slot].model == 1 then return false end

    Weapon.SetWeapon(player, 1, 0, true, Slot , true)

    local x,y,z = GetPlayerLocation(player)

    CREATE(x, y, z, Weapon_Player[Slot].model, Weapon_Player[Slot].ammo)
    
    return true
end
AddRemoteEvent("weapon:drop", DROP)

function GET(player, weapon_object)
    local takeable = GetObjectPropertyValue(weapon_object, "takeable")

    if takeable == false then return false end

    local weapon_id = GetObjectPropertyValue(weapon_object, "weapon_id")
    local weapon_ammo = GetObjectPropertyValue(weapon_object, "weapon_ammo")
    local Slot = GetPlayerEquippedWeaponSlot(player)

    local Weapon_Player = Weapon.GetWeaponPlayer(player)
    
    local x,y,z = GetPlayerLocation(player)
    CREATE(x,y,z, Weapon_Player[Slot].model, Weapon_Player[Slot].ammo)

    Weapon.SetWeapon(player, weapon_id, weapon_ammo, true, Slot , true)
    
    DestroyObject(weapon_object)
    
    return true

end
AddRemoteEvent("weapon:get", GET)

AddEvent("OnPlayerDeath", function(player, instigator)
    local Weapon_id_equiped, Weapon_ammo_equiped = GetPlayerWeapon(player)
    local x,y,z = GetPlayerLocation(player)

    CREATE(x,y,z, Weapon_id_equiped, Weapon_ammo_equiped)
end)
