// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_cc9afe4755847ade
#define INCLUDED_cc9afe4755847ade
#include "linc_lua.h"
#endif
#ifndef INCLUDED_LuaClass
#include <LuaClass.h>
#endif
#ifndef INCLUDED_LuaWindow
#include <LuaWindow.h>
#endif
#ifndef INCLUDED_Reflect
#include <Reflect.h>
#endif
#ifndef INCLUDED_flixel_tweens_FlxTween
#include <flixel/tweens/FlxTween.h>
#endif
#ifndef INCLUDED_flixel_tweens_misc_VarTween
#include <flixel/tweens/misc/VarTween.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_lime_app_Application
#include <lime/app/Application.h>
#endif
#ifndef INCLUDED_lime_app_IModule
#include <lime/app/IModule.h>
#endif
#ifndef INCLUDED_lime_app_Module
#include <lime/app/Module.h>
#endif
#ifndef INCLUDED_lime_ui_Window
#include <lime/ui/Window.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1771_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1771,0xe0a4e33e)
HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1781_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1781,0xe0a4e33e)
HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1791_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1791,0xe0a4e33e)
HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1801_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1801,0xe0a4e33e)
HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1811_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1811,0xe0a4e33e)
HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1816_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1816,0xe0a4e33e)
HX_DEFINE_STACK_FRAME(_hx_pos_bc049608668cd482_1763_new,"LuaWindow","new",0x4b52f09a,"LuaWindow.new","LuaClass.hx",1763,0xe0a4e33e)
HX_LOCAL_STACK_FRAME(_hx_pos_bc049608668cd482_1842_SetNumProperty,"LuaWindow","SetNumProperty",0xe4d61e5f,"LuaWindow.SetNumProperty","LuaClass.hx",1842,0xe0a4e33e)
HX_LOCAL_STACK_FRAME(_hx_pos_bc049608668cd482_1857_Register,"LuaWindow","Register",0xbf313009,"LuaWindow.Register","LuaClass.hx",1857,0xe0a4e33e)
HX_LOCAL_STACK_FRAME(_hx_pos_bc049608668cd482_1825_tweenPos,"LuaWindow","tweenPos",0x26ac4d6f,"LuaWindow.tweenPos","LuaClass.hx",1825,0xe0a4e33e)
HX_LOCAL_STACK_FRAME(_hx_pos_bc049608668cd482_1839_boot,"LuaWindow","boot",0x955896b8,"LuaWindow.boot","LuaClass.hx",1839,0xe0a4e33e)

void LuaWindow_obj::__construct(){
            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_0) HXARGC(2)
            		int _hx_run( cpp::Reference<lua_State> l, ::Dynamic data){
            			HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1771_new)
HXLINE(1772)			lua_pushnumber(l,( (Float)(::lime::app::Application_obj::current->_hx___window->_hx___x) ));
HXLINE(1773)			return 1;
            		}
            		HX_END_LOCAL_FUNC2(return)

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_1) HXARGC(2)
            		int _hx_run( cpp::Reference<lua_State> l, ::Dynamic data){
            			HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1781_new)
HXLINE(1782)			lua_pushnumber(l,( (Float)(::lime::app::Application_obj::current->_hx___window->_hx___y) ));
HXLINE(1783)			return 1;
            		}
            		HX_END_LOCAL_FUNC2(return)

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_2) HXARGC(2)
            		int _hx_run( cpp::Reference<lua_State> l, ::Dynamic data){
            			HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1791_new)
HXLINE(1792)			lua_pushnumber(l,( (Float)(::lime::app::Application_obj::current->_hx___window->_hx___width) ));
HXLINE(1793)			return 1;
            		}
            		HX_END_LOCAL_FUNC2(return)

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_3) HXARGC(2)
            		int _hx_run( cpp::Reference<lua_State> l, ::Dynamic data){
            			HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1801_new)
HXLINE(1802)			lua_pushnumber(l,( (Float)(::lime::app::Application_obj::current->_hx___window->_hx___height) ));
HXLINE(1803)			return 1;
            		}
            		HX_END_LOCAL_FUNC2(return)

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_4) HXARGC(2)
            		int _hx_run( cpp::Reference<lua_State> l, ::Dynamic data){
            			HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1811_new)
HXLINE(1812)			linc::lua::pushcfunction(l,::LuaWindow_obj::tweenPosC);
HXLINE(1813)			return 1;
            		}
            		HX_END_LOCAL_FUNC2(return)

            		HX_BEGIN_LOCAL_FUNC_S0(::hx::LocalFunc,_hx_Closure_5) HXARGC(1)
            		int _hx_run( cpp::Reference<lua_State> l){
            			HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1816_new)
HXLINE(1817)			linc::lual::error(l,HX_("tweenPos is read-only.",ca,97,f3,17));
HXLINE(1818)			return 0;
            		}
            		HX_END_LOCAL_FUNC1(return)

            	HX_GC_STACKFRAME(&_hx_pos_bc049608668cd482_1763_new)
HXLINE(1764)		super::__construct();
HXLINE(1765)		this->className = HX_("Window",10,08,21,87);
HXLINE(1767)		 ::haxe::ds::StringMap _g =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
HXDLIN(1767)		_g->set(HX_("x",78,00,00,00), ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("getter",0b,df,3f,a3), ::Dynamic(new _hx_Closure_0()))
            			->setFixed(1,HX_("defaultValue",f0,ba,13,e7),::lime::app::Application_obj::current->_hx___window->_hx___x)
            			->setFixed(2,HX_("setter",7f,33,88,6f),this->SetNumProperty_dyn())));
HXDLIN(1767)		_g->set(HX_("y",79,00,00,00), ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("getter",0b,df,3f,a3), ::Dynamic(new _hx_Closure_1()))
            			->setFixed(1,HX_("defaultValue",f0,ba,13,e7),::lime::app::Application_obj::current->_hx___window->_hx___y)
            			->setFixed(2,HX_("setter",7f,33,88,6f),this->SetNumProperty_dyn())));
HXDLIN(1767)		_g->set(HX_("width",06,b6,62,ca), ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("getter",0b,df,3f,a3), ::Dynamic(new _hx_Closure_2()))
            			->setFixed(1,HX_("defaultValue",f0,ba,13,e7),::lime::app::Application_obj::current->_hx___window->_hx___width)
            			->setFixed(2,HX_("setter",7f,33,88,6f),this->SetNumProperty_dyn())));
HXDLIN(1767)		_g->set(HX_("height",e7,07,4c,02), ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("getter",0b,df,3f,a3), ::Dynamic(new _hx_Closure_3()))
            			->setFixed(1,HX_("defaultValue",f0,ba,13,e7),::lime::app::Application_obj::current->_hx___window->_hx___height)
            			->setFixed(2,HX_("setter",7f,33,88,6f),this->SetNumProperty_dyn())));
HXDLIN(1767)		_g->set(HX_("tweenPos",e9,7f,cc,11), ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("getter",0b,df,3f,a3), ::Dynamic(new _hx_Closure_4()))
            			->setFixed(1,HX_("defaultValue",f0,ba,13,e7),0)
            			->setFixed(2,HX_("setter",7f,33,88,6f), ::Dynamic(new _hx_Closure_5()))));
HXDLIN(1767)		this->properties = _g;
            	}

Dynamic LuaWindow_obj::__CreateEmpty() { return new LuaWindow_obj; }

void *LuaWindow_obj::_hx_vtable = 0;

Dynamic LuaWindow_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< LuaWindow_obj > _hx_result = new LuaWindow_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool LuaWindow_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x52dfe7a4) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x52dfe7a4;
	} else {
		return inClassId==(int)0x7e86a304;
	}
}

int LuaWindow_obj::SetNumProperty( cpp::Reference<lua_State> l){
            	HX_STACKFRAME(&_hx_pos_bc049608668cd482_1842_SetNumProperty)
HXLINE(1847)		if ((lua_type(l,3) != 3)) {
HXLINE(1849)			linc::lual::error(l,((HX_("invalid argument #3 (number expected, got ",25,84,c0,d9) + linc::lua::_typename(l,lua_type(l,3))) + HX_(")",29,00,00,00)));
HXLINE(1850)			return 0;
            		}
HXLINE(1852)		 ::lime::ui::Window _hx_tmp = ::lime::app::Application_obj::current->_hx___window;
HXDLIN(1852)		::String _hx_tmp1 = linc::lua::tostring(l,2);
HXDLIN(1852)		::Reflect_obj::setProperty(_hx_tmp,_hx_tmp1,lua_tonumber(l,3));
HXLINE(1853)		return 0;
            	}


HX_DEFINE_DYNAMIC_FUNC1(LuaWindow_obj,SetNumProperty,return )

void LuaWindow_obj::Register( cpp::Reference<lua_State> l){
            	HX_STACKFRAME(&_hx_pos_bc049608668cd482_1857_Register)
HXLINE(1858)		::LuaWindow_obj::state = l;
HXLINE(1859)		this->super::Register(l);
            	}


 cpp::Reference<lua_State> LuaWindow_obj::state;

int LuaWindow_obj::tweenPos( lua_State* l){
            	HX_STACKFRAME(&_hx_pos_bc049608668cd482_1825_tweenPos)
HXLINE(1830)		Float xp = luaL_checknumber(::LuaWindow_obj::state,2);
HXLINE(1831)		Float yp = luaL_checknumber(::LuaWindow_obj::state,3);
HXLINE(1832)		Float time = luaL_checknumber(::LuaWindow_obj::state,4);
HXLINE(1834)		::flixel::tweens::FlxTween_obj::tween(::lime::app::Application_obj::current->_hx___window, ::Dynamic(::hx::Anon_obj::Create(2)
            			->setFixed(0,HX_("x",78,00,00,00),xp)
            			->setFixed(1,HX_("y",79,00,00,00),yp)),time,null());
HXLINE(1836)		return 0;
            	}


::cpp::Function< int  ( lua_State*) > LuaWindow_obj::tweenPosC;


::hx::ObjectPtr< LuaWindow_obj > LuaWindow_obj::__new() {
	::hx::ObjectPtr< LuaWindow_obj > __this = new LuaWindow_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< LuaWindow_obj > LuaWindow_obj::__alloc(::hx::Ctx *_hx_ctx) {
	LuaWindow_obj *__this = (LuaWindow_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(LuaWindow_obj), true, "LuaWindow"));
	*(void **)__this = LuaWindow_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

LuaWindow_obj::LuaWindow_obj()
{
}

::hx::Val LuaWindow_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"Register") ) { return ::hx::Val( Register_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"SetNumProperty") ) { return ::hx::Val( SetNumProperty_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool LuaWindow_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"state") ) { outValue = ( state ); return true; }
	}
	return false;
}

bool LuaWindow_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"state") ) { state=ioValue.Cast<  cpp::Reference<lua_State> >(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *LuaWindow_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo LuaWindow_obj_sStaticStorageInfo[] = {
	{::hx::fsUnknown /*  cpp::Reference<lua_State> */ ,(void *) &LuaWindow_obj::state,HX_("state",11,76,0b,84)},
	{::hx::fsObject /* ::cpp::Function< int  ( lua_State*) > */ ,(void *) &LuaWindow_obj::tweenPosC,HX_("tweenPosC",3a,6c,23,81)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String LuaWindow_obj_sMemberFields[] = {
	HX_("SetNumProperty",59,68,62,ea),
	HX_("Register",83,62,51,aa),
	::String(null()) };

static void LuaWindow_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(LuaWindow_obj::state,"state");
	HX_MARK_MEMBER_NAME(LuaWindow_obj::tweenPosC,"tweenPosC");
};

#ifdef HXCPP_VISIT_ALLOCS
static void LuaWindow_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(LuaWindow_obj::state,"state");
	HX_VISIT_MEMBER_NAME(LuaWindow_obj::tweenPosC,"tweenPosC");
};

#endif

::hx::Class LuaWindow_obj::__mClass;

static ::String LuaWindow_obj_sStaticFields[] = {
	HX_("state",11,76,0b,84),
	::String(null())
};

void LuaWindow_obj::__register()
{
	LuaWindow_obj _hx_dummy;
	LuaWindow_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("LuaWindow",a8,5b,7c,0c);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &LuaWindow_obj::__GetStatic;
	__mClass->mSetStaticField = &LuaWindow_obj::__SetStatic;
	__mClass->mMarkFunc = LuaWindow_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(LuaWindow_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(LuaWindow_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< LuaWindow_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = LuaWindow_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = LuaWindow_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = LuaWindow_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void LuaWindow_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_bc049608668cd482_1839_boot)
HXDLIN(1839)		tweenPosC = ::cpp::Function< int ( lua_State*)>(::hx::AnyCast(&::LuaWindow_obj::tweenPos ));
            	}
}
