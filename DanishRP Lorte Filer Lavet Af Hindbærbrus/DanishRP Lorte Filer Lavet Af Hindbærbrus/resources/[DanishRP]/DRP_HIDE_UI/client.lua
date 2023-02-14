isHidden = false
isBars = false
local UI = { 
	x =  0.000 ,
	y = 0.000 ,
}

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if isBars then
			drawRct(UI.x + 0.0, 	UI.y + 0.0, 1.0,0.15,0,0,0,255) -- Top Bar
			drawRct(UI.x + 0.0, 	UI.y + 0.85, 1.0,0.15,0,0,0,255) -- Bottom Bar
		end
	end
end)


AddEventHandler("srp_HIDE_UI:HideUI", function()
	myData = {
		showUI = "no",
	}
	TriggerEvent("srp_UI:sendNUIMessage", myData)
	DisplayRadar(false)
	TriggerEvent('ui:toggle', false)
	TriggerEvent('ui:hidevoice')
end)

AddEventHandler("srp_HIDE_UI:ShowUI", function()
	myData = {
		showUI = "yes"
	}
	TriggerEvent("srp_UI:sendNUIMessage", myData)
	DisplayRadar(true)
	TriggerEvent('ui:toggle', true)
	TriggerEvent('ui:showvoice')
end)

RegisterCommand('togglebars', function(source, args)
	if isBars then
		isBars = false
	else
		isBars = true
	end
end, false)