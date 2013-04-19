--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Stopwatch.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Stopwatch.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Get_State_e0120c : aliased Runner_1.Test_Case;
   Case_2_1_Test_Stopwatch_Logic_76af90 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Get_State_e0120c,
         "stopwatch.ads:10:4:",
         Test_Get_State_e0120c'Access);
      Runner_1.Create
        (Case_2_1_Test_Stopwatch_Logic_76af90,
         "stopwatch.ads:14:4:",
         Test_Stopwatch_Logic_76af90'Access);

      Result.Add_Test (Case_1_1_Test_Get_State_e0120c'Access);
      Result.Add_Test (Case_2_1_Test_Stopwatch_Logic_76af90'Access);

      return Result'Access;

   end Suite;

end Stopwatch.Test_Data.Tests.Suite;
--  end read only
