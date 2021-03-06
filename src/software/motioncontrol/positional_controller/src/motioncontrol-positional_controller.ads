with MotionControl;
with MotionControl.Motion_Component;
with MotionControl.PID_Controller;
with Math.Vectors;
with Math.Matrices;
with MotionControl.Thrusters;
with System;
with Ada.Text_IO;
with System.Address_Image;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Exception_Handling;

package MotionControl.Positional_Controller is

   type CPositionalController is new Ada.Finalization.Controlled with private;
   type pCPositionalController is access CPositionalController;

   type TPositionalErrors is array (MotionControl.Motion_Component.PositionX .. MotionControl.Motion_Component.PositionZ) of float;

   procedure Free(pxPositionalControllerToDeallocate : in out pCPositionalController);

   function pxCreate (pxCurrentAbsolutePosition : in Math.Vectors.pCVector; pxWantedAbsolutePosition : in Math.Vectors.pCVector; pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCPositionalController;
   --  <summary>Creates an object of type CPositionalController and sets references to the current and wanted position</summary>
   --  <parameter name="pxCurrentAbsoluteOrientation">A reference to the current absolute position</parameter>
   --  <parameter name="pxWantedAbsoluteOrientation">A reference to the wanted absolute position</parameter>

   procedure Get_Positional_Thruster_Control_Values(this : in CPositionalController; fDeltaTime : float; tfValues : out MotionControl.Thrusters.TThrusterEffects);
   --  <summary>Calculates thruster control values for all thrusters and scales them accordingly</summary>
   --  <parameter name="this">The CPositionalController to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>

   procedure Update_Current_Errors (this : in CPositionalController);
   --  <summary>Cascades the difference between the current orientation and the wanted orientation to all motion components</summary>
   --  <parameter name="this">The CPositionalController object that holds the objects that needs to be updated</parameter>

   procedure Set_New_PID_Component_Scalings(this : in CPositionalController; eComponentToUpdate : MotionControl.Motion_Component.EMotionComponent; xNewPIDScaling : MotionControl.PID_Controller.TPIDComponentScalings);
   --  <summary>Sets new component scalings on a PID controller held by the CPositionalController in question</summary>
   --  <parameter name="this">The CPositionalController object that holds the PID controller to update.</parameter>
   --  <parameter name="xNewPIDSCalings">The TPIDComponetScalings object to set for the object.</parameter>
   --  <parameter name="eComponentToChange">The index of the component to change.</parameter>

   function fGetCurrentErrors(this : in CPositionalController) return TPositionalErrors;

private
   type CPositionalController is new Ada.Finalization.Controlled with
      record

         pxWantedAbsolutePosition : Math.Vectors.pCVector;
         pxCurrentAbsolutePosition : Math.Vectors.pCVector;

         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxCurrentAbsoluteOrientationInverse : Math.Matrices.pCMatrix;

         pxXMotionComponent : MotionControl.Motion_Component.pCMotionComponent;
         pxYMotionComponent : MotionControl.Motion_Component.pCMotionComponent;
         pxZMotionComponent : MotionControl.Motion_Component.pCMotionComponent;
      end record;

   procedure Finalize(this : in out CPositionalController);

end MotionControl.Positional_Controller;
