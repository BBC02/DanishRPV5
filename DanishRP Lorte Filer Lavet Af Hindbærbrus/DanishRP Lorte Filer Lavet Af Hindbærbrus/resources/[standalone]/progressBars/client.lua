function startUI(time, text) 
	SendNUIMessage({
		type = "ui",
		display = true,
		time = time,
		text = text
	})
end

function stopUI() 
	SendNUIMessage({
		type = "CloseUI"
	})
end