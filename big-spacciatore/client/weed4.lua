ESX = exports["es_extended"]:getSharedObject()

local pedCoords = vector3(393.1835, -76.4213, 67.1805) -- Sostituisci x, y, z con le tue coordinate desiderate
-- Crea una funzione per spawnare il pedone
function spapwnpedpls()
    -- Modello del pedone (puoi sostituire "a_m_m_skater_01" con qualsiasi altro modello di pedone)
    local pedModel = "a_m_o_soucent_01"
    
    -- Carica il modello del pedone
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Citizen.Wait(0)
    end
    
    -- Crea il pedone nelle coordinate specificate
    local ped = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, 0.0, true, true)
    
    -- Imposta il pedone come neutrale (non attaccherà il giocatore)
    SetEntityAsMissionEntity(ped, true, true)
    SetEntityInvincible(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetPedCanBeTargetted(ped, false)
    FreezeEntityPosition(ped, true)
    SetPedIsDrunk(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityHeading(ped, 164.2766)
    
    -- Aggiungi qualsiasi altra logica o funzionalità necessaria per il pedone
    
    -- Rilascia il modello del pedone
    SetModelAsNoLongerNeeded(pedModel)
end

-- Esegui la funzione per spawnare il pedone quando la risorsa viene avviata
Citizen.CreateThread(function()
    spapwnpedpls()
end)

exports.ox_target:addSphereZone({
    coords = vec3(393.1835, -76.4213, 68.1805),
    radius = 2,
    debug = drawZones,
    options = {
        {
            name = 'sphere',
            event = 'ox:w4',
            icon = 'fa-solid fa-circle',
            label = 'Parla con Benjamin per vendere marijuana',
        }
    }
})

RegisterNetEvent('ox:w4')
AddEventHandler('ox:w4', function()
    if checkItem('marijuana') then
    TriggerServerEvent('weed:4')
    else
        ESX.ShowNotification('Non hai marijuana da vendere')
    end
end)

function checkItem(item)
    local hasItem = ESX.SearchInventory(item, 1)
          if hasItem >= 10 then
            return true
          else
            return false
          end
  end


  function checkbig()
    CreateThread( function()
        while true do
            Wait(2000)
            if checkItem('hacking_laptop') then
                
            else 
                
            end
    
        end
    end)
end

Citizen.CreateThread(function()
    -- Creazione del blip alle coordinate specificate
    local blip = AddBlipForCoord(393.1835, -76.4213, 67.1805)
    SetBlipSprite(blip, 141) 
    SetBlipColour(blip, 0) 
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true) 
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Crystal")
    EndTextCommandSetBlipName(blip)
end)