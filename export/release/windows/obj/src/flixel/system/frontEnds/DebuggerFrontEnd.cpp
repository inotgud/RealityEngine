// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_flixel_system_frontEnds_DebuggerFrontEnd
#include <flixel/system/frontEnds/DebuggerFrontEnd.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxSignal
#include <flixel/util/IFlxSignal.h>
#endif
#ifndef INCLUDED_flixel_util__FlxSignal_FlxBaseSignal
#include <flixel/util/_FlxSignal/FlxBaseSignal.h>
#endif
#ifndef INCLUDED_flixel_util__FlxSignal_FlxSignal0
#include <flixel/util/_FlxSignal/FlxSignal0.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_6f944dca4f3bb528_19_new,"flixel.system.frontEnds.DebuggerFrontEnd","new",0x8bc76b9f,"flixel.system.frontEnds.DebuggerFrontEnd.new","flixel/system/frontEnds/DebuggerFrontEnd.hx",19,0x2ebb4b30)
namespace flixel{
namespace _hx_system{
namespace frontEnds{

void DebuggerFrontEnd_obj::__construct(){
            	HX_GC_STACKFRAME(&_hx_pos_6f944dca4f3bb528_19_new)
HXLINE(  50)		this->visible = false;
HXLINE(  48)		this->visibilityChanged =  ::flixel::util::_FlxSignal::FlxSignal0_obj::__alloc( HX_CTX );
HXLINE(  24)		this->precision = 3;
            	}

Dynamic DebuggerFrontEnd_obj::__CreateEmpty() { return new DebuggerFrontEnd_obj; }

void *DebuggerFrontEnd_obj::_hx_vtable = 0;

Dynamic DebuggerFrontEnd_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< DebuggerFrontEnd_obj > _hx_result = new DebuggerFrontEnd_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool DebuggerFrontEnd_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x76a44a29;
}


::hx::ObjectPtr< DebuggerFrontEnd_obj > DebuggerFrontEnd_obj::__new() {
	::hx::ObjectPtr< DebuggerFrontEnd_obj > __this = new DebuggerFrontEnd_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< DebuggerFrontEnd_obj > DebuggerFrontEnd_obj::__alloc(::hx::Ctx *_hx_ctx) {
	DebuggerFrontEnd_obj *__this = (DebuggerFrontEnd_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(DebuggerFrontEnd_obj), true, "flixel.system.frontEnds.DebuggerFrontEnd"));
	*(void **)__this = DebuggerFrontEnd_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

DebuggerFrontEnd_obj::DebuggerFrontEnd_obj()
{
}

void DebuggerFrontEnd_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(DebuggerFrontEnd);
	HX_MARK_MEMBER_NAME(precision,"precision");
	HX_MARK_MEMBER_NAME(visibilityChanged,"visibilityChanged");
	HX_MARK_MEMBER_NAME(visible,"visible");
	HX_MARK_END_CLASS();
}

void DebuggerFrontEnd_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(precision,"precision");
	HX_VISIT_MEMBER_NAME(visibilityChanged,"visibilityChanged");
	HX_VISIT_MEMBER_NAME(visible,"visible");
}

::hx::Val DebuggerFrontEnd_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"visible") ) { return ::hx::Val( visible ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"precision") ) { return ::hx::Val( precision ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"visibilityChanged") ) { return ::hx::Val( visibilityChanged ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val DebuggerFrontEnd_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"visible") ) { visible=inValue.Cast< bool >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"precision") ) { precision=inValue.Cast< int >(); return inValue; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"visibilityChanged") ) { visibilityChanged=inValue.Cast<  ::flixel::util::_FlxSignal::FlxSignal0 >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void DebuggerFrontEnd_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("precision",3e,d5,c7,80));
	outFields->push(HX_("visibilityChanged",42,69,31,f5));
	outFields->push(HX_("visible",72,78,24,a3));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo DebuggerFrontEnd_obj_sMemberStorageInfo[] = {
	{::hx::fsInt,(int)offsetof(DebuggerFrontEnd_obj,precision),HX_("precision",3e,d5,c7,80)},
	{::hx::fsObject /*  ::flixel::util::_FlxSignal::FlxSignal0 */ ,(int)offsetof(DebuggerFrontEnd_obj,visibilityChanged),HX_("visibilityChanged",42,69,31,f5)},
	{::hx::fsBool,(int)offsetof(DebuggerFrontEnd_obj,visible),HX_("visible",72,78,24,a3)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *DebuggerFrontEnd_obj_sStaticStorageInfo = 0;
#endif

static ::String DebuggerFrontEnd_obj_sMemberFields[] = {
	HX_("precision",3e,d5,c7,80),
	HX_("visibilityChanged",42,69,31,f5),
	HX_("visible",72,78,24,a3),
	::String(null()) };

::hx::Class DebuggerFrontEnd_obj::__mClass;

void DebuggerFrontEnd_obj::__register()
{
	DebuggerFrontEnd_obj _hx_dummy;
	DebuggerFrontEnd_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.system.frontEnds.DebuggerFrontEnd",2d,b0,6b,ec);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(DebuggerFrontEnd_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< DebuggerFrontEnd_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = DebuggerFrontEnd_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = DebuggerFrontEnd_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace system
} // end namespace frontEnds