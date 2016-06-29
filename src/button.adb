------------------------------------------------------------------------------
--                                                                          --
--                             GNAT EXAMPLE                                 --
--                                                                          --
--             Copyright (C) 2014, Free Software Foundation, Inc.           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Interrupts.Names;
with Ada.Real_Time; use Ada.Real_Time;
with Registers;     use Registers;
with STM32F4;       use STM32F4;
with STM32F4.GPIO;  use STM32F4.GPIO;

package body Button is

   protected Button is
      pragma Interrupt_Priority;

      function Blink_Speed return Blink_Period;

   private
      procedure Interrupt_Handler;
      pragma Attach_Handler
         (Interrupt_Handler,
          Ada.Interrupts.Names.EXTI15_10_Interrupt);

      Current_Speed : Blink_Period := Short;
      Last_Time     : Time         := Clock;
   end Button;

   Debounce_Time : constant Time_Span := Milliseconds (500);

   protected body Button is

      function Blink_Speed return Blink_Period is
      begin
         return Current_Speed;
      end Blink_Speed;

      procedure Interrupt_Handler is
         Now : constant Time := Clock;
      begin
         --  Clear interrupt
         EXTI.PR (13) := 1;

         --  Debouncing
         if Now - Last_Time >= Debounce_Time then

            if Current_Speed = Short then
               Current_Speed := Long;
            else
               Current_Speed := Short;
            end if;

            Last_Time := Now;
         end if;
      end Interrupt_Handler;

   end Button;

   function Blink_Speed return Blink_Period is
   begin
      return Button.Blink_Speed;
   end Blink_Speed;

   procedure Initialize is
      RCC_AHB1ENR_GPIOC  : constant Word := 16#0004#; --  0000_0000_0000_0100
      RCC_APB2ENR_SYSCFG : constant Word := 16#4000#; --  0100_0000_0000_0000
   begin
      --  Enable clock for GPIO-C
      RCC.AHB1ENR := RCC.AHB1ENR or RCC_AHB1ENR_GPIOC;
      RCC.APB2ENR := RCC.APB2ENR or RCC_APB2ENR_SYSCFG;

      --  Configure PA13
      GPIOC.MODER (13) := Mode_IN;
      GPIOC.PUPDR (13) := No_Pull;

      --  Select C13 for EXTI13
      SYSCFG.EXTICR4 (1) := 16#2#;  -- 0010

      --  Interrupt on rising edge
      EXTI.FTSR (13) := 0;
      EXTI.RTSR (13) := 1;

      --  Disable other interrupts
      EXTI.IMR := (13 => 1, others => 0);
   end Initialize;

begin
   Initialize;
end Button;
