--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Clock.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Clock.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Get_Current_Time_fad5fe : aliased Runner_1.Test_Case;
   Case_2_1_Test_Initialise_To_Zero_e979d2 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Increment_00f5d9 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Get_Current_Time_fad5fe,
         "clock.ads:7:4:",
         Test_Get_Current_Time_fad5fe'Access);
      Runner_1.Create
        (Case_2_1_Test_Initialise_To_Zero_e979d2,
         "clock.ads:11:4:",
         Test_Initialise_To_Zero_e979d2'Access);
      Runner_1.Create
        (Case_3_1_Test_Increment_00f5d9,
         "clock.ads:16:4:",
         Test_Increment_00f5d9'Access);

      Result.Add_Test (Case_1_1_Test_Get_Current_Time_fad5fe'Access);
      Result.Add_Test (Case_2_1_Test_Initialise_To_Zero_e979d2'Access);
      Result.Add_Test (Case_3_1_Test_Increment_00f5d9'Access);

      return Result'Access;

   end Suite;

end Clock.Test_Data.Tests.Suite;
--  end read only
