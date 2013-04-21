Requirements for DNS query reception
==========

# Packet network encoding #

> Reference: https://tools.ietf.org/html/rfc1035#section-2.3.2

REQ-1: Received DNS query is a sequence of octets.

REQ-1.1: Maximum size of a DNS query is 512 octets.

REQ-2: Octets are transmitted on wire in the same order as shown in RFC
1035 diagrams.

> Example. Received sequence of bytes is 1, 2, 3, 4, 5 and 6.
>
>      0                   1
>      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
>     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
>     |       1       |       2       |
>     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
>     |       3       |       4       |
>     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
>     |       5       |       6       |
>     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

REQ-3: Whenever an octet represents a numeric quantity, the left most bit in
the diagram is the high order or most significant bit.  That is, the bit
labeled 0 is the most significant bit.

> Example. the following
> diagram represents the value 170 (decimal).
>
>      0 1 2 3 4 5 6 7
>     +-+-+-+-+-+-+-+-+
>     |1 0 1 0 1 0 1 0|
>     +-+-+-+-+-+-+-+-+

REQ-4: whenever a multi-octet field represents a numeric quantity
the left most bit of the whole field is the most significant bit.  When
a multi-octet quantity is transmitted the most significant octet is
transmitted first.

# Query header #

> Reference: https://tools.ietf.org/html/rfc1035#section-4.1

REQ-5: A DNS message contains a header, a question and an answer.

> Reference: https://tools.ietf.org/html/rfc1035#section-4.1.1

REQ-6: The header contains the following fields:

                                    1  1  1  1  1  1
      0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |                      ID                       |
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |QR|   Opcode  |AA|TC|RD|RA|   Z    |   RCODE   |
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |                    QDCOUNT                    |
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |                    ANCOUNT                    |
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |                    NSCOUNT                    |
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |                    ARCOUNT                    |
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

REQ-6.1: The ID field is a 16 bits identifier.

REQ-6.2: The QR field should be 1 (Query). Process as invalid query
otherwise.

REQ-6.3: The OPCODE field should be 0 (standard query (QUERY)) or 1
(inverse query (IQUERY)). Process as invalid query otherwise.

REQ-6.4: AA, TC, RD, RA, Z and RCDOE fields should be zero. Process as
invalid query otherwise.

REQ-6.5: The QDCOUNT field is an unsigned 16 bit integer specifying the
number of entries in the question section. Its valid range is 1 to
16. Process as invalid query otherwise.

REQ-6.6: The ANCOUNT, NSCOUNT and ARCOUNT fields are unsigned 16 bit
integer. They value should be zero. Process as invalid query otherwise.
