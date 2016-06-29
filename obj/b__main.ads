pragma Ada_95;
pragma Warnings (Off);
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#d2d8689e#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#0bedc8d1#;
   pragma Export (C, u00002, "systemS");
   u00003 : constant Version_32 := 16#93a884d6#;
   pragma Export (C, u00003, "driverB");
   u00004 : constant Version_32 := 16#a3378e12#;
   pragma Export (C, u00004, "driverS");
   u00005 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00005, "adaS");
   u00006 : constant Version_32 := 16#b51c1afb#;
   pragma Export (C, u00006, "ada__real_timeB");
   u00007 : constant Version_32 := 16#210f49b5#;
   pragma Export (C, u00007, "ada__real_timeS");
   u00008 : constant Version_32 := 16#4cf52eb9#;
   pragma Export (C, u00008, "system__task_primitivesS");
   u00009 : constant Version_32 := 16#e640c9e4#;
   pragma Export (C, u00009, "system__os_interfaceS");
   u00010 : constant Version_32 := 16#83daa007#;
   pragma Export (C, u00010, "system__bbS");
   u00011 : constant Version_32 := 16#e94ce81d#;
   pragma Export (C, u00011, "system__bb__board_supportB");
   u00012 : constant Version_32 := 16#50fc3ea3#;
   pragma Export (C, u00012, "system__bb__board_supportS");
   u00013 : constant Version_32 := 16#67545e3d#;
   pragma Export (C, u00013, "system__bb__parametersS");
   u00014 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00014, "interfacesS");
   u00015 : constant Version_32 := 16#eb2a747f#;
   pragma Export (C, u00015, "interfaces__stm32S");
   u00016 : constant Version_32 := 16#2209ecd3#;
   pragma Export (C, u00016, "interfaces__stm32__rccS");
   u00017 : constant Version_32 := 16#e721877b#;
   pragma Export (C, u00017, "interfaces__bit_typesS");
   u00018 : constant Version_32 := 16#3f6bb452#;
   pragma Export (C, u00018, "system__unsigned_typesS");
   u00019 : constant Version_32 := 16#faf500ff#;
   pragma Export (C, u00019, "system__bb__board_parametersS");
   u00020 : constant Version_32 := 16#1ad3e1fc#;
   pragma Export (C, u00020, "system__bb__mcu_parametersB");
   u00021 : constant Version_32 := 16#6b82b7ce#;
   pragma Export (C, u00021, "system__bb__mcu_parametersS");
   u00022 : constant Version_32 := 16#6bf11fcd#;
   pragma Export (C, u00022, "interfaces__stm32__pwrS");
   u00023 : constant Version_32 := 16#34e56f02#;
   pragma Export (C, u00023, "system__stm32B");
   u00024 : constant Version_32 := 16#02a6b195#;
   pragma Export (C, u00024, "system__stm32S");
   u00025 : constant Version_32 := 16#0456b31f#;
   pragma Export (C, u00025, "system__machine_codeS");
   u00026 : constant Version_32 := 16#ec69cd07#;
   pragma Export (C, u00026, "system__bb__cpu_primitivesB");
   u00027 : constant Version_32 := 16#0187d82a#;
   pragma Export (C, u00027, "system__bb__cpu_primitivesS");
   u00028 : constant Version_32 := 16#5e68f5cc#;
   pragma Export (C, u00028, "ada__exceptionsB");
   u00029 : constant Version_32 := 16#6f4e49e6#;
   pragma Export (C, u00029, "ada__exceptionsS");
   u00030 : constant Version_32 := 16#92724662#;
   pragma Export (C, u00030, "system__bb__threadsB");
   u00031 : constant Version_32 := 16#dde1af77#;
   pragma Export (C, u00031, "system__bb__threadsS");
   u00032 : constant Version_32 := 16#f1115928#;
   pragma Export (C, u00032, "system__bb__protectionB");
   u00033 : constant Version_32 := 16#7cbd1653#;
   pragma Export (C, u00033, "system__bb__protectionS");
   u00034 : constant Version_32 := 16#5b35ed67#;
   pragma Export (C, u00034, "system__bb__threads__queuesB");
   u00035 : constant Version_32 := 16#63341024#;
   pragma Export (C, u00035, "system__bb__threads__queuesS");
   u00036 : constant Version_32 := 16#1a7dc503#;
   pragma Export (C, u00036, "system__bb__cpu_primitives__multiprocessorsB");
   u00037 : constant Version_32 := 16#127f1e3a#;
   pragma Export (C, u00037, "system__bb__cpu_primitives__multiprocessorsS");
   u00038 : constant Version_32 := 16#5a83c3a4#;
   pragma Export (C, u00038, "system__multiprocessorsB");
   u00039 : constant Version_32 := 16#c674cd64#;
   pragma Export (C, u00039, "system__multiprocessorsS");
   u00040 : constant Version_32 := 16#dff90f1c#;
   pragma Export (C, u00040, "system__bb__timeB");
   u00041 : constant Version_32 := 16#d60104a4#;
   pragma Export (C, u00041, "system__bb__timeS");
   u00042 : constant Version_32 := 16#b5993228#;
   pragma Export (C, u00042, "ada__tagsB");
   u00043 : constant Version_32 := 16#d590539c#;
   pragma Export (C, u00043, "ada__tagsS");
   u00044 : constant Version_32 := 16#a56b3ef3#;
   pragma Export (C, u00044, "system__secondary_stackB");
   u00045 : constant Version_32 := 16#82fee897#;
   pragma Export (C, u00045, "system__secondary_stackS");
   u00046 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00046, "system__storage_elementsB");
   u00047 : constant Version_32 := 16#262e82d5#;
   pragma Export (C, u00047, "system__storage_elementsS");
   u00048 : constant Version_32 := 16#ce253456#;
   pragma Export (C, u00048, "system__bb__interruptsB");
   u00049 : constant Version_32 := 16#09004764#;
   pragma Export (C, u00049, "system__bb__interruptsS");
   u00050 : constant Version_32 := 16#b7ebfd80#;
   pragma Export (C, u00050, "system__bb__timing_eventsB");
   u00051 : constant Version_32 := 16#c2cb2cd3#;
   pragma Export (C, u00051, "system__bb__timing_eventsS");
   u00052 : constant Version_32 := 16#0941e52e#;
   pragma Export (C, u00052, "system__multiprocessors__fair_locksB");
   u00053 : constant Version_32 := 16#a70e2885#;
   pragma Export (C, u00053, "system__multiprocessors__fair_locksS");
   u00054 : constant Version_32 := 16#5f7c11fe#;
   pragma Export (C, u00054, "system__multiprocessors__spin_locksB");
   u00055 : constant Version_32 := 16#9ac42bf1#;
   pragma Export (C, u00055, "system__multiprocessors__spin_locksS");
   u00056 : constant Version_32 := 16#c0ab394a#;
   pragma Export (C, u00056, "system__parametersB");
   u00057 : constant Version_32 := 16#c2139b8e#;
   pragma Export (C, u00057, "system__parametersS");
   u00058 : constant Version_32 := 16#a48963b8#;
   pragma Export (C, u00058, "system__task_primitives__operationsB");
   u00059 : constant Version_32 := 16#a4cb5653#;
   pragma Export (C, u00059, "system__task_primitives__operationsS");
   u00060 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00060, "system__task_infoB");
   u00061 : constant Version_32 := 16#8bf775d0#;
   pragma Export (C, u00061, "system__task_infoS");
   u00062 : constant Version_32 := 16#3de333df#;
   pragma Export (C, u00062, "system__taskingB");
   u00063 : constant Version_32 := 16#d907bb05#;
   pragma Export (C, u00063, "system__taskingS");
   u00064 : constant Version_32 := 16#0f8eba36#;
   pragma Export (C, u00064, "system__tasking__debugB");
   u00065 : constant Version_32 := 16#6b583f9f#;
   pragma Export (C, u00065, "system__tasking__debugS");
   u00066 : constant Version_32 := 16#6a4c6cb2#;
   pragma Export (C, u00066, "ada__real_time__delaysB");
   u00067 : constant Version_32 := 16#64efb39b#;
   pragma Export (C, u00067, "ada__real_time__delaysS");
   u00068 : constant Version_32 := 16#0256bb37#;
   pragma Export (C, u00068, "buttonB");
   u00069 : constant Version_32 := 16#bea7f9e8#;
   pragma Export (C, u00069, "buttonS");
   u00070 : constant Version_32 := 16#800bd20c#;
   pragma Export (C, u00070, "ada__interruptsB");
   u00071 : constant Version_32 := 16#f3f9466e#;
   pragma Export (C, u00071, "ada__interruptsS");
   u00072 : constant Version_32 := 16#51078933#;
   pragma Export (C, u00072, "ada__task_identificationB");
   u00073 : constant Version_32 := 16#7b5027ff#;
   pragma Export (C, u00073, "ada__task_identificationS");
   u00074 : constant Version_32 := 16#858ee8bc#;
   pragma Export (C, u00074, "system__tasking__restrictedS");
   u00075 : constant Version_32 := 16#3ef1c8c6#;
   pragma Export (C, u00075, "system__tasking__restricted__stagesB");
   u00076 : constant Version_32 := 16#57e13518#;
   pragma Export (C, u00076, "system__tasking__restricted__stagesS");
   u00077 : constant Version_32 := 16#0a6637d7#;
   pragma Export (C, u00077, "system__interruptsB");
   u00078 : constant Version_32 := 16#38e9971b#;
   pragma Export (C, u00078, "system__interruptsS");
   u00079 : constant Version_32 := 16#86882935#;
   pragma Export (C, u00079, "system__tasking__protected_objectsB");
   u00080 : constant Version_32 := 16#7670502d#;
   pragma Export (C, u00080, "system__tasking__protected_objectsS");
   u00081 : constant Version_32 := 16#1ab029f2#;
   pragma Export (C, u00081, "system__tasking__protected_objects__single_entryB");
   u00082 : constant Version_32 := 16#c7328e25#;
   pragma Export (C, u00082, "system__tasking__protected_objects__single_entryS");
   u00083 : constant Version_32 := 16#1ff5c9d4#;
   pragma Export (C, u00083, "system__tasking__protected_objects__multiprocessorsB");
   u00084 : constant Version_32 := 16#01c3fc38#;
   pragma Export (C, u00084, "system__tasking__protected_objects__multiprocessorsS");
   u00085 : constant Version_32 := 16#da287206#;
   pragma Export (C, u00085, "ada__interrupts__namesS");
   u00086 : constant Version_32 := 16#fb1abea1#;
   pragma Export (C, u00086, "registersS");
   u00087 : constant Version_32 := 16#40ae2c51#;
   pragma Export (C, u00087, "stm32f4S");
   u00088 : constant Version_32 := 16#1acdc035#;
   pragma Export (C, u00088, "stm32f4__gpioS");
   u00089 : constant Version_32 := 16#29bef750#;
   pragma Export (C, u00089, "stm32f4__reset_clock_controlS");
   u00090 : constant Version_32 := 16#8977ddd8#;
   pragma Export (C, u00090, "stm32f4__sysconfig_controlS");
   u00091 : constant Version_32 := 16#9670ce10#;
   pragma Export (C, u00091, "ledsB");
   u00092 : constant Version_32 := 16#48dcf74c#;
   pragma Export (C, u00092, "ledsS");
   u00093 : constant Version_32 := 16#be933b26#;
   pragma Export (C, u00093, "last_chance_handlerB");
   u00094 : constant Version_32 := 16#d1bc38d5#;
   pragma Export (C, u00094, "last_chance_handlerS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  interfaces.bit_types%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  interfaces.stm32%s
   --  interfaces.stm32.pwr%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.bb.protection%s
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  ada.tags%s
   --  system.task_info%s
   --  system.task_info%b
   --  system.unsigned_types%s
   --  interfaces.stm32.rcc%s
   --  system.stm32%s
   --  system.bb.parameters%s
   --  system.stm32%b
   --  system.bb.cpu_primitives%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.bb.cpu_primitives.multiprocessors%s
   --  system.bb.cpu_primitives.multiprocessors%b
   --  system.bb.interrupts%s
   --  system.bb.board_support%s
   --  system.bb.board_support%b
   --  system.bb.time%s
   --  system.bb.threads%s
   --  system.bb.threads.queues%s
   --  system.bb.threads.queues%b
   --  system.bb.threads%b
   --  system.bb.interrupts%b
   --  system.bb.cpu_primitives%b
   --  system.bb.protection%b
   --  system.bb.timing_events%s
   --  system.bb.timing_events%b
   --  system.multiprocessors.spin_locks%s
   --  system.multiprocessors.spin_locks%b
   --  system.multiprocessors.fair_locks%s
   --  system.bb.time%b
   --  system.os_interface%s
   --  system.multiprocessors.fair_locks%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  ada.task_identification%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.secondary_stack%s
   --  system.tasking%b
   --  ada.tags%b
   --  system.secondary_stack%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.multiprocessors%s
   --  system.tasking.protected_objects.multiprocessors%b
   --  system.tasking.protected_objects.single_entry%s
   --  system.tasking.protected_objects.single_entry%b
   --  system.tasking.restricted%s
   --  system.tasking.restricted.stages%s
   --  system.tasking.restricted.stages%b
   --  ada.task_identification%b
   --  system.interrupts%s
   --  system.interrupts%b
   --  ada.interrupts%s
   --  ada.interrupts%b
   --  ada.interrupts.names%s
   --  driver%s
   --  last_chance_handler%s
   --  stm32f4%s
   --  stm32f4.gpio%s
   --  stm32f4.reset_clock_control%s
   --  stm32f4.sysconfig_control%s
   --  registers%s
   --  button%s
   --  button%b
   --  leds%s
   --  leds%b
   --  last_chance_handler%b
   --  driver%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
