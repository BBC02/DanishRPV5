IPLDesign = function(name, data)
    Citizen.CreateThread(function()
        if name == 'FinanceOffice1' then
            FinanceOffice1 = exports['bob74_ipl']:GetFinanceOffice1Object()

            FinanceOffice1.Style.Set(FinanceOffice1['Style']['Theme'][data['interior']['them']])
            FinanceOffice1.Chairs.Set(FinanceOffice1['Chairs'][data['interior']['chairs']['status']])
            FinanceOffice1.Swag.Enable(FinanceOffice1.Painting, true)
        end

        if name == 'FinanceOffice2' then
            FinanceOffice2 = exports['bob74_ipl']:GetFinanceOffice2Object()

            FinanceOffice2.Style.Set(FinanceOffice2['Style']['Theme'][data['interior']['them']])
            FinanceOffice2.Chairs.Set(FinanceOffice2['Chairs'][data['interior']['chairs']['status']])
            FinanceOffice2.Swag.Enable(FinanceOffice2.Painting, true)
        end

        if name == 'FinanceOffice3' then
            FinanceOffice3 = exports['bob74_ipl']:GetFinanceOffice3Object()

            FinanceOffice3.Style.Set(FinanceOffice3['Style']['Theme'][data['interior']['them']])
            FinanceOffice3.Chairs.Set(FinanceOffice3['Chairs'][data['interior']['chairs']['status']])
            FinanceOffice3.Swag.Enable(FinanceOffice3.Painting, true)
        end

        if name == 'FinanceOffice4' then
            FinanceOffice4 = exports['bob74_ipl']:GetFinanceOffice4Object()

            FinanceOffice4.Style.Set(FinanceOffice4['Style']['Theme'][data['interior']['them']])
            FinanceOffice4.Chairs.Set(FinanceOffice4['Chairs'][data['interior']['chairs']['status']])
            FinanceOffice4.Swag.Enable(FinanceOffice4.Painting, true)
        end
    end)
end

IPLSetOfficeSign = function(name, data)
    Citizen.CreateThread(function()
        FinanceOrganization = exports['bob74_ipl']:GetFinanceOrganizationObject()
        FinanceOrganization.Name.Set(data['sign']['text'], FinanceOrganization.Name.Style.normal, FinanceOrganization['Name']['Colors'][data['sign']['color']], FinanceOrganization['Name']['Fonts'][data['sign']['font']])
        FinanceOrganization.Office.Enable(true)
    end)
end

IPLRemoveOfficeSign = function()
    Citizen.CreateThread(function()
        FinanceOrganization = exports['bob74_ipl']:GetFinanceOrganizationObject()
        FinanceOrganization.Office.Enable(false)
    end)
end
