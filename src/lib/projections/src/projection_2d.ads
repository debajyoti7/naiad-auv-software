with Math.Matrices;
with Math.Vectors;
with Math.Planes;

-- Projects 3D stuff in 2D, looking from above things.

--  	Transformation matrix:
--  	1	0	0	2
--  	0	1	0	0
--  	0	0	1	0
--  	0	0	0	1

--  	Projection matrix:
--  	0	-1	0	0
--  	0	0	-1	0
--  	0	0	1	0
--  	1	0	0	0

--  	Final matrix:
--  	0	-1	0	0
--  	0	0	-1	0
--  	0	0	1	0
--  	1	0	0	2

--  	Vector	X	=>	X'	=	-Y/W'
--  		Y	=>	Y'	=	-Z/W'
--  		Z	=>	Z'	=	Z
--  		W	=>	W'	=	X + 2W

package Projection_2D is

   type TPoint is
      record
         X : float;
         Y : float;
      end record;

   type EPlaneProjectionPointIndices is (UpperLeft, UpperRight, LowerLeft, LowerRight);
   type TPlaneProjectionPoints is array (UpperLeft .. LowerRight) of TPoint;

   type EOrientationProjectionPointIndices is (XVector, YVector, ZVector, XArrowLeftTail, XArrowRightTail, YArrowLeftTail, YArrowRightTail, ZArrowLeftTail, ZArrowRightTail);

   type EAxisArrow is (Head , LeftTail, RightTail);

   type TAxisArrow is array(Head .. RightTail) of TPoint;

   type TOrientationProjectionPoints is array (XVector .. ZVector) of TAxisArrow;


   function txGet_Plane_2D_Projection (iCenterX : in integer;
                                       iCenterY : in integer;
                                       iWidth : in integer;
                                       iHeight : in integer;
                                       xOrientation : in Math.Matrices.CMatrix) return TPlaneProjectionPoints;

   function txGet_Orientation_2D_Projection (iCenterX : in integer;
                                             iCenterY : in integer;
                                             iWidth : in integer;
                                             iHeight : in integer;
                                             xOrientation : in Math.Matrices.CMatrix) return TOrientationProjectionPoints;

   function xGet_Vector_2D_Projection ( iCenterX : in integer;
                                             iCenterY : in integer;
                                             iWidth : in integer;
                                             iHeight : in integer;
                                             xVector : in Math.Vectors.CVector) return TPoint;

end Projection_2D;
