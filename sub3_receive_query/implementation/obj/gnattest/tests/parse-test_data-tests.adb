--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Parse.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Parse.Test_Data.Tests is


--  begin read only
   procedure Test_Parse_Header (Gnattest_T : in out Test);
   procedure Test_Parse_Header_5b705a (Gnattest_T : in out Test) renames Test_Parse_Header;
--  id:2.1/5b705a7565053ba2/Parse_Header/1/0/
   procedure Test_Parse_Header (Gnattest_T : in out Test) is
   --  parse.ads:15:4:Parse_Header
--  end read only

      pragma Unreferenced (Gnattest_T);
      Query : Network_DNS_Query;
      Result : Parse_Result_T;
   begin
      -- use http://vscomp.org/example-data/ (0>) as data source
      Query := ((Data => 16#ED#), (Data => 16#A0#), (Data => 16#01#),
                (Data => 16#00#), (Data => 16#00#), (Data => 16#01#),
                (Data => 16#00#), (Data => 16#00#), (Data => 16#00#),
                (Data => 16#00#), (Data => 16#00#), (Data => 16#00#),
                others => (Data => 0));
      Parse_Header(Query  => Query,
                   Result => Result);
      AUnit.Assertions.Assert
        (Result.Return_Code = OK,
         "Header parsing OK");

      AUnit.Assertions.Assert
        (Result.Header = (ID => 16#ED#*256 + 16#A0#,
                          OPCODE => Standard_Query,
                          QDCOUNT => 1),
         "Header content OK");

--  begin read only
   end Test_Parse_Header;
--  end read only

end Parse.Test_Data.Tests;
