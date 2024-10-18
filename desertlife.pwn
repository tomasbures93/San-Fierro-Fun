#include <a_samp>

#pragma tabsize 0

#define WHITE 0xFFFFFFAA

public OnFilterScriptExit()
{
	return 1;
}

main()
{
	print("\n----------------------------------");
	print(" Desert Life");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	SetGameModeText("Desert Life");
    UsePlayerPedAnims();
    ShowPlayerMarkers(1);
    ShowNameTags(1);
    //DisableInteriorEnterExits();
    //AllowInteriorWeapons(1);
    AddPlayerClass(250,-204.1086,1119.1073,19.7422,267.3280,0,0,0,0,0,0);
    AddPlayerClass(0,-204.1086,1119.1073,19.7422,267.3280,0,0,0,0,0,0);
    //--------AUTA V MODU-----------
    AddStaticVehicle(451,-201.1305,1133.7876,19.7422,181.6761,125,125); // turismo
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid,0);
	SetPlayerFacingAngle(playerid,5.9891);
	SetPlayerPos(playerid,-201.1305,1133.7876,19.7422);
	SetPlayerCameraPos(playerid,-192.4307,1114.7733,19.7890);
	SetPlayerCameraLookAt(playerid,-201.1305,1133.7876,19.7422);
	return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid,WHITE,"Welcome to server");
    new player[100];
    GetPlayerName(playerid, player, 24);
    format(player, 100, "%s is here!", player);
    SendClientMessageToAll(WHITE,player);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new player[100];
    GetPlayerName(playerid, player, 30);
    switch (reason) {
        case 0: format(player, 100, "%s is gone. [Game Crashed]", player);
        case 1: format(player, 100, "%s is gone. [Left]", player);
        case 2: format(player, 100, "%s is gone. [Kick/Ban]", player);
    }
    SendClientMessageToAll(WHITE, player);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, -204.1086,1119.1073,19.7422);
    GivePlayerMoney(playerid, 20000);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
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
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
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
