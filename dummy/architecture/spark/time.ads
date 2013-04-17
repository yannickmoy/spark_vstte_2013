package Time is

  type Minutes_T is range 0 .. 59;
  type Seconds_T is range 0 .. 59;

  type T is record
     Hours   : Natural;
     Minutes : Minutes_T;
     Seconds : Seconds_T;
  end record;

  procedure Increment (X : in out T);
  --  Provides part of S.count

end Time;
