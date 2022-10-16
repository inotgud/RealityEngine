// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_Alphabet
#include <Alphabet.h>
#endif
#ifndef INCLUDED_Character
#include <Character.h>
#endif
#ifndef INCLUDED_ChartingState
#include <ChartingState.h>
#endif
#ifndef INCLUDED_Controls
#include <Controls.h>
#endif
#ifndef INCLUDED_Debug
#include <Debug.h>
#endif
#ifndef INCLUDED_DiscordClient
#include <DiscordClient.h>
#endif
#ifndef INCLUDED_EngineEditorsState
#include <EngineEditorsState.h>
#endif
#ifndef INCLUDED_LoadingState
#include <LoadingState.h>
#endif
#ifndef INCLUDED_MainMenuState
#include <MainMenuState.h>
#endif
#ifndef INCLUDED_ModsMenuState
#include <ModsMenuState.h>
#endif
#ifndef INCLUDED_MusicBeatState
#include <MusicBeatState.h>
#endif
#ifndef INCLUDED_Paths
#include <Paths.h>
#endif
#ifndef INCLUDED_PlayerSettings
#include <PlayerSettings.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_engineEditors_CharacterEditor
#include <engineEditors/CharacterEditor.h>
#endif
#ifndef INCLUDED_engineEditors_MidSongEventEditor
#include <engineEditors/MidSongEventEditor.h>
#endif
#ifndef INCLUDED_engineEditors_StageEditor
#include <engineEditors/StageEditor.h>
#endif
#ifndef INCLUDED_engineEditors_WeekEditor
#include <engineEditors/WeekEditor.h>
#endif
#ifndef INCLUDED_flixel_FlxBasic
#include <flixel/FlxBasic.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_FlxGame
#include <flixel/FlxGame.h>
#endif
#ifndef INCLUDED_flixel_FlxObject
#include <flixel/FlxObject.h>
#endif
#ifndef INCLUDED_flixel_FlxSprite
#include <flixel/FlxSprite.h>
#endif
#ifndef INCLUDED_flixel_FlxState
#include <flixel/FlxState.h>
#endif
#ifndef INCLUDED_flixel_addons_transition_FlxTransitionableState
#include <flixel/addons/transition/FlxTransitionableState.h>
#endif
#ifndef INCLUDED_flixel_addons_transition_TransitionData
#include <flixel/addons/transition/TransitionData.h>
#endif
#ifndef INCLUDED_flixel_addons_ui_FlxUIState
#include <flixel/addons/ui/FlxUIState.h>
#endif
#ifndef INCLUDED_flixel_addons_ui_interfaces_IEventGetter
#include <flixel/addons/ui/interfaces/IEventGetter.h>
#endif
#ifndef INCLUDED_flixel_addons_ui_interfaces_IFlxUIState
#include <flixel/addons/ui/interfaces/IFlxUIState.h>
#endif
#ifndef INCLUDED_flixel_effects_FlxFlicker
#include <flixel/effects/FlxFlicker.h>
#endif
#ifndef INCLUDED_flixel_group_FlxTypedGroup
#include <flixel/group/FlxTypedGroup.h>
#endif
#ifndef INCLUDED_flixel_group_FlxTypedSpriteGroup
#include <flixel/group/FlxTypedSpriteGroup.h>
#endif
#ifndef INCLUDED_flixel_input_FlxBaseKeyList
#include <flixel/input/FlxBaseKeyList.h>
#endif
#ifndef INCLUDED_flixel_input_FlxKeyManager
#include <flixel/input/FlxKeyManager.h>
#endif
#ifndef INCLUDED_flixel_input_IFlxInputManager
#include <flixel/input/IFlxInputManager.h>
#endif
#ifndef INCLUDED_flixel_input_actions_FlxAction
#include <flixel/input/actions/FlxAction.h>
#endif
#ifndef INCLUDED_flixel_input_actions_FlxActionDigital
#include <flixel/input/actions/FlxActionDigital.h>
#endif
#ifndef INCLUDED_flixel_input_actions_FlxActionSet
#include <flixel/input/actions/FlxActionSet.h>
#endif
#ifndef INCLUDED_flixel_input_keyboard_FlxKeyList
#include <flixel/input/keyboard/FlxKeyList.h>
#endif
#ifndef INCLUDED_flixel_input_keyboard_FlxKeyboard
#include <flixel/input/keyboard/FlxKeyboard.h>
#endif
#ifndef INCLUDED_flixel_math_FlxPoint
#include <flixel/math/FlxPoint.h>
#endif
#ifndef INCLUDED_flixel_system_FlxSound
#include <flixel/system/FlxSound.h>
#endif
#ifndef INCLUDED_flixel_system_FlxSoundGroup
#include <flixel/system/FlxSoundGroup.h>
#endif
#ifndef INCLUDED_flixel_system_frontEnds_SoundFrontEnd
#include <flixel/system/frontEnds/SoundFrontEnd.h>
#endif
#ifndef INCLUDED_flixel_text_FlxText
#include <flixel/text/FlxText.h>
#endif
#ifndef INCLUDED_flixel_text_FlxTextBorderStyle
#include <flixel/text/FlxTextBorderStyle.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxPooled
#include <flixel/util/IFlxPooled.h>
#endif
#ifndef INCLUDED_miniGames_MiniGamesState
#include <miniGames/MiniGamesState.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_9fa4ea8c535eac36_28_new,"EngineEditorsState","new",0xec30a47f,"EngineEditorsState.new","EngineEditorsState.hx",28,0xe7cdafd1)
static const ::String _hx_array_data_8bcef90d_1[] = {
	HX_("#314d7f",00,3a,f0,6c),HX_("#4e7093",c7,f0,f5,c5),HX_("#70526e",08,5c,7a,73),HX_("#594465",86,29,b7,d4),
};
static const ::String _hx_array_data_8bcef90d_2[] = {
	HX_("Credits Editor",33,6b,35,13),HX_("Events Editor",d4,93,0b,7d),HX_("Stage Editor",0f,63,39,a5),HX_("Character Editor",84,45,58,b1),HX_("Week Editor",59,6c,6c,6d),HX_("Chart Editor",ef,b4,29,e9),HX_("Mods",91,ff,39,33),HX_("Minigames",2a,ce,b5,50),
};
HX_LOCAL_STACK_FRAME(_hx_pos_9fa4ea8c535eac36_57_create,"EngineEditorsState","create",0x976cb03d,"EngineEditorsState.create","EngineEditorsState.hx",57,0xe7cdafd1)
HX_LOCAL_STACK_FRAME(_hx_pos_9fa4ea8c535eac36_110_update,"EngineEditorsState","update",0xa262cf4a,"EngineEditorsState.update","EngineEditorsState.hx",110,0xe7cdafd1)
HX_LOCAL_STACK_FRAME(_hx_pos_9fa4ea8c535eac36_165_update,"EngineEditorsState","update",0xa262cf4a,"EngineEditorsState.update","EngineEditorsState.hx",165,0xe7cdafd1)
HX_LOCAL_STACK_FRAME(_hx_pos_9fa4ea8c535eac36_204_changeSelection,"EngineEditorsState","changeSelection",0x68cf9f5b,"EngineEditorsState.changeSelection","EngineEditorsState.hx",204,0xe7cdafd1)
HX_LOCAL_STACK_FRAME(_hx_pos_9fa4ea8c535eac36_43_boot,"EngineEditorsState","boot",0xb6784b33,"EngineEditorsState.boot","EngineEditorsState.hx",43,0xe7cdafd1)

void EngineEditorsState_obj::__construct( ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut){
            	HX_STACKFRAME(&_hx_pos_9fa4ea8c535eac36_28_new)
HXLINE(  50)		this->colorRotation = 1;
HXLINE(  49)		this->bgColors = ::Array_obj< ::String >::fromData( _hx_array_data_8bcef90d_1,4);
HXLINE(  47)		this->char2 = null();
HXLINE(  46)		this->char1 = null();
HXLINE(  41)		this->confirming = false;
HXLINE(  31)		this->optionShit = ::Array_obj< ::String >::fromData( _hx_array_data_8bcef90d_2,8);
HXLINE(  28)		super::__construct(TransIn,TransOut);
            	}

Dynamic EngineEditorsState_obj::__CreateEmpty() { return new EngineEditorsState_obj; }

void *EngineEditorsState_obj::_hx_vtable = 0;

Dynamic EngineEditorsState_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< EngineEditorsState_obj > _hx_result = new EngineEditorsState_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool EngineEditorsState_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x4a86e631) {
		if (inClassId<=(int)0x2f064378) {
			if (inClassId<=(int)0x23a57bae) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x23a57bae;
			} else {
				return inClassId==(int)0x2f064378;
			}
		} else {
			return inClassId==(int)0x3f706236 || inClassId==(int)0x4a86e631;
		}
	} else {
		if (inClassId<=(int)0x7c795c9f) {
			return inClassId==(int)0x62817b24 || inClassId==(int)0x7c795c9f;
		} else {
			return inClassId==(int)0x7ccf8994;
		}
	}
}

void EngineEditorsState_obj::create(){
            	HX_GC_STACKFRAME(&_hx_pos_9fa4ea8c535eac36_57_create)
HXLINE(  60)		::DiscordClient_obj::changePresence(HX_("In the Menus",0a,c1,ad,c6),null(),null(),null(),null());
HXLINE(  63)		 ::flixel::FlxSprite _hx_tmp =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,null(),null(),null());
HXDLIN(  63)		::String library = null();
HXDLIN(  63)		this->bg = _hx_tmp->loadGraphic(::Paths_obj::getPath(((HX_("images/",77,50,74,c1) + HX_("editorsbg",6b,e1,d2,35)) + HX_(".png",3b,2d,bd,1e)),HX_("IMAGE",3b,57,57,3b),library),null(),null(),null(),null(),null());
HXLINE(  64)		this->bg->set_color(-13290187);
HXLINE(  65)		this->add(this->bg);
HXLINE(  67)		 ::flixel::FlxSprite _hx_tmp1 =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,null(),null(),null());
HXDLIN(  67)		::String library1 = null();
HXDLIN(  67)		this->bg2 = _hx_tmp1->loadGraphic(::Paths_obj::getPath(((HX_("images/",77,50,74,c1) + HX_("editors1",4b,2b,f3,de)) + HX_(".png",3b,2d,bd,1e)),HX_("IMAGE",3b,57,57,3b),library1),null(),null(),null(),null(),null());
HXLINE(  68)		this->add(this->bg2);
HXLINE(  70)		this->grpOptionShit =  ::flixel::group::FlxTypedGroup_obj::__alloc( HX_CTX ,null());
HXLINE(  71)		this->add(this->grpOptionShit);
HXLINE(  73)		this->char1 =  ::Character_obj::__alloc( HX_CTX ,( (Float)(870) ),( (Float)(180) ),HX_("bf",c4,55,00,00),true);
HXLINE(  74)		 ::Character _hx_tmp2 = this->char1;
HXDLIN(  74)		_hx_tmp2->setGraphicSize(::Std_obj::_hx_int((this->char1->get_width() * ((Float)0.8))),null());
HXLINE(  75)		this->add(this->char1);
HXLINE(  76)		this->char1->set_visible(false);
HXLINE(  78)		this->char2 =  ::Character_obj::__alloc( HX_CTX ,( (Float)(870) ),( (Float)(180) ),HX_("pico",e5,e8,57,4a),true);
HXLINE(  79)		 ::Character _hx_tmp3 = this->char2;
HXDLIN(  79)		_hx_tmp3->setGraphicSize(::Std_obj::_hx_int((this->char2->get_width() * ((Float)0.6))),null());
HXLINE(  80)		this->add(this->char2);
HXLINE(  81)		this->char2->set_visible(false);
HXLINE(  83)		 ::flixel::text::FlxText versionShit =  ::flixel::text::FlxText_obj::__alloc( HX_CTX ,5,(::flixel::FlxG_obj::height - 18),0,HX_("Coming Soon",fa,a1,f9,11),12,null());
HXLINE(  84)		versionShit->scrollFactor->set(null(),null());
HXLINE(  85)		versionShit->setFormat(HX_("PhantomMuff 1.5",0d,79,26,b7),16,-1,HX_("left",07,08,b0,47),::flixel::text::FlxTextBorderStyle_obj::OUTLINE_dyn(),-16777216,null());
HXLINE(  86)		this->add(versionShit);
HXLINE(  89)		{
HXLINE(  89)			int _g = 0;
HXDLIN(  89)			int _g1 = this->optionShit->length;
HXDLIN(  89)			while((_g < _g1)){
HXLINE(  89)				_g = (_g + 1);
HXDLIN(  89)				int i = (_g - 1);
HXLINE(  91)				this->creditText =  ::Alphabet_obj::__alloc( HX_CTX ,( (Float)(0) ),( (Float)(((70 * i) + 30)) ),this->optionShit->__get(i),true,false,null(),null(),null());
HXLINE(  92)				this->creditText->isMenuItem = true;
HXLINE(  93)				this->creditText->targetY = ( (Float)(i) );
HXLINE(  94)				this->grpOptionShit->add(this->creditText).StaticCast<  ::Alphabet >();
            			}
            		}
HXLINE( 101)		this->changeSelection(null());
HXLINE( 105)		this->super::create();
            	}


void EngineEditorsState_obj::update(Float elapsed){
            	HX_GC_STACKFRAME(&_hx_pos_9fa4ea8c535eac36_110_update)
HXLINE( 109)		 ::EngineEditorsState _gthis = ::hx::ObjectPtr<OBJ_>(this);
HXLINE( 111)		this->super::update(elapsed);
HXLINE( 113)		bool upP = ::PlayerSettings_obj::player1->controls->_upP->check();
HXLINE( 114)		bool downP = ::PlayerSettings_obj::player1->controls->_downP->check();
HXLINE( 115)		bool accepted = ::PlayerSettings_obj::player1->controls->_accept->check();
HXLINE( 116)		 ::flixel::input::keyboard::FlxKeyList _this = ( ( ::flixel::input::keyboard::FlxKeyList)(::flixel::FlxG_obj::keys->justPressed) );
HXDLIN( 116)		bool space = _this->keyManager->checkStatusUnsafe(32,_this->status);
HXLINE( 120)		if ((this->optionShit->__get(::EngineEditorsState_obj::curSelected) == HX_("Character Editor",84,45,58,b1))) {
HXLINE( 122)			this->char1->dance(null(),null());
HXLINE( 123)			this->char1->updateHitbox();
HXLINE( 124)			this->char1->set_visible(true);
            		}
            		else {
HXLINE( 128)			this->char1->set_visible(false);
            		}
HXLINE( 131)		if ((this->optionShit->__get(::EngineEditorsState_obj::curSelected) == HX_("Week Editor",59,6c,6c,6d))) {
HXLINE( 133)			this->char2->dance(null(),null());
HXLINE( 134)			this->char2->updateHitbox();
HXLINE( 135)			this->char2->set_visible(true);
            		}
            		else {
HXLINE( 139)			this->char2->set_visible(false);
            		}
HXLINE( 142)		int shiftMult = 1;
HXLINE( 143)		 ::flixel::input::keyboard::FlxKeyList _this1 = ( ( ::flixel::input::keyboard::FlxKeyList)(::flixel::FlxG_obj::keys->pressed) );
HXDLIN( 143)		if (_this1->keyManager->checkStatusUnsafe(16,_this1->status)) {
HXLINE( 144)			shiftMult = 3;
            		}
HXLINE( 146)		bool _hx_tmp;
HXDLIN( 146)		if (upP) {
HXLINE( 146)			_hx_tmp = !(this->confirming);
            		}
            		else {
HXLINE( 146)			_hx_tmp = false;
            		}
HXDLIN( 146)		if (_hx_tmp) {
HXLINE( 148)			 ::flixel::_hx_system::frontEnds::SoundFrontEnd _hx_tmp = ::flixel::FlxG_obj::sound;
HXDLIN( 148)			_hx_tmp->play(::Paths_obj::sound(HX_("scrollMenu",4c,d4,18,06),null()),((Float)0.4),null(),null(),null(),null());
HXLINE( 149)			this->changeSelection(-(shiftMult));
            		}
HXLINE( 151)		bool _hx_tmp1;
HXDLIN( 151)		if (downP) {
HXLINE( 151)			_hx_tmp1 = !(this->confirming);
            		}
            		else {
HXLINE( 151)			_hx_tmp1 = false;
            		}
HXDLIN( 151)		if (_hx_tmp1) {
HXLINE( 153)			 ::flixel::_hx_system::frontEnds::SoundFrontEnd _hx_tmp = ::flixel::FlxG_obj::sound;
HXDLIN( 153)			_hx_tmp->play(::Paths_obj::sound(HX_("scrollMenu",4c,d4,18,06),null()),((Float)0.4),null(),null(),null(),null());
HXLINE( 154)			this->changeSelection(shiftMult);
            		}
HXLINE( 157)		bool _hx_tmp2;
HXDLIN( 157)		if (::PlayerSettings_obj::player1->controls->_back->check()) {
HXLINE( 157)			_hx_tmp2 = !(this->confirming);
            		}
            		else {
HXLINE( 157)			_hx_tmp2 = false;
            		}
HXDLIN( 157)		if (_hx_tmp2) {
HXLINE( 158)			 ::flixel::FlxState nextState =  ::MainMenuState_obj::__alloc( HX_CTX ,null(),null());
HXDLIN( 158)			if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 158)				::flixel::FlxG_obj::game->_requestedState = nextState;
            			}
            		}
HXLINE( 160)		bool _hx_tmp3;
HXDLIN( 160)		if (::PlayerSettings_obj::player1->controls->_accept->check()) {
HXLINE( 160)			_hx_tmp3 = !(this->confirming);
            		}
            		else {
HXLINE( 160)			_hx_tmp3 = false;
            		}
HXDLIN( 160)		if (_hx_tmp3) {
            			HX_BEGIN_LOCAL_FUNC_S1(::hx::LocalFunc,_hx_Closure_0, ::EngineEditorsState,_gthis) HXARGC(1)
            			void _hx_run( ::flixel::effects::FlxFlicker flick){
            				HX_GC_STACKFRAME(&_hx_pos_9fa4ea8c535eac36_165_update)
HXLINE( 166)				::String _hx_switch_0 = _gthis->optionShit->__get(::EngineEditorsState_obj::curSelected);
            				if (  (_hx_switch_0==HX_("Character Editor",84,45,58,b1)) ){
HXLINE( 182)					 ::flixel::FlxState nextState = ::LoadingState_obj::getNextState(( ( ::flixel::FlxState)( ::engineEditors::CharacterEditor_obj::__alloc( HX_CTX ,null(),null())) ),false);
HXDLIN( 182)					if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 182)						::flixel::FlxG_obj::game->_requestedState = nextState;
            					}
HXDLIN( 182)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Chart Editor",ef,b4,29,e9)) ){
HXLINE( 191)					 ::flixel::FlxState nextState = ::LoadingState_obj::getNextState(( ( ::flixel::FlxState)( ::ChartingState_obj::__alloc( HX_CTX ,null())) ),false);
HXDLIN( 191)					if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 191)						::flixel::FlxG_obj::game->_requestedState = nextState;
            					}
HXDLIN( 191)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Credits Editor",33,6b,35,13)) ){
HXLINE( 176)					::Debug_obj::displayAlert(HX_("Credits Editor",33,6b,35,13),HX_("Credits Editor is under maintenance for a while, add credits from json. Sorry for that",bb,2b,8e,4f));
HXDLIN( 176)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Events Editor",d4,93,0b,7d)) ){
HXLINE( 173)					 ::flixel::FlxState nextState =  ::engineEditors::MidSongEventEditor_obj::__alloc( HX_CTX ,null(),null());
HXDLIN( 173)					if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 173)						::flixel::FlxG_obj::game->_requestedState = nextState;
            					}
HXDLIN( 173)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Minigames",2a,ce,b5,50)) ){
HXLINE( 194)					{
HXLINE( 194)						 ::flixel::FlxState nextState = ::LoadingState_obj::getNextState(( ( ::flixel::FlxState)( ::miniGames::MiniGamesState_obj::__alloc( HX_CTX ,null(),null())) ),false);
HXDLIN( 194)						if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 194)							::flixel::FlxG_obj::game->_requestedState = nextState;
            						}
            					}
HXLINE( 195)					::miniGames::MiniGamesState_obj::h = HX_("normal",27,72,69,30);
HXLINE( 193)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Mods",91,ff,39,33)) ){
HXLINE( 188)					 ::flixel::FlxState nextState = ::LoadingState_obj::getNextState(( ( ::flixel::FlxState)( ::ModsMenuState_obj::__alloc( HX_CTX ,null(),null())) ),false);
HXDLIN( 188)					if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 188)						::flixel::FlxG_obj::game->_requestedState = nextState;
            					}
HXDLIN( 188)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Stage Editor",0f,63,39,a5)) ){
HXLINE( 179)					 ::flixel::FlxState nextState =  ::engineEditors::StageEditor_obj::__alloc( HX_CTX ,null(),null());
HXDLIN( 179)					if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 179)						::flixel::FlxG_obj::game->_requestedState = nextState;
            					}
HXDLIN( 179)					goto _hx_goto_5;
            				}
            				if (  (_hx_switch_0==HX_("Week Editor",59,6c,6c,6d)) ){
HXLINE( 185)					 ::flixel::FlxState nextState = ::LoadingState_obj::getNextState(( ( ::flixel::FlxState)( ::engineEditors::WeekEditor_obj::__alloc( HX_CTX ,null(),null())) ),false);
HXDLIN( 185)					if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE( 185)						::flixel::FlxG_obj::game->_requestedState = nextState;
            					}
HXDLIN( 185)					goto _hx_goto_5;
            				}
            				_hx_goto_5:;
HXLINE( 197)				::flixel::FlxG_obj::sound->music->set_volume(( (Float)(0) ));
HXLINE( 198)				_gthis->confirming = false;
            			}
            			HX_END_LOCAL_FUNC1((void))

HXLINE( 162)			 ::flixel::_hx_system::frontEnds::SoundFrontEnd _hx_tmp = ::flixel::FlxG_obj::sound;
HXDLIN( 162)			_hx_tmp->play(::Paths_obj::sound(HX_("confirmMenu",bf,8e,fe,3c),null()),null(),null(),null(),null(),null());
HXLINE( 163)			this->confirming = true;
HXLINE( 164)			::flixel::effects::FlxFlicker_obj::flicker(Dynamic( this->grpOptionShit->members->__get(::EngineEditorsState_obj::curSelected)).StaticCast<  ::Alphabet >(),1,((Float)0.06),true,false, ::Dynamic(new _hx_Closure_0(_gthis)),null());
            		}
            	}


void EngineEditorsState_obj::changeSelection(::hx::Null< int >  __o_change){
            		int change = __o_change.Default(0);
            	HX_STACKFRAME(&_hx_pos_9fa4ea8c535eac36_204_changeSelection)
HXLINE( 205)		 ::Dynamic _hx_tmp = ::hx::ClassOf< ::EngineEditorsState >();
HXDLIN( 205)		::EngineEditorsState_obj::curSelected = (::EngineEditorsState_obj::curSelected + change);
HXLINE( 207)		if ((::EngineEditorsState_obj::curSelected < 0)) {
HXLINE( 208)			::EngineEditorsState_obj::curSelected = (this->optionShit->length - 1);
            		}
HXLINE( 209)		if ((::EngineEditorsState_obj::curSelected >= this->optionShit->length)) {
HXLINE( 210)			::EngineEditorsState_obj::curSelected = 0;
            		}
HXLINE( 212)		int bullShit = 0;
HXLINE( 214)		{
HXLINE( 214)			int _g = 0;
HXDLIN( 214)			::Array< ::Dynamic> _g1 = this->grpOptionShit->members;
HXDLIN( 214)			while((_g < _g1->length)){
HXLINE( 214)				 ::Alphabet item = _g1->__get(_g).StaticCast<  ::Alphabet >();
HXDLIN( 214)				_g = (_g + 1);
HXLINE( 216)				item->targetY = ( (Float)((bullShit - ::EngineEditorsState_obj::curSelected)) );
HXLINE( 217)				bullShit = (bullShit + 1);
HXLINE( 219)				item->set_alpha(((Float)0.6));
HXLINE( 221)				if ((item->targetY == 0)) {
HXLINE( 223)					item->set_alpha(( (Float)(1) ));
            				}
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(EngineEditorsState_obj,changeSelection,(void))

int EngineEditorsState_obj::curSelected;


::hx::ObjectPtr< EngineEditorsState_obj > EngineEditorsState_obj::__new( ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut) {
	::hx::ObjectPtr< EngineEditorsState_obj > __this = new EngineEditorsState_obj();
	__this->__construct(TransIn,TransOut);
	return __this;
}

::hx::ObjectPtr< EngineEditorsState_obj > EngineEditorsState_obj::__alloc(::hx::Ctx *_hx_ctx, ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut) {
	EngineEditorsState_obj *__this = (EngineEditorsState_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(EngineEditorsState_obj), true, "EngineEditorsState"));
	*(void **)__this = EngineEditorsState_obj::_hx_vtable;
	__this->__construct(TransIn,TransOut);
	return __this;
}

EngineEditorsState_obj::EngineEditorsState_obj()
{
}

void EngineEditorsState_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(EngineEditorsState);
	HX_MARK_MEMBER_NAME(optionShit,"optionShit");
	HX_MARK_MEMBER_NAME(confirming,"confirming");
	HX_MARK_MEMBER_NAME(grpOptionShit,"grpOptionShit");
	HX_MARK_MEMBER_NAME(char1,"char1");
	HX_MARK_MEMBER_NAME(char2,"char2");
	HX_MARK_MEMBER_NAME(bgColors,"bgColors");
	HX_MARK_MEMBER_NAME(colorRotation,"colorRotation");
	HX_MARK_MEMBER_NAME(bg,"bg");
	HX_MARK_MEMBER_NAME(bg2,"bg2");
	HX_MARK_MEMBER_NAME(creditText,"creditText");
	 ::MusicBeatState_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void EngineEditorsState_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(optionShit,"optionShit");
	HX_VISIT_MEMBER_NAME(confirming,"confirming");
	HX_VISIT_MEMBER_NAME(grpOptionShit,"grpOptionShit");
	HX_VISIT_MEMBER_NAME(char1,"char1");
	HX_VISIT_MEMBER_NAME(char2,"char2");
	HX_VISIT_MEMBER_NAME(bgColors,"bgColors");
	HX_VISIT_MEMBER_NAME(colorRotation,"colorRotation");
	HX_VISIT_MEMBER_NAME(bg,"bg");
	HX_VISIT_MEMBER_NAME(bg2,"bg2");
	HX_VISIT_MEMBER_NAME(creditText,"creditText");
	 ::MusicBeatState_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val EngineEditorsState_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"bg") ) { return ::hx::Val( bg ); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"bg2") ) { return ::hx::Val( bg2 ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"char1") ) { return ::hx::Val( char1 ); }
		if (HX_FIELD_EQ(inName,"char2") ) { return ::hx::Val( char2 ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { return ::hx::Val( create_dyn() ); }
		if (HX_FIELD_EQ(inName,"update") ) { return ::hx::Val( update_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"bgColors") ) { return ::hx::Val( bgColors ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"optionShit") ) { return ::hx::Val( optionShit ); }
		if (HX_FIELD_EQ(inName,"confirming") ) { return ::hx::Val( confirming ); }
		if (HX_FIELD_EQ(inName,"creditText") ) { return ::hx::Val( creditText ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"grpOptionShit") ) { return ::hx::Val( grpOptionShit ); }
		if (HX_FIELD_EQ(inName,"colorRotation") ) { return ::hx::Val( colorRotation ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"changeSelection") ) { return ::hx::Val( changeSelection_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool EngineEditorsState_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 11:
		if (HX_FIELD_EQ(inName,"curSelected") ) { outValue = ( curSelected ); return true; }
	}
	return false;
}

::hx::Val EngineEditorsState_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"bg") ) { bg=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"bg2") ) { bg2=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"char1") ) { char1=inValue.Cast<  ::Character >(); return inValue; }
		if (HX_FIELD_EQ(inName,"char2") ) { char2=inValue.Cast<  ::Character >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"bgColors") ) { bgColors=inValue.Cast< ::Array< ::String > >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"optionShit") ) { optionShit=inValue.Cast< ::Array< ::String > >(); return inValue; }
		if (HX_FIELD_EQ(inName,"confirming") ) { confirming=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"creditText") ) { creditText=inValue.Cast<  ::Alphabet >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"grpOptionShit") ) { grpOptionShit=inValue.Cast<  ::flixel::group::FlxTypedGroup >(); return inValue; }
		if (HX_FIELD_EQ(inName,"colorRotation") ) { colorRotation=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool EngineEditorsState_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 11:
		if (HX_FIELD_EQ(inName,"curSelected") ) { curSelected=ioValue.Cast< int >(); return true; }
	}
	return false;
}

void EngineEditorsState_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("optionShit",d5,2d,ee,91));
	outFields->push(HX_("confirming",e2,8f,36,e0));
	outFields->push(HX_("grpOptionShit",1a,6e,9f,41));
	outFields->push(HX_("char1",9b,9c,b3,45));
	outFields->push(HX_("char2",9c,9c,b3,45));
	outFields->push(HX_("bgColors",55,b1,8d,9b));
	outFields->push(HX_("colorRotation",c1,05,49,0b));
	outFields->push(HX_("bg",c5,55,00,00));
	outFields->push(HX_("bg2",cd,b6,4a,00));
	outFields->push(HX_("creditText",86,ad,5d,19));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo EngineEditorsState_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /* ::Array< ::String > */ ,(int)offsetof(EngineEditorsState_obj,optionShit),HX_("optionShit",d5,2d,ee,91)},
	{::hx::fsBool,(int)offsetof(EngineEditorsState_obj,confirming),HX_("confirming",e2,8f,36,e0)},
	{::hx::fsObject /*  ::flixel::group::FlxTypedGroup */ ,(int)offsetof(EngineEditorsState_obj,grpOptionShit),HX_("grpOptionShit",1a,6e,9f,41)},
	{::hx::fsObject /*  ::Character */ ,(int)offsetof(EngineEditorsState_obj,char1),HX_("char1",9b,9c,b3,45)},
	{::hx::fsObject /*  ::Character */ ,(int)offsetof(EngineEditorsState_obj,char2),HX_("char2",9c,9c,b3,45)},
	{::hx::fsObject /* ::Array< ::String > */ ,(int)offsetof(EngineEditorsState_obj,bgColors),HX_("bgColors",55,b1,8d,9b)},
	{::hx::fsInt,(int)offsetof(EngineEditorsState_obj,colorRotation),HX_("colorRotation",c1,05,49,0b)},
	{::hx::fsObject /*  ::flixel::FlxSprite */ ,(int)offsetof(EngineEditorsState_obj,bg),HX_("bg",c5,55,00,00)},
	{::hx::fsObject /*  ::flixel::FlxSprite */ ,(int)offsetof(EngineEditorsState_obj,bg2),HX_("bg2",cd,b6,4a,00)},
	{::hx::fsObject /*  ::Alphabet */ ,(int)offsetof(EngineEditorsState_obj,creditText),HX_("creditText",86,ad,5d,19)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo EngineEditorsState_obj_sStaticStorageInfo[] = {
	{::hx::fsInt,(void *) &EngineEditorsState_obj::curSelected,HX_("curSelected",fb,eb,ab,32)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String EngineEditorsState_obj_sMemberFields[] = {
	HX_("optionShit",d5,2d,ee,91),
	HX_("confirming",e2,8f,36,e0),
	HX_("grpOptionShit",1a,6e,9f,41),
	HX_("char1",9b,9c,b3,45),
	HX_("char2",9c,9c,b3,45),
	HX_("bgColors",55,b1,8d,9b),
	HX_("colorRotation",c1,05,49,0b),
	HX_("bg",c5,55,00,00),
	HX_("bg2",cd,b6,4a,00),
	HX_("creditText",86,ad,5d,19),
	HX_("create",fc,66,0f,7c),
	HX_("update",09,86,05,87),
	HX_("changeSelection",bc,98,b5,48),
	::String(null()) };

static void EngineEditorsState_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(EngineEditorsState_obj::curSelected,"curSelected");
};

#ifdef HXCPP_VISIT_ALLOCS
static void EngineEditorsState_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(EngineEditorsState_obj::curSelected,"curSelected");
};

#endif

::hx::Class EngineEditorsState_obj::__mClass;

static ::String EngineEditorsState_obj_sStaticFields[] = {
	HX_("curSelected",fb,eb,ab,32),
	::String(null())
};

void EngineEditorsState_obj::__register()
{
	EngineEditorsState_obj _hx_dummy;
	EngineEditorsState_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("EngineEditorsState",0d,f9,ce,8b);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &EngineEditorsState_obj::__GetStatic;
	__mClass->mSetStaticField = &EngineEditorsState_obj::__SetStatic;
	__mClass->mMarkFunc = EngineEditorsState_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(EngineEditorsState_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(EngineEditorsState_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< EngineEditorsState_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = EngineEditorsState_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = EngineEditorsState_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = EngineEditorsState_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void EngineEditorsState_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_9fa4ea8c535eac36_43_boot)
HXDLIN(  43)		curSelected = 0;
            	}
}
