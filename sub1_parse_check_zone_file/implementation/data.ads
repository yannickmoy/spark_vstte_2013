with Names;

package Data is

   type Entry_Type_T is (NS_A_SOA, SOA, NS_A, A_PTR, A, PTR, MX_A, TXT, CNAME);

   type Time_T is new Natural;
   type Distance_T is new Natural;

   type Address_T is array (1 .. 4) of Natural;

   --  I am not sure at all the following type is the best way to represent
   --  things, pretty much the contrary in fact, but I'll proceed with that
   --  until we have a better idea.

   type Zone_File_T (Entry_Type : Entry_Type_T) is record
      Domain_Name : Names.Domain_Name_T;
      Time_To_Live : Time_T;
      case Entry_Type is
         when NS_A_SOA =>
            NS_A_SOA_Name_Server : Names.Domain_Name_T;
            NS_A_SOA_Address : Names.Address_T;
            NS_A_SOA_Start_Of_Authority : ???
        when MX =>
            MX_Mail_Exchanger : Names.Domain_Name_T;
            MX_Distance : Distance_T;
         when TXT =>
            TXT_Text : Names.Text_T;
         when CNAME =>
            CNAME_Canonical_Name : Names.Domain_Name_T;
      end case;
   end record;

   Zone_File : Zone_File_T;

   procedure Parse_Zone_File (Zone : String) with
     Global => (Output => Zone_File);

   procedure Check_Zone_File (Res : out Boolean) with
     Global => (Input => Zone_File);

end Data;
