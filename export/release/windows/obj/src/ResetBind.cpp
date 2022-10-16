// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_Debug
#include <Debug.h>
#endif
#ifndef INCLUDED_Option
#include <Option.h>
#endif
#ifndef INCLUDED_ResetBind
#include <ResetBind.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_util_FlxSave
#include <flixel/util/FlxSave.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c2a2a3d366dcbe79_256_new,"ResetBind","new",0x1a3bf5fe,"ResetBind.new","Options.hx",256,0x9d9a0240)
HX_LOCAL_STACK_FRAME(_hx_pos_c2a2a3d366dcbe79_264_onType,"ResetBind","onType",0xd3ffac9b,"ResetBind.onType","Options.hx",264,0x9d9a0240)
HX_LOCAL_STACK_FRAME(_hx_pos_c2a2a3d366dcbe79_272_press,"ResetBind","press",0x48fb9ca1,"ResetBind.press","Options.hx",272,0x9d9a0240)
HX_LOCAL_STACK_FRAME(_hx_pos_c2a2a3d366dcbe79_281_updateDisplay,"ResetBind","updateDisplay",0xc1672657,"ResetBind.updateDisplay","Options.hx",281,0x9d9a0240)

void ResetBind_obj::__construct(::String desc){
            	HX_STACKFRAME(&_hx_pos_c2a2a3d366dcbe79_256_new)
HXLINE( 257)		super::__construct();
HXLINE( 258)		this->description = desc;
HXLINE( 259)		this->acceptType = true;
            	}

Dynamic ResetBind_obj::__CreateEmpty() { return new ResetBind_obj; }

void *ResetBind_obj::_hx_vtable = 0;

Dynamic ResetBind_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< ResetBind_obj > _hx_result = new ResetBind_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool ResetBind_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x27a70eb9) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x27a70eb9;
	} else {
		return inClassId==(int)0x49a6f884;
	}
}

void ResetBind_obj::onType(::String text){
            	HX_STACKFRAME(&_hx_pos_c2a2a3d366dcbe79_264_onType)
HXDLIN( 264)		if (this->waitingType) {
HXLINE( 266)			::flixel::FlxG_obj::save->data->__SetField(HX_("resetBind",2c,ff,02,87),text,::hx::paccDynamic);
HXLINE( 267)			this->waitingType = false;
            		}
            	}


bool ResetBind_obj::press(){
            	HX_STACKFRAME(&_hx_pos_c2a2a3d366dcbe79_272_press)
HXLINE( 273)		::Debug_obj::logTrace(HX_("keybind change",34,82,1f,10),::hx::SourceInfo(HX_("source/Options.hx",34,ca,fe,29),273,HX_("ResetBind",0c,df,d5,28),HX_("press",83,53,88,c8)));
HXLINE( 274)		this->waitingType = !(this->waitingType);
HXLINE( 276)		return true;
            	}


::String ResetBind_obj::updateDisplay(){
            	HX_STACKFRAME(&_hx_pos_c2a2a3d366dcbe79_281_updateDisplay)
HXDLIN( 281)		::String _hx_tmp;
HXDLIN( 281)		if (this->waitingType) {
HXDLIN( 281)			_hx_tmp = ((HX_("> ",22,36,00,00) + ::Std_obj::string( ::Dynamic(::flixel::FlxG_obj::save->data->__Field(HX_("resetBind",2c,ff,02,87),::hx::paccDynamic)))) + HX_(" <",1c,1c,00,00));
            		}
            		else {
HXDLIN( 281)			_hx_tmp = ( (::String)(::flixel::FlxG_obj::save->data->__Field(HX_("resetBind",2c,ff,02,87),::hx::paccDynamic)) );
            		}
HXDLIN( 281)		return ((HX_("RESET: ",15,be,9d,e0) + _hx_tmp) + HX_("",00,00,00,00));
            	}



::hx::ObjectPtr< ResetBind_obj > ResetBind_obj::__new(::String desc) {
	::hx::ObjectPtr< ResetBind_obj > __this = new ResetBind_obj();
	__this->__construct(desc);
	return __this;
}

::hx::ObjectPtr< ResetBind_obj > ResetBind_obj::__alloc(::hx::Ctx *_hx_ctx,::String desc) {
	ResetBind_obj *__this = (ResetBind_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(ResetBind_obj), true, "ResetBind"));
	*(void **)__this = ResetBind_obj::_hx_vtable;
	__this->__construct(desc);
	return __this;
}

ResetBind_obj::ResetBind_obj()
{
}

::hx::Val ResetBind_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"press") ) { return ::hx::Val( press_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"onType") ) { return ::hx::Val( onType_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"updateDisplay") ) { return ::hx::Val( updateDisplay_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *ResetBind_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *ResetBind_obj_sStaticStorageInfo = 0;
#endif

static ::String ResetBind_obj_sMemberFields[] = {
	HX_("onType",79,fb,92,ef),
	HX_("press",83,53,88,c8),
	HX_("updateDisplay",39,8f,b8,86),
	::String(null()) };

::hx::Class ResetBind_obj::__mClass;

void ResetBind_obj::__register()
{
	ResetBind_obj _hx_dummy;
	ResetBind_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("ResetBind",0c,df,d5,28);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(ResetBind_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< ResetBind_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ResetBind_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ResetBind_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
