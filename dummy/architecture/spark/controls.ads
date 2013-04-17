--  Workaround, because we don't have volatile ins yet...

package Controls
  with Abstract_State => (Start, Stop, Reset)
is

  procedure Read_Start_State (Is_Pressed : out Boolean)
    with Global => (Input => Start);
  --  S.start, S.count

  procedure Read_Stop_State (Is_Pressed : out Boolean)
    with Global => (Input => Stop);
  --  S.stop, S.count

  procedure Read_Reset_State (Is_Pressed : out Boolean)
    with Global => (Input => Reset);
  --  S.reset

end Controls;
