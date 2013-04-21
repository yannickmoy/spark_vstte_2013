with Types; use Types;
with Interfaces; use Interfaces;

package Util is
   function Extract_Unsigned_16(Query : Network_DNS_Query;
                                Offset : Network_DNS_Query_Range)
                                return Unsigned_16
   with
     Pre => Offset <= Network_DNS_Query_Range'Last - 1; -- at least two octets
end;
