with GNAT.Sockets;
with Ada.Text_IO;
with Ada.Streams;

package body Sockets is
    CRLF : constant String := ASCII.CR & ASCII.LF;
    PORT : constant GNAT.Sockets.Port_Type := 50000;
    Tmp : Ada.Streams.Stream_Element_Array (1 .. 65535);

    ------------------
    -- Read_Request --
    ------------------

-- function Read_Request originally written by Simon Wright from
    -- https://groups.google.com/forum/#!topic/comp.lang.ada/j23Fv-uvNX8
function Read_Request (From : GNAT.Sockets.Socket_Type) return Natural is
     use Ada.Streams;
     use Standard.ASCII;
      Last : Ada.Streams.Stream_Element_Offset := Tmp'First - 1;
      Next : Ada.Streams.Stream_Element_Offset;
      Termination : constant Ada.Streams.Stream_Element_Array :=
        (Character'Pos (CR),
         Character'Pos (LF),
         Character'Pos (CR),
         Character'Pos (LF));
      Socket_Stream_Access : GNAT.Sockets.Stream_Access := GNAT.Sockets.Stream (From);
   begin
      --  We need to read the whole request from the client. Of course
      --  we don't know how long it is. We can't just issue an
      --  Ada.Streams.Read for a large buffer, because the client may
      --  not have sent that much and if she hasn't we'll block until
      --  she gives up and closes the socket. So we read a character
      --  at a time until we've got the CR/LF/CR/LF which terminates
      --  the line.
      loop
         Ada.Streams.Read (Stream => Socket_Stream_Access.all,
                           Item => Tmp (Last + 1 .. Last + 1),
                           Last => Next);
         exit when Next = Last;

         -- Ada.Text_IO.Put(Tmp(Last));

         Last := Last + 1;
         exit when Last >= Termination'Length
           and then Tmp (Last - 3 .. Last) = Termination;
         exit when Last = Tmp'Last;
      end loop;

        --Free_Stream(S);
        return Natural(Last);
    end Read_Request;

    -----------------
    -- Get_Message --
    -----------------
    function Get_Message (N : Natural) return String is
        Result : String (1 .. N);
        -- pragma Import (Ada, Result);
        for Result'Address use Tmp'Address;

    begin
        return Result;
    end Get_Message;

    ----------------------
    -- Send_UDP_Message --
    ----------------------
    procedure Send_UDP_Message is
        Remote_Address: GNAT.Sockets.Sock_Addr_Type;
        Socket  : GNAT.Sockets.Socket_Type;
        Stream_Access : GNAT.Sockets.Stream_Access;
        Message_Length: Natural;
    begin
        Ada.Text_IO.Put_Line("DEBUG: Send_UDP_Message - Started");

        Remote_Address.Addr :=  GNAT.Sockets.Addresses(
                                    GNAT.Sockets.Get_Host_By_Name(
                                        GNAT.Sockets.Host_Name), 1);
        Remote_Address.Port := PORT;

       GNAT.Sockets.Create_Socket(Socket);
       --                             GNAT.Sockets.Family_Inet,
        --                            GNAT.Sockets.Datagram_Socket);

       -- GNAT.Sockets.Create_Socket(Socket,
       --                             GNAT.Sockets.Family_Inet,
        --                            GNAT.Sockets.Datagram_Socket);

        GNAT.Sockets.Set_Socket_Option(Socket,
                                        GNAT.Sockets.Socket_Level,
                                        (GNAT.Sockets.Reuse_address, True));

        GNAT.Sockets.Connect_Socket(Socket, Remote_Address);
        Stream_Access := GNAT.Sockets.Stream(Socket);

        delay 1.0;

        String'Write (Stream_Access, "Dad" & CRLF & CRLF & "TEST");

        Message_Length := Read_Request(Socket);

        Ada.Text_IO.Put_Line ("DEBUG: Message Length from Read_Request" & Natural'Image(Message_Length));
        declare
            Message : String(1 .. Message_Length) := Get_Message(Message_Length);
            -- Message : String := String'Input(Stream_Access);
        begin
            Ada.Text_IO.Put_Line(Message);
            delay 1.0;
            String'Write(Stream_Access, CRLF & "Datagram Socket: Message from Server back to Client" & CRLF );
            String'Write(Stream_Access, Message);
        end;

        GNAT.Sockets.Close_Socket(Socket);

        Ada.Text_IO.Put_Line("DEBUG: Send_UDP_Message - Finished");
    end Send_UDP_Message;

    ----------------------
    -- Listen_On_Socket --
    ----------------------
    procedure Listen_On_Socket is
        Address : GNAT.Sockets.Sock_Addr_Type;
        Socket  : GNAT.Sockets.Socket_Type;
        Server  : GNAT.Sockets.Socket_Type;
        Stream_Access : GNAT.Sockets.Stream_Access;
        Message_Length: Natural;
    begin
        Ada.Text_IO.Put_Line("DEBUG: Listen_On_Socket - Started");

        Address.Addr := GNAT.Sockets.Addresses(
                            GNAT.Sockets.Get_Host_By_Name(
                                GNAT.Sockets.Host_Name), 1);
        Address.Port := PORT;

        GNAT.Sockets.Create_Socket(Server);
        GNAT.Sockets.Set_Socket_Option(Server,
                                        GNAT.Sockets.Socket_Level,
                                        (GNAT.Sockets.Reuse_address, True));

        GNAT.Sockets.Bind_Socket(Server, Address);
        GNAT.Sockets.Listen_Socket(Server);
        GNAT.Sockets.Accept_Socket(Server, Socket, Address);

        Stream_Access := GNAT.Sockets.Stream(Socket);
        Message_Length := Read_Request(Socket);

        Ada.Text_IO.Put_Line ("DEBUG: Message Length from Read_Request" & Natural'Image(Message_Length));
        declare
            Message : String(1 .. Message_Length) := Get_Message(Message_Length);
            -- Message : String := String'Input(Stream_Access);
        begin
            Ada.Text_IO.Put_Line(Message);
            delay 1.0;
            String'Write(Stream_Access, CRLF & "Datagram Socket: Message from Server back to Client" & CRLF );
            String'Write(Stream_Access, Message);
        end;

        delay 5.0;
        GNAT.Sockets.Close_Socket(Server);
        GNAT.Sockets.Close_Socket(Socket);

        Ada.Text_IO.Put_Line("DEBUG: Listen_On_Socket - Finished");
    end Listen_On_Socket;

end Sockets;
