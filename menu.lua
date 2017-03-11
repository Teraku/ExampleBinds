local tests = {"test1", "test2"}
local modPath = ModPath

Hooks:Add("MenuManagerInitialize", "ExampleBinds_InitCallbacks", function(menu_manager)
	
	MenuCallbackHandler.test_callback = function(self, item)
		
		log("A key was pressed!")
		
	end
	
	MenuHelper:LoadFromJsonFile(modPath .. "menu.json", {}, {})
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "ExampleBinds_PopulateMenu", function(menu_manager, nodes)

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
		end

end)