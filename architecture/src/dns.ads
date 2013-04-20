with Types; use Types;

-- process DNS
package DNS is

   --  features
   --  In_Packet: in event data port UDP_Packet.Impl;
   procedure In_Packet (Event_Data : UDP_Packet);

   --  Out_Packet: out data port UDP_Packet.Impl;
   procedure Out_Packet (Data : out UDP_Packet);

   --  Zone_File_Name: in data port String;
   procedure Zone_File_Name (Data : String);

end DNS;
