untyped
global function ccmu_Init

bool            	notifier_enabled
bool            	colorchat_enabled

bool            	dynamic_chat_enabled
float           	dynamic_chat_speed
float 				dynamic_chat_fxstep
bool 				dynamic_chat_tone_enabled
string	        	dynamic_chat_tone
int 				dynamic_chat_totalFX

bool				f_enabled
string          	f_messageColor
string          	f_nameColor
string          	f_tagColor
string          	f_seperatorColor
string          	f_seperator

bool				o_enabled
string          	o_messageColor
string          	o_nameColor
string          	o_tagColor
string          	o_seperatorColor
string          	o_seperator

bool 				party_enabled
string          	p_messageColor
string          	p_nameColor
string          	p_tagColor
string          	p_seperatorColor
string          	p_seperator

bool 				ea_enabled
string          	ea_messageColor
string          	ea_nameColor
string          	ea_tagColor
string          	ea_seperatorColor
string          	ea_seperator

bool 				s_enabled
string         		s_messageColor
string         		s_nameColor
string         		s_tagColor
string         		s_seperatorColor
string         		s_seperator

bool 				t_enabled
string          	t_messageColor
string          	t_nameColor
string          	t_tagColor
string          	t_seperatorColor
string          	t_seperator

bool            	n_playMentionSound
array<string>   	n_keywords
string          	n_tag
string          	n_tagColor
string          	n_keywordColor
bool            	n_isCaseSensitive

bool 				prefixes_enabled
string				prefix_s
string				prefix_party
string				prefix_ea
string				prefix_friendly
string				prefix_opp
string				prefix_team

bool			 	show_nettags
bool			 	show_nettag_s			
bool			 	show_nettag_party		
bool			 	show_nettag_ea			
bool			 	show_nettag_friendly
bool			 	show_nettag_opp			
bool			 	show_nettag_team		

const string 		fallback_friendlyColor   	= "\x1b[38;2;52;234;254m"
const string 		fallback_enemyColor      	= "\x1b[38;2;231;82;6m" 
const string 		fallback_messageColor    	= "\x1b[38;2;222;222;222m" 

int 				teamNum 					= 0
int             	message_buffer 				= 0

const array<string> tones 						= [ "none", "gen", "spam", "sans", "arab", "dial", "ios" ]

void function getConfig(){
	colorchat_enabled       			= GetConVarBool(      "cv_ccmu_colorchat_enabled" )
	if( colorchat_enabled ){

		f_enabled						= GetConVarBool(      "cv_ccmu_f_enabled" )
		if( f_enabled ){
			f_messageColor          	= parseColor(         GetConVarString( "cv_ccmu_messageColor_friendly" ))
			f_nameColor             	= parseColor(         GetConVarString( "cv_ccmu_playerNameColor_friendly" ))
			f_tagColor              	= parseColor(         GetConVarString( "cv_ccmu_playerTagColor_friendly" ))
			f_seperatorColor        	= parseColor(         GetConVarString( "cv_ccmu_playerSeperatorColor_friendly" ))
			f_seperator             	= GetConVarString(    "cv_ccmu_playerSeperator_friendly" )
		} else {
			f_messageColor  			= fallback_messageColor
			f_nameColor     			= fallback_friendlyColor
			f_tagColor      			= fallback_friendlyColor
			f_seperatorColor			= fallback_friendlyColor
			f_seperator     			= ": "
		}

		o_enabled						= GetConVarBool(      "cv_ccmu_o_enabled" ) 						
		if( o_enabled ){
			o_messageColor          	= parseColor(         GetConVarString( "cv_ccmu_messageColor_opp" ))
			o_nameColor             	= parseColor(         GetConVarString( "cv_ccmu_playerNameColor_opp" ))
			o_tagColor              	= parseColor(         GetConVarString( "cv_ccmu_playerTagColor_opp" ))
			o_seperatorColor        	= parseColor(         GetConVarString( "cv_ccmu_playerSeperatorColor_opp" ))
			o_seperator             	= GetConVarString(    "cv_ccmu_playerSeperator_opp" )
		} else {
			o_messageColor  			= fallback_messageColor
			o_nameColor     			= fallback_enemyColor
			o_tagColor      			= fallback_enemyColor
			o_seperatorColor			= fallback_enemyColor
			o_seperator     			= ": "
		}

		party_enabled					= GetConVarBool(      "cv_ccmu_party_enabled" )
		if( party_enabled ){
			p_messageColor				= parseColor(         GetConVarString( "cv_ccmu_messageColor_party" ))
			p_nameColor					= parseColor(         GetConVarString( "cv_ccmu_playerNameColor_party" ))
			p_tagColor					= parseColor(         GetConVarString( "cv_ccmu_playerTagColor_party" ))
			p_seperatorColor			= parseColor(         GetConVarString( "cv_ccmu_playerSeperatorColor_party" ))	
			p_seperator					= GetConVarString(    "cv_ccmu_playerSeperator_party" )
		}

		ea_enabled						= GetConVarBool(      "cv_ccmu_ea_enabled" )
		if( ea_enabled ){
			ea_messageColor				= parseColor(         GetConVarString( "cv_ccmu_messageColor_ea" ))
			ea_nameColor				= parseColor(         GetConVarString( "cv_ccmu_playerNameColor_ea" ))
			ea_tagColor					= parseColor(         GetConVarString( "cv_ccmu_playerTagColor_ea" ))
			ea_seperatorColor			= parseColor(         GetConVarString( "cv_ccmu_playerSeperatorColor_ea" ))
			ea_seperator				= GetConVarString(    "cv_ccmu_playerSeperator_ea" )
		}

		s_enabled						= GetConVarBool(      "cv_ccmu_s_enabled" )
		if( s_enabled ){
			s_messageColor				= parseColor(         GetConVarString( "cv_ccmu_messageColor_s" ))
			s_nameColor					= parseColor(         GetConVarString( "cv_ccmu_playerNameColor_s" ))
			s_tagColor					= parseColor(         GetConVarString( "cv_ccmu_playerTagColor_s" ))
			s_seperatorColor			= parseColor(         GetConVarString( "cv_ccmu_playerSeperatorColor_s" ))
			s_seperator					= GetConVarString(    "cv_ccmu_playerSeperator_s" )
		}

		t_enabled						= GetConVarBool(      "cv_ccmu_t_enabled" )
		if( t_enabled ){
			t_messageColor				= parseColor(         GetConVarString( "cv_ccmu_messageColor_t" ))
			t_nameColor					= parseColor(         GetConVarString( "cv_ccmu_playerNameColor_t" ))
			t_tagColor					= parseColor(         GetConVarString( "cv_ccmu_playerTagColor_t" ))
			t_seperatorColor			= parseColor(         GetConVarString( "cv_ccmu_playerSeperatorColor_t" ))
			t_seperator					= GetConVarString(    "cv_ccmu_playerSeperator_t" )
		} else {
			t_messageColor				= fallback_messageColor
			t_nameColor					= fallback_friendlyColor
			t_tagColor					= fallback_friendlyColor
			t_seperatorColor			= fallback_friendlyColor
			t_seperator					= ": " 
		}
	}

	notifier_enabled        		= GetConVarBool(      "cv_ccmu_notifier_enabled" )
	if( notifier_enabled ){
		n_playMentionSound      	= GetConVarBool(      "cv_ccmu_play_mention_sound" )
		n_tag                   	= GetConVarString(    "cv_ccmu_notifier_tag" )
		n_keywords              	= split(              GetConVarString( "cv_ccmu_notifier_keywords" ), "," )
		n_tagColor              	= parseColor(         GetConVarString( "cv_ccmu_notifier_tag_color" ))
		n_keywordColor          	= parseColor(         GetConVarString( "cv_ccmu_notifier_keyword_color" ))
	}

	dynamic_chat_enabled    		= GetConVarBool(      "cv_ccmu_dynamic_chat_enabled" )
	if( dynamic_chat_enabled ){
		dynamic_chat_speed      	= GetConVarFloat(     "cv_ccmu_dynamic_chat_speed" )
		dynamic_chat_tone_enabled 	= GetConVarBool( 	  "cv_ccmu_dynamic_chat_tone_enabled" )
		dynamic_chat_fxstep 		= ceil( 0.1 / dynamic_chat_speed )
	}

	prefixes_enabled				= GetConVarBool( 	  "cv_ccmu_prefixes_enabled" )
	if( prefixes_enabled ){
		prefix_s					= GetConVarString(    "cv_ccmu_prefix_s" )
		prefix_party				= GetConVarString(    "cv_ccmu_prefix_party" )
		prefix_ea					= GetConVarString(    "cv_ccmu_prefix_ea" )
		prefix_friendly				= GetConVarString(    "cv_ccmu_prefix_friendly" )
		prefix_opp					= GetConVarString(    "cv_ccmu_prefix_opp" )
		prefix_team					= GetConVarString(    "cv_ccmu_prefix_team" )
	}

	show_nettags					= GetConVarBool( 	  "cv_ccmu_show_nettags" )
	if( show_nettags ){
		show_nettag_s				= GetConVarBool(      "cv_ccmu_show_nettag_s" )
		show_nettag_party			= GetConVarBool(      "cv_ccmu_show_nettag_party" )
		show_nettag_ea				= GetConVarBool(      "cv_ccmu_show_nettag_ea" )
		show_nettag_friendly		= GetConVarBool(      "cv_ccmu_show_nettag_friendly" )
		show_nettag_opp				= GetConVarBool(      "cv_ccmu_show_nettag_opp" )
		show_nettag_team			= GetConVarBool(      "cv_ccmu_show_nettag_team" )
	}
}

void function setTotalFX(){
	switch( dynamic_chat_tone ){
		case "none":
			dynamic_chat_totalFX = 0
			break
		case "gen":
		case "spam":
			dynamic_chat_totalFX = 1
			break
		case "ios":
			dynamic_chat_totalFX = 2
			break
		case "sans":
		case "arab":
			dynamic_chat_totalFX = 4
			break
		case "dial":
			dynamic_chat_totalFX = 6
			break
	}
}

void function ccmu_Init(){
	#if HAS_TOOLS
		//getConfig() // Load config only once every game (less performance heavy, less flexible)
		dtool_loadFriendsAndParty()
		AddCallback_OnReceivedSayTextMessage( colorchatMU )
		thread setTeamNum()
	#else 
		printt( "[ccmu] Missing dependencies: drachenfruchl.tools" )
	#endif
}

void function setTeamNum(){
	while( GetLocalClientPlayer() == null )
		WaitFrame()
	teamNum = GetLocalClientPlayer().GetTeam()
}

ClClient_MessageStruct function colorchatMU( ClClient_MessageStruct ms ){
	getConfig() // Load config on every new message (more performance heavy, more flexible)
	
	if( 
		!notifier_enabled && 
		!dynamic_chat_enabled && 
		!colorchat_enabled && 
		!prefixes_enabled && 
		!show_nettags 
	) return ms

	// hide xcp messages
	var posStartIndex = ms.message.find( "<" )
	var posEndIndex = ms.message.find( ">" )
	bool isMsgXCP = ( 
		ms.message.find( "xcp@" ) != null &&
		posStartIndex != null && 	
		posEndIndex != null 
	)

	if( isMsgXCP )
		return ms

	while( message_buffer > 0 ) 
		WaitFrame()
	message_buffer++

	string          format_msg

	array<string>   nameparts       	= seperateName( ms.playerName )
	string          playerTag       	= nameparts[ 0 ]
	string          playerUsername  	= nameparts[ 1 ]

	bool 			isSelf				= s_enabled 			? ms.player == GetLocalClientPlayer() 									  		: false
	bool 			isFriend			= ea_enabled 			? dtool_isFriend( playerUsername ) 											  	: false
	bool 			inParty				= party_enabled  		? ms.player == GetLocalClientPlayer() ? false : dtool_inParty( playerUsername ) : false
	bool 			isTeamchat			= t_enabled 			? ms.isTeam 															  		: false
	bool            isFriendly      	= IsValid( ms.player ) 	? teamNum == ms.player.GetTeam() 												: false

	dynamic_chat_tone = "none"
	if( dynamic_chat_enabled && dynamic_chat_tone_enabled ){
		string tone = isSelf ? "s" : inParty ? "party" : isFriend ? "ea" : ms.isTeam ? "team" : isFriendly ? "friendly" : "opp"
		dynamic_chat_tone = tones[ GetConVarInt( "cv_ccmu_dynamic_chat_tone_" + tone ) ]
	}
	setTotalFX()

	string          rawMessage      	= ms.message
	bool            mentioned       	= false

	string          messageColor
	string          nameColor
	string          tagColor
	string          seperatorColor
	string          seperator

	if( colorchat_enabled ){
		messageColor                    = isSelf ? s_messageColor  	: inParty ? p_messageColor 		: isFriend ? ea_messageColor 	: isTeamchat ? t_messageColor  	: isFriendly ? f_messageColor   : o_messageColor
		nameColor                       = isSelf ? s_nameColor      : inParty ? p_nameColor      	: isFriend ? ea_nameColor      	: isTeamchat ? t_nameColor      : isFriendly ? f_nameColor      : o_nameColor
		tagColor                        = isSelf ? s_tagColor       : inParty ? p_tagColor       	: isFriend ? ea_tagColor       	: isTeamchat ? t_tagColor       : isFriendly ? f_tagColor       : o_tagColor
		seperatorColor                  = isSelf ? s_seperatorColor : inParty ? p_seperatorColor 	: isFriend ? ea_seperatorColor 	: isTeamchat ? t_seperatorColor : isFriendly ? f_seperatorColor : o_seperatorColor
		seperator                       = isSelf ? s_seperator      : inParty ? p_seperator      	: isFriend ? ea_seperator      	: isTeamchat ? t_seperator      : isFriendly ? f_seperator      : o_seperator
	} else {
		messageColor                    = fallback_messageColor
		nameColor                       = isFriendly ? fallback_friendlyColor : fallback_enemyColor
		tagColor                        = isFriendly ? fallback_friendlyColor : fallback_enemyColor
		seperatorColor                  = isFriendly ? fallback_friendlyColor : fallback_enemyColor
		seperator                       = ": "
	}

	if( notifier_enabled ){
		if( ms.player != GetLocalClientPlayer() ){
			foreach( keyword in n_keywords ){
				if( keyword.find( "<key>" ) != null ) 
					continue
				if( ms.message.tolower().find( keyword.tolower() ) != null ){
					rawMessage = replaceMessage( rawMessage, keyword, messageColor )
					mentioned = true
					//break
				}
			}

			if( 
				n_playMentionSound && 
				( 
					mentioned || 
					ms.message.tolower().find( GetLocalClientPlayer().GetPlayerName().tolower() ) != null 
				) 
			){
				GetLocalClientPlayer().ClientCommand( "playvideo mentionsound 1 1" )
				// if( GetMapName() != "mp_lobby" )
				// 	SetTimedEventNotification( 2.0, format( "@%s mentionedU", playerUsername ) )
			}
		}
	}

	string 	totalTag 	= ""
	bool 	showTag 	= true

	// totalTag += IsValid( ms.player ) ? format( "[%.2f] ", ( ms.player.GetPlayerGameStat( PGS_DEATHS ) == 0 ? ms.player.GetPlayerGameStat( PGS_KILLS ) : ms.player.GetPlayerGameStat( PGS_KILLS ).tofloat() / ms.player.GetPlayerGameStat( PGS_DEATHS ).tofloat() ) ) : "[?.??] "

	if( ms.isTeam ){
		if( prefixes_enabled )
			totalTag += prefix_team
		else
			totalTag += "[TEAM] "
	}

	if( prefixes_enabled ){
		if( isSelf )
			totalTag += prefix_s
		else if( isFriendly )
			totalTag += prefix_friendly	
		else 
			totalTag += prefix_opp

		if( inParty )
			totalTag += prefix_party
			
		if( isFriend )
			totalTag += prefix_ea	
	}

	if( show_nettags ){
		showTag = isSelf ? show_nettag_s : inParty ? show_nettag_party : isFriend ? show_nettag_ea : isTeamchat ? show_nettag_team : isFriendly ? show_nettag_friendly : show_nettag_opp

		if( playerTag != "" && showTag )
			totalTag += playerTag + " "
	}	

	if( mentioned ){
		format_msg = format( "%s[%s] ",
			( n_tagColor        == "rgb" ? rainbowText( n_tag, "" )  : n_tagColor.slice( 0, 1 ) == "f" ? rainbowText( n_tag, n_tagColor.slice( 1 ) ) 	: n_tagColor ),
			( n_tagColor        == "rgb" ? ""                        : n_tagColor.slice( 0, 1 ) == "f" ? "" 										 	: n_tag )
		)
	}

	format_msg += format( "%s%s%s%s%s%s",
		( tagColor        == "rgb" ? rainbowText( totalTag, "" )  		: tagColor.slice( 0, 1 ) == "f" 		? rainbowText( totalTag, tagColor.slice( 1 ) ) 			: tagColor ),
		( tagColor        == "rgb" ? ""                                 : tagColor.slice( 0, 1 ) == "f" 		? "" 													: totalTag ),

		( nameColor       == "rgb" ? rainbowText( playerUsername, "" )  : nameColor.slice( 0, 1 ) == "f" 		? rainbowText( playerUsername, nameColor.slice( 1 ) ) 	: nameColor ),
		( nameColor       == "rgb" ? ""                                 : nameColor.slice( 0, 1 ) == "f" 		? "" 													: playerUsername ),

		( seperatorColor  == "rgb" ? rainbowText( seperator, "" )       : seperatorColor.slice( 0, 1 ) == "f" 	? rainbowText( seperator, seperatorColor.slice( 1 ) ) 	: seperatorColor ),
		( seperatorColor  == "rgb" ? ""                                 : seperatorColor.slice( 0, 1 ) == "f" 	? "" 													: seperator )
	)

	if( dynamic_chat_enabled ){
		Chat_GameWriteLine( format_msg )
		if( messageColor == "rgb" )
			fadeText_anim( rawMessage, "" )
		else if( messageColor.slice( 0, 1 ) == "f" )
			fadeText_anim( rawMessage, messageColor.slice( 1 ) )
		else
			text_anim( rawMessage, messageColor )
	} else {
		if( messageColor == "rgb" )
			format_msg += rainbowText( rawMessage, "" )
		else if( messageColor.slice( 0, 1 ) == "f" )
			format_msg += rainbowText( rawMessage, messageColor.slice( 1 ) )
		else
			format_msg += messageColor + rawMessage
		Chat_GameWriteLine( format_msg )
	}

	ms.shouldBlock = true
	message_buffer--
	return ms
}

string function parseColor( string color ){
	if( color.len() == 0 )
		return "\x1b[0m"
	if( color == "rgb" )
		return "rgb"
	if( color.slice( 0, 1 ) == "f" )
		return color

	array<string>   rgb     = split( color, " " )
	string          color   = "\x1b[38;2;"

	if( rgb.len() != 3 )
		return "\x1b[0m"

	foreach( channel in rgb ) 
		color += int( clamp( channel.tointeger(), 0, 254 ) ) + ";"
	color = color.slice( 0, color.len()-1 ) + "m"

	return color
}

array<string> function seperateName( string playerName ){
	if( playerName.find( " " ) == null ) 
		return [ "", playerName ]

	var     index_seperator = playerName.find( " " )
	string  tag             = playerName.slice( 0, index_seperator )
	string  username        = playerName.slice( index_seperator + 1 )

	return [ tag, username ]
}

string function replaceMessage( string msg, string word, string messageColor ){
	string  lowered     = msg.tolower()
	string  lowerWord   = word.tolower()
	var     index       = lowered.find( lowerWord )

	while( index != null ){
		string  match    = msg.slice( index, index + word.len() )
		string  before   = msg.slice( 0, index )
		string  after    = msg.slice( index + word.len() )

		msg     = before + n_keywordColor + match + ( messageColor != "rgb" && messageColor.slice( 0,1 ) != "f" ? messageColor : "<key>" ) + after
		lowered = msg.tolower()
		index   = lowered.find( lowerWord, index + match.len() + n_keywordColor.len() + ( messageColor != "rgb" && messageColor.slice( 0, 1 ) != "f" ? messageColor.len() : 0 ) )
	}

	return msg
}

void function fadeText_anim( string text, string fadestring ){
	array<string> colors = [
		"254 0 0", "254 127 0", "254 254 0", "127 254 0",
		"0 254 0", "0 254 127", "0 254 254", "0 127 254",
		"0 0 254", "127 0 254", "254 0 254", "254 0 127"
	]

	int 	colorlen 	= colors.len()
	int 	textlen 	= text.len()
	int 	a 			= n_keywordColor.len()
	int 	i 			= 0
	float 	step 		= colorlen.tofloat() / textlen.tofloat()
	vector 	v1 	
	vector  v2

	if( fadestring != "" ){
		array<string> fades = split( fadestring, "," )

		array<string> rgb1 = split( fades[ 0 ], " " )
		v1 = < 
			rgb1[ 0 ].tointeger(), 
			rgb1[ 1 ].tointeger(), 
			rgb1[ 2 ].tointeger() 
		>

		array<string> rgb2 = split( fades[ 1 ], " " )
		v2 = < 
			rgb2[ 0 ].tointeger(), 
			rgb2[ 1 ].tointeger(), 
			rgb2[ 2 ].tointeger() 
		>
	}

	while( i < textlen ){
		if( a > 0 && i + a <= textlen && text.slice( i, i + a ) == n_keywordColor ){
			Chat_GameWrite( n_keywordColor )
			i += a

			var k = text.find( "<key>", i )
			if( k ){
				expect int( k )

				while( i < k ){
					int charLength = dtool_byteSliceLength( text[ i ].tointeger() )

					if( i + charLength <= textlen ){
						Chat_GameWrite( text.slice( i, i + charLength ) )
						dtool_playRandomAudio( dynamic_chat_tone, dynamic_chat_totalFX ) 
						i += charLength
					} 

					wait dynamic_chat_speed
				}
				i = k + 5
			}
			continue
		}

		int charLength = dtool_byteSliceLength( text[ i ].tointeger() )

		if( i + charLength <= textlen ){
			string char = text.slice( i, i + charLength )
			string temp 

			if( fadestring != "" ){
				temp = parseColor( lerp( ( i + charLength ).tofloat(), textlen.tofloat(), v1, v2 ) )
			} else {
				int index = ( step * i ).tointeger() % colorlen
				temp = parseColor( colors[ index ] )
			}

			Chat_GameWrite( temp + char )
			if( i % dynamic_chat_fxstep == 0 ) 
				dtool_playRandomAudio( dynamic_chat_tone, dynamic_chat_totalFX ) 
			i += charLength
		} 

		wait dynamic_chat_speed
	}
}

void function text_anim( string text, string messageColor ){
	Chat_GameWrite( messageColor )

	int a 	= n_keywordColor.len()
	int b 	= messageColor.len()
	int i 	= 0
	int len = text.len()

	while( i < len ){
		if( i + a < len && text.slice( i, i + a ) == n_keywordColor ){
			Chat_GameWrite( n_keywordColor )
			i += a
			continue
		}

		if( i + b <= len && text.slice( i, i + b ) == messageColor ){
			Chat_GameWrite( messageColor )
			i += b
			continue
		}

		int charLength = dtool_byteSliceLength( text[ i ].tointeger() )

		if( i + charLength <= len ){
			Chat_GameWrite( text.slice( i, i + charLength ) )
			if( i % dynamic_chat_fxstep == 0 ) 
				dtool_playRandomAudio( dynamic_chat_tone, dynamic_chat_totalFX ) 
			i += charLength
		} 

		wait dynamic_chat_speed
	}
}

string function rainbowText( string text, string fadestring ){
	array<string> colors = [
		"254 0 0", "254 127 0", "254 254 0", "127 254 0",
		"0 254 0", "0 254 127", "0 254 254", "0 127 254",
		"0 0 254", "127 0 254", "254 0 254", "254 0 127"
	]

	int 		colorlen 	= colors.len()
	int 		textlen 	= text.len()
	string 		result 		= ""
	int 		a 			= n_keywordColor.len()
	int 		i 			= 0
	float		step	 	= colorlen.tofloat() / textlen.tofloat()
	vector 		v1 
	vector 		v2 		

	if( fadestring != "" ){
		array<string> fades = split( fadestring, "," )

		array<string> rgb1 = split( fades[ 0 ], " " )
		v1 = < 
			rgb1[ 0 ].tointeger(), 
			rgb1[ 1 ].tointeger(),
			rgb1[ 2 ].tointeger() 
		>

		array<string> rgb2 = split( fades[ 1 ], " " )
		v2 = < 
			rgb2[ 0 ].tointeger(), 
			rgb2[ 1 ].tointeger(),
			rgb2[ 2 ].tointeger()
		>
	}

	while( i < textlen ){
		if( a > 0 && i + a <= textlen && text.slice( i, i + a ) == n_keywordColor ){
			result += n_keywordColor
			i += a

			var k = text.find( "<key>", i )
			if( k ){
				expect int( k )
				result += text.slice( i, k )
				i = k + 5
			}
			continue
		}

		int charLength = dtool_byteSliceLength( text[ i ].tointeger() )

		if( i + charLength <= textlen ){
			string char = text.slice( i, i + charLength )
			string temp 
		
			if( fadestring != "" ){
				temp = parseColor( lerp( ( i + charLength - 1 ).tofloat(), textlen.tofloat() - 1, v1, v2 ) )
			} else {
				int index = ( step * i ).tointeger() % colorlen
				temp = parseColor( colors[ index ] )
			}

			result += temp + char
			i += charLength
		}
	}

	return result
}

string function lerp( float cur, float max, vector v_start, vector v_end ){
    float t = cur / max
    t = clamp( t, 0.0, 1.0 )

    string toReturn = format( "%i %i %i",
        int( clamp( v_start.x + ( v_end.x - v_start.x ) * t, 0, 254 ) ),
        int( clamp( v_start.y + ( v_end.y - v_start.y ) * t, 0, 254 ) ),
        int( clamp( v_start.z + ( v_end.z - v_start.z ) * t, 0, 254 ) )
	)

	return toReturn
}