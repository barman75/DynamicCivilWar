/**
 * DYNAMIC CIVIL WAR
 * Created: 2017-11-29
 * Author: BIDASS
 * License: MIT
 */

_nbTrucks = 2;
_roadRadius = 40;
_worldSize = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} else {8192;};
_worldCenter = [_worldSize/2,_worldSize/2,0];

ENEMY_COMMANDER = objNull;
_grp = createGroup ENEMY_SIDE;
ESCORT = [];

_mkrToAvoid = createMarker ["mkrToAvoid",getPos player];
_mkrToAvoid setMarkerShape "ELLIPSE";
_mkrToAvoid setMarkerAlpha 0;
_mkrToAvoid setMarkerSize [1200,1200];
_tempList = MARKER_WHITE_LIST + [_mkrToAvoid];

_initPos = [_worldCenter, (_worldSize/2)*0, (_worldSize/2)*1.2, 4, 0, 20, 0, _tempList] call BIS_fnc_findSafePos;
{  
    _initPos = _x select 0;

    //Spawn the commander
    ENEMY_COMMANDER = _grp createUnit [ENEMY_COMMANDER_CLASS, _initPos,[],ENEMY_SKILLS,"NONE"];
    removeAllWeapons ENEMY_COMMANDER;
    ENEMY_COMMANDER setBehaviour "SAFE";
    
    //Custom variable
    if (DEBUG) then {
        _marker = createMarker ["commanderMarker",getPos ENEMY_COMMANDER];
        _marker setMarkerShape "ICON";
        _marker setMarkerColor "ColorRed";
        _marker setMarkerType "o_motor_inf";
        ENEMY_COMMANDER setVariable["marker",_marker];
    };

    //Push to units-spawned to update the marker pos
    UNITS_SPAWNED pushback ENEMY_COMMANDER;
    ESCORT pushBack ENEMY_COMMANDER;

    //When the commander is attacked by the player group, he would try to flee. If he is far from the player, he would disappear and got respawned in another sector
    ENEMY_COMMANDER addEventHandler ["FiredNear",{
        _civ=_this select 0;	
		_distance = _this select 2;	
		_gunner = _this select 7;	

        if (group _gunner == group player && _distance < 50)then{
            [player,"Shit ! this asshole is fleeing."] spawn fnc_talk;
            [_civ] joinSilent (createGroup ENEMY_SIDE);
            _civ setBehaviour "CARELESS";
            _civ forceWalk false;
            _civ forceSpeed 10;
            _dir = [player,_civ] call BIS_fnc_dirTo;
            _newPos = [(getPos _civ), 2000,_dir] call BIS_fnc_relPos;
            [_newPos, 0, 1000, 4, 0, 20, 0, MARKER_WHITE_LIST] call BIS_fnc_findSafePos;
            _civ move _newPos;
            [] spawn{
                waitUntil{sleep 1;(player distance ENEMY_COMMANDER) > 500 || !(alive ENEMY_COMMANDER) };
                if (!alive ENEMY_COMMANDER)exitWith{false};
                deleteMarker ENEMY_COMMANDER getVariable["marker",""];
                deleteVehicle ENEMY_COMMANDER;
                [player,"He has definitely left the area... Mission compromised. Maybe we would catch him later..."] call fnc_talk;
                //{ESCORT = ESCORT - [_x];deleteVehicle _x; } forEach ESCORT;
                [] call fnc_SpawnMainObjective;
            };
        };
    }];

    ENEMY_COMMANDER addEventHandler ["Killed",{
        params["_unit","_killer"];

        if (group _killer == group player)then{
            []spawn{
                [player,"HQ ! This is charlie team, the enemy commander is KIA ! Out."] call fnc_talk;
                sleep 14;
                ["END1",true,2] call BIS_fnc_endMission;
            };
        }else{
            { ESCORT = ESCORT - [_x]; deleteMarker (_x getVariable["marker",""]);deleteVehicle _x;} forEach CONVOY;
            [] spawn fnc_SpawnMainObjective;
        };
    }];

    //Civilian team spawn.
    //If we killed them, it's over.
    
    for "_xc" from 1 to 4  do {
        _unit = _grp createUnit [CIV_LIST_UNITS call BIS_fnc_selectRandom, _initPos,[],ENEMY_SKILLS,"NONE"];
        _unit addEventHandler ["Killed",{
            params["_unit","_killer"];
            if (group _killer == group player)then{
            []spawn{
                [player,"Shit ! We killed his civilian escort. The operation is compromised."] call fnc_talk;
                sleep 10;
                ["epicFail",false,2] call BIS_fnc_endMission;
            };
            };
            
        }];
        ESCORT pushback _unit;
    };

    for "_yc" from 1 to 4  do {
        _unit =[_grp,_initPos] call fnc_spawnEnemy;
        ESCORT pushback _unit;
    };
    
} 
foreach selectBestPlaces [_initPos, 500, "+trees +forest*10 -meadow", 5, 1];

/*
{ESCORT = ESCORT - [_x];deleteVehicle _x; } forEach ESCORT;
*/
false;