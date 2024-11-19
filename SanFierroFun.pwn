#include <a_samp>

new modversion[20] = "v0.0.2a";

#pragma tabsize 0

// colors
#define SYS_WHITE 0xFFFFFFAA
#define SYS_PROBLEM 0xff0000AA
#define SYS_OK 0x00ff00AA
#define SYS_WARNING 0xff9100AA

// TextDraws
new Text:version;
new Text:Test;

// pickups - transport
new sfairport;
new sftrain;

// pickups - work
new trucksfdocks;

// others
new jobpickup[MAX_PLAYERS];
new pickuppickup[MAX_PLAYERS];

// Dialogs
enum
{
    DIALOG_LOGIN,
    DIALOG_WELCOME,
    DIALOG_WEAPONS,
	DIALOG_JOBS,
	DIALOG_TP,
	DIALOG_JOB_TRUCKER
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
	AddStaticVehicle(411, -1990.0114,186.7471,27.5391,353.3199,0, 1);
	AddStaticVehicle(495, -1988.7845,138.8985,27.5391,181.3216, 0, 1);
	// Trucks SF Docks - Truck ID 515 , Trailer ID 435 for missions
	AddStaticVehicle(515,-1647.5753,10.4159,4.5717,44.4010,1,1); 
	AddStaticVehicle(515,-1651.5116,6.7247,4.5712,42.9010,1,1); 
	AddStaticVehicle(515,-1655.7568,2.6430,4.5678,42.9431,1,1); 
	AddStaticVehicle(515,-1659.9255,-1.4529,4.5700,44.5571,1,1); 
	AddStaticVehicle(515,-1630.2097,70.4724,4.5737,176.7814,1,1); 
	AddStaticVehicle(515,-1623.8671,77.0643,4.5758,180.3049,1,1); 
	AddStaticVehicle(515,-1617.1459,84.3643,4.5759,182.5267,1,1); 
	AddStaticVehicle(515,-1610.7916,91.3931,4.5731,184.0389,1,1); 
	AddStaticVehicle(515,-1731.7963,2.5310,4.5748,2.1874,1,1); 
	AddStaticVehicle(435,-1700.8362,104.6634,4.5758,142.6419,1,1);
	AddStaticVehicle(435,-1713.5856,64.1006,4.5694,46.1683,1,1);
	AddStaticVehicle(435,-1707.0029,12.4028,4.5788,316.3098,1,1); 
	AddStaticVehicle(435,-1690.8182,96.3132,4.5716,86.0747,1,1); 
	AddStaticVehicle(435,-1695.9539,91.3294,4.5722,83.7602,1,1); 
	AddStaticVehicle(435,-1700.5251,86.3879,4.5711,86.3353,1,1); 
	AddStaticVehicle(435,-1705.3693,81.7890,4.5749,85.8162,1,1); 
	AddStaticVehicle(435,-1710.0132,77.1295,4.5764,85.5209,1,1); 
	AddStaticVehicle(435,-1704.3184,109.1280,4.5889,141.1323,1,1); 
	// Transport Pickups
	sfairport = CreatePickup(1239, 1, -1423.3116,-289.1021,14.1484, -1);
	sftrain = CreatePickup(1239, 1, -1973.3477,118.4421,27.6875, -1);
	// Pickups - Jobs
	trucksfdocks = CreatePickup(1274, 1, -1732.1434,36.2360,3.5, -1); // Trucker SF Docks
	Create3DTextLabel("Job: Trucker SF Docks \n Pay: 500$ \n Missions: Yes", SYS_OK, -1732.1434,36.2360,4.5, 40.0, 0, 0);
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
	// Variables
	jobpickup[playerid] = 0;
	pickuppickup[playerid] = 0;
	// Map Icons
	SetPlayerMapIcon(playerid, 1, -1732.1434,36.2360,3.5547, 51, SYS_WHITE, 1);
	SetPlayerMapIcon(playerid, 2, -1423.3116,-289.1021,14.1484, 5, SYS_WHITE, 1);
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
    SetPlayerPos(playerid, -1973.8416,159.3786,27.6940);
	SetPlayerFacingAngle(playerid, 182.5750);
	GivePlayerMoney(playerid, 1000);
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
        ShowPlayerDialog(playerid, DIALOG_JOBS, DIALOG_STYLE_TABLIST, "Job Teleports", "Trucker\tSF Docks\tNO REWARD", "Select", "Cancel");
    return 1;
    }
	if(strcmp(cmdtext, "/tp", true) == 0){
        ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_TABLIST, "Teleports", "San Fierro Airport\tFree\nSan Fierro Train Station\tFree\nSan Fierro Fire Department \tFree", "Select", "Cancel");
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
	if (pickuppickup[playerid] == 1) {
		return 1;
	} 
	if(pickupid == trucksfdocks){
		TogglePlayerControllable(playerid, false);
		jobpickup[playerid] = 1;
		pickuppickup[playerid] = 1;
		ShowPlayerDialog(playerid, DIALOG_JOB_TRUCKER, DIALOG_STYLE_LIST, "Trucker", "Info\nMissions\nJoin", "Ok", "Cancel");
	}
	if(pickupid == sfairport){
		SendClientMessage(playerid, SYS_OK, "SF Airport pickup");
	}
	if(pickupid == sftrain){
		SendClientMessage(playerid, SYS_OK, "SF Train pickup");
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
	if(dialogid == DIALOG_TP){
		new message[50];
		format(message, sizeof(message), "[SYSTEM] Teleported to %s", inputtext);
		switch(listitem){
			case 0: {

				SetPlayerPos(playerid, -1433.7793,-281.6175,14.1484);
				SetPlayerFacingAngle(playerid, 136.1181);
				SendClientMessage(playerid, SYS_OK, message);
			}
			case 1: {

				SetPlayerPos(playerid, -1973.8416,159.3786,27.6940);
				SetPlayerFacingAngle(playerid, 182.5750);
				SendClientMessage(playerid, SYS_OK, message);
			}
			case 2: {
				
				SetPlayerPos(playerid, -2015.4547,64.9303,29.3113);
				SetPlayerFacingAngle(playerid, 79.9318);
				SendClientMessage(playerid, SYS_OK, message);
			}
		}
		
	}
	if(dialogid == DIALOG_JOB_TRUCKER && response){
		if(jobpickup[playerid] == 1){
			switch(listitem){
				case 0: {
					TogglePlayerControllable(playerid, true);
					SendClientMessage(playerid, SYS_OK, "Info");
					SetTimerEx("pickupreset", 15000, false, "i", playerid);
				}
				case 1: {
					TogglePlayerControllable(playerid, true);
					SendClientMessage(playerid, SYS_OK, "Missions");
					SetTimerEx("pickupreset", 15000, false, "i", playerid);
				}
				case 2: {
					TogglePlayerControllable(playerid, true);
					SendClientMessage(playerid, SYS_OK, "Join");
					SetTimerEx("pickupreset", 15000, false, "i", playerid);
				}
			}
				
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	new string[128], title[64], info[256];
	new Float:x, Float:y, Float:z;
	new ping = GetPlayerPing(playerid);
	new name[MAX_PLAYER_NAME];
	GetPlayerPos(playerid, x, y, z);
	GetPlayerName(clickedplayerid, name, sizeof(name));
    format(string, sizeof(string), "You clicked on %s (ID: %d)", name, clickedplayerid);
    SendClientMessage(playerid, SYS_OK, string);
	format(title, sizeof(title), "Info about player");
	format(info, sizeof(info), "Name: %s (ID: %d)\nPing: %d ms\nPosition: X %0.4f Y %0.4f Z %0.4f\nPickuppicked %d", name, clickedplayerid, ping, x, y, z, pickuppickup[playerid]);
	ShowPlayerDialog(playerid, DIALOG_WELCOME, DIALOG_STYLE_MSGBOX, title, info, "OK", "");
	return 1;
}

//extras
forward pickupreset(playerid);
public pickupreset(playerid) {
	pickuppickup[playerid] = 0;
	SendClientMessage(playerid, SYS_WARNING, "Timer RESET");
}