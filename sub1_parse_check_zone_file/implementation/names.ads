package Names is
   type Domain_Name_T is private;
   type Text_T is private;
private
   type Domain_Name_T is access String;
   type Text_T is access String;
end Names;
