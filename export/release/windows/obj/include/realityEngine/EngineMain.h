// Generated by Haxe 4.1.5
#ifndef INCLUDED_realityEngine_EngineMain
#define INCLUDED_realityEngine_EngineMain

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(realityEngine,EngineMain)

namespace realityEngine{


class HXCPP_CLASS_ATTRIBUTES EngineMain_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef EngineMain_obj OBJ_;
		EngineMain_obj();

	public:
		enum { _hx_ClassId = 0x069231ad };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="realityEngine.EngineMain")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"realityEngine.EngineMain"); }

		inline static ::hx::ObjectPtr< EngineMain_obj > __new() {
			::hx::ObjectPtr< EngineMain_obj > __this = new EngineMain_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< EngineMain_obj > __alloc(::hx::Ctx *_hx_ctx) {
			EngineMain_obj *__this = (EngineMain_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(EngineMain_obj), false, "realityEngine.EngineMain"));
			*(void **)__this = EngineMain_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~EngineMain_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("EngineMain",3b,b9,50,df); }

		static void discordClient(::String discord);
		static ::Dynamic discordClient_dyn();

};

} // end namespace realityEngine

#endif /* INCLUDED_realityEngine_EngineMain */ 