// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_EReg
#include <EReg.h>
#endif
#ifndef INCLUDED_MusicBeatSubstate
#include <MusicBeatSubstate.h>
#endif
#ifndef INCLUDED_OpenDiscord
#include <OpenDiscord.h>
#endif
#ifndef INCLUDED_Paths
#include <Paths.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_flixel_FlxBasic
#include <flixel/FlxBasic.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
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
#ifndef INCLUDED_flixel_graphics_FlxGraphic
#include <flixel/graphics/FlxGraphic.h>
#endif
#ifndef INCLUDED_flixel_group_FlxTypedGroup
#include <flixel/group/FlxTypedGroup.h>
#endif
#ifndef INCLUDED_flixel_input_FlxBaseKeyList
#include <flixel/input/FlxBaseKeyList.h>
#endif
#ifndef INCLUDED_flixel_input_FlxKeyManager
#include <flixel/input/FlxKeyManager.h>
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
#ifndef INCLUDED_flixel_input_keyboard_FlxKeyList
#include <flixel/input/keyboard/FlxKeyList.h>
#endif
#ifndef INCLUDED_flixel_input_keyboard_FlxKeyboard
#include <flixel/input/keyboard/FlxKeyboard.h>
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
#ifndef INCLUDED_openfl_Lib
#include <openfl/Lib.h>
#endif
#ifndef INCLUDED_openfl_net_URLRequest
#include <openfl/net/URLRequest.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_7779fe0c942acfa4_48_new,"OpenDiscord","new",0x348c9cd4,"OpenDiscord.new","OpenDiscord.hx",48,0x8e95d91c)
HX_LOCAL_STACK_FRAME(_hx_pos_7779fe0c942acfa4_65_create,"OpenDiscord","create",0xdf0adb08,"OpenDiscord.create","OpenDiscord.hx",65,0x8e95d91c)
HX_LOCAL_STACK_FRAME(_hx_pos_7779fe0c942acfa4_50_create,"OpenDiscord","create",0xdf0adb08,"OpenDiscord.create","OpenDiscord.hx",50,0x8e95d91c)
HX_LOCAL_STACK_FRAME(_hx_pos_7779fe0c942acfa4_78_update,"OpenDiscord","update",0xea00fa15,"OpenDiscord.update","OpenDiscord.hx",78,0x8e95d91c)

void OpenDiscord_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_7779fe0c942acfa4_48_new)
HXDLIN(  48)		super::__construct();
            	}

Dynamic OpenDiscord_obj::__CreateEmpty() { return new OpenDiscord_obj; }

void *OpenDiscord_obj::_hx_vtable = 0;

Dynamic OpenDiscord_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< OpenDiscord_obj > _hx_result = new OpenDiscord_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool OpenDiscord_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x62817b24) {
		if (inClassId<=(int)0x5661ffbf) {
			if (inClassId<=(int)0x0841db76) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x0841db76;
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

void OpenDiscord_obj::create(){
            		HX_BEGIN_LOCAL_FUNC_S1(::hx::LocalFunc,_hx_Closure_0, ::OpenDiscord,_gthis) HXARGC(0)
            		void _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_7779fe0c942acfa4_65_create)
HXLINE(  66)			{
HXLINE(  66)				::String prefix = HX_("",00,00,00,00);
HXDLIN(  66)				if (!( ::EReg_obj::__alloc( HX_CTX ,HX_("^https?://",48,ee,dd,38),HX_("",00,00,00,00))->match(HX_("https://discord.gg/VjG7PZ6ksy",27,1b,87,23)))) {
HXLINE(  66)					prefix = HX_("http://",52,75,cd,5a);
            				}
HXDLIN(  66)				::openfl::Lib_obj::getURL( ::openfl::net::URLRequest_obj::__alloc( HX_CTX ,(prefix + HX_("https://discord.gg/VjG7PZ6ksy",27,1b,87,23))),HX_("_blank",95,26,d9,b0));
            			}
HXLINE(  67)			::flixel::FlxG_obj::save->data->__SetField(HX_("realitydc",0f,91,b0,32),true,::hx::paccDynamic);
HXLINE(  68)			::flixel::FlxG_obj::save->data->__SetField(HX_("joinedc",7a,95,95,57),true,::hx::paccDynamic);
HXLINE(  69)			_gthis->close();
            		}
            		HX_END_LOCAL_FUNC0((void))

            	HX_GC_STACKFRAME(&_hx_pos_7779fe0c942acfa4_50_create)
HXDLIN(  50)		 ::OpenDiscord _gthis = ::hx::ObjectPtr<OBJ_>(this);
HXLINE(  51)		::flixel::FlxG_obj::mouse->set_visible(true);
HXLINE(  52)		if (::hx::IsEq( ::flixel::FlxG_obj::save->data->__Field(HX_("realitydc",0f,91,b0,32),::hx::paccDynamic),true )) {
HXLINE(  54)			this->close();
            		}
HXLINE(  56)		 ::flixel::FlxSprite bg =  ::flixel::FlxSprite_obj::__alloc( HX_CTX ,-100,null(),null());
HXDLIN(  56)		 ::flixel::FlxSprite bg1 = bg->loadGraphic(::Paths_obj::loadImage(HX_("joinDC",e9,bd,09,91),null()),null(),null(),null(),null(),null());
HXLINE(  57)		bg1->scrollFactor->set_x(( (Float)(0) ));
HXLINE(  58)		bg1->scrollFactor->set_y(((Float)0.10));
HXLINE(  59)		bg1->setGraphicSize(::Std_obj::_hx_int((bg1->get_width() * ((Float)1.1))),null());
HXLINE(  60)		bg1->updateHitbox();
HXLINE(  61)		{
HXLINE(  61)			 ::flixel::util::FlxAxes axes = ::flixel::util::FlxAxes_obj::XY_dyn();
HXDLIN(  61)			bool _hx_tmp;
HXDLIN(  61)			switch((int)(axes->_hx_getIndex())){
            				case (int)0: case (int)2: {
HXLINE(  61)					_hx_tmp = true;
            				}
            				break;
            				default:{
HXLINE(  61)					_hx_tmp = false;
            				}
            			}
HXDLIN(  61)			if (_hx_tmp) {
HXLINE(  61)				int _hx_tmp = ::flixel::FlxG_obj::width;
HXDLIN(  61)				bg1->set_x(((( (Float)(_hx_tmp) ) - bg1->get_width()) / ( (Float)(2) )));
            			}
HXDLIN(  61)			bool _hx_tmp1;
HXDLIN(  61)			switch((int)(axes->_hx_getIndex())){
            				case (int)1: case (int)2: {
HXLINE(  61)					_hx_tmp1 = true;
            				}
            				break;
            				default:{
HXLINE(  61)					_hx_tmp1 = false;
            				}
            			}
HXDLIN(  61)			if (_hx_tmp1) {
HXLINE(  61)				int _hx_tmp = ::flixel::FlxG_obj::height;
HXDLIN(  61)				bg1->set_y(((( (Float)(_hx_tmp) ) - bg1->get_height()) / ( (Float)(2) )));
            			}
            		}
HXLINE(  62)		bg1->set_antialiasing(( (bool)(::flixel::FlxG_obj::save->data->__Field(HX_("antialiasing",f4,16,b3,48),::hx::paccDynamic)) ));
HXLINE(  63)		this->add(bg1);
HXLINE(  65)		 ::flixel::ui::FlxButton save =  ::flixel::ui::FlxButton_obj::__alloc( HX_CTX ,550,550,HX_("Join Discord",76,9f,60,0a), ::Dynamic(new _hx_Closure_0(_gthis)));
HXLINE(  71)		this->add(save);
HXLINE(  73)		::flixel::FlxG_obj::save->data->__SetField(HX_("realitydc",0f,91,b0,32),true,::hx::paccDynamic);
HXLINE(  74)		this->super::create();
            	}


void OpenDiscord_obj::update(Float elapsed){
            	HX_STACKFRAME(&_hx_pos_7779fe0c942acfa4_78_update)
HXLINE(  79)		 ::flixel::input::keyboard::FlxKeyList _this = ( ( ::flixel::input::keyboard::FlxKeyList)(::flixel::FlxG_obj::keys->justPressed) );
HXDLIN(  79)		if (_this->keyManager->checkStatusUnsafe(27,_this->status)) {
HXLINE(  81)			::flixel::FlxG_obj::save->data->__SetField(HX_("realitydc",0f,91,b0,32),true,::hx::paccDynamic);
HXLINE(  82)			this->close();
            		}
HXLINE(  84)		this->super::update(elapsed);
            	}



::hx::ObjectPtr< OpenDiscord_obj > OpenDiscord_obj::__new() {
	::hx::ObjectPtr< OpenDiscord_obj > __this = new OpenDiscord_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< OpenDiscord_obj > OpenDiscord_obj::__alloc(::hx::Ctx *_hx_ctx) {
	OpenDiscord_obj *__this = (OpenDiscord_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(OpenDiscord_obj), true, "OpenDiscord"));
	*(void **)__this = OpenDiscord_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

OpenDiscord_obj::OpenDiscord_obj()
{
}

::hx::Val OpenDiscord_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { return ::hx::Val( create_dyn() ); }
		if (HX_FIELD_EQ(inName,"update") ) { return ::hx::Val( update_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *OpenDiscord_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *OpenDiscord_obj_sStaticStorageInfo = 0;
#endif

static ::String OpenDiscord_obj_sMemberFields[] = {
	HX_("create",fc,66,0f,7c),
	HX_("update",09,86,05,87),
	::String(null()) };

::hx::Class OpenDiscord_obj::__mClass;

void OpenDiscord_obj::__register()
{
	OpenDiscord_obj _hx_dummy;
	OpenDiscord_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("OpenDiscord",e2,e2,28,32);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(OpenDiscord_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< OpenDiscord_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = OpenDiscord_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = OpenDiscord_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
