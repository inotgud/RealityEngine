// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_openfl_display_DOMRenderer
#include <openfl/display/DOMRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectRenderer
#include <openfl/display/DisplayObjectRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display__internal_DOMTextField
#include <openfl/display/_internal/DOMTextField.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_text_TextField
#include <openfl/text/TextField.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_737ece1df218ad42_26_clear,"openfl.display._internal.DOMTextField","clear",0x58a798c6,"openfl.display._internal.DOMTextField.clear","openfl/display/_internal/DOMTextField.hx",26,0xc7d4d214)
HX_LOCAL_STACK_FRAME(_hx_pos_737ece1df218ad42_346_renderDrawable,"openfl.display._internal.DOMTextField","renderDrawable",0x8cdc02bb,"openfl.display._internal.DOMTextField.renderDrawable","openfl/display/_internal/DOMTextField.hx",346,0xc7d4d214)
HX_LOCAL_STACK_FRAME(_hx_pos_737ece1df218ad42_384_renderDrawableClear,"openfl.display._internal.DOMTextField","renderDrawableClear",0xaca218d2,"openfl.display._internal.DOMTextField.renderDrawableClear","openfl/display/_internal/DOMTextField.hx",384,0xc7d4d214)
HX_LOCAL_STACK_FRAME(_hx_pos_737ece1df218ad42_17_boot,"openfl.display._internal.DOMTextField","boot",0xe1e5e719,"openfl.display._internal.DOMTextField.boot","openfl/display/_internal/DOMTextField.hx",17,0xc7d4d214)
namespace openfl{
namespace display{
namespace _internal{

void DOMTextField_obj::__construct() { }

Dynamic DOMTextField_obj::__CreateEmpty() { return new DOMTextField_obj; }

void *DOMTextField_obj::_hx_vtable = 0;

Dynamic DOMTextField_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< DOMTextField_obj > _hx_result = new DOMTextField_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool DOMTextField_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x43d09599;
}

void DOMTextField_obj::clear( ::openfl::text::TextField textField, ::openfl::display::DOMRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_737ece1df218ad42_26_clear)
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DOMTextField_obj,clear,(void))

void DOMTextField_obj::renderDrawable( ::openfl::text::TextField textField, ::openfl::display::DOMRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_737ece1df218ad42_346_renderDrawable)
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DOMTextField_obj,renderDrawable,(void))

void DOMTextField_obj::renderDrawableClear( ::openfl::text::TextField textField, ::openfl::display::DOMRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_737ece1df218ad42_384_renderDrawableClear)
HXDLIN( 384)		::openfl::display::_internal::DOMTextField_obj::clear(textField,renderer);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DOMTextField_obj,renderDrawableClear,(void))


DOMTextField_obj::DOMTextField_obj()
{
}

bool DOMTextField_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"clear") ) { outValue = clear_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"renderDrawable") ) { outValue = renderDrawable_dyn(); return true; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"renderDrawableClear") ) { outValue = renderDrawableClear_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *DOMTextField_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *DOMTextField_obj_sStaticStorageInfo = 0;
#endif

::hx::Class DOMTextField_obj::__mClass;

static ::String DOMTextField_obj_sStaticFields[] = {
	HX_("clear",8d,71,5b,48),
	HX_("renderDrawable",14,59,d0,dd),
	HX_("renderDrawableClear",d9,1f,f9,ad),
	::String(null())
};

void DOMTextField_obj::__register()
{
	DOMTextField_obj _hx_dummy;
	DOMTextField_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.display._internal.DOMTextField",e7,e6,d2,33);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &DOMTextField_obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(DOMTextField_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< DOMTextField_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = DOMTextField_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = DOMTextField_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void DOMTextField_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_737ece1df218ad42_17_boot)
HXDLIN(  17)		__mClass->__meta__ =  ::Dynamic(::hx::Anon_obj::Create(1)
            			->setFixed(0,HX_("obj",f7,8f,54,00), ::Dynamic(::hx::Anon_obj::Create(1)
            				->setFixed(0,HX_("SuppressWarnings",0c,d3,d2,00),::cpp::VirtualArray_obj::__new(1)->init(0,HX_("checkstyle:FieldDocComment",70,56,1b,20))))));
            	}
}

} // end namespace openfl
} // end namespace display
} // end namespace _internal