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

with LEDs;          use LEDs;
with Button;        use Button;
with Ada.Real_Time; use Ada.Real_Time;

package body Driver is

   function Delay_Period(Period : in Blink_Period) return Time_Span is
      New_Period : Time_Span := Milliseconds (100);
   begin

      if Period = Short then
         New_Period := Milliseconds (200);
      else
         New_Period := Milliseconds (1000);
      end if;

      return New_Period;

   end Delay_Period;

   task body Controller is
      Next_Start : Time    := Clock;
      Light_On   : Boolean := False;
   begin
      Off_LED;
      loop
         if not Light_On then
            On_LED;
            Light_On := True;
         else
            Off_LED;
            Light_On := False;
         end if;

         -- Note: Tasks having the same priority need yield control to each other or risk locking
         --  each other out of the processor. Using a delay accomplishes this.
         Next_Start := Next_Start + Delay_Period(Button.Blink_Speed);
         delay until Next_Start;
      end loop;
   end Controller;

end Driver;
