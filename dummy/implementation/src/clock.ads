with Time; use type Time.T;

package Clock
  with Abstract_State => State
is

   procedure Initialise_To_Zero with
     Global => (Output => State),
     Post   => Get_Current_Time = Time.Zero;
  --  S.reset

   procedure Increment with
     Global => (In_Out => State),
     Post   => Get_Current_Time = Time.Increment (Get_Current_Time'Old);
  --  S.count

   function Get_Current_Time return Time.T with
     Global => (Input => State);
  --  S.display

end Clock;
