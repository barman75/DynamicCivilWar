
//Global configuration
//GLOBAL
DEBUG = false; //Make all units visible on the map
SHOW_SECTOR = true; //Make every sector colored on the map
SIDE_FRIENDLY = side player; //Side player
NUMBER_RESPAWN = 3;
CIVIL_REPUTATION = 50;
"B_RangeMaster_F" createUnit [[-1000,-1000], createGroup SIDE_FRIENDLY, "this allowDamage false; HQ = this; ", 0.6, "colonel"];
[]spawn{
	sleep 1;
	HQ setName "HQ";
};

//SPAWNING CONFIG
SIZE_BLOCK = 500; // Size of blocks
MAX_CLUSTER_SIZE = 200;
SPAWN_DISTANCE = 650; //Distance uniuts are spawned
MIN_SPAWN_DISTANCE =  350; //Units can't spawn before this distance
RADIO_CHAT_LIST=["rhs_usa_land_rc_1","rhs_usa_land_rc_2","rhs_usa_land_rc_3","rhs_usa_land_rc_4","rhs_usa_land_rc_5","rhs_usa_land_rc_6","rhs_usa_land_rc_7","rhs_usa_land_rc_7"];

// SUPPORT CLASSES
SUPPORT_ARTILLERY_CLASS = "RHS_M119_D";
SUPPORT_BOMBING_AIRCRAFT_CLASS = "RHS_A10";
SUPPORT_CAS_HELI_CLASS = "UK3CB_BAF_Apache_AH1_CAS_MTP";
SUPPORT_DROP_AIRCRAFT_CLASS = "RHS_C130J";
SUPPORT_TRANSPORT_CHOPPER_CLASS = "UK3CB_BAF_Merlin_HC3_18_GPMG_MTP";
SUPPORT_MEDEVAC_CHOPPER_CLASS = "UK3CB_BAF_Merlin_HC3_18_GPMG_MTP";
SUPPORT_MEDEVAC_CREW_CLASS = "UK3CB_BAF_Medic_MTP_RM_H";
SUPPORT_DRONE_CLASS = "B_UAV_02_dynamicLoadout_F";

//FRIENDLIES
ALLIED_LIST_UNITS = ["UK3CB_TKA_B_RIF_2","UK3CB_TKA_B_MK","UK3CB_TKA_B_STATIC_GUN_KORD","UK3CB_TKA_B_STATIC_GUN_NSV","UK3CB_TKA_B_GL","UK3CB_TKA_B_DEM","UK3CB_TKA_B_AR","UK3CB_TKA_B_AT","UK3CB_TKA_B_GL","UK3CB_TKA_B_MD","UK3CB_TKA_B_TL"]; //Units of your side
ALLIED_LIST_CARS = ["rhs_tigr_sts_3camo_vmf"]; //Friendly cars
FRIENDLY_FLAG = "Flag_AFG_13";//Flag of your side

//CIVILIAN
SIDE_CIV = CIVILIAN; // Side civilian
CIV_LIST_UNITS = ["UK3CB_TKC_C_CIV"];
CIV_LIST_CARS = ["UK3CB_TKC_C_Ikarus","UK3CB_TKC_C_Datsun_Civ_Closed","UK3CB_TKC_C_Datsun_Civ_Open","UK3CB_TKC_C_Hatchback","UK3CB_TKC_C_Hilux_Civ_Open","UK3CB_TKC_C_Kamaz_Covered","UK3CB_TKC_C_Lada","UK3CB_TKC_C_Lada_Taxi","UK3CB_TKC_C_LR_Closed","UK3CB_TKC_C_LR_Open","UK3CB_TKC_C_V3S_Reammo","UK3CB_TKC_C_V3S_Refuel","UK3CB_TKC_C_V3S_Repair","UK3CB_TKC_C_V3S_Open","UK3CB_TKC_C_Sedan","UK3CB_TKC_C_Skoda","UK3CB_TKC_C_S1203","UK3CB_TKC_C_Tractor_Old","UK3CB_TKC_C_UAZ_Closed","UK3CB_TKC_C_UAZ_Open","UK3CB_TKC_C_Gaz24"];
HUMANITAR_LIST_CARS = ["LOP_UN_Ural","LOP_UN_Offroad","LOP_UN_UAZ"];
HUMANITAR_LIST_UNITS = ["C_IDAP_Man_AidWorker_06_F","C_IDAP_Man_AidWorker_05_F","C_IDAP_Man_AidWorker_01_F","C_IDAP_Man_AidWorker_08_F","C_IDAP_Man_UAV_06_medical_F","C_IDAP_Man_EOD_01_F","C_IDAP_Man_AidWorker_03_F"];
MAX_RANDOM_CIVILIAN = 7;
MAX_SHEEP_HERD = 2; //Number of sheep herd
RATIO_POPULATION =  .1; //Number of unit per building. 0.4 default
RATIO_CARS =  .04; //Number of empty cars spawned in a city by buidling
PERCENTAGE_FRIENDLIES = 30; //Percentage friendly spawn in patrol
PERCENTAGE_CIVILIAN = 60; //Percentage civilian in a block
PERCENTAGE_ENEMIES = 40; //Percentage enemies
PERCENTAGE_INSURGENTS = 50; //Percentage of potential insurgents in the civilians. If the civilian are attacked they might join the east or west wether the shot are coming from (And with probabilities rules...)
PERCENTAGE_FRIENDLY_INSURGENTS = 50; //Percentage of potential insurgents joining the west.
PERCENTAGE_SUSPECT = ((PERCENTAGE_INSURGENTS * PERCENTAGE_FRIENDLY_INSURGENTS)/100);

//ENEMIES
SIDE_ENEMY = EAST; //Enemy side 
AI_SKILLS = 1; //Skills units
PATROL_SIZE = [2,2]; //Size of patrol => [minimum,random additionnals units]
MAX_SPAWNED_UNITS = 60; //Max units to spawn
MAX_CHASERS = 10; //Max hunters who are looking for you !
MAX_RANDOM_PATROL = 12; //Number of units patroling around the player at the same time
MAX_RANDOM_CAR = 2; //Max car spawned.
NUMBER_CHOPPERS = 0; // Number of choppers
ENEMY_LIST_UNITS = ["UK3CB_TKM_O_WAR","UK3CB_TKM_O_TL","UK3CB_TKM_O_SNI","UK3CB_TKM_O_SL","UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_MD","UK3CB_TKM_O_MG","UK3CB_TKM_O_MG_ASST","UK3CB_TKM_O_IED","UK3CB_TKM_O_ENG","UK3CB_TKM_O_DEM","UK3CB_TKM_O_AR","UK3CB_TKM_O_AT_ASST","UK3CB_TKM_O_AT","UK3CB_TKM_O_AA","UK3CB_TKM_O_AA_ASST","UK3CB_TKM_O_LAT","UK3CB_TKM_O_GL"];
ENEMY_SNIPER_UNITS = ["UK3CB_TKM_O_SNI","UK3CB_TKM_O_SPOT"];
ENEMY_LIST_CARS = ["UK3CB_TKM_O_Hilux_GMG","UK3CB_TKM_O_Datsun_Open","UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_GMG","UK3CB_TKM_O_Hilux_Dshkm","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_Hilux_Spg9","UK3CB_TKM_O_LR_Closed","UK3CB_TKM_O_LR_AGS30","UK3CB_TKM_O_LR_M2","UK3CB_TKM_O_LR_SF_AGS30","UK3CB_TKM_O_V3S_Reammo","UK3CB_TKM_O_UAZ_AGS30","UK3CB_TKM_O_UAZ_Closed","UK3CB_TKM_O_UAZ_Dshkm","UK3CB_TKM_O_BTR40_MG","UK3CB_TKM_O_UAZ_SPG9"];
ENEMY_CHOPPERS = ["UK3CB_TKA_O_UH1H_M240"];
ENEMY_ATTACHEDLIGHT_CLASS =  "rhs_acc_2dpZenit"; //default : "acc_flashlight"
ENEMY_MORTAR_CLASS = "UK3CB_TKM_O_2b14_82mm"; //Mortar class
NUMBER_TANKS = 10; //Number of tanks
ENEMY_LIST_TANKS = ["UK3CB_TKM_O_T34","UK3CB_TKM_O_T55"]; //Tanks
ENEMY_COMMANDER_CLASS = "UK3CB_TKM_O_WAR"; //commander
ENEMY_CONVOY_CAR_CLASS = "UK3CB_TKM_O_Datsun_Pkm"; //commander
ENEMY_CONVOY_TRUCK_CLASS = "UK3CB_TKM_O_V3S_Closed"; //commander
ENEMY_OFFICER_LIST_CARS = ["UK3CB_TKM_O_BTR60","UK3CB_TKM_O_MTLB_PKT"];  //car list used by officer