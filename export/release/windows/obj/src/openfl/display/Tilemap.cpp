// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_lime_utils_ObjectPool
#include <lime/utils/ObjectPool.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_ITileContainer
#include <openfl/display/ITileContainer.h>
#endif
#ifndef INCLUDED_openfl_display_Tile
#include <openfl/display/Tile.h>
#endif
#ifndef INCLUDED_openfl_display_TileContainer
#include <openfl/display/TileContainer.h>
#endif
#ifndef INCLUDED_openfl_display_Tilemap
#include <openfl/display/Tilemap.h>
#endif
#ifndef INCLUDED_openfl_display_Tileset
#include <openfl/display/Tileset.h>
#endif
#ifndef INCLUDED_openfl_display__internal_Context3DBuffer
#include <openfl/display/_internal/Context3DBuffer.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_geom_Matrix
#include <openfl/geom/Matrix.h>
#endif
#ifndef INCLUDED_openfl_geom_Rectangle
#include <openfl/geom/Rectangle.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_1cbb708783dfd99e_117_new,"openfl.display.Tilemap","new",0x34c22ff6,"openfl.display.Tilemap.new","openfl/display/Tilemap.hx",117,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_379___enterFrame,"openfl.display.Tilemap","__enterFrame",0x56d37cbf,"openfl.display.Tilemap.__enterFrame","openfl/display/Tilemap.hx",379,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_388___getBounds,"openfl.display.Tilemap","__getBounds",0x92793e21,"openfl.display.Tilemap.__getBounds","openfl/display/Tilemap.hx",388,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_402___hitTest,"openfl.display.Tilemap","__hitTest",0x7360e53b,"openfl.display.Tilemap.__hitTest","openfl/display/Tilemap.hx",402,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_434_get_height,"openfl.display.Tilemap","get_height",0x840dd6da,"openfl.display.Tilemap.get_height","openfl/display/Tilemap.hx",434,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_440_set_height,"openfl.display.Tilemap","set_height",0x878b754e,"openfl.display.Tilemap.set_height","openfl/display/Tilemap.hx",440,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_485_get_width,"openfl.display.Tilemap","get_width",0x1d9f4673,"openfl.display.Tilemap.get_width","openfl/display/Tilemap.hx",485,0xd55dffbc)
HX_LOCAL_STACK_FRAME(_hx_pos_1cbb708783dfd99e_491_set_width,"openfl.display.Tilemap","set_width",0x00f0327f,"openfl.display.Tilemap.set_width","openfl/display/Tilemap.hx",491,0xd55dffbc)
namespace openfl{
namespace display{

void Tilemap_obj::__construct(int width,int height, ::openfl::display::Tileset tileset,::hx::Null< bool >  __o_smoothing){
            		bool smoothing = __o_smoothing.Default(true);
            	HX_GC_STACKFRAME(&_hx_pos_1cbb708783dfd99e_117_new)
HXLINE( 118)		super::__construct();
HXLINE( 120)		this->_hx___drawableType = 9;
HXLINE( 121)		this->_hx___tileset = tileset;
HXLINE( 122)		this->smoothing = smoothing;
HXLINE( 124)		this->tileAlphaEnabled = true;
HXLINE( 125)		this->tileBlendModeEnabled = true;
HXLINE( 126)		this->tileColorTransformEnabled = true;
HXLINE( 128)		this->_hx___group =  ::openfl::display::TileContainer_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null(),null());
HXLINE( 129)		this->_hx___group->set_tileset(tileset);
HXLINE( 131)		this->_hx___width = width;
HXLINE( 132)		this->_hx___height = height;
            	}

Dynamic Tilemap_obj::__CreateEmpty() { return new Tilemap_obj; }

void *Tilemap_obj::_hx_vtable = 0;

Dynamic Tilemap_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Tilemap_obj > _hx_result = new Tilemap_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool Tilemap_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x2aebe7dc) {
		if (inClassId<=(int)0x0c89e854) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x0c89e854;
		} else {
			return inClassId==(int)0x2aebe7dc;
		}
	} else {
		return inClassId==(int)0x6b353933;
	}
}

static ::openfl::display::ITileContainer_obj _hx_openfl_display_Tilemap__hx_openfl_display_ITileContainer= {
};

void *Tilemap_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0xcad54adc: return &_hx_openfl_display_Tilemap__hx_openfl_display_ITileContainer;
	}
	return super::_hx_getInterface(inHash);
}

void Tilemap_obj::_hx___enterFrame(int deltaTime){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_379___enterFrame)
HXDLIN( 379)		if (this->_hx___group->_hx___dirty) {
HXLINE( 381)			if (!(this->_hx___renderDirty)) {
HXLINE( 381)				this->_hx___renderDirty = true;
HXDLIN( 381)				this->_hx___setParentRenderDirty();
            			}
            		}
            	}


void Tilemap_obj::_hx___getBounds( ::openfl::geom::Rectangle rect, ::openfl::geom::Matrix matrix){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_388___getBounds)
HXLINE( 389)		 ::openfl::geom::Rectangle bounds = ::openfl::geom::Rectangle_obj::_hx___pool->get().StaticCast<  ::openfl::geom::Rectangle >();
HXLINE( 390)		bounds->setTo(( (Float)(0) ),( (Float)(0) ),( (Float)(this->_hx___width) ),( (Float)(this->_hx___height) ));
HXLINE( 391)		bounds->_hx___transform(bounds,matrix);
HXLINE( 393)		rect->_hx___expand(bounds->x,bounds->y,bounds->width,bounds->height);
HXLINE( 395)		::openfl::geom::Rectangle_obj::_hx___pool->release(bounds);
            	}


bool Tilemap_obj::_hx___hitTest(Float x,Float y,bool shapeFlag,::Array< ::Dynamic> stack,bool interactiveOnly, ::openfl::display::DisplayObject hitObject){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_402___hitTest)
HXLINE( 403)		bool _hx_tmp;
HXDLIN( 403)		if (hitObject->get_visible()) {
HXLINE( 403)			_hx_tmp = this->_hx___isMask;
            		}
            		else {
HXLINE( 403)			_hx_tmp = true;
            		}
HXDLIN( 403)		if (_hx_tmp) {
HXLINE( 403)			return false;
            		}
HXLINE( 404)		bool _hx_tmp1;
HXDLIN( 404)		if (::hx::IsNotNull( this->get_mask() )) {
HXLINE( 404)			_hx_tmp1 = !(this->get_mask()->_hx___hitTestMask(x,y));
            		}
            		else {
HXLINE( 404)			_hx_tmp1 = false;
            		}
HXDLIN( 404)		if (_hx_tmp1) {
HXLINE( 404)			return false;
            		}
HXLINE( 406)		this->_hx___getRenderTransform();
HXLINE( 408)		 ::openfl::geom::Matrix _this = this->_hx___renderTransform;
HXDLIN( 408)		Float norm = ((_this->a * _this->d) - (_this->b * _this->c));
HXDLIN( 408)		Float px;
HXDLIN( 408)		if ((norm == 0)) {
HXLINE( 408)			px = -(_this->tx);
            		}
            		else {
HXLINE( 408)			px = ((((Float)1.0) / norm) * ((_this->c * (_this->ty - y)) + (_this->d * (x - _this->tx))));
            		}
HXLINE( 409)		 ::openfl::geom::Matrix _this1 = this->_hx___renderTransform;
HXDLIN( 409)		Float norm1 = ((_this1->a * _this1->d) - (_this1->b * _this1->c));
HXDLIN( 409)		Float py;
HXDLIN( 409)		if ((norm1 == 0)) {
HXLINE( 409)			py = -(_this1->ty);
            		}
            		else {
HXLINE( 409)			py = ((((Float)1.0) / norm1) * ((_this1->a * (y - _this1->ty)) + (_this1->b * (_this1->tx - x))));
            		}
HXLINE( 411)		bool _hx_tmp2;
HXDLIN( 411)		bool _hx_tmp3;
HXDLIN( 411)		bool _hx_tmp4;
HXDLIN( 411)		if ((px > 0)) {
HXLINE( 411)			_hx_tmp4 = (py > 0);
            		}
            		else {
HXLINE( 411)			_hx_tmp4 = false;
            		}
HXDLIN( 411)		if (_hx_tmp4) {
HXLINE( 411)			_hx_tmp3 = (px <= this->_hx___width);
            		}
            		else {
HXLINE( 411)			_hx_tmp3 = false;
            		}
HXDLIN( 411)		if (_hx_tmp3) {
HXLINE( 411)			_hx_tmp2 = (py <= this->_hx___height);
            		}
            		else {
HXLINE( 411)			_hx_tmp2 = false;
            		}
HXDLIN( 411)		if (_hx_tmp2) {
HXLINE( 413)			bool _hx_tmp;
HXDLIN( 413)			if (::hx::IsNotNull( stack )) {
HXLINE( 413)				_hx_tmp = !(interactiveOnly);
            			}
            			else {
HXLINE( 413)				_hx_tmp = false;
            			}
HXDLIN( 413)			if (_hx_tmp) {
HXLINE( 415)				stack->push(hitObject);
            			}
HXLINE( 418)			return true;
            		}
HXLINE( 421)		return false;
            	}


Float Tilemap_obj::get_height(){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_434_get_height)
HXDLIN( 434)		int _hx_tmp = this->_hx___height;
HXDLIN( 434)		return (( (Float)(_hx_tmp) ) * ::Math_obj::abs(this->get_scaleY()));
            	}


Float Tilemap_obj::set_height(Float value){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_440_set_height)
HXLINE( 441)		this->_hx___height = ::Std_obj::_hx_int(value);
HXLINE( 442)		int _hx_tmp = this->_hx___height;
HXDLIN( 442)		return (( (Float)(_hx_tmp) ) * ::Math_obj::abs(this->get_scaleY()));
            	}


Float Tilemap_obj::get_width(){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_485_get_width)
HXDLIN( 485)		return (( (Float)(this->_hx___width) ) * ::Math_obj::abs(this->_hx___scaleX));
            	}


Float Tilemap_obj::set_width(Float value){
            	HX_STACKFRAME(&_hx_pos_1cbb708783dfd99e_491_set_width)
HXLINE( 492)		this->_hx___width = ::Std_obj::_hx_int(value);
HXLINE( 493)		return (( (Float)(this->_hx___width) ) * ::Math_obj::abs(this->_hx___scaleX));
            	}



::hx::ObjectPtr< Tilemap_obj > Tilemap_obj::__new(int width,int height, ::openfl::display::Tileset tileset,::hx::Null< bool >  __o_smoothing) {
	::hx::ObjectPtr< Tilemap_obj > __this = new Tilemap_obj();
	__this->__construct(width,height,tileset,__o_smoothing);
	return __this;
}

::hx::ObjectPtr< Tilemap_obj > Tilemap_obj::__alloc(::hx::Ctx *_hx_ctx,int width,int height, ::openfl::display::Tileset tileset,::hx::Null< bool >  __o_smoothing) {
	Tilemap_obj *__this = (Tilemap_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Tilemap_obj), true, "openfl.display.Tilemap"));
	*(void **)__this = Tilemap_obj::_hx_vtable;
	__this->__construct(width,height,tileset,__o_smoothing);
	return __this;
}

Tilemap_obj::Tilemap_obj()
{
}

void Tilemap_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Tilemap);
	HX_MARK_MEMBER_NAME(tileAlphaEnabled,"tileAlphaEnabled");
	HX_MARK_MEMBER_NAME(tileBlendModeEnabled,"tileBlendModeEnabled");
	HX_MARK_MEMBER_NAME(tileColorTransformEnabled,"tileColorTransformEnabled");
	HX_MARK_MEMBER_NAME(smoothing,"smoothing");
	HX_MARK_MEMBER_NAME(_hx___group,"__group");
	HX_MARK_MEMBER_NAME(_hx___tileset,"__tileset");
	HX_MARK_MEMBER_NAME(_hx___buffer,"__buffer");
	HX_MARK_MEMBER_NAME(_hx___height,"__height");
	HX_MARK_MEMBER_NAME(_hx___width,"__width");
	 ::openfl::display::DisplayObject_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Tilemap_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(tileAlphaEnabled,"tileAlphaEnabled");
	HX_VISIT_MEMBER_NAME(tileBlendModeEnabled,"tileBlendModeEnabled");
	HX_VISIT_MEMBER_NAME(tileColorTransformEnabled,"tileColorTransformEnabled");
	HX_VISIT_MEMBER_NAME(smoothing,"smoothing");
	HX_VISIT_MEMBER_NAME(_hx___group,"__group");
	HX_VISIT_MEMBER_NAME(_hx___tileset,"__tileset");
	HX_VISIT_MEMBER_NAME(_hx___buffer,"__buffer");
	HX_VISIT_MEMBER_NAME(_hx___height,"__height");
	HX_VISIT_MEMBER_NAME(_hx___width,"__width");
	 ::openfl::display::DisplayObject_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val Tilemap_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"__group") ) { return ::hx::Val( _hx___group ); }
		if (HX_FIELD_EQ(inName,"__width") ) { return ::hx::Val( _hx___width ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__buffer") ) { return ::hx::Val( _hx___buffer ); }
		if (HX_FIELD_EQ(inName,"__height") ) { return ::hx::Val( _hx___height ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"smoothing") ) { return ::hx::Val( smoothing ); }
		if (HX_FIELD_EQ(inName,"__tileset") ) { return ::hx::Val( _hx___tileset ); }
		if (HX_FIELD_EQ(inName,"__hitTest") ) { return ::hx::Val( _hx___hitTest_dyn() ); }
		if (HX_FIELD_EQ(inName,"get_width") ) { return ::hx::Val( get_width_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_width") ) { return ::hx::Val( set_width_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"get_height") ) { return ::hx::Val( get_height_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_height") ) { return ::hx::Val( set_height_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"__getBounds") ) { return ::hx::Val( _hx___getBounds_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"__enterFrame") ) { return ::hx::Val( _hx___enterFrame_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"tileAlphaEnabled") ) { return ::hx::Val( tileAlphaEnabled ); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"tileBlendModeEnabled") ) { return ::hx::Val( tileBlendModeEnabled ); }
		break;
	case 25:
		if (HX_FIELD_EQ(inName,"tileColorTransformEnabled") ) { return ::hx::Val( tileColorTransformEnabled ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val Tilemap_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"__group") ) { _hx___group=inValue.Cast<  ::openfl::display::TileContainer >(); return inValue; }
		if (HX_FIELD_EQ(inName,"__width") ) { _hx___width=inValue.Cast< int >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__buffer") ) { _hx___buffer=inValue.Cast<  ::openfl::display::_internal::Context3DBuffer >(); return inValue; }
		if (HX_FIELD_EQ(inName,"__height") ) { _hx___height=inValue.Cast< int >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"smoothing") ) { smoothing=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"__tileset") ) { _hx___tileset=inValue.Cast<  ::openfl::display::Tileset >(); return inValue; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"tileAlphaEnabled") ) { tileAlphaEnabled=inValue.Cast< bool >(); return inValue; }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"tileBlendModeEnabled") ) { tileBlendModeEnabled=inValue.Cast< bool >(); return inValue; }
		break;
	case 25:
		if (HX_FIELD_EQ(inName,"tileColorTransformEnabled") ) { tileColorTransformEnabled=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Tilemap_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("tileAlphaEnabled",11,71,ce,dc));
	outFields->push(HX_("tileBlendModeEnabled",db,9d,a9,f4));
	outFields->push(HX_("tileColorTransformEnabled",ea,29,1c,dd));
	outFields->push(HX_("smoothing",74,d5,e1,95));
	outFields->push(HX_("__group",1f,0c,53,04));
	outFields->push(HX_("__tileset",14,d2,e1,c6));
	outFields->push(HX_("__buffer",20,28,c4,78));
	outFields->push(HX_("__height",07,73,7b,aa));
	outFields->push(HX_("__width",e6,0e,c1,34));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo Tilemap_obj_sMemberStorageInfo[] = {
	{::hx::fsBool,(int)offsetof(Tilemap_obj,tileAlphaEnabled),HX_("tileAlphaEnabled",11,71,ce,dc)},
	{::hx::fsBool,(int)offsetof(Tilemap_obj,tileBlendModeEnabled),HX_("tileBlendModeEnabled",db,9d,a9,f4)},
	{::hx::fsBool,(int)offsetof(Tilemap_obj,tileColorTransformEnabled),HX_("tileColorTransformEnabled",ea,29,1c,dd)},
	{::hx::fsBool,(int)offsetof(Tilemap_obj,smoothing),HX_("smoothing",74,d5,e1,95)},
	{::hx::fsObject /*  ::openfl::display::TileContainer */ ,(int)offsetof(Tilemap_obj,_hx___group),HX_("__group",1f,0c,53,04)},
	{::hx::fsObject /*  ::openfl::display::Tileset */ ,(int)offsetof(Tilemap_obj,_hx___tileset),HX_("__tileset",14,d2,e1,c6)},
	{::hx::fsObject /*  ::openfl::display::_internal::Context3DBuffer */ ,(int)offsetof(Tilemap_obj,_hx___buffer),HX_("__buffer",20,28,c4,78)},
	{::hx::fsInt,(int)offsetof(Tilemap_obj,_hx___height),HX_("__height",07,73,7b,aa)},
	{::hx::fsInt,(int)offsetof(Tilemap_obj,_hx___width),HX_("__width",e6,0e,c1,34)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *Tilemap_obj_sStaticStorageInfo = 0;
#endif

static ::String Tilemap_obj_sMemberFields[] = {
	HX_("tileAlphaEnabled",11,71,ce,dc),
	HX_("tileBlendModeEnabled",db,9d,a9,f4),
	HX_("tileColorTransformEnabled",ea,29,1c,dd),
	HX_("smoothing",74,d5,e1,95),
	HX_("__group",1f,0c,53,04),
	HX_("__tileset",14,d2,e1,c6),
	HX_("__buffer",20,28,c4,78),
	HX_("__height",07,73,7b,aa),
	HX_("__width",e6,0e,c1,34),
	HX_("__enterFrame",15,7f,e3,3a),
	HX_("__getBounds",8b,58,a0,10),
	HX_("__hitTest",25,b1,cd,63),
	HX_("get_height",b0,77,d3,f2),
	HX_("set_height",24,16,51,f6),
	HX_("get_width",5d,12,0c,0e),
	HX_("set_width",69,fe,5c,f1),
	::String(null()) };

::hx::Class Tilemap_obj::__mClass;

void Tilemap_obj::__register()
{
	Tilemap_obj _hx_dummy;
	Tilemap_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.display.Tilemap",04,bd,49,b4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(Tilemap_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< Tilemap_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Tilemap_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Tilemap_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace display