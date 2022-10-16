// Generated by Haxe 4.1.5
#ifndef INCLUDED_flixel_math_FlxMath
#define INCLUDED_flixel_math_FlxMath

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(flixel,math,FlxMath)
HX_DECLARE_CLASS2(flixel,math,FlxRect)
HX_DECLARE_CLASS2(flixel,util,IFlxDestroyable)
HX_DECLARE_CLASS2(flixel,util,IFlxPooled)

namespace flixel{
namespace math{


class HXCPP_CLASS_ATTRIBUTES FlxMath_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef FlxMath_obj OBJ_;
		FlxMath_obj();

	public:
		enum { _hx_ClassId = 0x7a539556 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="flixel.math.FlxMath")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"flixel.math.FlxMath"); }

		inline static ::hx::ObjectPtr< FlxMath_obj > __new() {
			::hx::ObjectPtr< FlxMath_obj > __this = new FlxMath_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< FlxMath_obj > __alloc(::hx::Ctx *_hx_ctx) {
			FlxMath_obj *__this = (FlxMath_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(FlxMath_obj), false, "flixel.math.FlxMath"));
			*(void **)__this = FlxMath_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~FlxMath_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("FlxMath",3a,7b,ae,d8); }

		static Float roundDecimal(Float Value,int Precision);
		static ::Dynamic roundDecimal_dyn();

		static bool pointInCoordinates(Float pointX,Float pointY,Float rectX,Float rectY,Float rectWidth,Float rectHeight);
		static ::Dynamic pointInCoordinates_dyn();

		static bool pointInFlxRect(Float pointX,Float pointY, ::flixel::math::FlxRect rect);
		static ::Dynamic pointInFlxRect_dyn();

		static bool mouseInFlxRect(bool useWorldCoords, ::flixel::math::FlxRect rect);
		static ::Dynamic mouseInFlxRect_dyn();

		static Float remapToRange(Float value,Float start1,Float stop1,Float start2,Float stop2);
		static ::Dynamic remapToRange_dyn();

};

} // end namespace flixel
} // end namespace math

#endif /* INCLUDED_flixel_math_FlxMath */ 