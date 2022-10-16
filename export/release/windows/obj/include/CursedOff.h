// Generated by Haxe 4.1.5
#ifndef INCLUDED_CursedOff
#define INCLUDED_CursedOff

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_Option
#include <Option.h>
#endif
HX_DECLARE_CLASS0(CursedOff)
HX_DECLARE_CLASS0(Option)



class HXCPP_CLASS_ATTRIBUTES CursedOff_obj : public  ::Option_obj
{
	public:
		typedef  ::Option_obj super;
		typedef CursedOff_obj OBJ_;
		CursedOff_obj();

	public:
		enum { _hx_ClassId = 0x05e7b19d };

		void __construct(::String desc);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="CursedOff")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"CursedOff"); }
		static ::hx::ObjectPtr< CursedOff_obj > __new(::String desc);
		static ::hx::ObjectPtr< CursedOff_obj > __alloc(::hx::Ctx *_hx_ctx,::String desc);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~CursedOff_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("CursedOff",5d,3c,a4,42); }

		bool left();

		bool right();

		::String updateDisplay();

};


#endif /* INCLUDED_CursedOff */ 