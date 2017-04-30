#include <stdio.h>
#include "opencv/cv.h"
#include "opencv/highgui.h"
#include <time.h>



void invert_img(IplImage *src, IplImage *dst){

  CvScalar sp, dp;
  int height, width;
  int i, j, k, tid;

  height = src->height;
  width = src->width;

  for (i = 0; i < height; i++)
    {
      for (j = 0; j < width; j++)
	{
	  sp = cvGet2D (src, i, j);
	  dp.val[0] = 255 - sp.val[0];
	  dp.val[1] = 255 - sp.val[1];
	  dp.val[2] = 255 - sp.val[2];
	  cvSet2D (dst, i, j, dp);
	}
    }
 

}

/* main code */
int
main (int argc, char **argv)
{
  IplImage *src, *dst;
  uchar *data;

  if (argc != 2)
    {
      fprintf (stderr, "Usage: %s file\n", argv[0]);
      exit (1);
    }
  src = cvLoadImage (argv[1], -1);
  cvNamedWindow ("img", 1);
  cvShowImage ("img", src);
  dst = cvCreateImage (cvSize (src->width, src->height ), IPL_DEPTH_8U, 3);



  cvWaitKey (0);

  invert_img(src,dst);

  cvShowImage ("img", dst);
  cvWaitKey (0);
  cvDestroyWindow ("img");
  cvReleaseImage (&src);
  cvReleaseImage (&dst);
  return 0;
}
