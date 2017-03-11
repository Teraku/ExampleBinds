local tests = {"test1", "test2"}
local modPath = ModPath

Hooks:Add("MenuManagerInitialize", "ExampleBinds_InitCallbacks", function(menu_manager)
	
	log("[ExampleBinds]Adding menu callbacks")
	
	MenuCallbackHandler.test_callback = function()
		
		log("A key was pressed!")
		
	end
	
	MenuCallbackHandler.example_test1 = function()
		
		log("Another key was pressed!")
		
	end
	
	log("[ExampleBinds]Finished adding menu callbacks")
	
	log("[ExampleBinds]Building a menu from JSON")
	MenuHelper:LoadFromJsonFile(modPath .. "menu.json", {}, {})
	log("[ExampleBinds]Finished building a menu from JSON")
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "ExampleBinds_PopulateMenu", function(menu_manager, nodes)

		log("[ExampleBinds]Adding keybinds to menu")
		
		for i, id in pairs(tests) do
			MenuHelper:AddKeybinding({
				id = "example_" .. id,
				title = id,
				binding = LuaModManager:GetPlayerKeybind("example_" .. id) or "",
				button = LuaModManager:GetPlayerKeybind("example_" .. id) or "",
				callback = "test_callback",
				connection_name = "example_" .. id,
				menu_id = "examplebinds_menu",
				localized = false
			})
			
			LuaModManager:AddKeybinding("example_" .. id, MenuCallbackHandler.test_callback)
		end
		
		log("[ExampleBinds]Finished adding keybinds to menu")
end)