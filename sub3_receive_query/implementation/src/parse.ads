with Types; use Types;
with Interfaces; use Interfaces;

package Parse is
   procedure Parse_Header(Query : Network_DNS_Query;
                          Header : out Query_Header;
                          Return_Code : out Return_Code_T);
   -- FIXME: How to specify as Post that we have Header data structure if
   -- returned code is OK?

   -- The functional behaviour is not specified in the Post. Would be cumbersome
   -- to do. Would it bring additional assurance?
end;
