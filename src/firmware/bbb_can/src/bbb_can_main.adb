

---------------------------------------------------------------------------
-- This code tests the communication between the BeagleBone Black (BBB) and
-- the CAN-link.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-28

-- TODO: hardware testing

---------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Command_line;
with Ada.Text_IO;

with UartWrapper;

--  with AVR.AT90CAN128;
--  with AVR.AT90CAN128.CAN;
with BBB_CAN;
with CAN_Defs;

procedure BBB_CAN_main is
   pragma Suppress (All_Checks);
   msg : CAN_Defs.CAN_Message;
   bMsg : Boolean;
   bOk  : Boolean;

begin
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Hello!");

   if Ada.Command_line.Argument_Count /= 2 then
      Ada.Text_IO.Put_Line("Please provide two arbuments, the name of the serial port (excluding '/dev/') and the baudrate (9600, 38400, 57600 or 115200)");
      return;
   else
      declare
         sPort : String := Ada.Command_line.Argument(1);
         baud : UartWrapper.BaudRates;
      begin
         if Ada.Command_line.Argument(2) = "9600" then
            baud := UartWrapper.B9600;
         elsif Ada.Command_line.Argument(2) = "115200" then
            baud := UartWrapper.B115200;
         else
            Ada.Text_IO.Put_Line("ERROR: Incorrect baudrate!");
            return;
         end if;
         BBB_CAN.Init(sPort, baud);
      end;
   end if;
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Successfully connected to COM port");

   msg.ID := (10, false);
   msg.Len := 8;
   msg.Data := (0, 0, 0, 0, 0, 0, 0, 0);

  -- BBB_CAN.Send(msg);

   loop

      BBB_CAN.Get(msg, bMsg, bOk);
      if bMsg then
         Ada.Text_IO.Put_Line("ID=" & Integer'Image(Integer(msg.ID.Identifier)) & ", length=" & msg.Len'Img & ", data(1)=" & Integer'Image(Integer(msg.Data(1))));
         Ada.Text_IO.New_Line;


         --if Integer(msg.ID.Identifier) = 15 then
         msg.Data(1) := 2;

         -- Ada.Text_IO.Put_Line("Sending CAN message: ID=" & Integer'Image(Integer(msg.ID.Identifier)) & ", length=" & msg.Len'Img & ", data(1)=" & Integer'Image(Integer(msg.Data(1))));
         BBB_CAN.Send(msg);
         --  end if;

      else
         delay(0.001);
         --           Ada.Text_IO.Put_Line("No message read");
      end if;

   end loop;
end BBB_CAN_main;
