--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Util.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Util.Test_Data.Tests is


--  begin read only
   procedure Test_Extract_Unsigned_16 (Gnattest_T : in out Test);
   procedure Test_Extract_Unsigned_16_342c77 (Gnattest_T : in out Test) renames Test_Extract_Unsigned_16;
--  id:2.1/342c77e88391dcbe/Extract_Unsigned_16/1/0/
   procedure Test_Extract_Unsigned_16 (Gnattest_T : in out Test) is
   --  util.ads:5:4:Extract_Unsigned_16
--  end read only

      pragma Unreferenced (Gnattest_T);
      Query : Network_DNS_Query;

   begin
      Query(0).Data := 8;
      Query(1).Data := 5;

      AUnit.Assertions.Assert(Extract_Unsigned_16(Query, 0) = 8*256+5,
                              "Check of extracting 2 bytes");

--  begin read only
   end Test_Extract_Unsigned_16;
--  end read only


--  begin read only
   procedure Test_Extract_Bits_Of_Octet (Gnattest_T : in out Test);
   procedure Test_Extract_Bits_Of_Octet_314193 (Gnattest_T : in out Test) renames Test_Extract_Bits_Of_Octet;
--  id:2.1/3141934e6013e7c8/Extract_Bits_Of_Octet/1/0/
   procedure Test_Extract_Bits_Of_Octet (Gnattest_T : in out Test) is
   --  util.ads:11:4:Extract_Bits_Of_Octet
--  end read only

      pragma Unreferenced (Gnattest_T);
      Query : Network_DNS_Query;
   begin
      Query(0).Data := 2#00101000#;

      AUnit.Assertions.Assert
        (Extract_Bits_Of_Octet(Query           => Query,
                               Offset          => 0,
                               Bit_Shift_Right => 3,
                               Bit_Mask        => 2#111#) = 2#101#,
         "Check bit mask");

--  begin read only
   end Test_Extract_Bits_Of_Octet;
--  end read only

end Util.Test_Data.Tests;
