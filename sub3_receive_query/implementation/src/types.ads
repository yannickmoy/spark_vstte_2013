with Interfaces; use Interfaces;

package Types is
   subtype Octet is Unsigned_8; -- FIXME: how to ensure REQ-3?

   type Network_DNS_Query_Range is range 0..512; -- REQ-1.1
   type Network_DNS_Query is array (Network_DNS_Query_Range) of Octet; -- REQ-1
end;
