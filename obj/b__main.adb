pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E07 : Short_Integer; pragma Import (Ada, E07, "ada__real_time_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "system__tasking__protected_objects_E");
   E84 : Short_Integer; pragma Import (Ada, E84, "system__tasking__protected_objects__multiprocessors_E");
   E76 : Short_Integer; pragma Import (Ada, E76, "system__tasking__restricted__stages_E");
   E04 : Short_Integer; pragma Import (Ada, E04, "driver_E");
   E94 : Short_Integer; pragma Import (Ada, E94, "last_chance_handler_E");
   E86 : Short_Integer; pragma Import (Ada, E86, "registers_E");
   E69 : Short_Integer; pragma Import (Ada, E69, "button_E");
   E92 : Short_Integer; pragma Import (Ada, E92, "leds_E");


   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");

      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      Main_Priority := 0;

      Ada.Real_Time'Elab_Body;
      E07 := E07 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E80 := E80 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E84 := E84 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E76 := E76 + 1;
      Driver'Elab_Spec;
      Registers'Elab_Spec;
      E86 := E86 + 1;
      Button'Elab_Body;
      E69 := E69 + 1;
      Leds'Elab_Body;
      E92 := E92 + 1;
      E94 := E94 + 1;
      Driver'Elab_Body;
      E04 := E04 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/dushan/dev/ada_arm/led_demo/obj/stm32f4.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/stm32f4-gpio.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/stm32f4-reset_clock_control.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/stm32f4-sysconfig_control.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/registers.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/button.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/leds.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/last_chance_handler.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/driver.o
   --   /home/dushan/dev/ada_arm/led_demo/obj/main.o
   --   -L/home/dushan/dev/ada_arm/led_demo/obj/
   --   -L/home/dushan/dev/ada_arm/led_demo/obj/
   --   -L/opt/gnat_arm/arm-eabi/lib/gnat/ravenscar-sfp-stm32f411nucleo/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
