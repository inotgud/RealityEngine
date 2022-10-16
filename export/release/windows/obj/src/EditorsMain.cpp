// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_Controls
#include <Controls.h>
#endif
#ifndef INCLUDED_Debug
#include <Debug.h>
#endif
#ifndef INCLUDED_EditorsMain
#include <EditorsMain.h>
#endif
#ifndef INCLUDED_EngineEditorsState
#include <EngineEditorsState.h>
#endif
#ifndef INCLUDED_MainMenuState
#include <MainMenuState.h>
#endif
#ifndef INCLUDED_MusicBeatState
#include <MusicBeatState.h>
#endif
#ifndef INCLUDED_MusicBeatSubstate
#include <MusicBeatSubstate.h>
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
#ifndef INCLUDED_flixel_FlxSubState
#include <flixel/FlxSubState.h>
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
#ifndef INCLUDED_flixel_graphics_FlxGraphic
#include <flixel/graphics/FlxGraphic.h>
#endif
#ifndef INCLUDED_flixel_group_FlxTypedGroup
#include <flixel/group/FlxTypedGroup.h>
#endif
#ifndef INCLUDED_flixel_input_FlxPointer
#include <flixel/input/FlxPointer.h>
#endif
#ifndef INCLUDED_flixel_input_IFlxInput
#include <flixel/input/IFlxInput.h>
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
#ifndef INCLUDED_flixel_input_mouse_FlxMouse
#include <flixel/input/mouse/FlxMouse.h>
#endif
#ifndef INCLUDED_flixel_math_FlxPoint
#include <flixel/math/FlxPoint.h>
#endif
#ifndef INCLUDED_flixel_ui_FlxButton
#include <flixel/ui/FlxButton.h>
#endif
#ifndef INCLUDED_flixel_ui_FlxTypedButton_flixel_text_FlxText
#include <flixel/ui/FlxTypedButton_flixel_text_FlxText.h>
#endif
#ifndef INCLUDED_flixel_util_FlxAxes
#include <flixel/util/FlxAxes.h>
#endif
#ifndef INCLUDED_flixel_util_FlxSave
#include <flixel/util/FlxSave.h>
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

HX_DEFINE_STACK_FRAME(_hx_pos_eec349df0935cb05_34_new,"EditorsMain","new",0x445a79d1,"EditorsMain.new","EditorsMain.hx",34,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_54_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",54,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_60_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",60,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_67_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",67,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_74_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",74,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_80_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",80,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_87_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",87,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_91_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",91,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_39_create,"EditorsMain","create",0xff897a2b,"EditorsMain.create","EditorsMain.hx",39,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_108_update,"EditorsMain","update",0x0a7f9938,"EditorsMain.update","EditorsMain.hx",108,0x1e276abf)
HX_LOCAL_STACK_FRAME(_hx_pos_eec349df0935cb05_118_stageEditorFunc,"EditorsMain","stageEditorFunc",0xaad24ae0,"EditorsMain.stageEditorFunc","EditorsMain.hx",118,0x1e276abf)

void EditorsMain_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_eec349df0935cb05_34_new)
HXDLIN(  34)		super::__construct();
            	}

Dynamic EditorsMain_obj::__CreateEmpty() { return new EditorsMain_obj; }

void *EditorsMain_obj::_hx_vtable = 0;

Dynamic EditorsMain_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< EditorsMain_obj > _hx_result = new EditorsMain_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool EditorsMain_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x62817b24) {
		if (inClassId<=(int)0x5661ffbf) {
			if (inClassId<=(int)0x02a6829f) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x02a6829f;
			} else {
				return inClassId==(int)0x5661ffbf;
			}
		} else {
			return inClassId==(int)0x62817b24;
		}
	} else {
		if (inClassId<=(int)0x7ccf8994) {
			return inClassId==(int)0x7c795c9f || inClassId==(int)0x7ccf8994;
		} else {
			return inClassId==(int)0x7fce3ab0;
		}
	}
}

void EditorsMain_obj::create(){
            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_0) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_54_create)
HXLINE(  55)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE(  56)			{
HXLINE(  56)				 ::flixel::FlxState nextState =  ::engineEditors::StageEditor_obj::__alloc( HX_CTX ,null(),null());
HXDLIN(  56)				if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE(  56)					::flixel::FlxG_obj::game->_requestedState = nextState;
            				}
            			}
            		}
            		HX_END_LOCAL_FUNC0((void))

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_1) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_60_create)
HXLINE(  61)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE(  62)			::MainMenuState_obj::Editorsnull = true;
HXLINE(  63)			{
HXLINE(  63)				 ::flixel::FlxState nextState =  ::engineEditors::CharacterEditor_obj::__alloc( HX_CTX ,null(),null());
HXDLIN(  63)				if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE(  63)					::flixel::FlxG_obj::game->_requestedState = nextState;
            				}
            			}
            		}
            		HX_END_LOCAL_FUNC0((void))

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_2) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_67_create)
HXLINE(  68)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE(  69)			::MainMenuState_obj::Editorsnull = true;
HXLINE(  70)			{
HXLINE(  70)				 ::flixel::FlxState nextState =  ::engineEditors::WeekEditor_obj::__alloc( HX_CTX ,null(),null());
HXDLIN(  70)				if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE(  70)					::flixel::FlxG_obj::game->_requestedState = nextState;
            				}
            			}
            		}
            		HX_END_LOCAL_FUNC0((void))

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_3) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_74_create)
HXLINE(  75)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE(  76)			{
HXLINE(  76)				 ::flixel::FlxState nextState =  ::miniGames::MiniGamesState_obj::__alloc( HX_CTX ,null(),null());
HXDLIN(  76)				if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE(  76)					::flixel::FlxG_obj::game->_requestedState = nextState;
            				}
            			}
            		}
            		HX_END_LOCAL_FUNC0((void))

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_4) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_80_create)
HXLINE(  81)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE(  82)			{
HXLINE(  82)				 ::flixel::FlxState nextState =  ::engineEditors::MidSongEventEditor_obj::__alloc( HX_CTX ,null(),null());
HXDLIN(  82)				if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE(  82)					::flixel::FlxG_obj::game->_requestedState = nextState;
            				}
            			}
            		}
            		HX_END_LOCAL_FUNC0((void))

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_5) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_87_create)
HXLINE(  87)			::Debug_obj::displayAlert(HX_("Credits Editor",33,6b,35,13),HX_("Credits Editor is under maintenance for a while, add credits from json. Sorry for that",bb,2b,8e,4f));
            		}
            		HX_END_LOCAL_FUNC0((void))

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_6) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_91_create)
HXLINE(  92)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE(  93)			{
HXLINE(  93)				 ::flixel::FlxState nextState =  ::EngineEditorsState_obj::__alloc( HX_CTX ,null(),null());
HXDLIN(  93)				if (::flixel::FlxG_obj::game->_state->switchTo(nextState)) {
HXLINE(  93)					::flixel::FlxG_obj::game->_requestedState = nextState;
            				}
            			}
            		}
            		HX_END_LOCAL_FUNC0((void))

            	HX_GC_STACKFRAME(&_hx_pos_eec349df0935cb05_39_create)
HXLINE(  40)		this->bg2 =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,null(),null(),null())->makeGraphic(::flixel::FlxG_obj::width,::flixel::FlxG_obj::height,-16777216,null(),null());
HXLINE(  41)		this->bg2->set_alpha(((Float)0.6));
HXLINE(  42)		this->bg2->scrollFactor->set(null(),null());
HXLINE(  43)		this->add(this->bg2);
HXLINE(  44)		 ::flixel::FlxSprite _hx_tmp =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,-100,null(),null());
HXDLIN(  44)		this->bg = _hx_tmp->loadGraphic(::Paths_obj::loadImage(HX_("no/menuBGSub",2e,68,a8,a5),null()),null(),null(),null(),null(),null());
HXLINE(  45)		this->bg->scrollFactor->set_x(( (Float)(0) ));
HXLINE(  46)		this->bg->scrollFactor->set_y(((Float)0.10));
HXLINE(  47)		 ::flixel::FlxSprite _hx_tmp1 = this->bg;
HXDLIN(  47)		_hx_tmp1->setGraphicSize(::Std_obj::_hx_int((this->bg->get_width() * ((Float)1.1))),null());
HXLINE(  48)		this->bg->updateHitbox();
HXLINE(  49)		{
HXLINE(  49)			 ::flixel::FlxSprite _this = this->bg;
HXDLIN(  49)			 ::flixel::util::FlxAxes axes = ::flixel::util::FlxAxes_obj::XY_dyn();
HXDLIN(  49)			bool _hx_tmp2;
HXDLIN(  49)			switch((int)(axes->_hx_getIndex())){
            				case (int)0: case (int)2: {
HXLINE(  49)					_hx_tmp2 = true;
            				}
            				break;
            				default:{
HXLINE(  49)					_hx_tmp2 = false;
            				}
            			}
HXDLIN(  49)			if (_hx_tmp2) {
HXLINE(  49)				int _hx_tmp = ::flixel::FlxG_obj::width;
HXDLIN(  49)				_this->set_x(((( (Float)(_hx_tmp) ) - _this->get_width()) / ( (Float)(2) )));
            			}
HXDLIN(  49)			bool _hx_tmp3;
HXDLIN(  49)			switch((int)(axes->_hx_getIndex())){
            				case (int)1: case (int)2: {
HXLINE(  49)					_hx_tmp3 = true;
            				}
            				break;
            				default:{
HXLINE(  49)					_hx_tmp3 = false;
            				}
            			}
HXDLIN(  49)			if (_hx_tmp3) {
HXLINE(  49)				int _hx_tmp = ::flixel::FlxG_obj::height;
HXDLIN(  49)				_this->set_y(((( (Float)(_hx_tmp) ) - _this->get_height()) / ( (Float)(2) )));
            			}
            		}
HXLINE(  50)		this->bg->scrollFactor->set(null(),null());
HXLINE(  51)		this->bg->set_antialiasing(( (bool)(::flixel::FlxG_obj::save->data->__Field(HX_("antialiasing",f4,16,b3,48),::hx::paccDynamic)) ));
HXLINE(  52)		this->add(this->bg);
HXLINE(  53)		::flixel::FlxG_obj::mouse->set_visible(true);
HXLINE(  54)		 ::flixel::ui::FlxButton button2 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,115,HX_("Stage Editor",0f,63,39,a5), ::Dynamic(new _hx_Closure_0()));
HXLINE(  58)		this->add(button2);
HXLINE(  60)		 ::flixel::ui::FlxButton button3 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,140,HX_("Character E",ee,8b,f1,a2), ::Dynamic(new _hx_Closure_1()));
HXLINE(  65)		this->add(button3);
HXLINE(  67)		 ::flixel::ui::FlxButton button4 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,165,HX_("Week Editor",59,6c,6c,6d), ::Dynamic(new _hx_Closure_2()));
HXLINE(  72)		this->add(button4);
HXLINE(  74)		 ::flixel::ui::FlxButton button5 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,190,HX_("Mini Games",f8,59,b4,ea), ::Dynamic(new _hx_Closure_3()));
HXLINE(  78)		this->add(button5);
HXLINE(  80)		 ::flixel::ui::FlxButton button6 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,215,HX_("Event Editor",33,a9,36,2e), ::Dynamic(new _hx_Closure_4()));
HXLINE(  84)		this->add(button6);
HXLINE(  86)		 ::flixel::ui::FlxButton button8 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,240,HX_("Credits Editor",33,6b,35,13), ::Dynamic(new _hx_Closure_5()));
HXLINE(  89)		this->add(button8);
HXLINE(  91)		 ::flixel::ui::FlxButton button7 =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,155,265,HX_("Other...",3e,87,5e,86), ::Dynamic(new _hx_Closure_6()));
HXLINE(  95)		this->add(button7);
HXLINE( 106)		this->super::create();
            	}


void EditorsMain_obj::update(Float elapsed){
            	HX_STACKFRAME(&_hx_pos_eec349df0935cb05_108_update)
HXLINE( 109)		if (::PlayerSettings_obj::player1->controls->_back->check()) {
HXLINE( 111)			::MainMenuState_obj::Editorsmainyes = false;
HXLINE( 112)			this->close();
            		}
HXLINE( 114)		this->super::update(elapsed);
            	}


void EditorsMain_obj::stageEditorFunc(){
            	HX_STACKFRAME(&_hx_pos_eec349df0935cb05_118_stageEditorFunc)
            	}


HX_DEFINE_DYNAMIC_FUNC0(EditorsMain_obj,stageEditorFunc,(void))


::hx::ObjectPtr< EditorsMain_obj > EditorsMain_obj::__new() {
	::hx::ObjectPtr< EditorsMain_obj > __this = new EditorsMain_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< EditorsMain_obj > EditorsMain_obj::__alloc(::hx::Ctx *_hx_ctx) {
	EditorsMain_obj *__this = (EditorsMain_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(EditorsMain_obj), true, "EditorsMain"));
	*(void **)__this = EditorsMain_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

EditorsMain_obj::EditorsMain_obj()
{
}

void EditorsMain_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(EditorsMain);
	HX_MARK_MEMBER_NAME(bg2,"bg2");
	HX_MARK_MEMBER_NAME(bg3,"bg3");
	HX_MARK_MEMBER_NAME(bg,"bg");
	 ::flixel::FlxSubState_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void EditorsMain_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(bg2,"bg2");
	HX_VISIT_MEMBER_NAME(bg3,"bg3");
	HX_VISIT_MEMBER_NAME(bg,"bg");
	 ::flixel::FlxSubState_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val EditorsMain_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"bg") ) { return ::hx::Val( bg ); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"bg2") ) { return ::hx::Val( bg2 ); }
		if (HX_FIELD_EQ(inName,"bg3") ) { return ::hx::Val( bg3 ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { return ::hx::Val( create_dyn() ); }
		if (HX_FIELD_EQ(inName,"update") ) { return ::hx::Val( update_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"stageEditorFunc") ) { return ::hx::Val( stageEditorFunc_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val EditorsMain_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"bg") ) { bg=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"bg2") ) { bg2=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
		if (HX_FIELD_EQ(inName,"bg3") ) { bg3=inValue.Cast<  ::flixel::FlxSprite >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void EditorsMain_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("bg2",cd,b6,4a,00));
	outFields->push(HX_("bg3",ce,b6,4a,00));
	outFields->push(HX_("bg",c5,55,00,00));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo EditorsMain_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::flixel::FlxSprite */ ,(int)offsetof(EditorsMain_obj,bg2),HX_("bg2",cd,b6,4a,00)},
	{::hx::fsObject /*  ::flixel::FlxSprite */ ,(int)offsetof(EditorsMain_obj,bg3),HX_("bg3",ce,b6,4a,00)},
	{::hx::fsObject /*  ::flixel::FlxSprite */ ,(int)offsetof(EditorsMain_obj,bg),HX_("bg",c5,55,00,00)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *EditorsMain_obj_sStaticStorageInfo = 0;
#endif

static ::String EditorsMain_obj_sMemberFields[] = {
	HX_("bg2",cd,b6,4a,00),
	HX_("bg3",ce,b6,4a,00),
	HX_("bg",c5,55,00,00),
	HX_("create",fc,66,0f,7c),
	HX_("update",09,86,05,87),
	HX_("stageEditorFunc",ef,bb,fa,98),
	::String(null()) };

::hx::Class EditorsMain_obj::__mClass;

void EditorsMain_obj::__register()
{
	EditorsMain_obj _hx_dummy;
	EditorsMain_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("EditorsMain",5f,3d,ab,4f);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(EditorsMain_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< EditorsMain_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = EditorsMain_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = EditorsMain_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
