AddEvent("OnKeyPress", function(key)
    if key == "G" then 
        CallRemoteEvent("weapon:drop")
    elseif key == "F" then

        local object_list = {}

        local x,y,z = GetPlayerLocation()

        for k,v in pairs(GetStreamedObjects()) do
            local x2,y2,z2 = GetObjectLocation(v)
            local dist = GetDistance3D(x,y,z,x2,y2,z2)
            if dist <= 200 then 
                table.insert(object_list, v)
            end
        end
        

        if #object_list == 1 then 

            CallRemoteEvent("weapon:get", object_list[1])
 
        elseif #object_list > 1 then
            local object_x, object_y, object_z = GetObjectLocation(object_list[1])
            local base_dist = GetDistance3D(x, y, z, object_x, object_y, object_z)

            local top = {1, base_dist}

            for i = 1, #object_list do
                local x2,y2,z2 = GetObjectLocation(object_list[i])
                local dist = GetDistance3D(x, y, z, x2, y2, z2)
                
                if dist < top[2] then
                    top = {i, dist}
                end

            end

            CallRemoteEvent("weapon:get", object_list[top[1]])

        end
    end
end)

AddEvent("OnObjectStreamIn", function(object)

    local propComponent = GetObjectStaticMeshComponent(object)
    propComponent:SetMobility(EComponentMobility.Movable)
    propComponent:SetCollisionEnabled(ECollisionEnabled.QueryAndPhysics)
    propComponent:SetSimulatePhysics(true)
    propComponent:SetEnableGravity(true)
    
end)
