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
   procedure Test_Parse_Header_3eba72 (Gnattest_T : in out Test) renames Test_Parse_Header;
--  id:2.1/3eba72f35e165b51/Parse_Header/1/0/
   procedure Test_Parse_Header (Gnattest_T : in out Test) is
   --  parse.ads:5:4:Parse_Header
--  end read only

      pragma Unreferenced (Gnattest_T);
      Query : Network_DNS_Query;
      Header : Query_Header;
      Return_Code : Return_Code_T;
   begin
      -- use http://vscomp.org/example-data/ (0>) as data source
      Query := (16#ED#, 16#A0#, 16#01#, 16#00#, 16#00#, 16#01#, 16#00#, 16#00#,
                16#00#, 16#00#, 16#00#, 16#00#, others => 0);
      Parse_Header(Query       => Query,
                   Header      => Header,
                   Return_Code => Return_Code);
      AUnit.Assertions.Assert
        (Return_Code = OK,
         "Header parsing OK");

      AUnit.Assertions.Assert
        (Header = (ID => 16#ED#*256 + 16#A0#,
                   OPCODE => Standard_Query,
                   QDCOUNT => 1),
         "Header content OK");

--  begin read only
   end Test_Parse_Header;
--  end read only

end Parse.Test_Data.Tests;
