local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "Xic_richpresence")

RegisterServerEvent('Xic_richpresence:getPlayerInfo')
AddEventHandler('Xic_richpresence:getPlayerInfo', function()
    local _source = source
    local user_id = vRP.getUserId({source})

    local users = vRP.getUsers()
    local userCounter = 0
    for k, v in pairs(users) do
      userCounter = userCounter + 1
    end

    vRP.getUserIdentity({user_id, function(identity)
        if identity then
            TriggerClientEvent("Xic_richpresence:setRichPresence", _source, identity.firstname, identity.name, user_id, userCounter)
        else
            TriggerClientEvent("Xic_richpresence:setRichPresence", _source, false, false, false, userCounter)
        end
    end})
end)