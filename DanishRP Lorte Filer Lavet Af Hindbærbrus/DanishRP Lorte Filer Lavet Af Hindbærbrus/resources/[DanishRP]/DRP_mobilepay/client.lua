Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/mobilepay', 'Betal en anden spiller vha. ID', {
    {name="ID", help="Spillerens ID (FINDES på PAGE DOWN)"},
    {name="Belob", help="Belobet du vil overfore til personens konto"},
  })
end)