// Generated by Haxe 4.1.5
#ifndef INCLUDED_openfl_net_SharedObject
#define INCLUDED_openfl_net_SharedObject

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
HX_DECLARE_CLASS1(haxe,IMap)
HX_DECLARE_CLASS2(haxe,ds,StringMap)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,net,SharedObject)

namespace openfl{
namespace net{


class HXCPP_CLASS_ATTRIBUTES SharedObject_obj : public  ::openfl::events::EventDispatcher_obj
{
	public:
		typedef  ::openfl::events::EventDispatcher_obj super;
		typedef SharedObject_obj OBJ_;
		SharedObject_obj();

	public:
		enum { _hx_ClassId = 0x39ea9431 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.net.SharedObject")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"openfl.net.SharedObject"); }
		static ::hx::ObjectPtr< SharedObject_obj > __new();
		static ::hx::ObjectPtr< SharedObject_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~SharedObject_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("SharedObject",64,a7,41,90); }

		static void __boot();
		static int defaultObjectEncoding;
		static  ::haxe::ds::StringMap _hx___sharedObjects;
		static  ::openfl::net::SharedObject getLocal(::String name,::String localPath,::hx::Null< bool >  secure);
		static ::Dynamic getLocal_dyn();

		static ::String _hx___getPath(::String localPath,::String name);
		static ::Dynamic _hx___getPath_dyn();

		static void _hx___mkdir(::String directory);
		static ::Dynamic _hx___mkdir_dyn();

		static ::hx::Class _hx___resolveClass(::String name);
		static ::Dynamic _hx___resolveClass_dyn();

		static void application_onExit(int _);
		static ::Dynamic application_onExit_dyn();

		 ::Dynamic client;
		 ::Dynamic data;
		int objectEncoding;
		::String _hx___localPath;
		::String _hx___name;
		 ::Dynamic flush(::hx::Null< int >  minDiskSpace);
		::Dynamic flush_dyn();

};

} // end namespace openfl
} // end namespace net

#endif /* INCLUDED_openfl_net_SharedObject */ 