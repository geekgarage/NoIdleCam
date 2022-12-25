RegisterCommand('idlecamoff', function() -- help2 31, 167, 9
  TriggerEvent('chat:addMessage', {
    color = {227,8,0},
    multiline = true,
    args = {'[COMMANDS]', 'Idle Cam Is Now Off'}
  })
  SetResourceKvp("NoIdle_Cam", "off")
end)

RegisterCommand('idlecamon', function() -- help2 31, 167, 9
  TriggerEvent('chat:addMessage', {
    color = {31,167,9},
    multiline = true,
    args = {'[COMMANDS]', 'Idle Cam Is Now On'}
  })
  SetResourceKvp("NoIdle_Cam", "on")
end)

RegisterCommand('idlemoveoff', function() -- help2 31, 167, 9
  TriggerEvent('chat:addMessage', {
    color = {227,8,0},
    multiline = true,
    args = {'[COMMANDS]', 'Idle PED Movement Is Now Off'}
  })
  SetResourceKvp("NoIdle_Move", "off")
end)

RegisterCommand('idlemoveon', function() -- help2 31, 167, 9
  TriggerEvent('chat:addMessage', {
    color = {31,167,9},
    multiline = true,
    args = {'[COMMANDS]', 'Idle PED Movement Is Now On'}
  })
  SetResourceKvp("NoIdle_Move", "on")
end)

TriggerEvent("chat:addSuggestion", "/idlecamoff", "Disables the idle cam")
TriggerEvent("chat:addSuggestion", "/idlecamon", "Enables the idle cam")
TriggerEvent("chat:addSuggestion", "/idlemoveoff", "Disables the idle PED movement")
TriggerEvent("chat:addSuggestion", "/idlemoveon", "Enables the idle PED Movement")

local idleCamState = GetResourceKvpString("NoIdle_Cam") == "off"
local idleMoveState = GetResourceKvpString("NoIdle_Move") == "off"

Citizen.CreateThread(function()
  while true do
    local playerPed = GetPlayerPed(-1)
    local idleCamState = GetResourceKvpString("NoIdle_Cam")
    local idleMoveState = GetResourceKvpString("NoIdle_Move")
    if idleCamState == "off" then
      InvalidateIdleCam()
      InvalidateVehicleIdleCam()
      Citizen.Wait(10000) --The idle camera activates after 30 second so we don't need to call this per frame
    else
      Citizen.Wait(1000)
    end
    if idleMoveState == "off" then
      SetPedCanPlayAmbientAnims(playerPed, false)
      SetPedCanPlayAmbientBaseAnims(playerPed, false)
    else
      SetPedCanPlayAmbientAnims(playerPed, true)
      SetPedCanPlayAmbientBaseAnims(playerPed, true)
    end
  end
end)
