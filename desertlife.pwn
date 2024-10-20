#include <a_samp>

#pragma tabsize 0

#define WHITE 0xFFFFFFAA

main()
{
	print("\n----------------------------------");
	print(" Desert Life ");
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

    AddStaticVehicle(451,-201.1305,1133.7876,19.7422,181.6761,125,125);
    AddStaticVehicle(400,-244.3235,1084.0929,19.3995,1.2456,125,125);
    AddStaticVehicle(404,-306.4029,1114.1477,19.4561,180.0822,125,125);
    AddStaticVehicle(413,-361.7625,1102.5178,19.4554,270.1758,125,125); //
	AddStaticVehicle(426,-361.1224,1127.5635,19.4031,269.2841,125,125); //
	AddStaticVehicle(424,-373.9860,1194.6785,19.2406,225.7900,125,125); //
	AddStaticVehicle(439,-340.3588,1163.9119,19.4519,359.9863,125,125); //
	AddStaticVehicle(458,-330.2484,1134.2765,19.4502,89.2109,125,125); //
	AddStaticVehicle(475,-194.5708,1223.4083,19.4486,359.7765,125,125); //
	AddStaticVehicle(483,-204.2441,1223.5276,19.4490,178.9421,125,125); //
	AddStaticVehicle(451,-199.4162,1223.4907,19.4489,180.5263,125,125); //
	AddStaticVehicle(500,-177.8762,1225.1942,19.4495,270.3810,125,125); //
	AddStaticVehicle(491,-177.5118,1217.0146,19.4493,90.3831,125,125); //
	AddStaticVehicle(517,-155.0946,1186.3340,19.4493,91.7808,125,125); //
	AddStaticVehicle(506,-167.0262,1171.4707,19.4576,271.1754,125,125); //
	AddStaticVehicle(533,-101.2883,1222.2987,19.4466,2.9905,125,125); //
	AddStaticVehicle(534,-94.1786,1221.8550,19.4434,179.9629,125,125); //
	AddStaticVehicle(535,-84.3987,1222.1628,19.4488,180.6793,125,125); //
	AddStaticVehicle(549,-77.1341,1222.1743,19.4496,177.6727,125,125); //
	AddStaticVehicle(554,-3.4096,1236.3792,19.0609,355.5321,125,125); //
	AddStaticVehicle(560,8.5975,1236.2865,19.0514,0.1965,125,125); //
	AddStaticVehicle(567,5.8335,1164.8289,19.3146,180.0594,125,125); //
	AddStaticVehicle(579,12.6552,1165.2192,19.2999,180.6573,125,125); //
	AddStaticVehicle(589,19.7121,1165.1696,19.2864,179.8788,125,125); //
	AddStaticVehicle(600,92.5536,1158.3988,18.3629,180.4386,125,125); //
	AddStaticVehicle(603,46.5890,1177.1774,18.3713,269.8951,125,125); //
	AddStaticVehicle(609,46.5397,1167.1792,18.3702,267.9671,125,125); //
	AddStaticVehicle(579,45.0004,1157.9912,18.3706,268.6886,125,125); //
	AddStaticVehicle(554,157.0741,1192.2046,14.9584,276.0541,125,125); //
	AddStaticVehicle(551,156.9614,1182.0562,14.9952,85.3323,125,125); //
	AddStaticVehicle(482,157.2127,1172.4885,14.9773,59.6960,125,125); //
	AddStaticVehicle(429,178.4144,1162.0227,14.4643,94.8127,125,125); //
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
	SetPlayerPos(playerid,-204.1086,1119.1073,19.7422);
	SetPlayerCameraPos(playerid,-192.4307,1114.7733,19.7890);
	SetPlayerCameraLookAt(playerid,-204.1086,1119.1073,19.7422);
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
