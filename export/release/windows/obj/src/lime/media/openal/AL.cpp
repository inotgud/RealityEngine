// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_lime__internal_backend_native_NativeCFFI
#include <lime/_internal/backend/native/NativeCFFI.h>
#endif
#ifndef INCLUDED_lime_media_openal_AL
#include <lime/media/openal/AL.h>
#endif
#ifndef INCLUDED_lime_utils_ArrayBufferView
#include <lime/utils/ArrayBufferView.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_292_bufferData,"lime.media.openal.AL","bufferData",0x84698d77,"lime.media.openal.AL.bufferData","lime/media/openal/AL.hx",292,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_362_createBuffer,"lime.media.openal.AL","createBuffer",0x67917089,"lime.media.openal.AL.createBuffer","lime/media/openal/AL.hx",362,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_389_createSource,"lime.media.openal.AL","createSource",0xc92e6464,"lime.media.openal.AL.createSource","lime/media/openal/AL.hx",389,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_398_deleteBuffer,"lime.media.openal.AL","deleteBuffer",0xabd456f8,"lime.media.openal.AL.deleteBuffer","lime/media/openal/AL.hx",398,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_418_deleteSource,"lime.media.openal.AL","deleteSource",0x0d714ad3,"lime.media.openal.AL.deleteSource","lime/media/openal/AL.hx",418,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_445_distanceModel,"lime.media.openal.AL","distanceModel",0x71becc27,"lime.media.openal.AL.distanceModel","lime/media/openal/AL.hx",445,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_908_getSource3f,"lime.media.openal.AL","getSource3f",0x72b66657,"lime.media.openal.AL.getSource3f","lime/media/openal/AL.hx",908,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_928_getSourcef,"lime.media.openal.AL","getSourcef",0xf9a06362,"lime.media.openal.AL.getSourcef","lime/media/openal/AL.hx",928,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_973_getSourcei,"lime.media.openal.AL","getSourcei",0xf9a06365,"lime.media.openal.AL.getSourcei","lime/media/openal/AL.hx",973,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1130_source3f,"lime.media.openal.AL","source3f",0x5ff8035b,"lime.media.openal.AL.source3f","lime/media/openal/AL.hx",1130,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1144_sourcef,"lime.media.openal.AL","sourcef",0x265052de,"lime.media.openal.AL.sourcef","lime/media/openal/AL.hx",1144,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1164_sourcei,"lime.media.openal.AL","sourcei",0x265052e1,"lime.media.openal.AL.sourcei","lime/media/openal/AL.hx",1164,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1198_sourcePlay,"lime.media.openal.AL","sourcePlay",0x63b3e29c,"lime.media.openal.AL.sourcePlay","lime/media/openal/AL.hx",1198,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1218_sourceStop,"lime.media.openal.AL","sourceStop",0x65b5a4aa,"lime.media.openal.AL.sourceStop","lime/media/openal/AL.hx",1218,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1238_sourceRewind,"lime.media.openal.AL","sourceRewind",0x75ce58a3,"lime.media.openal.AL.sourceRewind","lime/media/openal/AL.hx",1238,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1297_sourceQueueBuffers,"lime.media.openal.AL","sourceQueueBuffers",0x07401e8a,"lime.media.openal.AL.sourceQueueBuffers","lime/media/openal/AL.hx",1297,0x932ea25e)
HX_LOCAL_STACK_FRAME(_hx_pos_87306d7050ce8f43_1312_sourceUnqueueBuffers,"lime.media.openal.AL","sourceUnqueueBuffers",0xca8ba063,"lime.media.openal.AL.sourceUnqueueBuffers","lime/media/openal/AL.hx",1312,0x932ea25e)
namespace lime{
namespace media{
namespace openal{

void AL_obj::__construct() { }

Dynamic AL_obj::__CreateEmpty() { return new AL_obj; }

void *AL_obj::_hx_vtable = 0;

Dynamic AL_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< AL_obj > _hx_result = new AL_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool AL_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x2695cb8f;
}

void AL_obj::bufferData( ::Dynamic buffer,int format, ::lime::utils::ArrayBufferView data,int size,int freq){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_292_bufferData)
HXDLIN( 292)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_buffer_data(::hx::DynamicPtr(buffer),format,::hx::DynamicPtr(data),size,freq);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(AL_obj,bufferData,(void))

 ::Dynamic AL_obj::createBuffer(){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_362_createBuffer)
HXDLIN( 362)		return ( ( ::Dynamic)(::lime::_internal::backend::native::NativeCFFI_obj::lime_al_gen_buffer()) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(AL_obj,createBuffer,return )

 ::Dynamic AL_obj::createSource(){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_389_createSource)
HXDLIN( 389)		return ( ( ::Dynamic)(::lime::_internal::backend::native::NativeCFFI_obj::lime_al_gen_source()) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(AL_obj,createSource,return )

void AL_obj::deleteBuffer( ::Dynamic buffer){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_398_deleteBuffer)
HXDLIN( 398)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_delete_buffer(::hx::DynamicPtr(buffer));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AL_obj,deleteBuffer,(void))

void AL_obj::deleteSource( ::Dynamic source){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_418_deleteSource)
HXDLIN( 418)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_delete_source(::hx::DynamicPtr(source));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AL_obj,deleteSource,(void))

void AL_obj::distanceModel(int distanceModel){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_445_distanceModel)
HXDLIN( 445)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_distance_model(distanceModel);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AL_obj,distanceModel,(void))

::Array< Float > AL_obj::getSource3f( ::Dynamic source,int param){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_908_getSource3f)
HXLINE( 910)		 ::hx::Object * result = ::lime::_internal::backend::native::NativeCFFI_obj::lime_al_get_source3f(::hx::DynamicPtr(source),param);
HXLINE( 918)		return ( ( ::Dynamic)(result) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AL_obj,getSource3f,return )

Float AL_obj::getSourcef( ::Dynamic source,int param){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_928_getSourcef)
HXDLIN( 928)		return ( (Float)(::lime::_internal::backend::native::NativeCFFI_obj::lime_al_get_sourcef(::hx::DynamicPtr(source),param)) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AL_obj,getSourcef,return )

 ::Dynamic AL_obj::getSourcei( ::Dynamic source,int param){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_973_getSourcei)
HXDLIN( 973)		return ( ( ::Dynamic)(::lime::_internal::backend::native::NativeCFFI_obj::lime_al_get_sourcei(::hx::DynamicPtr(source),param)) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AL_obj,getSourcei,return )

void AL_obj::source3f( ::Dynamic source,int param,Float value1,Float value2,Float value3){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1130_source3f)
HXDLIN(1130)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_source3f(::hx::DynamicPtr(source),param,( (float)(value1) ),( (float)(value2) ),( (float)(value3) ));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(AL_obj,source3f,(void))

void AL_obj::sourcef( ::Dynamic source,int param,Float value){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1144_sourcef)
HXDLIN(1144)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_sourcef(::hx::DynamicPtr(source),param,( (float)(value) ));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(AL_obj,sourcef,(void))

void AL_obj::sourcei( ::Dynamic source,int param, ::Dynamic value){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1164_sourcei)
HXDLIN(1164)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_sourcei(::hx::DynamicPtr(source),param,::hx::DynamicPtr(value));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(AL_obj,sourcei,(void))

void AL_obj::sourcePlay( ::Dynamic source){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1198_sourcePlay)
HXDLIN(1198)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_source_play(::hx::DynamicPtr(source));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AL_obj,sourcePlay,(void))

void AL_obj::sourceStop( ::Dynamic source){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1218_sourceStop)
HXDLIN(1218)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_source_stop(::hx::DynamicPtr(source));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AL_obj,sourceStop,(void))

void AL_obj::sourceRewind( ::Dynamic source){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1238_sourceRewind)
HXDLIN(1238)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_source_rewind(::hx::DynamicPtr(source));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AL_obj,sourceRewind,(void))

void AL_obj::sourceQueueBuffers( ::Dynamic source,int nb,::cpp::VirtualArray buffers){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1297_sourceQueueBuffers)
HXDLIN(1297)		::lime::_internal::backend::native::NativeCFFI_obj::lime_al_source_queue_buffers(::hx::DynamicPtr(source),nb,::hx::DynamicPtr(buffers));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(AL_obj,sourceQueueBuffers,(void))

::cpp::VirtualArray AL_obj::sourceUnqueueBuffers( ::Dynamic source,int nb){
            	HX_STACKFRAME(&_hx_pos_87306d7050ce8f43_1312_sourceUnqueueBuffers)
HXLINE(1314)		 ::hx::Object * result = ::lime::_internal::backend::native::NativeCFFI_obj::lime_al_source_unqueue_buffers(::hx::DynamicPtr(source),nb);
HXLINE(1322)		return ( ( ::Dynamic)(result) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AL_obj,sourceUnqueueBuffers,return )


AL_obj::AL_obj()
{
}

bool AL_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"sourcef") ) { outValue = sourcef_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"sourcei") ) { outValue = sourcei_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"source3f") ) { outValue = source3f_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bufferData") ) { outValue = bufferData_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getSourcef") ) { outValue = getSourcef_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getSourcei") ) { outValue = getSourcei_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"sourcePlay") ) { outValue = sourcePlay_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"sourceStop") ) { outValue = sourceStop_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"getSource3f") ) { outValue = getSource3f_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"createBuffer") ) { outValue = createBuffer_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"createSource") ) { outValue = createSource_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"deleteBuffer") ) { outValue = deleteBuffer_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"deleteSource") ) { outValue = deleteSource_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"sourceRewind") ) { outValue = sourceRewind_dyn(); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"distanceModel") ) { outValue = distanceModel_dyn(); return true; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"sourceQueueBuffers") ) { outValue = sourceQueueBuffers_dyn(); return true; }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"sourceUnqueueBuffers") ) { outValue = sourceUnqueueBuffers_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *AL_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *AL_obj_sStaticStorageInfo = 0;
#endif

::hx::Class AL_obj::__mClass;

static ::String AL_obj_sStaticFields[] = {
	HX_("bufferData",4a,bf,73,93),
	HX_("createBuffer",1c,fd,e9,f2),
	HX_("createSource",f7,f0,86,54),
	HX_("deleteBuffer",8b,e3,2c,37),
	HX_("deleteSource",66,d7,c9,98),
	HX_("distanceModel",34,40,e1,d3),
	HX_("getSource3f",24,cd,97,8c),
	HX_("getSourcef",35,95,aa,08),
	HX_("getSourcei",38,95,aa,08),
	HX_("source3f",6e,0a,a4,66),
	HX_("sourcef",2b,0f,49,b9),
	HX_("sourcei",2e,0f,49,b9),
	HX_("sourcePlay",6f,14,be,72),
	HX_("sourceStop",7d,d6,bf,74),
	HX_("sourceRewind",36,e5,26,01),
	HX_("sourceQueueBuffers",5d,db,5c,42),
	HX_("sourceUnqueueBuffers",f6,77,ef,93),
	::String(null())
};

void AL_obj::__register()
{
	AL_obj _hx_dummy;
	AL_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("lime.media.openal.AL",21,39,77,65);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &AL_obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(AL_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< AL_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AL_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AL_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace media
} // end namespace openal