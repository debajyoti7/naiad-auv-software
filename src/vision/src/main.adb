with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
--with Vision.Image; use Vision.Image;
with Vision.Image_Preprocessing; use Vision.Image_Preprocessing;
with Vision.Image_Processing;

procedure main is
   iImageSource : integer;
   iImageDestination : integer;
   iGreyFilter : integer;
   iCannyKernelSize :integer;
   iCannyLowThres : integer;
   iCannyHighThres : integer;

   --hough cirlces variables
   --src use destination of canny as source for hough circles
   inverseRatioOfResolution : integer;
   minDistBetweenCenters : integer;
   --cannyUpThres : integer; use canny high thres declared above
   centerDetectionThreshold : integer;
   minRadius : integer;
   maxRadius : integer;

   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;
begin
   --canny declarations
   iImageSource := 1;
   iImageDestination := 1;
   iGreyFilter := 6;
   iCannyLowThres := 10;
   iCannyHighThres := 460;
   iCannyKernelSize := 3;

   --hough circle declarations
   --src use destination of canny as source for hough circles
   inverseRatioOfResolution := 1;
   minDistBetweenCenters := 10;
   --cannyUpThres : integer; use canny high thres declared above
   centerDetectionThreshold := 100;
   minRadius := 0;--zero used if unknown
   maxRadius :=	 0;--zero used if unknown
   --CHECK FOR INSTRUCTION--to be implemented, for now just working on default mode

   --GET IMAGE-- read from buffer, but for now just read in png
   CoreWrap.push_back(New_String("lena.png"));
   CoreWrap.push_back(New_String("circle.jpg"));
   CoreWrap.waitKey(0);
   CoreWrap.imshow(New_String("Sir star fish the third"), 1);--show image for debug purposes
   CoreWrap.waitKey(0);



   --CLEAN IMAGE--to be implemented
   --CONVERT IMAGE TO GREYSCALE FOR CANNY
   --image_processing.convertToGreyscale(image)
   --call convertToGreyscale procedure
   Vision.Image_Processing.Convert_To_Greyscale(iImageSource,iImageDestination, iGreyFilter);

   --USE CANNY ON GREYSCALE IMAGE
   --processing.canny(imageSource,imageDestination)
   --processingWrap.cvtColor(1, 1, 6);
   --Class_Processing_Wrap.cvtColor(imageSource, imageDestination, greyFilter);
   CoreWrap.imshow(New_String("why so canny Sir star fish?"), 1);--show image for debug purposes
   CoreWrap.waitKey(0);
   Vision.Image_Processing.Canny(iImageSource,iImageDestination, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
   --processingWrap.Canny(1,1,50,150,3);
   CoreWrap.imshow(New_String("why so canny Sir star fish?"), 1);--show image for debug purposes
   CoreWrap.waitKey(0);
   --int src,int inverseRatioOfResolution,int minDistBetweenCenters,int cannyUpThres, int centerDetectionThreshold, int minRadius,int maxRadius
   processingWrap.HoughCircles(interfaces.C.int(iImageDestination), interfaces.C.int(inverseRatioOfResolution),interfaces.C.int(minDistBetweenCenters),interfaces.C.int(iCannyHighThres),interfaces.C.int(centerDetectionThreshold),interfaces.C.int(minRadius),interfaces.C.int(maxRadius));
   CoreWrap.waitKey(0);
   processingWrap.DrawHoughCircles(interfaces.C.int(iImageDestination));
   CoreWrap.waitKey(0);
end main;


--LOOP:
--//look for instruction

-- if instruction
--//go to mission wrap

--else
--//dont go to mission wrap!
--	//get image
--	//clean image
--	//find/calculate position/velocity
--	//check for object
--		if ojbect detected
--			//figure out what oject is
--			//figure out where object is
--
--END LOOP
