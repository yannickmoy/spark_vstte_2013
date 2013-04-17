with Time;

with Clock;
with Display;
with Controls;
with Stopwatch;

procedure Main
  with Global => (Input => (Controls.Start,
                            Controls.Stop,
                            Controls.Reset),
                  Output => Display.State,
                  In_Out => (Clock.State,
                             Stopwatch.State))
is
begin
   null;
end Main;
