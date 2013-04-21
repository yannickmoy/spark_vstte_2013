with Interfaces; use Interfaces;

package Types is
   type Return_Code_T is (OK, Invalid_Query);

   subtype Octet is Unsigned_8; -- FIXME: how to ensure REQ-3?
   subtype Bit_Range is Natural range 0..7;

   type Network_DNS_Query_Range is range 0..512; -- REQ-1.1
   type Network_DNS_Query is array (Network_DNS_Query_Range) of Octet; -- REQ-1

   type Query_Opcode is (Standard_Query, Inverse_Query);
   type Qdcount_Range is range 1..16;

   type Query_Header is record
      ID : Unsigned_16;
      OPCODE : Query_Opcode;
      QDCOUNT : Qdcount_Range;
   end record;

end;
