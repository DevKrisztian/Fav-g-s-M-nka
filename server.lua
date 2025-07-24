RegisterServerEvent("fa_vagas:kifizetes")
AddEventHandler("fa_vagas:kifizetes", function()
    local _source = source
    local osszeg = math.random(200, 300)
    print("Játékos kapott " .. osszeg .. " $ összeget fa kivágásért.")

    -- Átutalás játékosnak - állítsd be a megfelelő exportot ha ESX vagy QBCore
    -- Például: xPlayer.addMoney(osszeg)
    
    -- Standalone üzenet
    TriggerClientEvent("chat:addMessage", _source, {
        args = {"Munka", "Sikeresen kivágtál egy fát és kaptál $" .. osszeg}
    })
end)
-- server.lua
-- Ez a fájl kezeli a szerver oldali eseményeket és a játékosok jutalmazását a fa kivágásért.
-- A játékosok a fa kivágása után pénzt kapnak, amit a szer