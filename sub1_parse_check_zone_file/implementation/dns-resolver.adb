with Parse_Query;
with Look_Up;
with Open_Socket;

--  Zone_File: requires data access Zone_File.Impl;
--  with DNS.Zone_File;

package body DNS.Resolver is

   --  In_Packet: in event data port UDP_Packet.Impl;
   protected In_Packet_Port is
      procedure Write (Event_Data : UDP_Packet);
      function Read return UDP_Packet;
   private
      Data : UDP_Packet;
   end In_Packet_Port;

   protected body In_Packet_Port is
      procedure Write (Event_Data : UDP_Packet) is
      begin
         Data := Event_Data;
      end Write;

      function Read return UDP_Packet is
      begin
         return Data;
      end Read;
   end In_Packet_Port;

   --  Out_Packet: out data port UDP_Packet.Impl;
   protected Out_Packet_Port is
      procedure Write (Event_Data : UDP_Packet);
      function Read return UDP_Packet;
   private
      Data : UDP_Packet;
   end Out_Packet_Port;

   protected body Out_Packet_Port is
      procedure Write (Event_Data : UDP_Packet) is
      begin
         Data := Event_Data;
      end Write;

      function Read return UDP_Packet is
      begin
         return Data;
      end Read;
   end Out_Packet_Port;

   --     modes
   --       Not_Running : initial mode;
   --       Waiting : mode;
   --       Processing : mode;
   type Mode is (Not_Running, Waiting, Processing);

   task Thread is
      entry Start;
      entry Stop;
      entry In_Packet;
   end Thread;

   task body Thread is
      --  Not_Running : initial mode;
      Current_Mode : Mode := Not_Running;
   begin
      loop
         select

            --  Not_Running -[ Start ]-> Waiting;
            accept Start do

               if Current_Mode = Not_Running then
                  Current_Mode := Waiting;
               end if;

            end Start;

         or
            --  Waiting -[ Stop ]-> Not_Running;
            accept Stop do

               if Current_Mode = Waiting then
                  Current_Mode := Not_Running;
               end if;

            end Stop;

         or
            --  Waiting -[ In_Packet ]-> Processing;
            accept In_Packet do

               if Current_Mode = Waiting then
                  Current_Mode := Processing;
               end if;

            end In_Packet;

         end select;

         case Current_Mode is

            --  Init: {
            --    Open_Socket : subprogram Open_Socket.Impl;
            --  } in modes (Not_Running);
            when Not_Running =>
               Open_Socket;

            --  Process_Request:  {
            --    Parse: subprogram Parse_Query;
            --    Look_Up: subprogram Look_Up;
            --  } in modes (Processing);
            when Processing =>
               declare
                  Parse_Packet : constant UDP_Packet := In_Packet_port.Read;
                  Parse_Query : Query;
                  Look_Up_Res : UDP_Packet;
               begin
                  null;
                  --  parameter In_Packet -> Parse.Packet;
                  --  Parse_Query (Parse_Packet, Parse_Query);
                  --  parameter Parse.Query -> Look_Up.Query;
                  --  Look_Up (Parse_Query, Look_Up_Res);
                  --  parameter Look_Up.Res -> Out_Packet;
                  --  Out_Packet_Port.Write (Look_Up_Res);
               end;
            when others => null;

         end case;

      end loop;
   end Thread;

   procedure In_Packet (Event_Data : UDP_Packet) is
   begin
      In_Packet_Port.Write (Event_Data);
      Thread.In_Packet;
   end In_Packet;

   procedure Out_Packet (Data : out UDP_Packet) is
      Value : constant UDP_Packet := Out_Packet_Port.Read;
   begin
      Data := Value;
   end Out_Packet;

   procedure Start is
   begin
      Thread.Start;
   end Start;

   procedure Stop is
   begin
      Thread.Stop;
   end Stop;

end DNS.Resolver;
