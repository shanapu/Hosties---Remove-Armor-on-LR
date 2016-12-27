//Includes
#include <sourcemod>
#include <mystocks>
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
	version = "1.1", 
	url = "https://github.com/shanapu"
};


//Start Timer on Last Request
public int OnAvailableLR(int Announced)
{
	LoopValidClients(i, true, false)
	{
		SetEntProp(i, Prop_Send, "m_ArmorValue", 0);
		SetEntProp(i, Prop_Send, "m_bHasHelmet", 0);
	}
}