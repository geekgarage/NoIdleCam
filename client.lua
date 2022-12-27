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

TriggerEvent("chat:addSuggestion", "/idlecamoff", "Disables the idle cam")
TriggerEvent("chat:addSuggestion", "/idlecamon", "Enables the idle cam")

local idleCamState = GetResourceKvpString("NoIdle_Cam") == "off"

Citizen.CreateThread(function()
  while true do
    local playerPed = GetPlayerPed(-1)
    local idleCamState = GetResourceKvpString("NoIdle_Cam")
    if idleCamState == "off" then
      InvalidateIdleCam()
      InvalidateVehicleIdleCam()
      Citizen.Wait(10000) --The idle camera activates after 30 second so we don't need to call this per frame
    else
      Citizen.Wait(1000)
    end
  end
end)
