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

with Registers;     use Registers;
with STM32F4;       use STM32F4;
with STM32F4.GPIO;  use STM32F4.GPIO;

package body LEDs is

   LED_ON  : constant Word := 16#20#; --  PA5 => 0010_0000

   LED_OFF : constant Word := Shift_Left (LED_ON, 16);

   procedure Off_LED is
   begin
      GPIOA.BSRR := LED_OFF;
   end Off_LED;

   procedure On_LED is
   begin
      GPIOA.BSRR := LED_ON;
   end On_LED;

   procedure Initialize is
      RCC_AHB1ENR_GPIOA : constant Word := 16#01#;
   begin
      --  Enable clock for GPIO-A
      RCC.AHB1ENR := RCC.AHB1ENR or RCC_AHB1ENR_GPIOA;

     --  Configure PA5
      GPIOA.MODER   (5) := GPIO.Mode_OUT;
      GPIOA.OTYPER  (5) := GPIO.Type_PP;
      GPIOA.OSPEEDR (5) := GPIO.Speed_100MHz;
      GPIOA.PUPDR   (5) := GPIO.No_Pull;
   end Initialize;

begin
   Initialize;
end LEDs;
