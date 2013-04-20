--  subcomponents
--  Resolver: thread Resolver.Impl;
with DNS.Resover;
--  Name_Server: thread Name_Server.Impl;
with DNS.Name_Server;
--  Zone_File: data Zone_File.Impl;
with DNS.Zone_File;

package body DNS is

   --   event data port In_Packet -> Resolver.In_Packet;
   procedure In_Packet (Event_Data : UDP_Packet) is
   begin
      Resover.In_Packet (Event_Data);
   end In_Packet;

   --  data port Resolver.Out_Packet -> Out_Packet;
   procedure Out_Packet (Data : out UDP_Packet) is
   begin
      Resolver.Out_Packet (Data);
   end Out_Packet;

   --  data port Zone_File_Name -> Name_Server.Zone_File_Name;
   procedure Zone_File_Name (Data : String) is
   begin
      Name_Server.Zone_File_Name (Data);
   end Zone_File_Name;

end DNS;
