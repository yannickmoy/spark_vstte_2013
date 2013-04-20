with Types; use Types;

private package DNS.Zone_Files is

   --  Each record stores a Domain_Name together with some data. The Use_Until
   --  field gives the time at which this data becomes obsolete.

   type NS_Record is record
      Domain_Name : Domain_Name_T;
      Name_Server : Domain_Name_T;
      Use_Until   : Time_T;
   end record;

   type A_Record is record
      Domain_Name : Domain_Name_T;
      IP_Address  : Address_T;
      Use_Until   : Time_T;
   end record;

   type SOA_Record is record
      Domain_Name         : Domain_Name_T;
      Primary_Name_Server : Domain_Name_T;
      Hostmaster          : Host_Name_T;
      Refresh             : Time_T;
      Retry               : Time_T;
      Expire              : Time_T;
      Minimum             : Time_T;
      Use_Until           : Time_T;
   end record;

   type PTR_Record is record
      Domain_Name         : Domain_Name_T;
      Domain_Name_Pointed : Domain_Name_T;
      Use_Until           : Time_T;
   end record;

   type MX_Record is record
      Domain_Name    : Domain_Name_T;
      Mail_Exchanger : Domain_Name_T;
      Distance       : Distance_T;
      Use_Until      : Time_T;
   end record;

   type TXT_Record is record
      Domain_Name : Domain_Name_T;
      Text        : Text_T;
      Use_Until   : Time_T;
   end record;

   type CNAME_Record is record
      Domain_Name    : Domain_Name_T;
      Canonical_Name : Domain_Name_T;
      Use_Until      : Time_T;
   end record;

   type NS_Array    is array (Positive range <>) of NS_Record;
   type A_Array     is array (Positive range <>) of A_Record;
   type SOA_Array   is array (Positive range <>) of SOA_Record;
   type PTR_Array   is array (Positive range <>) of PTR_Record;
   type MX_Array    is array (Positive range <>) of MX_Record;
   type TXT_Array   is array (Positive range <>) of TXT_Record;
   type CNAME_Array is array (Positive range <>) of CNAME_Record;

   type Zone_File (Num_NS_Record    : Natural;
                   Num_A_Record     : Natural;
                   Num_SOA_Record   : Natural;
                   Num_PTR_Record   : Natural;
                   Num_MX_Record    : Natural;
                   Num_TXT_Record   : Natural;
                   Num_CNAME_Record : Natural) is
   record
      NS    : NS_Array (1 .. Num_NS_Record);
      A     : A_Array (1 .. Num_A_Record);
      SOA   : SOA_Array (1 .. Num_SOA_Record);
      PTR   : PTR_Array (1 .. Num_PTR_Record);
      MX    : MX_Array (1 .. Num_MX_Record);
      TXT   : TXT_Array (1 .. Num_TXT_Record);
      CNAME : CNAME_Array (1 .. Num_CNAME_Record);
   end record;

   type Zone_File_Ptr is access Zone_File;

   procedure Parse_Zone_File
     (Zone_File_Name : in String;
      Parsed_File    : out Zone_File);

   procedure Check_Zone_File
     (Parsed_File : in Zone_File;
      Res         : out Boolean) with
     Post =>
       (Res =
           --  A domain name can only have at most one entry in table NS
          ((for all J in Parsed_File.NS'Range =>
              (for all K in Parsed_File.NS'Range =>
                 (if J /= K then
                    Parsed_File.NS (J).Domain_Name
                      /=
                    Parsed_File.NS (K).Domain_Name)))
             and then

           --  A domain name can only have at most one entry in table A
           (for all J in Parsed_File.A'Range =>
              (for all K in Parsed_File.A'Range =>
                 (if J /= K then
                    Parsed_File.A (J).Domain_Name
                      /=
                    Parsed_File.A (K).Domain_Name)))));

end DNS.Zone_Files;
