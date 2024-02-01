ESX = exports["es_extended"]:getSharedObject()

local peddCoords = vector3(269.1121, -992.5806, 28.3172) -- Sostituisci x, y, z con le tue coordinate desiderate

-- Crea una funzione per spawnare il pedone
function pedgang()
    -- Modello del pedone (puoi sostituire "a_m_m_skater_01" con qualsiasi altro modello di pedone)
    local pedModel1 = "a_m_m_eastsa_01"
    
    -- Carica il modello del pedone
    RequestModel(pedModel1)
    while not HasModelLoaded(pedModel1) do
        Citizen.Wait(0)
    end
    
    -- Crea il pedone nelle coordinate specificate
    local peed = CreatePed(4, pedModel1, peddCoords.x, peddCoords.y, peddCoords.z, 0.0, true, true)
    
    -- Imposta il pedone come neutrale (non attaccherà il giocatore)
    SetEntityAsMissionEntity(peed, true, true)
    SetEntityInvincible(peed, true)
    SetEntityCanBeDamaged(peed, false)
    SetPedCanBeTargetted(peed, false)
    FreezeEntityPosition(peed, true)
    SetPedIsDrunk(peed, true)
    SetBlockingOfNonTemporaryEvents(peed, true)
    SetEntityHeading(peed, 166.8952)
    
    -- Aggiungi qualsiasi altra logica o funzionalità necessaria per il pedone
    
    -- Rilascia il modello del pedone
    SetModelAsNoLongerNeeded(pedModel1)
end

-- Esegui la funzione per spawnare il pedone quando la risorsa viene avviata
Citizen.CreateThread(function()
    pedgang()
end)

exports.ox_target:addSphereZone({
    coords = vec3(269.1121, -992.5806, 29.3172),
    radius = 2,
    debug = drawZones,
    options = {
        {
            name = 'sphere',
            event = 'ox:4',
            icon = 'fa-solid fa-circle',
            label = 'Parla con William per vendere cocaina',
        }
    }
})

RegisterNetEvent('ox:4')
AddEventHandler('ox:4', function()
    if checkkItem('coca') then
    TriggerServerEvent('coca:4')
    else
        ESX.ShowNotification('Non hai cocaina da vendere')
    end
end)

function checkkItem(item)
    local hasItem = ESX.SearchInventory(item, 1)
          if hasItem >= 10 then
            return true
          else
            return false
          end
  end


  function checkkbig()
    CreateThread( function()
        while true do
            Wait(2000)
            if checkkItem('coca') then
                
            else 
                
            end
    
        end
    end)
end

Citizen.CreateThread(function()
    -- Creazione del blip alle coordinate specificate
    local blip = AddBlipForCoord(269.1121, -992.5806, 28.3172)
    SetBlipSprite(blip, 141) 
    SetBlipColour(blip, 0) 
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true) 
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Crystal")
    EndTextCommandSetBlipName(blip)
end)