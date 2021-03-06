--------------------------------------------------------------------------
--  This tests IMU firmware code by communicating with the imu via comport.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-02

--------------------------------------------------------------------------

with Ada.Text_IO;
with Interfaces;		use Interfaces;
with Ins_Controller_Utils;
with Str2Float;


procedure Imu_Testing_Main is

   pragma Suppress (All_Checks);



   --this function assumes the format +1235.156
   function Read_Next_Float return float is
      sTemp : String(1..1);
      iCharsRead : Integer;
      sBuffer : String(1..20);
      i : Integer := 0;
   begin

      Ada.Text_IO.Put_Line("Reading float= ");


      loop
         Ins_Controller_Utils.Read(sTemp, 1, iCharsRead);

         if iCharsRead = 1 then
            exit when sTemp(1) = ',' or sTemp(1) = '*';

            Ada.Text_IO.Put(sTemp(1));

            i := i + 1;
            sBuffer(i) := sTemp(1);
         end if;
      end loop;

      Ada.Text_IO.New_Line;

      declare
         sValue : String(1..i);
      begin
         for j in sValue'Range loop
            sValue(j) := sBuffer(j);
         end loop;

      Ada.Text_IO.Put_Line("Float read= " & sValue);
      Ada.Text_IO.New_Line;

         return Str2Float.fStr2Float(sValue); --this function assumes the format +1235.156
      end;
   end Read_Next_Float;

   fYaw, fPitch, fRoll : float;
   fXAcceleration : float := 0.0;
   fYAcceleration : float := 0.0;
   fZAcceleration : float := 0.0;
begin
   
   Ada.Text_IO.Put_Line("Starting...");
   Ada.Text_IO.New_Line;

  Ins_Controller_Utils.Init;

   Ada.Text_IO.Put_Line("Init complete.");
   Ada.Text_IO.New_Line;
   
   loop
     Ins_Controller_Utils.Start_Message("VNYBA,");

--        Ada.Text_IO.Put_Line("Start_Message complete.");
--        Ada.Text_IO.New_Line;

      fYaw 	:= Read_Next_Float;
      fPitch 	:= Read_Next_Float;
      fRoll 	:= Read_Next_Float;
      fXAcceleration := Read_Next_Float;
      fYAcceleration := Read_Next_Float;
      fZAcceleration := Read_Next_Float;
      
      Ada.Text_IO.Put_Line("fYaw= " & fYaw'Img & "  fPitch= " & fPitch'Img & "  fRoll= " & fRoll'Img);

      Ada.Text_IO.Put_Line("fXAcceleration= " & fXAcceleration'Img & "  fYAcceleration= " & fYAcceleration'Img & "  fZAcceleration= " & fZAcceleration'Img);
      Ada.Text_IO.New_Line;

      delay(0.001);
   end loop;
end Imu_Testing_Main;

