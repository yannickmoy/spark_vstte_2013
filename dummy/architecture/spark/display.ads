with Time;

package Display
  with Abstract_State => State
is

  procedure Set_Display (X : Time.T)
  with Global => (Output => State);
  --  S.display

end Display;
