// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_lime_graphics_opengl_ext_APPLE_texture_max_level
#include <lime/graphics/opengl/ext/APPLE_texture_max_level.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_2b1cc31c43c675de_6_new,"lime.graphics.opengl.ext.APPLE_texture_max_level","new",0xb41c1cd0,"lime.graphics.opengl.ext.APPLE_texture_max_level.new","lime/graphics/opengl/ext/APPLE_texture_max_level.hx",6,0x1e6a97c2)
namespace lime{
namespace graphics{
namespace opengl{
namespace ext{

void APPLE_texture_max_level_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_2b1cc31c43c675de_6_new)
HXDLIN(   6)		this->TEXTURE_MAX_LEVEL_APPLE = 33085;
            	}

Dynamic APPLE_texture_max_level_obj::__CreateEmpty() { return new APPLE_texture_max_level_obj; }

void *APPLE_texture_max_level_obj::_hx_vtable = 0;

Dynamic APPLE_texture_max_level_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< APPLE_texture_max_level_obj > _hx_result = new APPLE_texture_max_level_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool APPLE_texture_max_level_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x75aa078e;
}


APPLE_texture_max_level_obj::APPLE_texture_max_level_obj()
{
}

::hx::Val APPLE_texture_max_level_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 23:
		if (HX_FIELD_EQ(inName,"TEXTURE_MAX_LEVEL_APPLE") ) { return ::hx::Val( TEXTURE_MAX_LEVEL_APPLE ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val APPLE_texture_max_level_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 23:
		if (HX_FIELD_EQ(inName,"TEXTURE_MAX_LEVEL_APPLE") ) { TEXTURE_MAX_LEVEL_APPLE=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void APPLE_texture_max_level_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("TEXTURE_MAX_LEVEL_APPLE",a0,c4,c8,df));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo APPLE_texture_max_level_obj_sMemberStorageInfo[] = {
	{::hx::fsInt,(int)offsetof(APPLE_texture_max_level_obj,TEXTURE_MAX_LEVEL_APPLE),HX_("TEXTURE_MAX_LEVEL_APPLE",a0,c4,c8,df)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *APPLE_texture_max_level_obj_sStaticStorageInfo = 0;
#endif

static ::String APPLE_texture_max_level_obj_sMemberFields[] = {
	HX_("TEXTURE_MAX_LEVEL_APPLE",a0,c4,c8,df),
	::String(null()) };

::hx::Class APPLE_texture_max_level_obj::__mClass;

void APPLE_texture_max_level_obj::__register()
{
	APPLE_texture_max_level_obj _hx_dummy;
	APPLE_texture_max_level_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("lime.graphics.opengl.ext.APPLE_texture_max_level",de,b4,81,4d);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(APPLE_texture_max_level_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< APPLE_texture_max_level_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = APPLE_texture_max_level_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = APPLE_texture_max_level_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace graphics
} // end namespace opengl
} // end namespace ext