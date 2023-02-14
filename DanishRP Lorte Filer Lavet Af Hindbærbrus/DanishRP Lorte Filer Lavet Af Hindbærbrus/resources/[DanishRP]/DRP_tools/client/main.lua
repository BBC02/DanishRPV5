AddEventHandler('Savanha:getSharedObject', function(cb)
	cb(Savanha)
end)

function getSharedObject()
	return Savanha
end

Savanha = {}
Savanha.Game = {}
Savanha.Streaming = {}
Savanha.Text = {}
Savanha.MiniGame = {}
Savanha.Math = {}
Savanha.Dev = {}
Savanha.Player = {}
Savanha.Markers = {}
Savanha.Markers.Table = {}
