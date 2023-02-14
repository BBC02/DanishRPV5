Savanha.Markers.Add = function(mType, mPos, red, green, blue, alpha, rangeToShow, bobUpAndDown, mScale, mRot, mDir, faceCamera, textureDict, textureName, draw)
	rangeToShow = rangeToShow ~= nil and rangeToShow or 50.0
	mScale = mScale ~= nil and mScale or vec(1, 1, 1)
	mDir = mDir ~= nil and mDir or vec(0, 0, 0)
	mRot = mRot ~= nil and mRot or vec(0, 0, 0)
	bobUpAndDown = bobUpAndDown or false
	faceCamera = faceCamera or false
	textureDict = textureDict or nil
	textureName = textureName or nil
	
	if textureDict ~= nil then
		Savanha.Streaming.RequestStreamedTextureDict(textureDict)
	end
	
	local markerData = {
		draw = draw,
		range = rangeToShow,
		type = mType,
		pos = mPos,
		dir = mDir,
		rot = mRot,
		scale = mScale,
		r = red,
		g = green,
		b = blue,
		a = alpha,
		bob = bobUpAndDown,
		faceCam = faceCamera,
		dict = textureDict,
		name = textureName,
		isInside = false,
		deleteNow = false
	}
	local tableKey = tostring(markerData)
    Savanha.Markers.Table[tableKey] = markerData

    return tableKey
end

Savanha.Markers.Remove = function(markerKey)
	Savanha.Markers.Table[markerKey].deleteNow = true
	local textureDict = Savanha.Markers.Table[markerKey].dict
	if textureDict ~= nil then
		SetStreamedTextureDictAsNoLongerNeeded(textureDict)
	end
end

Savanha.Markers.In = function(markerKey)
	return Savanha.Markers.Table[markerKey].isInside
end

local markerWait = 500
CreateThread(function()
	while true do
		Wait(markerWait)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		markerWait = 500
		
		for markerKey, marker in pairs(Savanha.Markers.Table) do
			if marker.deleteNow then
				marker = nilmark
			else
				if #(pedCoords - marker.pos) < marker.range then
					markerWait = 1
					if marker.draw or marker.draw == nil then
						DrawMarker(marker.type, marker.pos, marker.dir, marker.rot, marker.scale, marker.r, marker.g, marker.b, marker.a, marker.bob, marker.faceCam, 0, false, marker.dict, marker.name, false)
					end
				end
				if #(pedCoords - marker.pos) < (marker.scale.x / 2) then
					marker.isInside = true
				else
					marker.isInside = false
				end
			end
		end
	end
end)

