#include <a_samp>

#pragma tabsize 0

#define WHITE 0xFFFFFFAA

new Text:version;

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
    //DisableInteriorEnterExits();
    //AllowInteriorWeapons(1);
	AddPlayerClass(0,-1166.0553,30.2264,14.1484,277.2402,0,0,0,0,0,0);
	AddStaticVehicle(411, -1162.1776,35.5443,14.1484,129.6587,0, 1);
	AddStaticVehicle(495, -1163.0609,27.4130,14.1484,43.1779, 0, 1);

	version = TextDrawCreate(590.0, 430.0, "v0.0.1a");
	TextDrawFont(version, 1);
    TextDrawLetterSize(version, 0.3, 1.0);
    TextDrawColor(version, WHITE); 
    TextDrawSetOutline(version, 1);
    TextDrawSetProportional(version, 1);
	return 1;
}

public OnGameModeExit()
{
	TextDrawDestroy(version);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-1166.0553,30.2264,14.1484);
	SetPlayerFacingAngle(playerid, 277.2402);
	SetPlayerCameraPos(playerid,-1158.2056,30.9412,14.1484);
	SetPlayerCameraLookAt(playerid,-1166.0553,30.2264,14.1484);
	return 1;
}

public OnPlayerConnect(playerid)
{
    new player[100];
    GetPlayerName(playerid, player, 24);
    format(player, 100, "[SYSTEM] %s is here!", player);
    SendClientMessageToAll(WHITE,player);

	TextDrawShowForPlayer(playerid, version);
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
    SendClientMessageToAll(WHITE, player);
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
    SendClientMessageToAll(0xFFFFFFFF, message);
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
	if(strcmp(cmdtext, "/textupdate", true) == 0){
        TextDrawSetString(version, "New Text");
    return 1;
    }
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	new message[100];
	new Float:vehicle_HP;
	GetVehicleHealth(vehicleid, vehicle_HP);
    format(message, sizeof(message), "[SYSTEM] Status of vehicle: %.0f ", vehicle_HP);
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
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
