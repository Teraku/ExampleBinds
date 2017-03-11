Hooks:Add("LocalizationManagerPostInit", "ExampleBindsLoadLocalization", function(loc)

    loc:add_localized_strings({
        ["examplebinds_menu_title"] = "Examplebinds Options",
        ["examplebinds_menu_desc"] = "Open the examplebinds options menu.",
    })

end)