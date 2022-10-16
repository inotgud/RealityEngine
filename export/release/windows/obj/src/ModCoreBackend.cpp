// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_Debug
#include <Debug.h>
#endif
#ifndef INCLUDED_ModCoreBackend
#include <ModCoreBackend.h>
#endif
#ifndef INCLUDED_flixel_system_debug_log_LogStyle
#include <flixel/system/debug/log/LogStyle.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_polymod_backends_IBackend
#include <polymod/backends/IBackend.h>
#endif
#ifndef INCLUDED_polymod_backends_LimeBackend
#include <polymod/backends/LimeBackend.h>
#endif
#ifndef INCLUDED_polymod_backends_OpenFLBackend
#include <polymod/backends/OpenFLBackend.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_0b6f18c5f37dd37b_154_new,"ModCoreBackend","new",0x2cde9f65,"ModCoreBackend.new","ModCore.hx",154,0xcf163c3d)
HX_LOCAL_STACK_FRAME(_hx_pos_0b6f18c5f37dd37b_160_clearCache,"ModCoreBackend","clearCache",0xd7182510,"ModCoreBackend.clearCache","ModCore.hx",160,0xcf163c3d)
HX_LOCAL_STACK_FRAME(_hx_pos_0b6f18c5f37dd37b_166_exists,"ModCoreBackend","exists",0x5c0ebff7,"ModCoreBackend.exists","ModCore.hx",166,0xcf163c3d)
HX_LOCAL_STACK_FRAME(_hx_pos_0b6f18c5f37dd37b_172_getBytes,"ModCoreBackend","getBytes",0x1c1eb6d0,"ModCoreBackend.getBytes","ModCore.hx",172,0xcf163c3d)
HX_LOCAL_STACK_FRAME(_hx_pos_0b6f18c5f37dd37b_178_getText,"ModCoreBackend","getText",0x2c1bb1e8,"ModCoreBackend.getText","ModCore.hx",178,0xcf163c3d)

void ModCoreBackend_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_0b6f18c5f37dd37b_154_new)
HXLINE( 155)		super::__construct();
HXLINE( 156)		::Debug_obj::logTrace(HX_("Initialized custom asset loader backend.",14,14,a2,2b),::hx::SourceInfo(HX_("source/ModCore.hx",31,04,7b,5b),156,HX_("ModCoreBackend",f3,08,20,df),HX_("new",60,d0,53,00)));
            	}

Dynamic ModCoreBackend_obj::__CreateEmpty() { return new ModCoreBackend_obj; }

void *ModCoreBackend_obj::_hx_vtable = 0;

Dynamic ModCoreBackend_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< ModCoreBackend_obj > _hx_result = new ModCoreBackend_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool ModCoreBackend_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x12bf7dcf) {
		if (inClassId<=(int)0x0f879c7b) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x0f879c7b;
		} else {
			return inClassId==(int)0x12bf7dcf;
		}
	} else {
		return inClassId==(int)0x7a28a88e;
	}
}

void ModCoreBackend_obj::clearCache(){
            	HX_STACKFRAME(&_hx_pos_0b6f18c5f37dd37b_160_clearCache)
HXLINE( 161)		this->super::clearCache();
HXLINE( 162)		{
HXLINE( 162)			 ::Dynamic input = HX_("Custom asset cache has been cleared.",d3,43,ca,e4);
HXDLIN( 162)			if (::hx::IsNotNull( input )) {
HXLINE( 162)				::cpp::VirtualArray output = ::Debug_obj::formatOutput(input,::hx::SourceInfo(HX_("source/ModCore.hx",31,04,7b,5b),162,HX_("ModCoreBackend",f3,08,20,df),HX_("clearCache",75,d9,1e,16)));
HXDLIN( 162)				::Debug_obj::writeToFlxGLog(output,::Debug_obj::LOG_STYLE_WARN);
HXDLIN( 162)				::Debug_obj::writeToLogFile(output,HX_("WARN",46,2a,b3,39));
            			}
            		}
            	}


bool ModCoreBackend_obj::exists(::String id){
            	HX_STACKFRAME(&_hx_pos_0b6f18c5f37dd37b_166_exists)
HXLINE( 167)		::Debug_obj::logTrace(((HX_("Call to ModCoreBackend: exists(",10,78,93,a8) + id) + HX_(")",29,00,00,00)),::hx::SourceInfo(HX_("source/ModCore.hx",31,04,7b,5b),167,HX_("ModCoreBackend",f3,08,20,df),HX_("exists",dc,1d,e0,bf)));
HXLINE( 168)		return this->super::exists(id);
            	}


 ::haxe::io::Bytes ModCoreBackend_obj::getBytes(::String id){
            	HX_STACKFRAME(&_hx_pos_0b6f18c5f37dd37b_172_getBytes)
HXLINE( 173)		::Debug_obj::logTrace(((HX_("Call to ModCoreBackend: getBytes(",d7,2c,5a,09) + id) + HX_(")",29,00,00,00)),::hx::SourceInfo(HX_("source/ModCore.hx",31,04,7b,5b),173,HX_("ModCoreBackend",f3,08,20,df),HX_("getBytes",f5,17,6f,1d)));
HXLINE( 174)		return this->super::getBytes(id);
            	}


::String ModCoreBackend_obj::getText(::String id){
            	HX_STACKFRAME(&_hx_pos_0b6f18c5f37dd37b_178_getText)
HXLINE( 179)		::Debug_obj::logTrace(((HX_("Call to ModCoreBackend: getText(",a1,80,5d,b7) + id) + HX_(")",29,00,00,00)),::hx::SourceInfo(HX_("source/ModCore.hx",31,04,7b,5b),179,HX_("ModCoreBackend",f3,08,20,df),HX_("getText",63,7c,7c,1f)));
HXLINE( 180)		return this->super::getText(id);
            	}



::hx::ObjectPtr< ModCoreBackend_obj > ModCoreBackend_obj::__new() {
	::hx::ObjectPtr< ModCoreBackend_obj > __this = new ModCoreBackend_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< ModCoreBackend_obj > ModCoreBackend_obj::__alloc(::hx::Ctx *_hx_ctx) {
	ModCoreBackend_obj *__this = (ModCoreBackend_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(ModCoreBackend_obj), true, "ModCoreBackend"));
	*(void **)__this = ModCoreBackend_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

ModCoreBackend_obj::ModCoreBackend_obj()
{
}

::hx::Val ModCoreBackend_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"exists") ) { return ::hx::Val( exists_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"getText") ) { return ::hx::Val( getText_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"getBytes") ) { return ::hx::Val( getBytes_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"clearCache") ) { return ::hx::Val( clearCache_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *ModCoreBackend_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *ModCoreBackend_obj_sStaticStorageInfo = 0;
#endif

static ::String ModCoreBackend_obj_sMemberFields[] = {
	HX_("clearCache",75,d9,1e,16),
	HX_("exists",dc,1d,e0,bf),
	HX_("getBytes",f5,17,6f,1d),
	HX_("getText",63,7c,7c,1f),
	::String(null()) };

::hx::Class ModCoreBackend_obj::__mClass;

void ModCoreBackend_obj::__register()
{
	ModCoreBackend_obj _hx_dummy;
	ModCoreBackend_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("ModCoreBackend",f3,08,20,df);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(ModCoreBackend_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< ModCoreBackend_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ModCoreBackend_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ModCoreBackend_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
