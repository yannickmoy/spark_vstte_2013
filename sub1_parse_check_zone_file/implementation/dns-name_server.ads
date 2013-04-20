--  Name Server
private package DNS.Name_Server is

   procedure Zone_File_Name (Data : String);

private

   The_Zone_File : DNS.Zone_Files.Zone_File_Ptr;

end DNS.Resolver;
