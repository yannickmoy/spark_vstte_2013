package body Clock
--  with Refined_State => (State => Current_Time)
is

   Current_Time : Time.T;

   procedure Initialise_To_Zero is
   begin
      Current_Time := Time.Zero;
   end Initialise_To_Zero;

   procedure Increment is
   begin
      Current_Time := Time.Increment (Current_Time);
   end Increment;

   function Get_Current_Time return Time.T is (Current_Time);

end Clock;
