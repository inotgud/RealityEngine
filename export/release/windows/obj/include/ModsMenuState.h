// Generated by Haxe 4.1.5
#ifndef INCLUDED_ModsMenuState
#define INCLUDED_ModsMenuState

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_MusicBeatState
#include <MusicBeatState.h>
#endif
HX_DECLARE_CLASS0(Alphabet)
HX_DECLARE_CLASS0(AttachedSprite)
HX_DECLARE_CLASS0(ModsMenuState)
HX_DECLARE_CLASS0(ModsMetadata)
HX_DECLARE_CLASS0(MusicBeatState)
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS1(flixel,FlxState)
HX_DECLARE_CLASS3(flixel,addons,transition,FlxTransitionableState)
HX_DECLARE_CLASS3(flixel,addons,transition,TransitionData)
HX_DECLARE_CLASS3(flixel,addons,ui,FlxUIState)
HX_DECLARE_CLASS4(flixel,addons,ui,interfaces,IEventGetter)
HX_DECLARE_CLASS4(flixel,addons,ui,interfaces,IFlxUIState)
HX_DECLARE_CLASS2(flixel,group,FlxTypedGroup)
HX_DECLARE_CLASS2(flixel,group,FlxTypedSpriteGroup)
HX_DECLARE_CLASS2(flixel,input,IFlxInput)
HX_DECLARE_CLASS2(flixel,text,FlxText)
HX_DECLARE_CLASS2(flixel,tweens,FlxTween)
HX_DECLARE_CLASS2(flixel,ui,FlxButton)
HX_DECLARE_CLASS2(flixel,ui,FlxTypedButton_flixel_text_FlxText)
HX_DECLARE_CLASS2(flixel,util,IFlxDestroyable)



class HXCPP_CLASS_ATTRIBUTES ModsMenuState_obj : public  ::MusicBeatState_obj
{
	public:
		typedef  ::MusicBeatState_obj super;
		typedef ModsMenuState_obj OBJ_;
		ModsMenuState_obj();

	public:
		enum { _hx_ClassId = 0x6fd9fb99 };

		void __construct( ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="ModsMenuState")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"ModsMenuState"); }
		static ::hx::ObjectPtr< ModsMenuState_obj > __new( ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut);
		static ::hx::ObjectPtr< ModsMenuState_obj > __alloc(::hx::Ctx *_hx_ctx, ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ModsMenuState_obj();

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
		::String __ToString() const { return HX_("ModsMenuState",21,c6,f2,f5); }

		static void __boot();
		static int curSelected;
		::Array< ::Dynamic> mods;
		 ::flixel::ui::FlxButton button;
		int cornerSize;
		 ::flixel::group::FlxTypedGroup grpMods;
		 ::flixel::FlxSprite modIcon;
		 ::flixel::text::FlxText descText;
		 ::AttachedSprite selector;
		 ::flixel::FlxSprite bg;
		 ::flixel::tweens::FlxTween colorTween;
		::String modSelectedName;
		bool ending;
		 ::Alphabet modText;
		bool hmmended;
		void create();

		void update(Float elapsed);

		void createMod();
		::Dynamic createMod_dyn();

		void changeSelection(::hx::Null< int >  change);
		::Dynamic changeSelection_dyn();

		void selectMod(::String modName);
		::Dynamic selectMod_dyn();

		void makeSelectorGraphic();
		::Dynamic makeSelectorGraphic_dyn();

		void drawCircleCornerOnSelector(bool flipX,bool flipY);
		::Dynamic drawCircleCornerOnSelector_dyn();

};


#endif /* INCLUDED_ModsMenuState */ 