--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Time.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Time.Test_Data.Tests is


--  begin read only
   procedure Test_Increment (Gnattest_T : in out Test);
   procedure Test_Increment_59ec94 (Gnattest_T : in out Test) renames Test_Increment;
--  id:2.1/59ec9418e41c11e0/Increment/1/0/
   procedure Test_Increment (Gnattest_T : in out Test) is
   --  time.ads:22:3:Increment
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Increment;
--  end read only

end Time.Test_Data.Tests;
