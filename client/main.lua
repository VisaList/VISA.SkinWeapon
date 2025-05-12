ESX = exports["es_extended"]:getSharedObject();
local isinmenu = false
local currentmain = 1
local currentuse = {}

RegisterKeyMapping(Config["SETTING"]["OPENMENUCOMMAND"], "OPEN SKIN MENU", "keyboard", Config["SETTING"]["OPENMENUKEY"])
RegisterCommand(Config["SETTING"]["OPENMENUCOMMAND"],function()
	if not isDead then
		openmenu()
	end
end)

function openmenu()
	if not isinmenu then
		isinmenu = true
		togglefocus(true)
		SendNUIMessage({
			action = "openmenu",
			data = Config["WEAPONSKIN"],
			cate = Config["CATEGORY"],
			img = Config["IMG"]
		})
		ClearPedTasksImmediately(GetPlayerPed(-1))
		FreezeEntityPosition(GetPlayerPed(-1), true)
	end
end

function selectmain()
	local maintojs = currentmain - 1
	for k, v in ipairs(Config["WEAPONSKIN"][currentmain]["SKIN"]) do
		v["GOT"] = false
		if checkitem(v["ITEMUSE"]) then
			v["GOT"] = true
		end
	end
	SendNUIMessage({
		action = "selectmain",
		select = maintojs,
		data = Config["WEAPONSKIN"][currentmain]["SKIN"],
	})
end

function updateskin()
	local maintojs = currentmain - 1
	for k, v in ipairs(Config["WEAPONSKIN"][currentmain]["SKIN"]) do
		v["GOT"] = false
		if checkitem(v["ITEMUSE"]) then
			v["GOT"] = true
		end
	end
	SendNUIMessage({
		action = "updateskin",
		select = maintojs,
		data = Config["WEAPONSKIN"][currentmain]["SKIN"],
	})
end

function togglefocus(value)
    SetNuiFocus(value, value)
end

function closemenu()
	if isinmenu then
		isinmenu = false
		togglefocus(false)
		SendNUIMessage({
			action = "closemenu",
		})
		FreezeEntityPosition(GetPlayerPed(-1), false)
		SetEntityAlpha(GetPlayerPed(-1), 255, 0)
	end
end

RegisterNUICallback('action', function(data, cb)
	if data.action == "selectmain" then
		currentmain = math.floor(data.id + 1)
		selectmain()
	elseif data.action == "selectskin" then
		local selectskinid = math.floor(data.id + 1)
		selectskin(selectskinid, true)
    elseif data.action == 'resetskin' then
		local selectskinid = math.floor(data.id + 1)
        selectskin(selectskinid, false)
	elseif data.action == "closemenu" then
		closemenu()
	end
end)

function selectskin(skin, state)
	local datamain = Config["WEAPONSKIN"][currentmain]
	local dataskin = skin
    if state then
        if not datamain["SKIN"][dataskin]["INUSE"] then
            if checkitem(datamain["SKIN"][dataskin]["ITEMUSE"]) then
                if datamain["INUSE"] and datamain["INUSE"]["NAME"] ~= datamain["SKIN"][dataskin]["NAME"] then
                    if currentuse[datamain["MAIN"]] and currentuse[datamain["MAIN"]]["MODEL"] then
                        DeleteObject(currentuse[datamain["MAIN"]]["MODEL"])
                        currentuse[datamain["MAIN"]]["MODEL"] = nil
                    end
                    datamain["SKIN"][datamain["INUSE"]["INDEX"]]["INUSE"] = nil
                end
                local hasmainweapon = false
                if not datamain["MAIN"]["ITEMWEAPON"] then
                    if HasPedGotWeapon(PlayerPedId(), GetHashKey(datamain["MAIN"]), false) then
                        hasmainweapon = true
                    end
                else
                    if checkitem(datamain["MAIN"]) then
                        hasmainweapon = true
                    end
                end
                if hasmainweapon then
                    if not datamain["INUSE"] then
                        datamain["INUSE"] = {}
                        datamain["INUSE"]["NAME"] = datamain["MAIN"]
                    end
                    datamain["INUSE"]["NAME"] = datamain["SKIN"][dataskin]["NAME"]
                    datamain["INUSE"]["INDEX"] = dataskin
                    datamain["SKIN"][dataskin]["INUSE"] = true
                    currentuse[datamain["MAIN"]] = {}
                    currentuse[datamain["MAIN"]]["SKIN"] = datamain["SKIN"][dataskin]["NAME"]
                    currentuse[datamain["MAIN"]]["POSITION"] = datamain["POSITION"]
                    updateskin()
                end
				TriggerEvent("mythic_notify:client:SendAlert", {text = "คุณได้สวมสกินแล้ว", type = "success", timeout = 3000})
			else
				TriggerEvent("mythic_notify:client:SendAlert", {text = "คุณไม่มีไอเทมสกินนี้", type = "error", timeout = 3000})
            end
        end
    else
        if checkitem(datamain["SKIN"][dataskin]["ITEMUSE"]) then
            datamain["INUSE"]["NAME"] = currentmain
            datamain["SKIN"][dataskin]["INUSE"] = false
            DeleteObject(currentuse[datamain["MAIN"]]["MODEL"])
            currentuse[datamain["MAIN"]] = nil
            SetPedCurrentWeaponVisible(GetPlayerPed(-1), 1, 0, 1, 1)
            updateskin()

			TriggerEvent("mythic_notify:client:SendAlert", {text = "คุณได้ถอดสกินแล้ว", type = "info", timeout = 3000})
        end
    end
end

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
	if isinmenu then
		closemenu()
	end
end)

function checkitem(name) 
	for k,v in pairs(ESX.GetPlayerData().inventory) do 
		if v.name == name then 
			if v.count > 0 then 
				return true
			end 
		end 
	end 
	return false
end

CreateThread(function()
	while true do
		nothing, weapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)
		for k, v in pairs(currentuse) do
			if weapon == GetHashKey(k) then
				SetPedCurrentWeaponVisible(GetPlayerPed(-1), 0, 0, 1, 1)
				if not currentuse[k]["MODEL"] then
					weaponobject = CreateObject(GetHashKey(currentuse[k]["SKIN"]), x, y, z,  true,  false, true)
					print("Creating object: ", currentuse[k]["SKIN"])
					currentuse[k]["MODEL"] = weaponobject
					SetEntityAsMissionEntity(weaponobject, true, false)
					local weapposition = Config["WEAPONPOSITION"][currentuse[k]["POSITION"]]
					AttachEntityToEntity(weaponobject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), weapposition.Pos.x, weapposition.Pos.y, weapposition.Pos.z, weapposition.Rot.x, weapposition.Rot.y,weapposition.Rot.z, true, true, false, true, 0, true)
				end
			else
				if currentuse[k]["MODEL"] then
					DeleteObject(currentuse[k]["MODEL"])
					currentuse[k]["MODEL"] = nil
				end
			end
		end
		Wait(500)
	end
end)

