package Time is

  type Minutes_T is range 0 .. 59;
  type Seconds_T is range 0 .. 59;

  type T is record
     Hours   : Natural;
     Minutes : Minutes_T;
     Seconds : Seconds_T;
  end record;

  Zero : constant T :=
    (Hours   => 0,
     Minutes => 0,
     Seconds => 0);

  Max : constant T :=
    (Hours   => Natural'Last,
     Minutes => Minutes_T'Last,
     Seconds => Seconds_T'Last);

  function Increment (X : T) return T with
    Pre            => X /= Max,
    Contract_Cases =>
      (X.Seconds < Seconds_T'Last
       =>
        Increment'Result.Seconds = X.Seconds + 1
         and then Increment'Result.Minutes = X.Minutes
         and then Increment'Result.Hours = X.Hours,

       X.Seconds = Seconds_T'Last
        and then X.Minutes < Minutes_T'Last
       =>
        Increment'Result.Seconds = 0
         and then Increment'Result.Minutes = X.Minutes + 1
         and then Increment'Result.Hours = X.Hours,

       X.Seconds = Seconds_T'Last
        and then X.Minutes = Minutes_T'Last
       =>
        Increment'Result.Seconds = 0
         and then Increment'Result.Minutes = 0
         and then Increment'Result.Hours = X.Hours + 1);
   --  Provides part of S.count

end Time;
