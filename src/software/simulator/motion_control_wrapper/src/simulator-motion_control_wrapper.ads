with Navigation.Dispatcher;
with math.Vectors;
with Math.Matrices;
with Simulator.submarine;
with Navigation.Motion_Component;
with Navigation.Thrusters;
with Math.Angles;
with math.Vectors;
with Navigation.PID_Controller;

package simulator.Motion_Control_Wrapper is

   type TPIDComponentScalings is new navigation.PID_Controller.TPIDComponentScalings;
   type CWrapDispatcher is tagged private;
   type pCWrapDispatcher is access CWrapDispatcher;
   subtype EMotionComponent is navigation.Motion_Component.EMotionComponent range navigation.Motion_Component.PositionX .. navigation.Motion_Component.RotationZ;

   function pxCreate_Wrap_Dispatcher return pCWrapDispatcher;



   procedure Update_Pid_Scaling(this : in CWrapDispatcher ; xComponentScaling : TPIDComponentScalings; eComponentToScale : EMotionComponent);

   procedure Update_Values(this : in out CWrapDispatcher;
                           xNewCurrentAbsolutePosition : in math.Vectors.CVector;
                           xNewCurrentOrientation : in math.Matrices.CMatrix ;
                           tfMotorValuesSubmarine : out simulator.submarine.TMotorForce ;
                           fDeltaTime : in float);


   procedure Restart(this : in out CWrapDispatcher);
   procedure Update_Wanted_Position(this : in out CWrapDispatcher;
                                    xWantedPosition : in math.Vectors.CVector ;
                                    xWantedOrientation : in math.Matrices.CMatrix );
   function xGet_Wanted_Position(this : in CWrapDispatcher) return math.Vectors.CVector;
   function xGet_Wanted_Orientation(this : in CWrapDispatcher) return math.Matrices.CMatrix;

   function xGet_Motional_Errors(this : in CWrapDispatcher) return Navigation.Dispatcher.TMotionalErrors;


private

   type CWrapDispatcher is tagged
      record
         pxDispatcher : navigation.Dispatcher.pCDispatcher;
         pxWantedPositionVector : math.Vectors.pCVector;
         pxWantedOrientationMatrix : math.Matrices.pCMatrix;
      end record;


end simulator.Motion_Control_Wrapper;
