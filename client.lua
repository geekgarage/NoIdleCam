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


TriggerEvent("chat:addSuggestion", "/idlecamon", "Re-enables the idle cam")
TriggerEvent("chat:addSuggestion", "/idlecamoff", "Disables the idle cam")

local IdleCamState = GetResourceKvpString("idleCam") == "off"
print(IdleCamState)
print("We Rollin'")
Citizen.CreateThread(function()
	while true do
    IdleCamState = GetResourceKvpString("idleCam")
    print(IdleCamState)
    if IdleCamState == "off" then
      print("I'm In!")
		  InvalidateIdleCam()
		  InvalidateVehicleIdleCam()
    end
    Citizen.Wait(10000) --The idle camera activates after 30 second so we don't need to call this per frame
	end
end)