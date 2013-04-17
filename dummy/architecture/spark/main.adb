with Time;

with Clock;
with Display;
with Controls;

procedure Main
  with Global => (Input => (Controls.Start,
                            Controls.Stop,
                            Controls.Reset),
                  Output => (Display.State,
                             Clock.State))
is
begin
   null;
end Main;
