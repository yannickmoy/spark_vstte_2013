--  Resolver
private package DNS.Resolver is

   --  features
   --  In_Packet: in event data port UDP_Packet.Impl;
   procedure In_Packet (Event_Data : UDP_Packet);

   --  Out_Packet: out data port UDP_Packet.Impl;
   procedure Out_Packet (Data : out UDP_Packet);

   --  Start: in event port;
   procedure Start;

   --  Stop : in event port;
   procedure Stop;

private

end DNS.Resolver;
