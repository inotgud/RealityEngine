// Generated by Haxe 4.1.5
#ifndef INCLUDED_LuaStorage
#define INCLUDED_LuaStorage

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(LuaCamera)
HX_DECLARE_CLASS0(LuaClass)
HX_DECLARE_CLASS0(LuaStorage)
HX_DECLARE_CLASS1(haxe,IMap)
HX_DECLARE_CLASS2(haxe,ds,StringMap)



class HXCPP_CLASS_ATTRIBUTES LuaStorage_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef LuaStorage_obj OBJ_;
		LuaStorage_obj();

	public:
		enum { _hx_ClassId = 0x544afb43 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="LuaStorage")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"LuaStorage"); }

		inline static ::hx::ObjectPtr< LuaStorage_obj > __new() {
			::hx::ObjectPtr< LuaStorage_obj > __this = new LuaStorage_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< LuaStorage_obj > __alloc(::hx::Ctx *_hx_ctx) {
			LuaStorage_obj *__this = (LuaStorage_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(LuaStorage_obj), false, "LuaStorage"));
			*(void **)__this = LuaStorage_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~LuaStorage_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("LuaStorage",83,d8,87,3c); }

		static void __boot();
		static ::Array< ::Dynamic> ListOfCameras;
		static  ::haxe::ds::StringMap objectProperties;
};


#endif /* INCLUDED_LuaStorage */ 