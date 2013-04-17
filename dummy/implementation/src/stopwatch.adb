package body Stopwatch
--  with Refined_State => (State => Current_State)
is

   Current_State : State_T := Stopped;

   function Get_State return State_T is (Current_State);

   procedure Stopwatch_Logic (Act : Action_T) is
   begin
      case Current_State is
         when Counting =>
            case Act is
               when Reset =>
                  Current_State := Stopped;
                  Clock.Initialise_To_Zero;

               when Stop =>
                  Current_State := Stopped;

               when Tick =>
                  Clock.Increment;

               when Start =>
                  null;
            end case;

         when Stopped =>
            if Act = Start then
               Current_State := Counting;
            end if;
      end case;
   end Stopwatch_Logic;

end Stopwatch;
