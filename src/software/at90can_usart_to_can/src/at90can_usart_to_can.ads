
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project.
-- As of now it is not using any handshake at all.
--

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-28

---------------------------------------------------------------------------

with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;
with CAN_Defs;

package AT90CAN_Usart_To_Can is

   procedure Main_Loop;

   procedure Hardware_Init;

private

   -- USART1 is used for the communication between the CAN Router and BBB
   USART_PORT       : constant AVR.AT90CAN128.USART.USARTID    := AVR.AT90CAN128.USART.USART1;

   procedure Usart_Write(sBuffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                         iSize   : Positive);

   procedure Usart_Read(sBuffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        iSize   : Positive; iNumber : out integer);

   procedure Send_CanData_To_BBB(Msg : Can_Defs.CAN_Message);

   procedure CANBUS_Monitoring;

   procedure Cmd_Handler;

end AT90CAN_Usart_To_Can;
