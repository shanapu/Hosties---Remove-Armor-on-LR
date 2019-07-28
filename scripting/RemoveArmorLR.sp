//Includes
#include <sourcemod>
#include <hosties>
#include <lastrequest>


//Compiler Options
#pragma semicolon 1
#pragma newdecls required

//ConVars
ConVar gc_iArmor;
ConVar gc_iHealth;
ConVar gc_iHelmet;
ConVar gc_iTeam;

//Info
public Plugin myinfo =
{
	name = "Hosties - Remove Armor on LR", 
	author = "shanapu", 
	description = "Hosties - Set Kevlar, Helmet & HP on Last Request", 
	version = "1.3", 
	url = "https://github.com/shanapu"
};

public void OnPluginStart()
{
	gc_iHelmet = CreateConVar("hosties_lr_helmet", "0", "Value of helmet to set all alive players on LR");
	gc_iArmor = CreateConVar("hosties_lr_armor", "0", "Value of armor to set all alive players on LR");
	gc_iHealth = CreateConVar("hosties_lr_HP", "100", "Value of health to set all alive players on LR / 0 - disabled. Keep HP");
	gc_iTeam = CreateConVar("hosties_lr_team", "0", "0 - both ct & t / 1- only CT / 2 - only T");
	AutoExecConfig(true, "hosties_lr");
}

public void OnAvailableLR(int Announced)
{
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!IsClientInGame(i) || !IsPlayerAlive(i) || IsFakeClient(i))
			continue;

		if ((GetClientTeam(i) != 2 && gc_iTeam.IntValue == 1) || (GetClientTeam(i) != 3 && gc_iTeam.IntValue == 2))
			continue;

		SetEntProp(i, Prop_Send, "m_ArmorValue", gc_iArmor.IntValue);
		SetEntProp(i, Prop_Send, "m_bHasHelmet", gc_iHelmet.IntValue);

		if (gc_iHealth.IntValue < 1)
			continue;

		SetEntityHealth(i, gc_iHealth.IntValue);
	}
}