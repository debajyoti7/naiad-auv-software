with Gdk.GC;
with Gdk.Window;
with Gtk;
with Gtk.Drawing_Area;
with Gdk.Color;
with Math;
with Math.Matrices;
with Projection_2D;
with Simulator.ViewModel_Representation;
with Simulator.ViewModel_Pid_Errors;
with Glib.Main;

package Simulator.Drawing is

   type EView is (Side, Top, Back, Full, FullWanted);

   type TView is record
      xCanvas : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : EView;
      xMainWindowViewModel : Simulator.ViewModel_Representation.pCViewModel_Representation;
   end record;

   type TPidGraph is record
      xGraph : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : Simulator.ViewModel_Pid_Errors.EMotionComponent;
      xPIDErrorsWindowViewModel : Simulator.ViewModel_Pid_Errors.pCViewModel_Pid_Errors;
   end record;

   function bDraw_3DView (xView : TView) return Boolean;
   function bDraw_View (xView : in TView) return Boolean;
   function bDraw_Pid (xPid : in TPidGraph) return Boolean;

   package Drawing_Timeout_Pid is new Glib.Main.Generic_Sources (TPidGraph);
   package Drawing_Timeout_Drawing_View is new Glib.Main.Generic_Sources (TView);

private

   type TPoint is new Projection_2D.TPoint;

   type TViewPositions is record
      xCurrentPosition : TPoint;
      xWantedPosition : TPoint;
   end record;

   type ViewColors is record
      xGreenColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xRedColor : Gdk.GC.Gdk_GC;
      xBlackColor : Gdk.GC.Gdk_GC;

      xCustomColor : Gdk.Color.Gdk_Color;
   end record;

   type TPid_Scaling_In_Y is array (Simulator.ViewModel_Pid_Errors.EMotionComponent'Range) of float;

   procedure Draw_Plane (xWindowForView : Gdk.Window.Gdk_Window; xOrientationToDraw : Math.Matrices.CMatrix; xView : TView);
   procedure Draw_Axis_Arrow (xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xView : TView; xAxisArrowPoints : Projection_2D.TAxisArrow);
   procedure Draw_Arrow_Head (xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xAxisArrowPoints : Projection_2D.TAxisArrow);
   procedure Draw_Cross(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xCenterPoint : TPoint; iHorizontalLength : Integer; iVerticalLength : Integer);
   procedure Draw_Target_Point(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xCenterPoint : TPoint);
   procedure Draw_Point_Relative_To_Center_Of_View(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xCurrentPosition : TPoint);
   procedure Double_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent);
   procedure Preform_PID_Drawing_Step (xCanvas : in out Gdk.Window.Gdk_Window);

   function fGet_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) return float ;
   function fGet_Positions_For_View (eID : Simulator.Drawing.EView; xViewModel : Simulator.ViewModel_Representation.pCViewModel_Representation; iWindowHeight : integer; iWindowWidth : integer) return TViewPositions;
   function xMove_Into_View(xViewPositions : TViewPositions; iWindowHeight : Integer; iWindowWidth : integer) return TViewPositions;
   function xMove_Point_Into_View(xPoint : TPoint; iWindowHeight : Integer; iWindowWidth : integer) return TPoint ;

   iPidCounter : float := 0.0;
   xPid_Scaling : TPid_Scaling_In_Y := (others => 1.0);

end  Simulator.Drawing;
