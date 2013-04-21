package body Util is
   function Extract_Unsigned_16(Query : Network_DNS_Query;
                                Offset : Network_DNS_Query_Range)
                                return Unsigned_16 is
   begin
      return Shift_Left(Unsigned_16(Query(Offset)), 8)
        + Unsigned_16(Query(Offset + 1)); -- REQ-4
   end Extract_Unsigned_16;
end;
