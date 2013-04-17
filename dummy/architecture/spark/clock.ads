with Time;

package Clock
  with Abstract_State => State
is

  procedure Initialise_To_Zero
    with Global => (Output => State);
  --  S.reset

  procedure Increment
    with Global => (In_Out => State);
  --  S.count

  function Get_Current_Time return Time.T
    with Global => (Input => State);
  --  S.display

end Clock;
