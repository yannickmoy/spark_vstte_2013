--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Stopwatch.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Stopwatch.Test_Data.Tests is


--  begin read only
   procedure Test_Get_State (Gnattest_T : in out Test);
   procedure Test_Get_State_e0120c (Gnattest_T : in out Test) renames Test_Get_State;
--  id:2.1/e0120cc1a8ef4313/Get_State/1/0/
   procedure Test_Get_State (Gnattest_T : in out Test) is
   --  stopwatch.ads:10:4:Get_State
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_State;
--  end read only


--  begin read only
   procedure Test_Stopwatch_Logic (Gnattest_T : in out Test);
   procedure Test_Stopwatch_Logic_76af90 (Gnattest_T : in out Test) renames Test_Stopwatch_Logic;
--  id:2.1/76af90182cb084e3/Stopwatch_Logic/1/0/
   procedure Test_Stopwatch_Logic (Gnattest_T : in out Test) is
   --  stopwatch.ads:14:4:Stopwatch_Logic
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Stopwatch_Logic;
--  end read only

end Stopwatch.Test_Data.Tests;
