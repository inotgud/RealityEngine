// Generated by Haxe 4.1.5
#ifndef INCLUDED_RealityEngineData
#define INCLUDED_RealityEngineData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(RealityEngineData)



class HXCPP_CLASS_ATTRIBUTES RealityEngineData_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef RealityEngineData_obj OBJ_;
		RealityEngineData_obj();

	public:
		enum { _hx_ClassId = 0x7f64595c };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="RealityEngineData")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"RealityEngineData"); }

		inline static ::hx::ObjectPtr< RealityEngineData_obj > __new() {
			::hx::ObjectPtr< RealityEngineData_obj > __this = new RealityEngineData_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< RealityEngineData_obj > __alloc(::hx::Ctx *_hx_ctx) {
			RealityEngineData_obj *__this = (RealityEngineData_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(RealityEngineData_obj), false, "RealityEngineData"));
			*(void **)__this = RealityEngineData_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~RealityEngineData_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("RealityEngineData",9c,e0,bf,45); }

		static void initSave();
		static ::Dynamic initSave_dyn();

};


#endif /* INCLUDED_RealityEngineData */ 