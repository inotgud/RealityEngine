// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_flixel_system_frontEnds_VCRFrontEnd
#include <flixel/system/frontEnds/VCRFrontEnd.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_9c3075758433de87_21_new,"flixel.system.frontEnds.VCRFrontEnd","new",0x9592d9ef,"flixel.system.frontEnds.VCRFrontEnd.new","flixel/system/frontEnds/VCRFrontEnd.hx",21,0xa1666a42)
namespace flixel{
namespace _hx_system{
namespace frontEnds{

void VCRFrontEnd_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_9c3075758433de87_21_new)
HXLINE(  59)		this->stepRequested = false;
HXLINE(  54)		this->paused = false;
            	}

Dynamic VCRFrontEnd_obj::__CreateEmpty() { return new VCRFrontEnd_obj; }

void *VCRFrontEnd_obj::_hx_vtable = 0;

Dynamic VCRFrontEnd_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< VCRFrontEnd_obj > _hx_result = new VCRFrontEnd_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool VCRFrontEnd_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0b9c7265;
}


VCRFrontEnd_obj::VCRFrontEnd_obj()
{
}

::hx::Val VCRFrontEnd_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"paused") ) { return ::hx::Val( paused ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"stepRequested") ) { return ::hx::Val( stepRequested ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val VCRFrontEnd_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"paused") ) { paused=inValue.Cast< bool >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"stepRequested") ) { stepRequested=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void VCRFrontEnd_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("paused",ae,40,84,ef));
	outFields->push(HX_("stepRequested",82,98,54,d1));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo VCRFrontEnd_obj_sMemberStorageInfo[] = {
	{::hx::fsBool,(int)offsetof(VCRFrontEnd_obj,paused),HX_("paused",ae,40,84,ef)},
	{::hx::fsBool,(int)offsetof(VCRFrontEnd_obj,stepRequested),HX_("stepRequested",82,98,54,d1)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *VCRFrontEnd_obj_sStaticStorageInfo = 0;
#endif

static ::String VCRFrontEnd_obj_sMemberFields[] = {
	HX_("paused",ae,40,84,ef),
	HX_("stepRequested",82,98,54,d1),
	::String(null()) };

::hx::Class VCRFrontEnd_obj::__mClass;

void VCRFrontEnd_obj::__register()
{
	VCRFrontEnd_obj _hx_dummy;
	VCRFrontEnd_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.system.frontEnds.VCRFrontEnd",7d,b6,ad,b5);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(VCRFrontEnd_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< VCRFrontEnd_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = VCRFrontEnd_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = VCRFrontEnd_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace system
} // end namespace frontEnds