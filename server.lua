----------------------------------------------------------------------------
--	INITIALISATION DES VARIABLES
----------------------------------------------------------------------------

ESX = nil
local text1 = "Chere Citoyens, un Phénomène météorologique en approche dans 15 minutes, mettez vous a l'abri"
local text2 = "Chere Citoyens, un Phénomène météorologique en approche dans 10 minutes, mettez vous a l'abri"
local text3 = "Chere Citoyens, un Phénomène météorologique en approche dans 5 minutes, mettez vous a l'abri"

----------------------------------------------------------------------------
--	INITIALISATION ESX
----------------------------------------------------------------------------

TriggerEvent('rgd:getSharedObject', function(obj) ESX = obj end)

----------------------------------------------------------------------------
--	FONCTION RESTART
----------------------------------------------------------------------------

RegisterServerEvent("restart:checkreboot")
AddEventHandler('restart:checkreboot', function()
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	if date_local == '05:15:00' then
		TriggerClientEvent("annonce", -1, text1)  ---REBOOT 7H---//---COMMENCE A FAIRE DES NUAGE---
		ExecuteCommand('weather clearing')
	elseif date_local == '05:20:00' then
		TriggerClientEvent("annonce", -1, text2)  ---COMMENCE A PLEUVOIR---
		ExecuteCommand('weather rain')
	elseif date_local == '05:25:00' then
		TriggerClientEvent("annonce", -1, text3)  ---COMMENCE A FAIRE DES ORAGE---
		ExecuteCommand('weather thunder')
	-------------------------------------------------	
	elseif date_local == '16:45:00' then 
		TriggerClientEvent("annonce", -1, text1)  ---REBOOT 19H---//---COMMENCE A FAIRE DES NUAGE---
		ExecuteCommand('weather clearing')
	elseif date_local == '16:50:00' then
		TriggerClientEvent("annonce", -1, text2)  ---COMMENCE A PLEUVOIR---
		ExecuteCommand('weather rain')
	elseif date_local == '16:55:00' then
		TriggerClientEvent("annonce", -1, text3)  ---COMMENCE A FAIRE DES ORAGE---
		ExecuteCommand('weather thunder')
	end
end)

function restart_server()
	SetTimeout(1000, function()
		TriggerEvent('restart:checkreboot')
		restart_server()
	end)
end

restart_server()
