local fak = {
    vector3(-561.62, 5377.44, 70.21),
    vector3(-550.12, 5360.65, 70.32),
    vector3(-530.77, 5370.89, 70.23)
}

local vaghato = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for i=1, #fak do
            local fa = fak[i]
            local distance = #(pos - fa)

            if distance < 2.0 then
                DrawText3D(fa.x, fa.y, fa.z + 1.0, "[E] A Fa kivágása")
                if IsControlJustPressed(0, 38) then -- E gomb
                    vaghato = true
                    Vagat(ped, fa)
                end
            end
        end
    end
end)

function Vagat(ped, fa)
    TaskStartScenarioInPlace(ped, "world_human_hammering", 0, true)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    TriggerServerEvent("fa_vágas:kifizetés")
    vaghato = false
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
