--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Clock.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Clock.Test_Data.Tests is


--  begin read only
   procedure Test_Get_Current_Time (Gnattest_T : in out Test);
   procedure Test_Get_Current_Time_fad5fe (Gnattest_T : in out Test) renames Test_Get_Current_Time;
--  id:2.1/fad5fe2e2488e551/Get_Current_Time/1/0/
   procedure Test_Get_Current_Time (Gnattest_T : in out Test) is
   --  clock.ads:7:4:Get_Current_Time
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Current_Time;
--  end read only


--  begin read only
   procedure Test_Initialise_To_Zero (Gnattest_T : in out Test);
   procedure Test_Initialise_To_Zero_e979d2 (Gnattest_T : in out Test) renames Test_Initialise_To_Zero;
--  id:2.1/e979d2b31e422426/Initialise_To_Zero/1/0/
   procedure Test_Initialise_To_Zero (Gnattest_T : in out Test) is
   --  clock.ads:11:4:Initialise_To_Zero
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Initialise_To_Zero;
--  end read only


--  begin read only
   procedure Test_Increment (Gnattest_T : in out Test);
   procedure Test_Increment_00f5d9 (Gnattest_T : in out Test) renames Test_Increment;
--  id:2.1/00f5d913b3f15858/Increment/1/0/
   procedure Test_Increment (Gnattest_T : in out Test) is
   --  clock.ads:16:4:Increment
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      Clock.Initialise_To_Zero;
      Clock.Increment;

--  begin read only
   end Test_Increment;
--  end read only

end Clock.Test_Data.Tests;
