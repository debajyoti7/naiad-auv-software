pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package visionBindings_hpp is


   IMAGE_BUFFER_SIZE : constant := 10;  --  visionBindings.hpp:7
   IMAGE_STORE_SIZE : constant := 30;  --  visionBindings.hpp:8

   package Class_Core_Wrap is
      type Core_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Core_Wrap);

      procedure push_back (this : access Core_Wrap; src : Interfaces.C.Strings.chars_ptr);  -- visionBindings.cpp:70
      pragma Import (CPP, push_back, "_ZN9Core_Wrap9push_backEPc");

      procedure imread (this : access Core_Wrap; name : Interfaces.C.Strings.chars_ptr);  -- visionBindings.cpp:75
      pragma Import (CPP, imread, "_ZN9Core_Wrap6imreadEPc");

      function imwrite
        (this : access Core_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         src : int) return int;  -- visionBindings.cpp:85
      pragma Import (CPP, imwrite, "_ZN9Core_Wrap7imwriteEPci");

      procedure imshow
        (this : access Core_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         src : int);  -- visionBindings.cpp:93
      pragma Import (CPP, imshow, "_ZN9Core_Wrap6imshowEPci");

      procedure waitKey (this : access Core_Wrap; time : int);  -- visionBindings.cpp:98
      pragma Import (CPP, waitKey, "_ZN9Core_Wrap7waitKeyEi");

      function size (this : access Core_Wrap) return int;  -- visionBindings.cpp:103
      pragma Import (CPP, size, "_ZN9Core_Wrap4sizeEv");

      procedure img_buffer (this : access Core_Wrap);  -- visionBindings.cpp:35
      pragma Import (CPP, img_buffer, "_ZN9Core_Wrap10img_bufferEv");

      procedure imstore
        (this : access Core_Wrap;
         src : int;
         name : Interfaces.C.Strings.chars_ptr);  -- visionBindings.cpp:80
      pragma Import (CPP, imstore, "_ZN9Core_Wrap7imstoreEiPc");

      function New_Core_Wrap return Core_Wrap;  -- visionBindings.cpp:108
      pragma CPP_Constructor (New_Core_Wrap, "_ZN9Core_WrapC1Ev");


   end;
   use Class_Core_Wrap;
   package Class_Processing_Wrap is
      type Processing_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Processing_Wrap);

      procedure cvtColor
        (this : access Processing_Wrap;
         src : int;
         dst : int;
         filter : int);  -- visionBindings.cpp:112
      pragma Import (CPP, cvtColor, "_ZN15Processing_Wrap8cvtColorEiii");

      procedure Canny
        (this : access Processing_Wrap;
         src : int;
         dst : int;
         lThresh : int;
         hThresh : int;
         kernelSize : int);  -- visionBindings.cpp:118
      pragma Import (CPP, Canny, "_ZN15Processing_Wrap5CannyEiiiii");

      procedure HoughCircles
        (this : access Processing_Wrap;
         src : int;
         inverseRatioOfResolution : int;
         minDistBetweenCenters : int;
         cannyUpThres : int;
         centerDetectionThreshold : int;
         minRadius : int;
         maxRadius : int);  -- visionBindings.cpp:125
      pragma Import (CPP, HoughCircles, "_ZN15Processing_Wrap12HoughCirclesEiiiiiii");

      procedure DrawHoughCircles (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:139
      pragma Import (CPP, DrawHoughCircles, "_ZN15Processing_Wrap16DrawHoughCirclesEi");

      procedure HoughLines
        (this : access Processing_Wrap;
         src : int;
         rho : int;
         theta : float;
         intersectionThreshold : int);  -- visionBindings.cpp:184
      pragma Import (CPP, HoughLines, "_ZN15Processing_Wrap10HoughLinesEiifi");

      procedure DrawHoughLines (this : access Processing_Wrap; cdst : int);  -- visionBindings.cpp:195
      pragma Import (CPP, DrawHoughLines, "_ZN15Processing_Wrap14DrawHoughLinesEi");

      procedure Contours (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:220
      pragma Import (CPP, Contours, "_ZN15Processing_Wrap8ContoursEi");

      procedure showContours
        (this : access Processing_Wrap;
         contourOut : int;
         contourId : int;
         thickness : int);  -- visionBindings.cpp:250
      pragma Import (CPP, showContours, "_ZN15Processing_Wrap12showContoursEiii");

      procedure BGRHistogram
        (this : access Processing_Wrap;
         histSize : int;
         rangeLower : float;
         rangeHigher : float);  -- visionBindings.cpp:303
      pragma Import (CPP, BGRHistogram, "_ZN15Processing_Wrap12BGRHistogramEiff");

      procedure HSIHistogram
        (this : access Processing_Wrap;
         src : int;
         testArray : access int);  -- visionBindings.cpp:319
      pragma Import (CPP, HSIHistogram, "_ZN15Processing_Wrap12HSIHistogramEiPi");

      procedure showBGRHistogram (this : access Processing_Wrap; histSize : int);  -- visionBindings.cpp:364
      pragma Import (CPP, showBGRHistogram, "_ZN15Processing_Wrap16showBGRHistogramEi");

      procedure approxPolyDP
        (this : access Processing_Wrap;
         epsilon : double;
         closed : Extensions.bool);  -- visionBindings.cpp:259
      pragma Import (CPP, approxPolyDP, "_ZN15Processing_Wrap12approxPolyDPEdb");

      procedure splitChannels (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:295
      pragma Import (CPP, splitChannels, "_ZN15Processing_Wrap13splitChannelsEi");

      procedure showBlueChannel (this : access Processing_Wrap);  -- visionBindings.cpp:399
      pragma Import (CPP, showBlueChannel, "_ZN15Processing_Wrap15showBlueChannelEv");

      procedure showGreenChannel (this : access Processing_Wrap);  -- visionBindings.cpp:403
      pragma Import (CPP, showGreenChannel, "_ZN15Processing_Wrap16showGreenChannelEv");

      procedure showRedChannel (this : access Processing_Wrap);  -- visionBindings.cpp:407
      pragma Import (CPP, showRedChannel, "_ZN15Processing_Wrap14showRedChannelEv");

      procedure LabelPoints (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:159
      pragma Import (CPP, LabelPoints, "_ZN15Processing_Wrap11LabelPointsEi");

      function New_Processing_Wrap return Processing_Wrap;  -- visionBindings.cpp:414
      pragma CPP_Constructor (New_Processing_Wrap, "_ZN15Processing_WrapC1Ev");


   end;
   use Class_Processing_Wrap;
   package Class_Preprocessing_Wrap is
      type Preprocessing_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Preprocessing_Wrap);

      procedure VideoCaptureOpen (this : access Preprocessing_Wrap);  -- visionBindings.cpp:417
      pragma Import (CPP, VideoCaptureOpen, "_ZN18Preprocessing_Wrap16VideoCaptureOpenEv");

      procedure namedWindow
        (this : access Preprocessing_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         num : int);  -- visionBindings.cpp:422
      pragma Import (CPP, namedWindow, "_ZN18Preprocessing_Wrap11namedWindowEPci");

      procedure nextFrame (this : access Preprocessing_Wrap; dst : int);  -- visionBindings.cpp:427
      pragma Import (CPP, nextFrame, "_ZN18Preprocessing_Wrap9nextFrameEi");

      function New_Preprocessing_Wrap return Preprocessing_Wrap;  -- visionBindings.cpp:432
      pragma CPP_Constructor (New_Preprocessing_Wrap, "_ZN18Preprocessing_WrapC1Ev");


   end;
   use Class_Preprocessing_Wrap;
end visionBindings_hpp;
