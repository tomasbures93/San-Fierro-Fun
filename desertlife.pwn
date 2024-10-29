#include <a_samp>

new modversion[20] = "v0.0.2a";

#pragma tabsize 0

//colors
#define SYS_WHITE 0xFFFFFFAA
#define SYS_PROBLEM 0xff0000AA
#define SYS_OK 0x00ff00AA
#define SYS_WARNING 0xff9100AA

//TextDraws
new Text:version;
new Text:Test;

//pickups
new trucksfdocks;

// Dialogs
enum
{
    DIALOG_LOGIN,
    DIALOG_WELCOME,
    DIALOG_WEAPONS,
	DIALOG_JOBS
}
#define DIALOG_LOGIN 1
#define DIALOG_WELCOME 2
#define DIALOG_WEAPONS 3

main()
{
	print("\n----------------------------------");
	print(" San Fierro Fun");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	SetGameModeText("San Fierro Fun");
    UsePlayerPedAnims();
    ShowPlayerMarkers(1);
    ShowNameTags(1);
    DisableInteriorEnterExits();
    //AllowInteriorWeapons(1);
	AddPlayerClass(0,-1166.0553,30.2264,14.1484,277.2402,0,0,0,0,0,0);
	AddStaticVehicle(411, -1162.1776,35.5443,14.1484,129.6587,0, 1);
	AddStaticVehicle(495, -1163.0609,27.4130,14.1484,43.1779, 0, 1);
	// Trucks SF Docks - Truck ID 515 , Trailer ID 435 for missions
	AddStaticVehicle(515,-1736.7004,0.6265,5.2760,0.8750,1,1);
	AddStaticVehicle(515,-1714.7683,-8.4339,5.3044,38.0566,1,1);
	AddStaticVehicle(515,-1574.0729,129.9238,4.5714,136.8015,1,1);
	AddStaticVehicle(515,-1591.1049,111.7881,4.5808,136.7738,1,1); 
	AddStaticVehicle(515,-1605.5150,96.4574,4.5648,136.7756,1,1); 
	AddStaticVehicle(515,-1725.0200,4.9415,4.6118,40.2715,1,1); 
	AddStaticVehicle(435,-1693.2036,95.2051,4.2818,135.4469,1,1); 
	AddStaticVehicle(435,-1698.0519,97.9644,4.5761,135.6089,1,1);
	AddStaticVehicle(435,-1701.2671,101.6751,4.5719,135.2610,1,1); 
	AddStaticVehicle(435,-1706.7643,106.3703,4.5758,135.5140,1,1); 
	AddStaticVehicle(435,-1714.3096,63.5763,4.5724,44.5770,1,1); 
	AddStaticVehicle(435,-1554.5771,135.4863,4.5809,134.1101,1,1); 
	// Trucks upper SF Docks - Truck ID 403 , Trailer ID 591 for missions
	AddStaticVehicle(403,-1852.4331,167.9211,15.8443,180.3650,0,0);
	AddStaticVehicle(403,-1842.7319,167.3891,15.8443,180.6638,0,0); 
	AddStaticVehicle(591,-1856.9109,121.9408,14.8443,1.1350,0,0);
	AddStaticVehicle(591,-1844.2953,120.0702,14.8443,357.8600,0,0);
	// Pickups - Jobs
	trucksfdocks = CreatePickup(1239, 1, -1732.1434,36.2360,3.5, -1); // Trucker SF Docks
	// Version TextDraw
	version = TextDrawCreate(590.0, 430.0, modversion);
	TextDrawFont(version, 1);
    TextDrawLetterSize(version, 0.3, 1.0);
    TextDrawColor(version, SYS_WHITE); 
    TextDrawSetOutline(version, 1);
    TextDrawSetProportional(version, 1);
	// Info TextDraw - Test
	Test= TextDrawCreate(320.0, 35.0, "_");
    TextDrawAlignment(Test, 2);
    TextDrawLetterSize(Test, 0.0, 30.0); // This controls the height
    TextDrawUseBox(Test, 1);
    TextDrawBoxColor(Test, 0x000000AA); // Black with 66% opacity
    TextDrawTextSize(Test, 0.0, 400.0); // This controls the width

	return 1;
}

public OnGameModeExit()
{
	TextDrawDestroy(version);
	TextDrawDestroy(Test);
	return 1;
}


public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-1166.0553,30.2264,14.1484);
	SetPlayerFacingAngle(playerid, 277.2402);
	SetPlayerCameraPos(playerid,-1158.2056,30.9412,14.1484);
	SetPlayerCameraLookAt(playerid,-1166.0553,30.2264,14.1484);
	ShowPlayerDialog(playerid, DIALOG_WELCOME, DIALOG_STYLE_MSGBOX, "Welcome to the server", "Rules:\n1) Dont Cheat\n2) Be Polite\n3) Have Fun\nLine1\nLine2", "OK", "");
	return 1;
}

public OnPlayerConnect(playerid)
{
    new player[100];
    GetPlayerName(playerid, player, 24);
    format(player, 100, "[SYSTEM] %s is here!", player);
    SendClientMessageToAll(SYS_OK,player);
	TextDrawShowForPlayer(playerid, version);
	SetPlayerMapIcon(playerid, 1, -1732.1434,36.2360,3.5547, 51, SYS_WHITE, 1);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new player[100];
    GetPlayerName(playerid, player, 30);
    switch (reason) {
        case 0: format(player, 100, "[SYSTEM] %s is gone. [Game Crashed]", player);
        case 1: format(player, 100, "[SYSTEM] %s is gone. [Left]", player);
        case 2: format(player, 100, "[SYSTEM] %s is gone. [Kick/Ban]", player);
    }
    SendClientMessageToAll(SYS_OK, player);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, -1176.8077,14.9178,14.1484);
	SetPlayerFacingAngle(playerid, 41.6112);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new message[100];
	new playerName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playerName, sizeof(playerName));
    format(message, sizeof(message), "[SYSTEM] Player %s died.", playerName);
    SendClientMessageToAll(SYS_WARNING, message);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp(cmdtext, "/kill", true) == 0){
        SetPlayerHealth(playerid, 0);
    return 1;
    }
	if(strcmp(cmdtext, "/jobs", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_JOBS, DIALOG_STYLE_TABLIST, "Jobs", "Trucker\tSF Docks\tNO REWARD", "Select", "Cancel");
    return 1;
    }
	if(strcmp(cmdtext, "/msgbox", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_WELCOME, DIALOG_STYLE_MSGBOX, "Notice", "You are connected to the server", "Close", "");
    return 1;
    }
	if(strcmp(cmdtext, "/input", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "Login", "Enter your password below:", "Login", "Cancel");
    return 1;
    }
	if(strcmp(cmdtext, "/list", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_LIST, "Weapons", "AK47\nM4\nSniper Rifle", "Option 1", "Option 2");
    return 1;
    }
	if(strcmp(cmdtext, "/pass", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Enter your password below:", "Login", "Cancel");
    return 1;
    }
	if(strcmp(cmdtext, "/tab", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_TABLIST, "Buy Weapon", "Deagle\t$5000\t100\nSawnoff\t$5000\t100\nPistol\t$1000\t50", "Select", "Cancel");
    return 1;
    }
	if(strcmp(cmdtext, "/tab2", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_TABLIST_HEADERS, "Buy Weapon", "Weapon\tPrice\tAmmo\nDeagle\t$5000\t100\nSawnoff\t$5000\t100\nPistol\t$1000\t50", "Select", "Cancel");
    return 1;
    }
	if(strcmp(cmdtext, "/info", true) == 0){
        TextDrawShowForPlayer(playerid, Test);
		  return 1;
    }
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	new message[100];
	new Float:vehicle_HP;
	GetVehicleHealth(vehicleid, vehicle_HP);
	vehicle_HP = (vehicle_HP - 250) / 7.5;
    format(message, sizeof(message), "[SYSTEM] Status of vehicle: %.0f%%%% ", vehicle_HP);
    SendClientMessage(playerid, 0xFFFFFFFF, message);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == trucksfdocks){
		SendClientMessage(playerid, SYS_OK, "Pickup picked up");
	}
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_JOBS){
		if(response){
			new message[50];
			format(message, sizeof(message), "[SYSTEM] Teleported to the job %s", inputtext);
			SetPlayerPos(playerid, -1736.7004,0.6265,10.2760);
			SendClientMessage(playerid, SYS_OK, message);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
