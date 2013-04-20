package Types is

   type Query is new Integer;

   type UDP_Packet is new Integer;

   type Domain_Name_T is private;

   type Host_Name_T is private;

   type Text_T is private;

   type Time_T is new Natural;

   type Distance_T is new Natural;

   type Address_T is array (1 .. 4) of Natural;

private

   type Domain_Name_T is access String;

   type Host_Name_T is access String;

   type Text_T is access String;

end Types;
