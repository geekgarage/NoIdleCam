RegisterCommand('idlecamoff', function() -- help2 31, 167, 9
  TriggerEvent('chat:addMessage', {
    color = {227,8,0},
    multiline = true,
    args = {'[COMMANDS]', 'Idle Cam Is Now Off'}
  })
  DisableIdleCamera(true)
  SetResourceKvp("idleCam", "off")
end)

RegisterCommand('idlecamon', function() -- help2 31, 167, 9
  TriggerEvent('chat:addMessage', {
    color = {31,167,9},
    multiline = true,
    args = {'[COMMANDS]', 'Idle Cam Is Now On'}
  })
  DisableIdleCamera(false)
  SetResourceKvp("idleCam", "on")
end)

Citizen.CreateThread(function()
  TriggerEvent("chat:addSuggestion", "/idlecamon", "Re-enables the idle cam")
  TriggerEvent("chat:addSuggestion", "/idlecamoff", "Disables the idle cam")
	while true do
    local idleCamDisabled = GetResourceKvpString("idleCam") == "off"
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()
		Wait(20000) --The idle camera activates after 30 second so we don't need to call this per frame
	end
end)