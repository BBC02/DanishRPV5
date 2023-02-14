local show = false
local textFormatting = {
    -- Colors
    ['~r~'] = '<span style="color: rgb(224, 50, 50)">',
    ['~g~'] = '<span style="color: rgb(114, 204, 114)">',
    ['~b~'] = '<span style="color: rgb(93, 182, 229)">',
    ['~f~'] = '<span style="color: rgb(93, 182, 229)">',
    ['~y~'] = '<span style="color: rgb(240, 200, 80)">',
    ['~c~'] = '<span style="color: rgb(140, 140, 140)">',
    ['~t~'] = '<span style="color: rgb(140, 140, 140)">',
    ['~o~'] = '<span style="color: rgb(255, 133, 85)">',
    ['~p~'] = '<span style="color: rgb(132, 102, 226)">',
    ['~m~'] = '<span style="color: rgb(100, 100, 100)">',
    ['~l~'] = '<span style="color: rgb(0, 0, 0)">',
    ['~d~'] = '<span style="color: rgb(47, 92, 115)">',
    ['~w~'] = '<span style="color: rgb(240, 240, 240)">',

    -- Formatting
    ['~s~'] = '</span>',
    ['~n~'] = '<br>',

    -- Keys
    ['~INPUT_CONTEXT~'] = '[<b>E</b>]',
    ['~INPUT_PICKUP~'] = '[<b>E</b>]',
}

showUI = function(text)
    if not show then
        for k,v in pairs(textFormatting) do
            text = text:gsub(k, v)
        end
        SendNUIMessage({
            action = 'show',
            text = text,
        })
        show = true
    end
end

hideUI = function()
    if show then
        SendNUIMessage({
            action = 'hide'
        })
        show = false
    end
end

exports('showUI', showUI)
exports('hideUI', hideUI)