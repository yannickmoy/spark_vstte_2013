with Clock;
with Time; use type Time.T;

package Stopwatch
  with Abstract_State => State
is

   type State_T is (Stopped, Counting);

   function Get_State return State_T;

   type Action_T is (Tick, Start, Stop, Reset);

   procedure Stopwatch_Logic (Act : Action_T) with
     Global         => (In_Out => (State, Clock.State)),
     Pre            => Clock.Get_Current_Time /= Time.Max,
     Contract_Cases =>

        --  in Counting state, Reset takes priority

       (Get_State = Counting and Act = Reset           =>
          Get_State = Stopped
            and Clock.Get_Current_Time = Time.Zero,

        --  then Stop

        Get_State = Counting and Act = Stop =>
          Get_State = Stopped
            and Clock.Get_Current_Time = Clock.Get_Current_Time'Old,

        --  finally Tick

        Get_State = Counting and Act = Tick =>
          Get_State = Counting
            and Clock.Get_Current_Time =
                  Time.Increment (Clock.Get_Current_Time'Old),

        --  in Stopped state, Start is the only action that has an effect

        Get_State = Stopped and Act = Start =>
          Get_State = Counting,

        --  other cases are no-op

        others =>
           Clock.Get_Current_Time = Clock.Get_Current_Time'Old
             and Get_State = Get_State'Old);

end Stopwatch;
