with ada.Text_IO;
package body Simulator.Comunication is

   -------------------------
   -- Intialize_And_Reset --
   -------------------------

   procedure Intialize_And_Reset is
      tMotorForce : simulator.submarine.TMotorForce := (others => 0.0);
   begin
      xProtected_Info.Set_Current_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Info.Set_Current_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Info.Set_Wanted_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Info.Set_Wanted_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Info.Set_Motor_Power(tMotorForce);
      xProtected_Info.Set_Gripper_Left(false);
      xProtected_Info.Set_Gripper_Right(false);
      xProtected_Info.Set_Torpedo_Left(false);
      xProtected_Info.Set_Torpedo_Right(false);
      xProtected_Info.Set_Dropper_Left(false);
      xProtected_Info.Set_Dropper_Right(false);
      xProtected_Info.Set_Pressure(0.0);
      xProtected_Info.Set_Temperature(0.0);
   end Intialize_And_Reset;

   --------------------------
   -- Set_Current_Position --
   --------------------------

   procedure Set_Current_Position (xCurrent_Position : math.Vectors.CVector)
   is
   begin
      xProtected_Info.Set_Current_Position(xCurrent_Position);

   end Set_Current_Position;

   -----------------------------
   -- Set_Current_Orientation --
   -----------------------------

   procedure Set_Current_Orientation
     (xCurrent_Orientation : math.Matrices.CMatrix)
   is
   begin
      xProtected_Info.Set_Current_Orientation(xCurrent_Orientation);
   end Set_Current_Orientation;

   -------------------------
   -- Set_Wanted_Position --
   -------------------------

   procedure Set_Wanted_Position (xWanted_Position : math.Vectors.CVector) is
   begin
      xProtected_Info.Set_Wanted_Position(xWanted_Position);
   end Set_Wanted_Position;

   ----------------------------
   -- Set_Wanted_Orientation --
   ----------------------------

   procedure Set_Wanted_Orientation
     (xWanted_Orientation : math.Matrices.CMatrix)
   is
   begin
      xProtected_Info.Set_Wanted_Orientation(xWanted_Orientation);
   end Set_Wanted_Orientation;

   ----------------------
   -- Set_xMotor_Power --
   ----------------------

   procedure Set_Motor_Power
     (xMotor_Power : simulator.submarine.TMotorForce)
   is
   begin
      xProtected_Info.Set_Motor_Power(xMotor_Power);
   end Set_Motor_Power;

   ----------------------
   -- Set_Gripper_Left --
   ----------------------

   procedure Set_Gripper_Left (bGripper_Left : boolean) is
   begin
      xProtected_Info.Set_Gripper_Left(bGripper_Left);
   end Set_Gripper_Left;

   -----------------------
   -- Set_Gripper_Right --
   -----------------------

   procedure Set_Gripper_Right (bGripper_Right : boolean) is
   begin
      xProtected_Info.Set_Gripper_Right(bGripper_Right);
   end Set_Gripper_Right;

   ----------------------
   -- Set_Torpedo_Left --
   ----------------------

   procedure Set_Torpedo_Left (bTorpedo_Left : boolean) is
   begin
      xProtected_Info.Set_Torpedo_Left(bTorpedo_Left);
   end Set_Torpedo_Left;

   -----------------------
   -- Set_Torpedo_Right --
   -----------------------

   procedure Set_Torpedo_Right (bTorpedo_Right : boolean) is
   begin
      xProtected_Info.Set_Torpedo_Right(bTorpedo_Right);
   end Set_Torpedo_Right;

   ----------------------
   -- Set_Dropper_Left --
   ----------------------

   procedure Set_Dropper_Left (bDropper_Left : boolean) is
   begin
      xProtected_Info.Set_Dropper_Left(bDropper_Left);
   end Set_Dropper_Left;

   -----------------------
   -- Set_Dropper_Right --
   -----------------------

   procedure Set_Dropper_Right (bDropper_Right : boolean) is
   begin
      xProtected_Info.Set_Dropper_Right(bDropper_Right);
   end Set_Dropper_Right;

   ------------------
   -- Set_Pressure --
   ------------------

   procedure Set_Pressure (fPressure : float) is
   begin
      xProtected_Info.Set_Pressure(fPressure);
   end Set_Pressure;

   ---------------------
   -- Set_Temperature --
   ---------------------

   procedure Set_Temperature (fTemperature : float) is
   begin
      xProtected_Info.Set_Temperature(fTemperature);
   end Set_Temperature;

   ---------------------
   -- Set_Pid_Scaling --
   ---------------------

   procedure Set_Pid_Scaling(eComponent : EMotionComponent; PidScaling : TPIDComponentScalings) is
   begin
      xProtected_Info.Set_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(eComponent),simulator.Comunication_Prot_Obj.TPIDComponentScalings(PidScaling));
   end Set_Pid_Scaling;

   ------------------------
   -- Set_Operating_Mode --
   ------------------------

   procedure Set_Operating_Mode(eOperationMode : EoperatingMode) is
   begin
      xProtected_Info.Set_OperatingMode(simulator.Comunication_Prot_Obj.EOperatingMode(eOperationMode));
   end Set_Operating_Mode;

   ---------------------------
   -- xGet_Current_Position --
   ---------------------------

   function xGet_Current_Position return math.Vectors.CVector is
   begin
      return xProtected_Info.xGet_Current_Position;

   end xGet_Current_Position;

   ------------------------------
   -- xGet_Current_Orientation --
   ------------------------------

   function xGet_Current_Orientation return math.Matrices.CMatrix is
   begin
      return xProtected_Info.xGet_Current_Orientation;
   end xGet_Current_Orientation;

   --------------------------
   -- xGet_Wanted_Position --
   --------------------------

   function xGet_Wanted_Position return math.Vectors.CVector is
   begin
      return xProtected_Info.xGet_Wanted_Position;
   end xGet_Wanted_Position;

   -----------------------------
   -- xGet_Wanted_Orientation --
   -----------------------------

   function xGet_Wanted_Orientation return math.Matrices.CMatrix is
   begin
      return xProtected_Info.xGet_Wanted_Orientation;
   end xGet_Wanted_Orientation;

   -----------------------
   -- xGet_xMotor_Power --
   -----------------------

   function xGet_Motor_Power return simulator.submarine.TMotorForce is
   begin
      return xProtected_Info.xGet_Motor_Power;
   end xGet_Motor_Power;

   -----------------------
   -- bGet_Gripper_Left --
   -----------------------

   function bGet_Gripper_Left return boolean is
   begin
      return xProtected_Info.bGet_Gripper_Left;
   end bGet_Gripper_Left;

   ------------------------
   -- bGet_Gripper_Right --
   ------------------------

   function bGet_Gripper_Right return boolean is
   begin
      return xProtected_Info.bGet_Gripper_Right;
   end bGet_Gripper_Right;

   -----------------------
   -- bGet_Torpedo_Left --
   -----------------------

   function bGet_Torpedo_Left return boolean is
   begin
      return xProtected_Info.bGet_Torpedo_Left;
   end bGet_Torpedo_Left;

   ------------------------
   -- bGet_Torpedo_Right --
   ------------------------

   function bGet_Torpedo_Right return boolean is
   begin
      return xProtected_Info.bGet_Torpedo_Right;
   end bGet_Torpedo_Right;

   -----------------------
   -- bGet_Dropper_Left --
   -----------------------

   function bGet_Dropper_Left return boolean is
   begin
      return xProtected_Info.bGet_Dropper_Left;
   end bGet_Dropper_Left;

   ------------------------
   -- bGet_Dropper_Right --
   ------------------------

   function bGet_Dropper_Right return boolean is
   begin
      return xProtected_Info.bGet_Dropper_Right;
   end bGet_Dropper_Right;

   -------------------
   -- fGet_Pressure --
   -------------------

   function fGet_Pressure return float is
   begin
      return xProtected_Info.fGet_Pressure;
   end fGet_Pressure;

   ----------------------
   -- fGet_Temperature --
   ----------------------

   function fGet_Temperature return float is
   begin
      return xProtected_Info.fGet_Temperature;
   end fGet_Temperature;

   ----------------------
   -- xGet_Pid_Scaling --
   ----------------------

   function xGet_Pid_Scaling( eComponent : EMotionComponent ) return TPIDComponentScalings is
   begin
      return TPIDComponentScalings(xProtected_Info.xGet_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(eComponent)));
   end xGet_Pid_Scaling;

   function eGet_Operating_Mode return EOperatingMode is
   begin
      return EOperatingMode(xProtected_Info.eGet_OperatingMode);
   end eGet_Operating_Mode;


   ------------------------
   -- TCommunicationTask --
   ------------------------

   task body TCommunicationTask is
      xMessage : CAN_Defs.CAN_Message;
      iMessageLength : integer;
      iStatus : integer;
   begin
      Ethernet_Socket.Establish_Connection(sHost_Name => "196.176.0.2",
                                           Port       => 5555);
      loop
         Ethernet_Socket.Receive_CAN(msg => xMessage,
                                     iStatus => iStatus);
         if iStatus = 0 then
            iMessageLength := integer(xMessage.Len)+CAN_Utils.HEADLEN;
            Get_Data_From_Message(xMessage       => xMessage,
                                  iMessageLength => iMessageLength);
         end if;
         if iStatus = -1 then
            ada.Text_IO.Put_Line("Connection failure");
         end if;
         if iStatus = -2 then
            null;
         end if;
      end loop;
   end TCommunicationTask;

   ---------------------------
   -- Get_Data_From_Message --
   ---------------------------

   procedure Get_Data_From_Message(xMessage : CAN_Defs.CAN_Message; iMessageLength : integer) is
      sBuffer : String (1 .. iMessageLength);

   begin
      --Can_Defs.MSG_KILL_SWITCH_ID.Identifier := 3561;
      case xMessage.ID.Identifier is

         when MSG_Kill_Switch =>
            null;

         when others =>
            null;
      end case;


      CAN_Utils.Message_To_Bytes(sBuffer => sBuffer,
                                      msg     => xMessage);

   end Get_Data_From_Message;




end Simulator.Comunication;
