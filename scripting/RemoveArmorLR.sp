//Includes
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <hosties>
#include <lastrequest>


//Compiler Options
#pragma semicolon 1
#pragma newdecls required


//Info
public Plugin myinfo =
{
	name = "Hosties - Remove Armor on LR", 
	author = "shanapu", 
	description = "Hosties - Remove Kevlar & Helmet on Last Request", 
	version = "1.0", 
	url = "https://github.com/shanapu"
};


//Start Timer on Last Request
public int OnAvailableLR(int Announced)
{
	for (int i = 1; i <= MaxClients; i++) if(IsPlayerAlive(i))
	{
		SetEntProp(i, Prop_Send, "m_ArmorValue", 0);
		SetEntProp(i, Prop_Send, "m_bHasHelmet", 0);
	}
}