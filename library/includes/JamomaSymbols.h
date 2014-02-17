/** @file
 *
 * @ingroup implementationMaxLibrary
 *
 * @brief Jamoma symbols cached to avoid repeated calls to the expensive SymbolGen() function.
 *
 * @details
 *
 * @authors Tim Place
 *
 * @copyright Copyright © 2006, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __JAMOMA_SYMBOLS_H__
#define __JAMOMA_SYMBOLS_H__

#include "JamomaForMax.h"

extern "C" JAMOMA_EXPORT t_symbol *jps_done,
				//*jps_none,				
				*jps_linear,
				*jps_linear_q,
			    *jps_slash_ramp_slash_update,
				*jps_low,						///< Pointer to the symbol "low", used in clipping.
				*jps_high,						///< Pointer to the symbol "high", used in clipping.
				*jps_both,						///< Pointer to the symbol "both", used in clipping.
				*jps_wrap,						///< Pointer to the symbol "wrap", used in clipping.
				*jps_fold,						///< Pointer to the symbol "fold", used in clipping.
				*jps_inc,						///< Pointer to the symbol "inc", used for stepwise increment of parameter value.
				*jps_dec,						///< Pointer to the symbol "dec", used for stepwise decrement of parameter value.
				*jps_generic,					///< Pointer to the symbol "generic", one of the parameter and message data types.
				*jps_integer,					///< Pointer to the symbol "integer", one of the parameter and message data types.
				*jps_decimal,					///< Pointer to the symbol "decimal", one of the parameter and message data types.
				*jps_string,					///< Pointer to the symbol "string", one of the parameter and message data types.
				*jps_array,						///< This is deprecated, please use #jps_list, #jps_decimalArray or #jps_integerArray instead.
				*jps_decimalArray,				///< Pointer to the symbol "decimalArray", one of the parameter and message data types. Used for arrays of decimal values.
				*jps_integerArray,				///< Pointer to the symbol "integerArray", one of the parameter and message data types. Used for arrays of decimal values.
				*jps_boolean,					///< Pointer to the symbol "boolean", one of the parameter and message data types.
                //*jps_list_int,
                //*jps_list_float,
				*jps_none,						///< Pointer to the symbol "none", a data type that is only applicable to j.message.
				*jps_jcom_hub,
				*jps_feedback,
				*jps_alias,						///< Pointer to the symbol "alias". A model can have an alias in addition to the regularly assigned name. This can be used to address models with descriptive and content-related names that might change over time.
				*jps_module_name_get,
				*jps_core_module_name_get,
				*jps_dumpout,
				*jps_audio, 
				*jps_video, 
				*jps_control, 
				*jps_dispatched, 
				*jps_parameter_name,
				*jps_message_name,
				*jps_message_return,
				*jps_parameter_names_start, 
				*jps_parameter_names_end,
				*jps_message_names_start, 
				*jps_message_names_end,
				*jps_return_names_start, 
				*jps_return_names_end,
				*jps_parameter_values_start,
				*jps_parameter_values_end,
				*jps_parameter_value,
				*jps_subscribe,						// used for calling the 'bind' method on j.hub
				*jps_unsubscribe,
				*jps_release,						// method in the hub for unsubscribing
				*jps_subscribe_in,					// when binding to the hub, these specify what type of object this is...
				*jps_subscribe_out,
				*jps_subscribe_message,
				*jps_subscribe_parameter,
				*jps_subscribe_remote,
				*jps_subscribe_return,
				*jps_subscribe_init,
				*jps_subscribe_meter,
				//*jps_inspector,
				*jps_num_inputs,					// signal inlets and outlets
				*jps_num_outputs,
				*jps_type,
				*jps_dataspace,
				*jps_unit,
				*jps_algorithm_type,
				*jps_name,
				*jps_priority,	 
				*jps_readonly,	 	 
				*jps_range_bounds,
				*jps_range_clipmode,
				*jps_ramp,
				*jps_ramp_drive,
				*jps_ramp_function,
				*jps_repetitions_filter,
				*jps_description,
				*jps_enable,
				*jps_value,	
 				*jps_value_default,
 				*jps_value_stepsize,
				*jps_sigcount,
				*jps_siglist,
				*jps_config_changed,
				*jps_algorithm,
				*jps_get_num_channels,
				*jps_module_name,
				*jps_slash_module_name,	 
				*jps_module_class,
				*jps_module_type,
				//*jps_poly,
				*jps_default,
				*jps_jitter,
				*jps_1U,
				*jps_1U_half,
				*jps_algorithm_message,
				*jps_private,
				*jps__gui__,
				*jps__jcom_in__,
				*jps__jcom_out__,
				*jps___preview__,
				*jps_return,
				*jps_return_address,
				*jps_return_extended,
				*jps_return_signal,
				*jps_return_value,
				*jps_go,
				*jps_init,
				//*jps_ATTRIBUTES,					// used by the hub for setting up the gui...
				//*jps_BUILD,
				//*jps_MODULE_NAME,
				//*jps_MODULE_TITLE,
				//*jps_PARAMETER,
				//*jps_NEW_PRESETS_START,
				//*jps_NEW_PRESETS,
				//*jps_MENU_REBUILD,
				*jps_size,
				//*jps_skin,
				*jps_jcom_send,						// object names needed to load externs inside other objects...
				*jps_jcom_receive,
				*jps_jcom_remote_fromModule, 			
				*jps_jcom_remote_toModule,
				*jps_jcom_broadcast_fromHub,
				*jps_from_in_object,
				*jps_box,
				*jps_setcallback,
				*jps_link_in,						// common OSC messages, etc.
				*jps_link_out,
				*jps_unlink_in,
				*jps_unlink_out,
		 		*jps_audio_gain,
		 		*jps_slash_audio_gain,			
		 		//*jps_audio_gain_midi,
				//*jps_slash_audio_gain_midi,
				*jps_audio_mute,
				*jps_slash_audio_mute,
				*jps_audio_bypass,
				*jps_slash_audio_bypass,
	 			*jps_bypass,
	 			*jps_slash_bypass,					 
				*jps_audio_mix,
				*jps_slash_audio_mix,
				//*jps_audio_sample_rate,
				//*jps_slash_audio_sample_rate,
				*jps_audio_meters_freeze,
				*jps_slash_audio_meters_freeze,
				*jps_video_mute,
				*jps_slash_video_mute,
				*jps_video_bypass,
				*jps_slash_video_bypass,
		 		*jps_freeze,
		 		*jps_slash_freeze,					 
				*jps_video_freeze,
				*jps_slash_video_freeze,
				*jps_video_preview,
				*jps_slash_video_preview,
		 		*jps_preview,		
		 		*jps_slash_preview,								 
				*jps_open,							//  open
		 		*jps_slash_getstate,
			    *jps_slash_view_slash_panel,        // /view/panel
		 		*jps_slash_module_view_internals,	//	/module/view_internals
		 		*jps_slash_module_slash_reference,	//	/module/reference
		 		*jps_slash_module_slash_help,		//	/module/help				
		 		*jps_slash_preset_slash_interface,	// /preset/interface
				*jps_slash_preset_slash_default,	// /preset/default
				*jps_slash_preset_slash_load,		// /preset/load
				*jps_slash_preset_slash_store,		// /preset/store
				*jps_slash_preset_slash_storenext,	// /preset/storenext
				*jps_slash_preset_slash_storecurrent,	// /preset/storecurrent
				*jps_slash_preset_slash_recall,
				*jps_slash_preset_slash_write,		// /preset/write
				*jps_preset_slash_write,			// preset/write 
				*jps_slash_preset_slash_writeagain,	// /preset/writeagain
				*jps_preset_slash_writeagain,		// 	preset/writeagain					 
				*jps_slash_preset_slash_copy,		// /preset/save
				*jps_preset_slash_mix, 			 	// preset/mix
				*jps_preset_slash_default,			// preset/default
				*jps_preset_slash_interpolate,		// preset/interpolate	 
				*jps_slash_ui_slash_internals,      // /view/internals	 
				 *jps_ui_slash_internals,      		// view/internals
				*jps_ui_slash_freeze,				//	view/freeze
				*jps_slash_ui_slash_freeze,			// /view/freeze
				*jps_ui_slash_refresh,				//	view/refresh
				*jps_slash_ui_slash_refresh,		// /view/refresh
				*jps_register_meter,
				*jps_register_preview,
				//*jps_voices,
				*jps_gain,
				*jps_slash_gain,
				*jps_mix,
			    *jps_slash_mix,	
        		*jps_mix_slash_weight,				  
				*jps_settext,
				*jps_mute,
	  			*jps_slash_mute,
				*jps_target,
				*jps_sendlastvalue,
				*jps_sendbypassedvalue,
				*jps_star,
				*jps_add,							// used for calling methods on j.receivemaster
				*jps_remove,
				*jps_dispatch,
	  			*jps_subpatcher,
	  			*jps_bpatcher						  
				;

extern "C" void jamomaSymbolsInit();

#endif // #ifndef __JAMOMA_SYMBOLS_H__

