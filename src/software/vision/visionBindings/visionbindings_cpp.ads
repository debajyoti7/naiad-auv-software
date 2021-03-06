pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stl_vector_h;
with opencv2_highgui_highgui_hpp;
with cpp_4_7_4_bits_stl_queue_h;
with opencv2_core_core_hpp;

package visionBindings_cpp is

   img : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:11
   pragma Import (C, img, "img");

   circles : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:12
   pragma Import (C, circles, "circles");

   lines : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:13
   pragma Import (C, lines, "lines");

   contours : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:15
   pragma Import (C, contours, "contours");

   templeteContours : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:16
   pragma Import (C, templeteContours, "templeteContours");

   particleContours : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:18
   pragma Import (C, particleContours, "particleContours");

   cap : aliased opencv2_highgui_highgui_hpp.Class_VideoCapture.VideoCapture;  -- visionBindings.cpp:19
   pragma Import (C, cap, "cap");

   channels : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:20
   pragma Import (C, channels, "channels");

   imageBuf : aliased cpp_4_7_4_bits_stl_queue_h.Class_queue.queue;  -- visionBindings.cpp:22
   pragma Import (C, imageBuf, "imageBuf");

   imageName : aliased int;  -- visionBindings.cpp:23
   pragma Import (C, imageName, "imageName");

   BGR : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:26
   pragma Import (C, BGR, "BGR");

   blueHistVals : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- visionBindings.cpp:27
   pragma Import (C, blueHistVals, "blueHistVals");

   greenHistVals : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- visionBindings.cpp:28
   pragma Import (C, greenHistVals, "greenHistVals");

   redHistVals : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- visionBindings.cpp:29
   pragma Import (C, redHistVals, "redHistVals");

   hist : aliased opencv2_core_core_hpp.Class_MatND.MatND;  -- visionBindings.cpp:30
   pragma Import (C, hist, "hist");

   prevHist : aliased opencv2_core_core_hpp.Class_MatND.MatND;  -- visionBindings.cpp:30
   pragma Import (C, prevHist, "prevHist");

   currentHist : aliased opencv2_core_core_hpp.Class_MatND.MatND;  -- visionBindings.cpp:30
   pragma Import (C, currentHist, "currentHist");

   circleCenters : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:32
   pragma Import (C, circleCenters, "circleCenters");

   rectangleCenters : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:33
   pragma Import (C, rectangleCenters, "rectangleCenters");

   triangleCenters : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:34
   pragma Import (C, triangleCenters, "triangleCenters");

   features_prev : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:36
   pragma Import (C, features_prev, "features_prev");

   features_next : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:36
   pragma Import (C, features_next, "features_next");

   particle_features_prev : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:37
   pragma Import (C, particle_features_prev, "particle_features_prev");

   particle_features_nxt : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:37
   pragma Import (C, particle_features_nxt, "particle_features_nxt");

   templateStore : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:39
   pragma Import (C, templateStore, "templateStore");

end visionBindings_cpp;
