Citizen.CreateThread(function()
  while true do
    TriggerServerEvent("Xic_richpresence:getPlayerInfo")
    Citizen.Wait(60000)
	end
end)

RegisterNetEvent("Xic_richpresence:setRichPresence")
AddEventHandler("Xic_richpresence:setRichPresence", function(firstname, lastname, user_id, userCount)
    SetDiscordAppId(Config.DiscordAppID)
    SetDiscordRichPresenceAsset(Config.DiscordRichPresenceAssetName)
    SetDiscordRichPresenceAssetText(Config.Title)
    SetDiscordRichPresenceAssetSmall(Config.DiscordRichPresenceAssetName)
    SetDiscordRichPresenceAssetSmallText('')
    local users = userCount .. "/" .. Config.MaxClients
    if firstname ~= false and lastname ~= false and user_id ~= false then 
        local string = ""
        if Config.ShowCharacterFullName == true then 
          string = string .. firstname .. " " .. lastname
        end
        if Config.ShowUserID == true then 
          if Config.ShowCharacterFullName == true then 
            string = string .. " - ID: " .. user_id
          else
            string = string .. "ID: " .. user_id 
          end
        end
        if Config.ShowPlayerCounter == true then 
          string = string .. " [" .. users .. "]"
        end
        SetRichPresence(string)
    else 
        SetRichPresence("")
    end
end)