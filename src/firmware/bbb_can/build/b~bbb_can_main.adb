pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~bbb_can_main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~bbb_can_main.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E085 : Short_Integer; pragma Import (Ada, E085, "system__os_lib_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "ada__io_exceptions_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__strings_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__tags_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__streams_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "interfaces__c_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "interfaces__c__strings_E");
   E031 : Short_Integer; pragma Import (Ada, E031, "system__exceptions_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__finalization_root_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "ada__finalization_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__storage_pools_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "system__finalization_masters_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "system__storage_pools__subpools_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "system__pool_global_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__file_control_block_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "ada__streams__stream_io_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "system__file_io_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "gnat__serial_communications_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__object_reader_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__dwarf_lines_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__secondary_stack_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__strings__stream_ops_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "ada__text_io_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "can_defs_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "can_utils_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "exception_handling_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "queue_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "uartwrapper_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "bbb_can_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E165 := E165 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "uartwrapper__finalize_spec");
      begin
         F1;
      end;
      E113 := E113 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "exception_handling__finalize_spec");
      begin
         F2;
      end;
      E067 := E067 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__text_io__finalize_spec");
      begin
         F3;
      end;
      E159 := E159 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__object_reader__finalize_body");
      begin
         E143 := E143 - 1;
         F4;
      end;
      E090 := E090 - 1;
      E104 := E104 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E073 := E073 - 1;
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__object_reader__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gnat__serial_communications__finalize_spec");
      begin
         F7;
      end;
      E155 := E155 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ada__streams__stream_io__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__file_control_block__finalize_spec");
      begin
         E088 := E088 - 1;
         F9;
      end;
      E100 := E100 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_global__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__storage_pools__subpools__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__finalization_masters__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E078 := E078 + 1;
      Ada.Strings'Elab_Spec;
      E125 := E125 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E068 := E068 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E031 := E031 + 1;
      System.Finalization_Root'Elab_Spec;
      E077 := E077 + 1;
      Ada.Finalization'Elab_Spec;
      E075 := E075 + 1;
      System.Storage_Pools'Elab_Spec;
      E098 := E098 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E100 := E100 + 1;
      System.File_Control_Block'Elab_Spec;
      E088 := E088 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E155 := E155 + 1;
      Gnat.Serial_Communications'Elab_Spec;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.File_Io'Elab_Body;
      E073 := E073 + 1;
      E104 := E104 + 1;
      System.Finalization_Masters'Elab_Body;
      E090 := E090 + 1;
      E080 := E080 + 1;
      E050 := E050 + 1;
      Ada.Tags'Elab_Body;
      E058 := E058 + 1;
      E129 := E129 + 1;
      System.Soft_Links'Elab_Body;
      E015 := E015 + 1;
      System.Os_Lib'Elab_Body;
      E085 := E085 + 1;
      System.Secondary_Stack'Elab_Body;
      E019 := E019 + 1;
      System.Dwarf_Lines'Elab_Body;
      E124 := E124 + 1;
      System.Object_Reader'Elab_Body;
      E143 := E143 + 1;
      E159 := E159 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E153 := E153 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E067 := E067 + 1;
      Can_Defs'Elab_Spec;
      E111 := E111 + 1;
      E110 := E110 + 1;
      Exception_Handling'Elab_Spec;
      E113 := E113 + 1;
      E163 := E163 + 1;
      Uartwrapper'Elab_Spec;
      E165 := E165 + 1;
      E108 := E108 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_bbb_can_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/nils/robotic_project/git/naiad-auv-software/src/lib/can_defs/build/can_defs.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/lib/can_utils/build/can_utils.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/lib/exception_handling/obj/exception_handling.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/lib/queue/build/queue.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/firmware/UartWrapper/obj/uartwrapper.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/bbb_can.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/bbb_can_main.o
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/firmware/UartWrapper/obj/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/lib/exception_handling/obj/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/lib/queue/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/lib/can_utils/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/lib/can_defs/build/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
