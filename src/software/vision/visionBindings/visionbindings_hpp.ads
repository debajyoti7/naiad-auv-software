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

      procedure push_back (this : access Core_Wrap; src : Interfaces.C.Strings.chars_ptr);  -- visionBindings.cpp:88
      pragma Import (CPP, push_back, "_ZN9Core_Wrap9push_backEPc");

      procedure imread (this : access Core_Wrap; name : Interfaces.C.Strings.chars_ptr);  -- visionBindings.cpp:96
      pragma Import (CPP, imread, "_ZN9Core_Wrap6imreadEPc");

      function imwrite
        (this : access Core_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         src : int) return int;  -- visionBindings.cpp:112
      pragma Import (CPP, imwrite, "_ZN9Core_Wrap7imwriteEPci");

      procedure imshow
        (this : access Core_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         src : int);  -- visionBindings.cpp:123
      pragma Import (CPP, imshow, "_ZN9Core_Wrap6imshowEPci");

      procedure waitKey (this : access Core_Wrap; time : int);  -- visionBindings.cpp:131
      pragma Import (CPP, waitKey, "_ZN9Core_Wrap7waitKeyEi");

      function size (this : access Core_Wrap) return int;  -- visionBindings.cpp:139
      pragma Import (CPP, size, "_ZN9Core_Wrap4sizeEv");

      procedure img_buffer (this : access Core_Wrap);  -- visionBindings.cpp:42
      pragma Import (CPP, img_buffer, "_ZN9Core_Wrap10img_bufferEv");

      procedure imstore
        (this : access Core_Wrap;
         src : int;
         name : Interfaces.C.Strings.chars_ptr);  -- visionBindings.cpp:104
      pragma Import (CPP, imstore, "_ZN9Core_Wrap7imstoreEiPc");

      procedure printNum (this : access Core_Wrap; num : int);  -- visionBindings.cpp:80
      pragma Import (CPP, printNum, "_ZN9Core_Wrap8printNumEi");

      function New_Core_Wrap return Core_Wrap;  -- visionBindings.cpp:145
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
         filter : int);  -- visionBindings.cpp:157
      pragma Import (CPP, cvtColor, "_ZN15Processing_Wrap8cvtColorEiii");

      procedure Canny
        (this : access Processing_Wrap;
         src : int;
         dst : int;
         lThresh : int;
         hThresh : int;
         kernelSize : int);  -- visionBindings.cpp:166
      pragma Import (CPP, Canny, "_ZN15Processing_Wrap5CannyEiiiii");

      procedure HoughCircles
        (this : access Processing_Wrap;
         src : int;
         inverseRatioOfResolution : int;
         minDistBetweenCenters : int;
         cannyUpThres : int;
         centerDetectionThreshold : int;
         minRadius : int;
         maxRadius : int);  -- visionBindings.cpp:175
      pragma Import (CPP, HoughCircles, "_ZN15Processing_Wrap12HoughCirclesEiiiiiii");

      procedure DrawHoughCircles (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:189
      pragma Import (CPP, DrawHoughCircles, "_ZN15Processing_Wrap16DrawHoughCirclesEi");

      procedure FindCircleCenters (this : access Processing_Wrap);  -- visionBindings.cpp:206
      pragma Import (CPP, FindCircleCenters, "_ZN15Processing_Wrap17FindCircleCentersEv");

      procedure HoughLines
        (this : access Processing_Wrap;
         src : int;
         rho : int;
         theta : float;
         intersectionThreshold : int);  -- visionBindings.cpp:245
      pragma Import (CPP, HoughLines, "_ZN15Processing_Wrap10HoughLinesEiifi");

      procedure DrawHoughLines (this : access Processing_Wrap; cdst : int);  -- visionBindings.cpp:253
      pragma Import (CPP, DrawHoughLines, "_ZN15Processing_Wrap14DrawHoughLinesEi");

      procedure Contours (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:276
      pragma Import (CPP, Contours, "_ZN15Processing_Wrap8ContoursEi");

      procedure showContours
        (this : access Processing_Wrap;
         contourOut : int;
         contourId : int;
         thickness : int);  -- visionBindings.cpp:307
      pragma Import (CPP, showContours, "_ZN15Processing_Wrap12showContoursEiii");

      procedure BGRHistogram
        (this : access Processing_Wrap;
         numSourceArray : int;
         histDimensionality : int;
         histSize : int;
         c_range : access float;
         uniform : Extensions.bool;
         accumulate : Extensions.bool);  -- visionBindings.cpp:361
      pragma Import (CPP, BGRHistogram, "_ZN15Processing_Wrap12BGRHistogramEiiiPfbb");

      procedure HSIHistogram
        (this : access Processing_Wrap;
         src : int;
         numSourceArray : int;
         channels : access int;
         histSize : access int;
         hrange : access float;
         srange : access float;
         histDimensionality : int;
         uniform : Extensions.bool;
         accumulate : Extensions.bool);  -- visionBindings.cpp:407
      pragma Import (CPP, HSIHistogram, "_ZN15Processing_Wrap12HSIHistogramEiiPiS0_PfS1_ibb");

      procedure showBGRHistogram (this : access Processing_Wrap; histSize : int);  -- visionBindings.cpp:375
      pragma Import (CPP, showBGRHistogram, "_ZN15Processing_Wrap16showBGRHistogramEi");

      procedure showHSIHistogram (this : access Processing_Wrap; histSize : access int);  -- visionBindings.cpp:418
      pragma Import (CPP, showHSIHistogram, "_ZN15Processing_Wrap16showHSIHistogramEPi");

      procedure approxPolyDP
        (this : access Processing_Wrap;
         epsilon : double;
         closed : Extensions.bool);  -- visionBindings.cpp:318
      pragma Import (CPP, approxPolyDP, "_ZN15Processing_Wrap12approxPolyDPEdb");

      procedure splitChannels (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:352
      pragma Import (CPP, splitChannels, "_ZN15Processing_Wrap13splitChannelsEi");

      procedure showBlueChannel (this : access Processing_Wrap);  -- visionBindings.cpp:446
      pragma Import (CPP, showBlueChannel, "_ZN15Processing_Wrap15showBlueChannelEv");

      procedure showGreenChannel (this : access Processing_Wrap);  -- visionBindings.cpp:454
      pragma Import (CPP, showGreenChannel, "_ZN15Processing_Wrap16showGreenChannelEv");

      function thresh
        (this : access Processing_Wrap;
         src : int;
         lowLimit : int;
         upLimit : int;
         ch : int) return int;  -- visionBindings.cpp:470
      pragma Import (CPP, thresh, "_ZN15Processing_Wrap6threshEiiii");

      procedure showRedChannel (this : access Processing_Wrap);  -- visionBindings.cpp:462
      pragma Import (CPP, showRedChannel, "_ZN15Processing_Wrap14showRedChannelEv");

      procedure LabelPoints (this : access Processing_Wrap; src : int);  -- visionBindings.cpp:221
      pragma Import (CPP, LabelPoints, "_ZN15Processing_Wrap11LabelPointsEi");

      procedure gaussianBlur
        (this : access Processing_Wrap;
         src : int;
         dest : int;
         kersize : int;
         sigmaX : double;
         sigmaY : double);  -- visionBindings.cpp:502
      pragma Import (CPP, gaussianBlur, "_ZN15Processing_Wrap12gaussianBlurEiiidd");

      function New_Processing_Wrap return Processing_Wrap;  -- visionBindings.cpp:514
      pragma CPP_Constructor (New_Processing_Wrap, "_ZN15Processing_WrapC1Ev");


   end;
   use Class_Processing_Wrap;
   package Class_Preprocessing_Wrap is
      type Preprocessing_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Preprocessing_Wrap);

      procedure VideoCaptureOpen (this : access Preprocessing_Wrap);  -- visionBindings.cpp:526
      pragma Import (CPP, VideoCaptureOpen, "_ZN18Preprocessing_Wrap16VideoCaptureOpenEv");

      procedure namedWindow
        (this : access Preprocessing_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         num : int);  -- visionBindings.cpp:531
      pragma Import (CPP, namedWindow, "_ZN18Preprocessing_Wrap11namedWindowEPci");

      procedure nextFrame (this : access Preprocessing_Wrap; dst : int);  -- visionBindings.cpp:536
      pragma Import (CPP, nextFrame, "_ZN18Preprocessing_Wrap9nextFrameEi");

      function New_Preprocessing_Wrap return Preprocessing_Wrap;  -- visionBindings.cpp:541
      pragma CPP_Constructor (New_Preprocessing_Wrap, "_ZN18Preprocessing_WrapC1Ev");


   end;
   use Class_Preprocessing_Wrap;
end visionBindings_hpp;
