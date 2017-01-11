-------------------------------------------------------------------------------
--- AUTHOR: Nostrademous
--- Some Functions have been copy/pasted from bot-scripting community members 
--- Including: 
-------------------------------------------------------------------------------

local utils = require( GetScriptDirectory().."/utility" )
local dt = require( GetScriptDirectory().."/decision_tree" )

local SKILL_Q = "viper_poison_attack";
local SKILL_W = "viper_nethertoxin";
local SKILL_E = "viper_corrosive_skin";
local SKILL_R = "viper_viper_strike"; 

local ABILITY1 = "special_bonus_attack_damage_15"
local ABILITY2 = "special_bonus_hp_125"
local ABILITY3 = "special_bonus_strength_7"
local ABILITY4 = "special_bonus_agility_14"
local ABILITY5 = "special_bonus_armor_7"
local ABILITY6 = "special_bonus_attack_range_75"
local ABILITY7 = "special_bonus_unique_viper_1"
local ABILITY8 = "special_bonus_unique_viper_2"

local ViperAbilityPriority = {
	SKILL_Q,    SKILL_W,    SKILL_W,    SKILL_E,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_Q,    SKILL_Q,    ABILITY2,
    SKILL_Q,    SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    SKILL_R,    ABILITY6, 	ABILITY8
};

ACTION_NONE			= "ACTION_NONE";
local viperActionQueue = { [1] = ACTION_NONE }

ViperBot = dt:new()

function ViperBot:new(o)
	o = o or dt:new(o)
	setmetatable(o, self)
	self.__index = self
	return o
end

viperBot = ViperBot:new{prevTime = -998.0, actionQueue = viperActionQueue, abilityPriority = ViperAbilityPriority}
--viperBot:printInfo();

viperBot.Init = false;

function Think()
    local npcBot = GetBot();
	if ( not npcBot ) then return; end
	
	viperBot:Think(npcBot);
end