local GlobalPeds = {
    Ped = {
        {hash = "a_m_o_acult_02", coords = vector4(-1490.37, 4981.58, 62.36, 83.67)}, --Chasse Interact
        {hash = "s_m_y_chef_01", coords = vector4(736.07, -1364.96, 25.55, 86.41)}, --Chasse Vente
        {hash = "mp_m_securoguard_01", coords = vector4(128.49, -1299.67, 28.23, 307.61)}, -- Entree Unicorn
        {hash = "s_m_y_cop_01", coords = vector4(144.31, -1321.04, 28.23, 140.09)}, -- Garage Unicorn
        {hash = "s_m_m_security_01", coords = vector4(-1045.87, -2675.84, 12.83, 315.00)}, -- Car Location
    }
}

Citizen.CreateThread(function()
    for _,v in pairs(GlobalPeds.Ped) do
        local hash = GetHashKey(v.hash)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("Skyzeur", v.hash, v.coords, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, false)
    end
end)
