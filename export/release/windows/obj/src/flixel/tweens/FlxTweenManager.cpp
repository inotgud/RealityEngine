// Generated by Haxe 4.1.5
#include <hxcpp.h>

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
#ifndef INCLUDED_flixel_system_frontEnds_SignalFrontEnd
#include <flixel/system/frontEnds/SignalFrontEnd.h>
#endif
#ifndef INCLUDED_flixel_tweens_FlxTween
#include <flixel/tweens/FlxTween.h>
#endif
#ifndef INCLUDED_flixel_tweens_FlxTweenManager
#include <flixel/tweens/FlxTweenManager.h>
#endif
#ifndef INCLUDED_flixel_tweens_misc_AngleTween
#include <flixel/tweens/misc/AngleTween.h>
#endif
#ifndef INCLUDED_flixel_tweens_misc_ColorTween
#include <flixel/tweens/misc/ColorTween.h>
#endif
#ifndef INCLUDED_flixel_tweens_misc_NumTween
#include <flixel/tweens/misc/NumTween.h>
#endif
#ifndef INCLUDED_flixel_tweens_misc_VarTween
#include <flixel/tweens/misc/VarTween.h>
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

HX_DEFINE_STACK_FRAME(_hx_pos_5ae747326964aa7c_797_new,"flixel.tweens.FlxTweenManager","new",0x3916c2b2,"flixel.tweens.FlxTweenManager.new","flixel/tweens/FlxTween.hx",797,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_AngleTween,"flixel.tweens.FlxTweenManager","add_flixel_tweens_misc_AngleTween",0xb848364b,"flixel.tweens.FlxTweenManager.add_flixel_tweens_misc_AngleTween","flixel/tweens/FlxTween.hx",1127,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_NumTween,"flixel.tweens.FlxTweenManager","add_flixel_tweens_misc_NumTween",0xa10a3838,"flixel.tweens.FlxTweenManager.add_flixel_tweens_misc_NumTween","flixel/tweens/FlxTween.hx",1127,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_ColorTween,"flixel.tweens.FlxTweenManager","add_flixel_tweens_misc_ColorTween",0xd92edebb,"flixel.tweens.FlxTweenManager.add_flixel_tweens_misc_ColorTween","flixel/tweens/FlxTween.hx",1127,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_FlxTween,"flixel.tweens.FlxTweenManager","add_flixel_tweens_FlxTween",0xdb4849d9,"flixel.tweens.FlxTweenManager.add_flixel_tweens_FlxTween","flixel/tweens/FlxTween.hx",1127,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_VarTween,"flixel.tweens.FlxTweenManager","add_flixel_tweens_misc_VarTween",0x2ab94ff7,"flixel.tweens.FlxTweenManager.add_flixel_tweens_misc_VarTween","flixel/tweens/FlxTween.hx",1127,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_826_tween,"flixel.tweens.FlxTweenManager","tween",0x3e92553d,"flixel.tweens.FlxTweenManager.tween","flixel/tweens/FlxTween.hx",826,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_854_num,"flixel.tweens.FlxTweenManager","num",0x3916d098,"flixel.tweens.FlxTweenManager.num","flixel/tweens/FlxTween.hx",854,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_876_angle,"flixel.tweens.FlxTweenManager","angle",0x4803eea5,"flixel.tweens.FlxTweenManager.angle","flixel/tweens/FlxTween.hx",876,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_898_color,"flixel.tweens.FlxTweenManager","color",0x6f7e1c35,"flixel.tweens.FlxTweenManager.color","flixel/tweens/FlxTween.hx",898,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1084_destroy,"flixel.tweens.FlxTweenManager","destroy",0x1585b04c,"flixel.tweens.FlxTweenManager.destroy","flixel/tweens/FlxTween.hx",1084,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1090_update,"flixel.tweens.FlxTweenManager","update",0xdf5952f7,"flixel.tweens.FlxTweenManager.update","flixel/tweens/FlxTween.hx",1090,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1148_remove,"flixel.tweens.FlxTweenManager","remove",0x5cdc6932,"flixel.tweens.FlxTweenManager.remove","flixel/tweens/FlxTween.hx",1148,0x5d58d691)
HX_LOCAL_STACK_FRAME(_hx_pos_5ae747326964aa7c_1166_clear,"flixel.tweens.FlxTweenManager","clear",0x6d7d1c5f,"flixel.tweens.FlxTweenManager.clear","flixel/tweens/FlxTween.hx",1166,0x5d58d691)
namespace flixel{
namespace tweens{

void FlxTweenManager_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_797_new)
HXLINE( 802)		this->_tweens = ::Array_obj< ::Dynamic>::__new(0);
HXLINE( 806)		super::__construct();
HXLINE( 807)		this->set_visible(false);
HXLINE( 808)		::flixel::FlxG_obj::signals->preStateSwitch->add(this->clear_dyn());
            	}

Dynamic FlxTweenManager_obj::__CreateEmpty() { return new FlxTweenManager_obj; }

void *FlxTweenManager_obj::_hx_vtable = 0;

Dynamic FlxTweenManager_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< FlxTweenManager_obj > _hx_result = new FlxTweenManager_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool FlxTweenManager_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x75cc77f0) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x75cc77f0;
	} else {
		return inClassId==(int)0x7ccf8994;
	}
}

 ::flixel::tweens::misc::AngleTween FlxTweenManager_obj::add_flixel_tweens_misc_AngleTween( ::flixel::tweens::misc::AngleTween Tween,::hx::Null< bool >  __o_Start){
            		bool Start = __o_Start.Default(false);
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_AngleTween)
HXLINE(1129)		if (::hx::IsNull( Tween )) {
HXLINE(1130)			return null();
            		}
HXLINE(1132)		this->_tweens->push(Tween);
HXLINE(1134)		if (Start) {
HXLINE(1135)			Tween->start();
            		}
HXLINE(1136)		return Tween;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FlxTweenManager_obj,add_flixel_tweens_misc_AngleTween,return )

 ::flixel::tweens::misc::NumTween FlxTweenManager_obj::add_flixel_tweens_misc_NumTween( ::flixel::tweens::misc::NumTween Tween,::hx::Null< bool >  __o_Start){
            		bool Start = __o_Start.Default(false);
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_NumTween)
HXLINE(1129)		if (::hx::IsNull( Tween )) {
HXLINE(1130)			return null();
            		}
HXLINE(1132)		this->_tweens->push(Tween);
HXLINE(1134)		if (Start) {
HXLINE(1135)			Tween->start();
            		}
HXLINE(1136)		return Tween;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FlxTweenManager_obj,add_flixel_tweens_misc_NumTween,return )

 ::flixel::tweens::misc::ColorTween FlxTweenManager_obj::add_flixel_tweens_misc_ColorTween( ::flixel::tweens::misc::ColorTween Tween,::hx::Null< bool >  __o_Start){
            		bool Start = __o_Start.Default(false);
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_ColorTween)
HXLINE(1129)		if (::hx::IsNull( Tween )) {
HXLINE(1130)			return null();
            		}
HXLINE(1132)		this->_tweens->push(Tween);
HXLINE(1134)		if (Start) {
HXLINE(1135)			Tween->start();
            		}
HXLINE(1136)		return Tween;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FlxTweenManager_obj,add_flixel_tweens_misc_ColorTween,return )

 ::flixel::tweens::FlxTween FlxTweenManager_obj::add_flixel_tweens_FlxTween( ::flixel::tweens::FlxTween Tween,::hx::Null< bool >  __o_Start){
            		bool Start = __o_Start.Default(false);
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_FlxTween)
HXLINE(1129)		if (::hx::IsNull( Tween )) {
HXLINE(1130)			return null();
            		}
HXLINE(1132)		this->_tweens->push(Tween);
HXLINE(1134)		if (Start) {
HXLINE(1135)			Tween->start();
            		}
HXLINE(1136)		return Tween;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FlxTweenManager_obj,add_flixel_tweens_FlxTween,return )

 ::flixel::tweens::misc::VarTween FlxTweenManager_obj::add_flixel_tweens_misc_VarTween( ::flixel::tweens::misc::VarTween Tween,::hx::Null< bool >  __o_Start){
            		bool Start = __o_Start.Default(false);
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1127_add_flixel_tweens_misc_VarTween)
HXLINE(1129)		if (::hx::IsNull( Tween )) {
HXLINE(1130)			return null();
            		}
HXLINE(1132)		this->_tweens->push(Tween);
HXLINE(1134)		if (Start) {
HXLINE(1135)			Tween->start();
            		}
HXLINE(1136)		return Tween;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FlxTweenManager_obj,add_flixel_tweens_misc_VarTween,return )

 ::flixel::tweens::misc::VarTween FlxTweenManager_obj::tween( ::Dynamic Object, ::Dynamic Values,::hx::Null< Float >  __o_Duration, ::Dynamic Options){
            		Float Duration = __o_Duration.Default(1);
            	HX_GC_STACKFRAME(&_hx_pos_5ae747326964aa7c_826_tween)
HXLINE( 827)		 ::flixel::tweens::misc::VarTween tween =  ::flixel::tweens::misc::VarTween_obj::__alloc( HX_CTX ,Options,::hx::ObjectPtr<OBJ_>(this));
HXLINE( 828)		tween->tween(Object,Values,Duration);
HXLINE( 829)		return this->add_flixel_tweens_misc_VarTween(tween,null());
            	}


HX_DEFINE_DYNAMIC_FUNC4(FlxTweenManager_obj,tween,return )

 ::flixel::tweens::misc::NumTween FlxTweenManager_obj::num(Float FromValue,Float ToValue,::hx::Null< Float >  __o_Duration, ::Dynamic Options, ::Dynamic TweenFunction){
            		Float Duration = __o_Duration.Default(1);
            	HX_GC_STACKFRAME(&_hx_pos_5ae747326964aa7c_854_num)
HXLINE( 855)		 ::flixel::tweens::misc::NumTween tween =  ::flixel::tweens::misc::NumTween_obj::__alloc( HX_CTX ,Options,::hx::ObjectPtr<OBJ_>(this));
HXLINE( 856)		tween->tween(FromValue,ToValue,Duration,TweenFunction);
HXLINE( 857)		return this->add_flixel_tweens_misc_NumTween(tween,null());
            	}


HX_DEFINE_DYNAMIC_FUNC5(FlxTweenManager_obj,num,return )

 ::flixel::tweens::misc::AngleTween FlxTweenManager_obj::angle( ::flixel::FlxSprite Sprite,Float FromAngle,Float ToAngle,::hx::Null< Float >  __o_Duration, ::Dynamic Options){
            		Float Duration = __o_Duration.Default(1);
            	HX_GC_STACKFRAME(&_hx_pos_5ae747326964aa7c_876_angle)
HXLINE( 877)		 ::flixel::tweens::misc::AngleTween tween =  ::flixel::tweens::misc::AngleTween_obj::__alloc( HX_CTX ,Options,::hx::ObjectPtr<OBJ_>(this));
HXLINE( 878)		tween->tween(FromAngle,ToAngle,Duration,Sprite);
HXLINE( 879)		return this->add_flixel_tweens_misc_AngleTween(tween,null());
            	}


HX_DEFINE_DYNAMIC_FUNC5(FlxTweenManager_obj,angle,return )

 ::flixel::tweens::misc::ColorTween FlxTweenManager_obj::color( ::flixel::FlxSprite Sprite,::hx::Null< Float >  __o_Duration,int FromColor,int ToColor, ::Dynamic Options){
            		Float Duration = __o_Duration.Default(1);
            	HX_GC_STACKFRAME(&_hx_pos_5ae747326964aa7c_898_color)
HXLINE( 899)		 ::flixel::tweens::misc::ColorTween tween =  ::flixel::tweens::misc::ColorTween_obj::__alloc( HX_CTX ,Options,::hx::ObjectPtr<OBJ_>(this));
HXLINE( 900)		tween->tween(Duration,FromColor,ToColor,Sprite);
HXLINE( 901)		return this->add_flixel_tweens_misc_ColorTween(tween,null());
            	}


HX_DEFINE_DYNAMIC_FUNC5(FlxTweenManager_obj,color,return )

void FlxTweenManager_obj::destroy(){
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1084_destroy)
HXLINE(1085)		this->super::destroy();
HXLINE(1086)		::flixel::FlxG_obj::signals->preStateSwitch->remove(this->clear_dyn());
            	}


void FlxTweenManager_obj::update(Float elapsed){
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1090_update)
HXLINE(1092)		::Array< ::Dynamic> finishedTweens = null();
HXLINE(1094)		{
HXLINE(1094)			int _g = 0;
HXDLIN(1094)			::Array< ::Dynamic> _g1 = this->_tweens;
HXDLIN(1094)			while((_g < _g1->length)){
HXLINE(1094)				 ::flixel::tweens::FlxTween tween = _g1->__get(_g).StaticCast<  ::flixel::tweens::FlxTween >();
HXDLIN(1094)				_g = (_g + 1);
HXLINE(1096)				if (!(tween->active)) {
HXLINE(1097)					continue;
            				}
HXLINE(1099)				tween->update(elapsed);
HXLINE(1100)				if (tween->finished) {
HXLINE(1102)					if (::hx::IsNull( finishedTweens )) {
HXLINE(1103)						finishedTweens = ::Array_obj< ::Dynamic>::__new(0);
            					}
HXLINE(1104)					finishedTweens->push(tween);
            				}
            			}
            		}
HXLINE(1108)		if (::hx::IsNotNull( finishedTweens )) {
HXLINE(1110)			while((finishedTweens->length > 0)){
HXLINE(1112)				finishedTweens->shift().StaticCast<  ::flixel::tweens::FlxTween >()->finish();
            			}
            		}
            	}


 ::flixel::tweens::FlxTween FlxTweenManager_obj::remove( ::flixel::tweens::FlxTween Tween,::hx::Null< bool >  __o_Destroy){
            		bool Destroy = __o_Destroy.Default(true);
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1148_remove)
HXLINE(1149)		if (::hx::IsNull( Tween )) {
HXLINE(1150)			return null();
            		}
HXLINE(1152)		Tween->set_active(false);
HXLINE(1154)		if (Destroy) {
HXLINE(1155)			Tween->destroy();
            		}
HXLINE(1157)		{
HXLINE(1157)			::Array< ::Dynamic> array = this->_tweens;
HXDLIN(1157)			int index = array->indexOf(Tween,null());
HXDLIN(1157)			if ((index != -1)) {
HXLINE(1157)				array[index] = array->__get((array->length - 1)).StaticCast<  ::flixel::tweens::FlxTween >();
HXDLIN(1157)				array->pop().StaticCast<  ::flixel::tweens::FlxTween >();
            			}
            		}
HXLINE(1159)		return Tween;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FlxTweenManager_obj,remove,return )

void FlxTweenManager_obj::clear(){
            	HX_STACKFRAME(&_hx_pos_5ae747326964aa7c_1166_clear)
HXLINE(1167)		{
HXLINE(1167)			int _g = 0;
HXDLIN(1167)			::Array< ::Dynamic> _g1 = this->_tweens;
HXDLIN(1167)			while((_g < _g1->length)){
HXLINE(1167)				 ::flixel::tweens::FlxTween tween = _g1->__get(_g).StaticCast<  ::flixel::tweens::FlxTween >();
HXDLIN(1167)				_g = (_g + 1);
HXLINE(1169)				if (::hx::IsNotNull( tween )) {
HXLINE(1171)					tween->set_active(false);
HXLINE(1172)					tween->destroy();
            				}
            			}
            		}
HXLINE(1176)		this->_tweens->removeRange(0,this->_tweens->length);
            	}


HX_DEFINE_DYNAMIC_FUNC0(FlxTweenManager_obj,clear,(void))


::hx::ObjectPtr< FlxTweenManager_obj > FlxTweenManager_obj::__new() {
	::hx::ObjectPtr< FlxTweenManager_obj > __this = new FlxTweenManager_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< FlxTweenManager_obj > FlxTweenManager_obj::__alloc(::hx::Ctx *_hx_ctx) {
	FlxTweenManager_obj *__this = (FlxTweenManager_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(FlxTweenManager_obj), true, "flixel.tweens.FlxTweenManager"));
	*(void **)__this = FlxTweenManager_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

FlxTweenManager_obj::FlxTweenManager_obj()
{
}

void FlxTweenManager_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FlxTweenManager);
	HX_MARK_MEMBER_NAME(_tweens,"_tweens");
	 ::flixel::FlxBasic_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void FlxTweenManager_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_tweens,"_tweens");
	 ::flixel::FlxBasic_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val FlxTweenManager_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"num") ) { return ::hx::Val( num_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"tween") ) { return ::hx::Val( tween_dyn() ); }
		if (HX_FIELD_EQ(inName,"angle") ) { return ::hx::Val( angle_dyn() ); }
		if (HX_FIELD_EQ(inName,"color") ) { return ::hx::Val( color_dyn() ); }
		if (HX_FIELD_EQ(inName,"clear") ) { return ::hx::Val( clear_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"update") ) { return ::hx::Val( update_dyn() ); }
		if (HX_FIELD_EQ(inName,"remove") ) { return ::hx::Val( remove_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"_tweens") ) { return ::hx::Val( _tweens ); }
		if (HX_FIELD_EQ(inName,"destroy") ) { return ::hx::Val( destroy_dyn() ); }
		break;
	case 26:
		if (HX_FIELD_EQ(inName,"add_flixel_tweens_FlxTween") ) { return ::hx::Val( add_flixel_tweens_FlxTween_dyn() ); }
		break;
	case 31:
		if (HX_FIELD_EQ(inName,"add_flixel_tweens_misc_NumTween") ) { return ::hx::Val( add_flixel_tweens_misc_NumTween_dyn() ); }
		if (HX_FIELD_EQ(inName,"add_flixel_tweens_misc_VarTween") ) { return ::hx::Val( add_flixel_tweens_misc_VarTween_dyn() ); }
		break;
	case 33:
		if (HX_FIELD_EQ(inName,"add_flixel_tweens_misc_AngleTween") ) { return ::hx::Val( add_flixel_tweens_misc_AngleTween_dyn() ); }
		if (HX_FIELD_EQ(inName,"add_flixel_tweens_misc_ColorTween") ) { return ::hx::Val( add_flixel_tweens_misc_ColorTween_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val FlxTweenManager_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"_tweens") ) { _tweens=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FlxTweenManager_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("_tweens",47,85,9b,97));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo FlxTweenManager_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(FlxTweenManager_obj,_tweens),HX_("_tweens",47,85,9b,97)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *FlxTweenManager_obj_sStaticStorageInfo = 0;
#endif

static ::String FlxTweenManager_obj_sMemberFields[] = {
	HX_("add_flixel_tweens_misc_AngleTween",79,54,9c,f8),
	HX_("add_flixel_tweens_misc_NumTween",e6,ce,88,53),
	HX_("add_flixel_tweens_misc_ColorTween",e9,fc,82,19),
	HX_("add_flixel_tweens_FlxTween",eb,31,6d,84),
	HX_("add_flixel_tweens_misc_VarTween",a5,e6,37,dd),
	HX_("_tweens",47,85,9b,97),
	HX_("tween",6b,aa,70,19),
	HX_("num",46,de,53,00),
	HX_("angle",d3,43,e2,22),
	HX_("color",63,71,5c,4a),
	HX_("destroy",fa,2c,86,24),
	HX_("update",09,86,05,87),
	HX_("remove",44,9c,88,04),
	HX_("clear",8d,71,5b,48),
	::String(null()) };

::hx::Class FlxTweenManager_obj::__mClass;

void FlxTweenManager_obj::__register()
{
	FlxTweenManager_obj _hx_dummy;
	FlxTweenManager_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.tweens.FlxTweenManager",c0,41,37,9a);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(FlxTweenManager_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< FlxTweenManager_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = FlxTweenManager_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = FlxTweenManager_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace tweens