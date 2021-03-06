pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2013 (20130314)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_bbb_can_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#36dd9f82#;
   pragma Export (C, u00001, "bbb_can_mainB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#9e44d182#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#45724809#;
   pragma Export (C, u00005, "ada__calendar__delaysB");
   u00006 : constant Version_32 := 16#474dd4b1#;
   pragma Export (C, u00006, "ada__calendar__delaysS");
   u00007 : constant Version_32 := 16#8ba0787e#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#e2a1b7ab#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#ac6c9c48#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#90249111#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#fd7febcc#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#26c69dd1#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#844ab6bf#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#6ae9ec89#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#33862d3d#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#014a4db4#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00026, "system__htableB");
   u00027 : constant Version_32 := 16#138cdf1f#;
   pragma Export (C, u00027, "system__htableS");
   u00028 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00028, "system__string_hashB");
   u00029 : constant Version_32 := 16#b6b84985#;
   pragma Export (C, u00029, "system__string_hashS");
   u00030 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00030, "system__exceptionsB");
   u00031 : constant Version_32 := 16#9cda59a6#;
   pragma Export (C, u00031, "system__exceptionsS");
   u00032 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00032, "system__exceptions_debugB");
   u00033 : constant Version_32 := 16#a854b4c5#;
   pragma Export (C, u00033, "system__exceptions_debugS");
   u00034 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00034, "system__img_intB");
   u00035 : constant Version_32 := 16#92ff71d3#;
   pragma Export (C, u00035, "system__img_intS");
   u00036 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00036, "system__tracebackB");
   u00037 : constant Version_32 := 16#f1a34564#;
   pragma Export (C, u00037, "system__tracebackS");
   u00038 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00038, "system__wch_conB");
   u00039 : constant Version_32 := 16#2fcfbf2c#;
   pragma Export (C, u00039, "system__wch_conS");
   u00040 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00040, "system__wch_stwB");
   u00041 : constant Version_32 := 16#02de932d#;
   pragma Export (C, u00041, "system__wch_stwS");
   u00042 : constant Version_32 := 16#617a40f2#;
   pragma Export (C, u00042, "system__wch_cnvB");
   u00043 : constant Version_32 := 16#313139fa#;
   pragma Export (C, u00043, "system__wch_cnvS");
   u00044 : constant Version_32 := 16#cb4a8015#;
   pragma Export (C, u00044, "interfacesS");
   u00045 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00045, "system__wch_jisB");
   u00046 : constant Version_32 := 16#6543a2ee#;
   pragma Export (C, u00046, "system__wch_jisS");
   u00047 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00047, "system__traceback_entriesB");
   u00048 : constant Version_32 := 16#c2057f50#;
   pragma Export (C, u00048, "system__traceback_entriesS");
   u00049 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00049, "interfaces__cB");
   u00050 : constant Version_32 := 16#29899d4e#;
   pragma Export (C, u00050, "interfaces__cS");
   u00051 : constant Version_32 := 16#22d03640#;
   pragma Export (C, u00051, "system__os_primitivesB");
   u00052 : constant Version_32 := 16#20f51d38#;
   pragma Export (C, u00052, "system__os_primitivesS");
   u00053 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00053, "system__tracesB");
   u00054 : constant Version_32 := 16#6239f9bb#;
   pragma Export (C, u00054, "system__tracesS");
   u00055 : constant Version_32 := 16#576661f1#;
   pragma Export (C, u00055, "ada__command_lineB");
   u00056 : constant Version_32 := 16#df5044bd#;
   pragma Export (C, u00056, "ada__command_lineS");
   u00057 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00057, "ada__tagsB");
   u00058 : constant Version_32 := 16#39106b41#;
   pragma Export (C, u00058, "ada__tagsS");
   u00059 : constant Version_32 := 16#fac5cd67#;
   pragma Export (C, u00059, "system__unsigned_typesS");
   u00060 : constant Version_32 := 16#25c21d28#;
   pragma Export (C, u00060, "system__val_lluB");
   u00061 : constant Version_32 := 16#80379a15#;
   pragma Export (C, u00061, "system__val_lluS");
   u00062 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00062, "system__val_utilB");
   u00063 : constant Version_32 := 16#3c8427ef#;
   pragma Export (C, u00063, "system__val_utilS");
   u00064 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00064, "system__case_utilB");
   u00065 : constant Version_32 := 16#3d38f199#;
   pragma Export (C, u00065, "system__case_utilS");
   u00066 : constant Version_32 := 16#421d3150#;
   pragma Export (C, u00066, "ada__text_ioB");
   u00067 : constant Version_32 := 16#dac0d159#;
   pragma Export (C, u00067, "ada__text_ioS");
   u00068 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00068, "ada__streamsS");
   u00069 : constant Version_32 := 16#e0b7a7e8#;
   pragma Export (C, u00069, "interfaces__c_streamsB");
   u00070 : constant Version_32 := 16#95ad191f#;
   pragma Export (C, u00070, "interfaces__c_streamsS");
   u00071 : constant Version_32 := 16#f90957b0#;
   pragma Export (C, u00071, "system__crtlS");
   u00072 : constant Version_32 := 16#228a5436#;
   pragma Export (C, u00072, "system__file_ioB");
   u00073 : constant Version_32 := 16#0165f036#;
   pragma Export (C, u00073, "system__file_ioS");
   u00074 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00074, "ada__finalizationB");
   u00075 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00075, "ada__finalizationS");
   u00076 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00076, "system__finalization_rootB");
   u00077 : constant Version_32 := 16#dfd6e281#;
   pragma Export (C, u00077, "system__finalization_rootS");
   u00078 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00078, "ada__io_exceptionsS");
   u00079 : constant Version_32 := 16#9f990c8b#;
   pragma Export (C, u00079, "interfaces__c__stringsB");
   u00080 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00080, "interfaces__c__stringsS");
   u00081 : constant Version_32 := 16#d6bc4ecc#;
   pragma Export (C, u00081, "system__crtl__runtimeS");
   u00082 : constant Version_32 := 16#1eab0e09#;
   pragma Export (C, u00082, "system__img_enum_newB");
   u00083 : constant Version_32 := 16#17235ae1#;
   pragma Export (C, u00083, "system__img_enum_newS");
   u00084 : constant Version_32 := 16#3902baae#;
   pragma Export (C, u00084, "system__os_libB");
   u00085 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00085, "system__os_libS");
   u00086 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00086, "system__stringsB");
   u00087 : constant Version_32 := 16#27cedbd5#;
   pragma Export (C, u00087, "system__stringsS");
   u00088 : constant Version_32 := 16#b7c0fb6f#;
   pragma Export (C, u00088, "system__file_control_blockS");
   u00089 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00089, "system__finalization_mastersB");
   u00090 : constant Version_32 := 16#fad13d3d#;
   pragma Export (C, u00090, "system__finalization_mastersS");
   u00091 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00091, "system__address_imageB");
   u00092 : constant Version_32 := 16#31c80c2b#;
   pragma Export (C, u00092, "system__address_imageS");
   u00093 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00093, "system__img_boolB");
   u00094 : constant Version_32 := 16#65fde0fa#;
   pragma Export (C, u00094, "system__img_boolS");
   u00095 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00095, "system__ioB");
   u00096 : constant Version_32 := 16#0e66665e#;
   pragma Export (C, u00096, "system__ioS");
   u00097 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00097, "system__storage_poolsB");
   u00098 : constant Version_32 := 16#438a8e7c#;
   pragma Export (C, u00098, "system__storage_poolsS");
   u00099 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00099, "system__pool_globalB");
   u00100 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00100, "system__pool_globalS");
   u00101 : constant Version_32 := 16#fc605663#;
   pragma Export (C, u00101, "system__memoryB");
   u00102 : constant Version_32 := 16#5aaf2d04#;
   pragma Export (C, u00102, "system__memoryS");
   u00103 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00103, "system__storage_pools__subpoolsB");
   u00104 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00104, "system__storage_pools__subpoolsS");
   u00105 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00105, "system__storage_pools__subpools__finalizationB");
   u00106 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00106, "system__storage_pools__subpools__finalizationS");
   u00107 : constant Version_32 := 16#72cda066#;
   pragma Export (C, u00107, "bbb_canB");
   u00108 : constant Version_32 := 16#f5108d2c#;
   pragma Export (C, u00108, "bbb_canS");
   u00109 : constant Version_32 := 16#aa931f07#;
   pragma Export (C, u00109, "can_utilsB");
   u00110 : constant Version_32 := 16#b938dbcd#;
   pragma Export (C, u00110, "can_utilsS");
   u00111 : constant Version_32 := 16#2fdb1e3e#;
   pragma Export (C, u00111, "can_defsS");
   u00112 : constant Version_32 := 16#eec6f546#;
   pragma Export (C, u00112, "exception_handlingB");
   u00113 : constant Version_32 := 16#651b46a7#;
   pragma Export (C, u00113, "exception_handlingS");
   u00114 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00114, "gnatS");
   u00115 : constant Version_32 := 16#2648146e#;
   pragma Export (C, u00115, "gnat__tracebackB");
   u00116 : constant Version_32 := 16#ef6864dc#;
   pragma Export (C, u00116, "gnat__tracebackS");
   u00117 : constant Version_32 := 16#25f70bc7#;
   pragma Export (C, u00117, "ada__exceptions__tracebackB");
   u00118 : constant Version_32 := 16#1e536c8b#;
   pragma Export (C, u00118, "ada__exceptions__tracebackS");
   u00119 : constant Version_32 := 16#5f14e1a0#;
   pragma Export (C, u00119, "gnat__traceback__symbolicB");
   u00120 : constant Version_32 := 16#171ff1f9#;
   pragma Export (C, u00120, "gnat__traceback__symbolicS");
   u00121 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00121, "system__address_operationsB");
   u00122 : constant Version_32 := 16#505a7886#;
   pragma Export (C, u00122, "system__address_operationsS");
   u00123 : constant Version_32 := 16#4d628725#;
   pragma Export (C, u00123, "system__dwarf_linesB");
   u00124 : constant Version_32 := 16#921224b0#;
   pragma Export (C, u00124, "system__dwarf_linesS");
   u00125 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00125, "ada__stringsS");
   u00126 : constant Version_32 := 16#35b254f4#;
   pragma Export (C, u00126, "ada__strings__boundedB");
   u00127 : constant Version_32 := 16#366f64db#;
   pragma Export (C, u00127, "ada__strings__boundedS");
   u00128 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00128, "ada__strings__mapsB");
   u00129 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00129, "ada__strings__mapsS");
   u00130 : constant Version_32 := 16#1856bbe2#;
   pragma Export (C, u00130, "system__bit_opsB");
   u00131 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00131, "system__bit_opsS");
   u00132 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00132, "ada__charactersS");
   u00133 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00133, "ada__characters__latin_1S");
   u00134 : constant Version_32 := 16#ddb66c1c#;
   pragma Export (C, u00134, "ada__strings__superboundedB");
   u00135 : constant Version_32 := 16#ae699a5f#;
   pragma Export (C, u00135, "ada__strings__superboundedS");
   u00136 : constant Version_32 := 16#7b7cedaa#;
   pragma Export (C, u00136, "ada__strings__searchB");
   u00137 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00137, "ada__strings__searchS");
   u00138 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00138, "system__compare_array_unsigned_8B");
   u00139 : constant Version_32 := 16#4a1f67dc#;
   pragma Export (C, u00139, "system__compare_array_unsigned_8S");
   u00140 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00140, "system__img_unsB");
   u00141 : constant Version_32 := 16#6531f190#;
   pragma Export (C, u00141, "system__img_unsS");
   u00142 : constant Version_32 := 16#5b00f4eb#;
   pragma Export (C, u00142, "system__object_readerB");
   u00143 : constant Version_32 := 16#f9f2ce44#;
   pragma Export (C, u00143, "system__object_readerS");
   u00144 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00144, "system__stream_attributesB");
   u00145 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00145, "system__stream_attributesS");
   u00146 : constant Version_32 := 16#d3757657#;
   pragma Export (C, u00146, "system__val_lliB");
   u00147 : constant Version_32 := 16#0a0077b1#;
   pragma Export (C, u00147, "system__val_lliS");
   u00148 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00148, "system__concat_2B");
   u00149 : constant Version_32 := 16#6bf463ed#;
   pragma Export (C, u00149, "system__concat_2S");
   u00150 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00150, "system__concat_3B");
   u00151 : constant Version_32 := 16#e60e937b#;
   pragma Export (C, u00151, "system__concat_3S");
   u00152 : constant Version_32 := 16#ce0e2acb#;
   pragma Export (C, u00152, "system__strings__stream_opsB");
   u00153 : constant Version_32 := 16#8453d1c6#;
   pragma Export (C, u00153, "system__strings__stream_opsS");
   u00154 : constant Version_32 := 16#5268b4a3#;
   pragma Export (C, u00154, "ada__streams__stream_ioB");
   u00155 : constant Version_32 := 16#31db4e88#;
   pragma Export (C, u00155, "ada__streams__stream_ioS");
   u00156 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00156, "system__communicationB");
   u00157 : constant Version_32 := 16#650fb457#;
   pragma Export (C, u00157, "system__communicationS");
   u00158 : constant Version_32 := 16#eb9778d0#;
   pragma Export (C, u00158, "gnat__serial_communicationsB");
   u00159 : constant Version_32 := 16#066119d0#;
   pragma Export (C, u00159, "gnat__serial_communicationsS");
   u00160 : constant Version_32 := 16#3ff16a6d#;
   pragma Export (C, u00160, "gnat__os_libS");
   u00161 : constant Version_32 := 16#60238118#;
   pragma Export (C, u00161, "system__os_constantsS");
   u00162 : constant Version_32 := 16#4e1b9bf4#;
   pragma Export (C, u00162, "queueB");
   u00163 : constant Version_32 := 16#24f8d719#;
   pragma Export (C, u00163, "queueS");
   u00164 : constant Version_32 := 16#2b717539#;
   pragma Export (C, u00164, "uartwrapperB");
   u00165 : constant Version_32 := 16#d6fcfb68#;
   pragma Export (C, u00165, "uartwrapperS");
   u00166 : constant Version_32 := 16#c9fdc962#;
   pragma Export (C, u00166, "system__concat_6B");
   u00167 : constant Version_32 := 16#57ee6405#;
   pragma Export (C, u00167, "system__concat_6S");
   u00168 : constant Version_32 := 16#def1dd00#;
   pragma Export (C, u00168, "system__concat_5B");
   u00169 : constant Version_32 := 16#801d5fb0#;
   pragma Export (C, u00169, "system__concat_5S");
   u00170 : constant Version_32 := 16#3493e6c0#;
   pragma Export (C, u00170, "system__concat_4B");
   u00171 : constant Version_32 := 16#927b72af#;
   pragma Export (C, u00171, "system__concat_4S");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  gnat.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.superbounded%s
   --  ada.strings.bounded%s
   --  ada.strings.bounded%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.communication%s
   --  system.communication%b
   --  system.crtl.runtime%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.os_constants%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  gnat.serial_communications%s
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.superbounded%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.command_line%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  gnat.serial_communications%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.traceback%s
   --  gnat.traceback%b
   --  gnat.traceback.symbolic%s
   --  gnat.traceback.symbolic%b
   --  can_defs%s
   --  can_utils%s
   --  can_utils%b
   --  exception_handling%s
   --  exception_handling%b
   --  queue%s
   --  queue%b
   --  uartwrapper%s
   --  uartwrapper%b
   --  bbb_can%s
   --  bbb_can%b
   --  bbb_can_main%b
   --  END ELABORATION ORDER


end ada_main;
