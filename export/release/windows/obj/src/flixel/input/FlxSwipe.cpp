// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_FlxGame
#include <flixel/FlxGame.h>
#endif
#ifndef INCLUDED_flixel_input_FlxSwipe
#include <flixel/input/FlxSwipe.h>
#endif
#ifndef INCLUDED_flixel_math_FlxPoint
#include <flixel/math/FlxPoint.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_flixel_util_IFlxPooled
#include <flixel/util/IFlxPooled.h>
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

HX_DEFINE_STACK_FRAME(_hx_pos_223f15e5be8ee429_29_new,"flixel.input.FlxSwipe","new",0xecc12d70,"flixel.input.FlxSwipe.new","flixel/input/FlxSwipe.hx",29,0xe38cac7e)
namespace flixel{
namespace input{

void FlxSwipe_obj::__construct(int ID, ::flixel::math::FlxPoint StartPosition, ::flixel::math::FlxPoint EndPosition,int StartTimeInTicks){
            	HX_STACKFRAME(&_hx_pos_223f15e5be8ee429_29_new)
HXLINE(  30)		this->ID = ID;
HXLINE(  31)		this->startPosition = StartPosition;
HXLINE(  32)		this->endPosition = EndPosition;
HXLINE(  33)		this->_startTimeInTicks = StartTimeInTicks;
HXLINE(  34)		this->_endTimeInTicks = ::flixel::FlxG_obj::game->ticks;
            	}

Dynamic FlxSwipe_obj::__CreateEmpty() { return new FlxSwipe_obj; }

void *FlxSwipe_obj::_hx_vtable = 0;

Dynamic FlxSwipe_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< FlxSwipe_obj > _hx_result = new FlxSwipe_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool FlxSwipe_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x37477ab6;
}


::hx::ObjectPtr< FlxSwipe_obj > FlxSwipe_obj::__new(int ID, ::flixel::math::FlxPoint StartPosition, ::flixel::math::FlxPoint EndPosition,int StartTimeInTicks) {
	::hx::ObjectPtr< FlxSwipe_obj > __this = new FlxSwipe_obj();
	__this->__construct(ID,StartPosition,EndPosition,StartTimeInTicks);
	return __this;
}

::hx::ObjectPtr< FlxSwipe_obj > FlxSwipe_obj::__alloc(::hx::Ctx *_hx_ctx,int ID, ::flixel::math::FlxPoint StartPosition, ::flixel::math::FlxPoint EndPosition,int StartTimeInTicks) {
	FlxSwipe_obj *__this = (FlxSwipe_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(FlxSwipe_obj), true, "flixel.input.FlxSwipe"));
	*(void **)__this = FlxSwipe_obj::_hx_vtable;
	__this->__construct(ID,StartPosition,EndPosition,StartTimeInTicks);
	return __this;
}

FlxSwipe_obj::FlxSwipe_obj()
{
}

void FlxSwipe_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FlxSwipe);
	HX_MARK_MEMBER_NAME(ID,"ID");
	HX_MARK_MEMBER_NAME(startPosition,"startPosition");
	HX_MARK_MEMBER_NAME(endPosition,"endPosition");
	HX_MARK_MEMBER_NAME(_startTimeInTicks,"_startTimeInTicks");
	HX_MARK_MEMBER_NAME(_endTimeInTicks,"_endTimeInTicks");
	HX_MARK_END_CLASS();
}

void FlxSwipe_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(ID,"ID");
	HX_VISIT_MEMBER_NAME(startPosition,"startPosition");
	HX_VISIT_MEMBER_NAME(endPosition,"endPosition");
	HX_VISIT_MEMBER_NAME(_startTimeInTicks,"_startTimeInTicks");
	HX_VISIT_MEMBER_NAME(_endTimeInTicks,"_endTimeInTicks");
}

::hx::Val FlxSwipe_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"ID") ) { return ::hx::Val( ID ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"endPosition") ) { return ::hx::Val( endPosition ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"startPosition") ) { return ::hx::Val( startPosition ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"_endTimeInTicks") ) { return ::hx::Val( _endTimeInTicks ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"_startTimeInTicks") ) { return ::hx::Val( _startTimeInTicks ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val FlxSwipe_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"ID") ) { ID=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"endPosition") ) { endPosition=inValue.Cast<  ::flixel::math::FlxPoint >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"startPosition") ) { startPosition=inValue.Cast<  ::flixel::math::FlxPoint >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"_endTimeInTicks") ) { _endTimeInTicks=inValue.Cast< int >(); return inValue; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"_startTimeInTicks") ) { _startTimeInTicks=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FlxSwipe_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("ID",db,3f,00,00));
	outFields->push(HX_("startPosition",2b,03,b6,cf));
	outFields->push(HX_("endPosition",a4,33,b9,82));
	outFields->push(HX_("_startTimeInTicks",e1,34,b7,36));
	outFields->push(HX_("_endTimeInTicks",48,30,b2,c2));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo FlxSwipe_obj_sMemberStorageInfo[] = {
	{::hx::fsInt,(int)offsetof(FlxSwipe_obj,ID),HX_("ID",db,3f,00,00)},
	{::hx::fsObject /*  ::flixel::math::FlxPoint */ ,(int)offsetof(FlxSwipe_obj,startPosition),HX_("startPosition",2b,03,b6,cf)},
	{::hx::fsObject /*  ::flixel::math::FlxPoint */ ,(int)offsetof(FlxSwipe_obj,endPosition),HX_("endPosition",a4,33,b9,82)},
	{::hx::fsInt,(int)offsetof(FlxSwipe_obj,_startTimeInTicks),HX_("_startTimeInTicks",e1,34,b7,36)},
	{::hx::fsInt,(int)offsetof(FlxSwipe_obj,_endTimeInTicks),HX_("_endTimeInTicks",48,30,b2,c2)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *FlxSwipe_obj_sStaticStorageInfo = 0;
#endif

static ::String FlxSwipe_obj_sMemberFields[] = {
	HX_("ID",db,3f,00,00),
	HX_("startPosition",2b,03,b6,cf),
	HX_("endPosition",a4,33,b9,82),
	HX_("_startTimeInTicks",e1,34,b7,36),
	HX_("_endTimeInTicks",48,30,b2,c2),
	::String(null()) };

::hx::Class FlxSwipe_obj::__mClass;

void FlxSwipe_obj::__register()
{
	FlxSwipe_obj _hx_dummy;
	FlxSwipe_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.input.FlxSwipe",7e,f5,e9,ec);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(FlxSwipe_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< FlxSwipe_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = FlxSwipe_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = FlxSwipe_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace input