Requirements for DNS query reception
==========

# Packet network encoding #

> Note. reference: https://tools.ietf.org/html/rfc1035#section-2.3.2

REQ-1: Received DNS query is a sequence of octets.

REQ-1.1: Maximum size of a DNS query is 512 octets.

REQ-2: Octets are transmitted on wire in the same order as shown in RFC
1035 diagrams.

> Note. Example, sequence of bytes is 1, 2, 3, 4, 5 and 6.
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

> Note. For example, the following
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

