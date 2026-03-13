global function ccmuSettings_Init

const array<string> convars = [
	// "cv_ccmu_messageColor_",
	"cv_ccmu_playerNameColor_",
	// "cv_ccmu_playerTagColor_",
	// "cv_ccmu_playerSeperatorColor_"
]

const array<string> tones = [ 
	"None"
	"Generic",
	"[[BIG SHOT]]",
	"sans.",
	"arabic skull keyboard",
	"Dial",
	"iOS keyboard" 
]

const array<string> boolEnum 		= [ "Off", "On" ]
const vector 		colorEnabled	= < 255, 255, 255 >
const vector 		colorDisabled 	= < 150, 150, 150 >

void function ccmuSettings_Init(){
	ModSettings_AddModTitle(
		format( "^FFFFFF00[ccmu] %s ^FFFFFF00+ %s",
			formatSettingColor( convars.getrandom() + "friendly",   "Colorchat" ),
			formatSettingColor( convars.getrandom() + "opp",     	"MentionedU" )
		)
	)

	ModSettings_AddModCategory( formatToggleColor( 							"cv_ccmu_colorchat_enabled", 										" > Colorchat : Settings" ) )
	AddConVarSettingEnum(       "cv_ccmu_colorchat_enabled",                formatToggleColor( 		"cv_ccmu_colorchat_enabled", 				"Enabled" ),		    boolEnum )

	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_t_enabled", 						" > Colorchat : Teamchat" ) )
	AddConVarSettingEnum(       "cv_ccmu_t_enabled",		               	formatToggleColor( 		"cv_ccmu_t_enabled", 						"Enabled" ),		    boolEnum )
	ModSettings_AddButton(      "[Randomize]", 					    		void function():(){		randomizeConfig( "t" ) } )
	ModSettings_AddSetting(     "cv_ccmu_playerTagColor_t",               	formatSettingColor(     "cv_ccmu_playerTagColor_t",               	"Network tag color" ),  "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerNameColor_t",              	formatSettingColor(     "cv_ccmu_playerNameColor_t",              	"Playername color" ),   "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperatorColor_t",         	formatSettingColor(     "cv_ccmu_playerSeperatorColor_t",         	"Seperator color" ),    "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperator_t",              	"Seperator",                                                                      			"string" )
	ModSettings_AddSetting(     "cv_ccmu_messageColor_t",                 	formatSettingColor(     "cv_ccmu_messageColor_t",                 	"Message color" ),      "string" )

	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_f_enabled", 						" > Colorchat : Allies" ) )
	AddConVarSettingEnum(       "cv_ccmu_f_enabled",                 		formatToggleColor( 		"cv_ccmu_f_enabled", 						"Enabled" ),			boolEnum )
	ModSettings_AddButton(      "[Randomize]",                      		void function():(){ 	randomizeConfig( "friendly" ) } )
	ModSettings_AddSetting(     "cv_ccmu_playerTagColor_friendly",          formatSettingColor(     "cv_ccmu_playerTagColor_friendly",          "Network tag color" ),  "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerNameColor_friendly",         formatSettingColor(     "cv_ccmu_playerNameColor_friendly",         "Playername color" ),   "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperatorColor_friendly",    formatSettingColor(     "cv_ccmu_playerSeperatorColor_friendly",    "Seperator color" ),    "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperator_friendly",         "Seperator",                                                                        		"string" )
	ModSettings_AddSetting(     "cv_ccmu_messageColor_friendly",            formatSettingColor(     "cv_ccmu_messageColor_friendly",            "Message color" ),      "string" )

	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_o_enabled", 						" > Colorchat : Enemies" ) )
	AddConVarSettingEnum(       "cv_ccmu_o_enabled",                 		formatToggleColor( 		"cv_ccmu_o_enabled", 						"Enabled" ),			boolEnum )
	ModSettings_AddButton(      "[Randomize]", 					    		void function():(){		randomizeConfig( "opp" ) } )
	ModSettings_AddSetting(     "cv_ccmu_playerTagColor_opp",               formatSettingColor(     "cv_ccmu_playerTagColor_opp",               "Network tag color" ),  "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerNameColor_opp",              formatSettingColor(     "cv_ccmu_playerNameColor_opp",              "Playername color" ),   "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperatorColor_opp",         formatSettingColor(     "cv_ccmu_playerSeperatorColor_opp",         "Seperator color" ),    "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperator_opp",              "Seperator",                                                                        		"string" )
	ModSettings_AddSetting(     "cv_ccmu_messageColor_opp",                 formatSettingColor(     "cv_ccmu_messageColor_opp",                 "Message color" ),      "string" )
	
	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_s_enabled", 						" > Colorchat : Self" ) )
	AddConVarSettingEnum(       "cv_ccmu_s_enabled",		               	formatToggleColor( 		"cv_ccmu_s_enabled", 						"Enabled" ),		   	boolEnum )
	ModSettings_AddButton(      "[Randomize]", 					    		void function():(){		randomizeConfig( "s" ) } )
	ModSettings_AddSetting(     "cv_ccmu_playerTagColor_s",               	formatSettingColor(     "cv_ccmu_playerTagColor_s",               	"Network tag color" ),  "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerNameColor_s",              	formatSettingColor(     "cv_ccmu_playerNameColor_s",              	"Playername color" ),   "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperatorColor_s",         	formatSettingColor(     "cv_ccmu_playerSeperatorColor_s",         	"Seperator color" ),    "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperator_s",              	"Seperator",                                                                      			"string" )
	ModSettings_AddSetting(     "cv_ccmu_messageColor_s",                 	formatSettingColor(     "cv_ccmu_messageColor_s",                 	"Message color" ),      "string" )
	
	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_party_enabled", 					" > Colorchat : Party members" ) )
	AddConVarSettingEnum(       "cv_ccmu_party_enabled",		            formatToggleColor( 		"cv_ccmu_party_enabled", 					"Enabled" ),			boolEnum )
	ModSettings_AddButton(      "[Randomize]", 					    		void function():(){		randomizeConfig( "party" ) } )
	ModSettings_AddSetting(     "cv_ccmu_playerTagColor_party",             formatSettingColor(     "cv_ccmu_playerTagColor_party",             "Network tag color" ),	"string" )
	ModSettings_AddSetting(     "cv_ccmu_playerNameColor_party",            formatSettingColor(     "cv_ccmu_playerNameColor_party",            "Playername color" ), 	"string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperatorColor_party",       formatSettingColor(     "cv_ccmu_playerSeperatorColor_party",       "Seperator color" ),  	"string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperator_party",            "Seperator",                                                                        		"string" )
	ModSettings_AddSetting(     "cv_ccmu_messageColor_party",               formatSettingColor(     "cv_ccmu_messageColor_party",               "Message color" ),    	"string" )
	
	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_ea_enabled", 						" > Colorchat : Friends" ) )  
	AddConVarSettingEnum(       "cv_ccmu_ea_enabled",		               	formatToggleColor( 		"cv_ccmu_ea_enabled", 						"Enabled" ),		    boolEnum )
	ModSettings_AddButton(      "[Randomize]", 					    		void function():(){		randomizeConfig( "ea" ) } )
	ModSettings_AddSetting(     "cv_ccmu_playerTagColor_ea",               	formatSettingColor(     "cv_ccmu_playerTagColor_ea",               	"Network tag color" ),  "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerNameColor_ea",              	formatSettingColor(     "cv_ccmu_playerNameColor_ea",              	"Playername color" ),   "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperatorColor_ea",         	formatSettingColor(     "cv_ccmu_playerSeperatorColor_ea",         	"Seperator color" ),    "string" )
	ModSettings_AddSetting(     "cv_ccmu_playerSeperator_ea",              	"Seperator",                                                                       			"string" )
	ModSettings_AddSetting(     "cv_ccmu_messageColor_ea",                 	formatSettingColor(     "cv_ccmu_messageColor_ea",                 	"Message color" ),      "string" )
	
	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_prefixes_enabled", 				" > Prefixes : Settings" ) )
	AddConVarSettingEnum(       "cv_ccmu_prefixes_enabled",                 formatToggleColor( 		"cv_ccmu_prefixes_enabled", 				"Enabled" ),			boolEnum )
	ModSettings_AddSetting(     "cv_ccmu_prefix_team",                		formatSettingColor( 	"cv_ccmu_playerNameColor_t", 				"Teamchat" ),           "string" )
	ModSettings_AddSetting(     "cv_ccmu_prefix_friendly",                	formatSettingColor( 	"cv_ccmu_playerNameColor_friendly", 		"Allies" ),             "string" )
	ModSettings_AddSetting(     "cv_ccmu_prefix_opp",                		formatSettingColor( 	"cv_ccmu_playerNameColor_opp", 				"Opponents" ),          "string" )
	ModSettings_AddSetting(     "cv_ccmu_prefix_s",                			formatSettingColor( 	"cv_ccmu_playerNameColor_s", 				"Self" ),               "string" )
	ModSettings_AddSetting(     "cv_ccmu_prefix_party",                		formatSettingColor( 	"cv_ccmu_playerNameColor_party", 			"Party" ),              "string" )
	ModSettings_AddSetting(     "cv_ccmu_prefix_ea",                		formatSettingColor( 	"cv_ccmu_playerNameColor_ea", 				"Friends" ),            "string" )
	
	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_show_nettags", 					" > Network tags : Settings" ) )  
	AddConVarSettingEnum(       "cv_ccmu_show_nettags",                 	formatToggleColor( 		"cv_ccmu_show_nettags", 					"Show network tags" ),	boolEnum )
	AddConVarSettingEnum(     	"cv_ccmu_show_nettag_team",               	formatToggleColor( 		"cv_ccmu_show_nettag_team", 				"Teamchat" ),			boolEnum )
	AddConVarSettingEnum(     	"cv_ccmu_show_nettag_friendly",           	formatToggleColor( 		"cv_ccmu_show_nettag_friendly", 			"Allies" ),				boolEnum )
	AddConVarSettingEnum(     	"cv_ccmu_show_nettag_opp",                	formatToggleColor( 		"cv_ccmu_show_nettag_opp", 					"Opponents" ),			boolEnum )
	AddConVarSettingEnum(     	"cv_ccmu_show_nettag_s",                	formatToggleColor( 		"cv_ccmu_show_nettag_s", 					"Self" ),				boolEnum )
	AddConVarSettingEnum(     	"cv_ccmu_show_nettag_party",              	formatToggleColor( 		"cv_ccmu_show_nettag_party", 				"Party" ),				boolEnum )
	AddConVarSettingEnum(     	"cv_ccmu_show_nettag_ea",                	formatToggleColor( 		"cv_ccmu_show_nettag_ea", 					"Friends" ),			boolEnum )
	
	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_notifier_enabled", 				" > MentionedU : Settings" ) )
	AddConVarSettingEnum(       "cv_ccmu_notifier_enabled",                 formatToggleColor( 		"cv_ccmu_notifier_enabled", 				"Enabled" ),		   	boolEnum )
	AddConVarSettingEnum(       "cv_ccmu_play_mention_sound",               formatToggleColor( 		"cv_ccmu_play_mention_sound", 				"Mention sound" ),		boolEnum )

	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_notifier_enabled", 				" > MentionedU : Config" )  )
	ModSettings_AddSetting(     "cv_ccmu_notifier_tag",                     "Tag",                                                                              		"string" )
	ModSettings_AddSetting(     "cv_ccmu_notifier_tag_color",               formatSettingColor(     "cv_ccmu_notifier_tag_color",               "Tag color" ),          "string" )
	ModSettings_AddSetting(     "cv_ccmu_notifier_keyword_color",           formatSettingColor(     "cv_ccmu_notifier_keyword_color",           "Keyword color" ),      "string" )
	ModSettings_AddSetting(     "cv_ccmu_notifier_keywords",                "Keywords (Comma-seperated, case-insensitive)",                                   			"string" )

	ModSettings_AddModCategory( 											formatToggleColor( 		"cv_ccmu_dynamic_chat_enabled", 			" > Dynamic chat : Settings" ) ) 
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_enabled",             formatToggleColor( 		"cv_ccmu_dynamic_chat_enabled", 			"Enabled" ),		   	boolEnum )
	ModSettings_AddSetting(     "cv_ccmu_dynamic_chat_speed",               "Speed",                                                                            		"float" )
	
	ModSettings_AddModCategory(												formatToggleColor( 		"cv_ccmu_dynamic_chat_tone_enabled", 		" > Dynamic chat : Sounds" ) )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_enabled",        formatToggleColor( 		"cv_ccmu_dynamic_chat_tone_enabled", 		"Enabled" ),		   	boolEnum )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_team",           formatSettingColor( 	"cv_ccmu_playerNameColor_t", 				"Teamchat" ), 			tones )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_friendly",       formatSettingColor( 	"cv_ccmu_playerNameColor_friendly", 		"Allies" ),   			tones )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_opp",           	formatSettingColor( 	"cv_ccmu_playerNameColor_opp", 				"Opponents" ),			tones )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_s",           	formatSettingColor( 	"cv_ccmu_playerNameColor_s", 				"Self" ),     			tones )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_party",          formatSettingColor( 	"cv_ccmu_playerNameColor_party", 			"Party" ),    			tones )
	AddConVarSettingEnum(       "cv_ccmu_dynamic_chat_tone_ea",           	formatSettingColor( 	"cv_ccmu_playerNameColor_ea", 				"Friends" ),  			tones )
}

void function randomizeConfig( string category ){
	try{
        bool isCatEnabled = GetConVarBool( category + "_enabled" )
		if( !isCatEnabled ){
			EmitUISound( "CoOp_SentryGun_DeploymentDeniedBeep" )
			return
		}
    } catch( exception ) {} 

	EmitUISound( "UI_InGame_FD_MetaUpgradeTextAppear" )

	foreach( convar in convars )
		SetConVarString( convar + category, randomVec() )
}

string function randomVec(){
	int x = RandomInt( 255 ) // 0 - 254
	int y = RandomInt( 255 ) // 0 - 254
	int z = RandomInt( 255 ) // 0 - 254

	return format( "%i %i %i", x, y, z )
}

string function formatSettingColor( string convar, string text ){
    string          color           = GetConVarString( format( "%s", convar ) )

	if( text.len() == 0 )
		return "^FFFFFF00" + text + " ^FF000000[WRONG FORMAT]" 
    if( color == "rgb" )
        return dtool_rainbowModText( text )
    if( color.slice( 0, 1 ) == "f" )
        return dtool_fadeModText( text, color )

    array<string>   toVector        = split( color, " " )
    if( toVector.len() != 3 )
        return "^FFFFFF00" + text + " ^FF000000[WRONG FORMAT]" 

    vector          colorVector     = < toVector[0].tofloat(), toVector[1].tofloat(), toVector[2].tofloat() >

    return format( "^%s00%s", dtool_RGBtoHEX( colorVector ), text )
}

string function formatToggleColor( string convar, string text ){
	bool enabled = GetConVarBool( format( "%s", convar ) )
	
	if( enabled && convar == "cv_ccmu_dynamic_chat_tone_enabled" )
		enabled = GetConVarBool( "cv_ccmu_dynamic_chat_enabled" )

	return format( "^%s00%s", dtool_RGBtoHEX( ( enabled ? colorEnabled : colorDisabled ) ), text )
}