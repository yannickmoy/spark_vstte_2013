with Clock;
with Time; use type Time.T;

package Stopwatch
  with Abstract_State => State
is

   type State_T is (Stopped, Counting);

   function Get_State return State_T;

   procedure Stopwatch_Logic (Tick, Start, Stop, Reset : Boolean) with
     Global         => (In_Out => (State, Clock.State)),
     Contract_Cases =>

        --  in Counting state, Reset takes priority

       (Get_State = Counting and Reset              =>
          Get_State = Stopped
            and Clock.Get_Current_Time = Time.Zero,

        --  then Stop

        Get_State = Counting and Stop and not Reset =>
          Get_State = Stopped
            and Clock.Get_Current_Time = Clock.Get_Current_Time'Old,

        --  finally Tick

        Get_State = Counting and Tick and not (Reset or Stop) =>
          Get_State = Counting
            and Clock.Get_Current_Time =
                  Time.Increment (Clock.Get_Current_Time'Old),

        --  in Stopped state, Start is the only possible action

        Get_State = Stopped and Start =>
          Get_State = Counting,

        --  other cases are no-op

        others =>
           Clock.Get_Current_Time = Clock.Get_Current_Time'Old
             and Get_State = Get_State'Old);

end Stopwatch;
