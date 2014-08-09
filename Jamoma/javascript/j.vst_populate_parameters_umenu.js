/*
Used in default view for vst~.model

Input:

  int_ Number of parameters for the hosted plugin

Output:

  Messages for umenu

@authors Trond Lossius

@copyright © 2014 by Trond Lossius @n
This code is licensed under the terms of the "New BSD License" @n
http://creativecommons.org/licenses/BSD/
*/


outlets = 1;
setinletassist(0,"number of parameters");
setoutletassist(0,"connect to umenu");

function msg_int(n)
{
  outlet(0, "clear");
  
  var myNum = n;
  var myLow = 0;
  var myHigh = 0;
  
  if (myNum == 0)
    outlet(0, "append", "None");
  else {
    while (myNum>0) {
      if (myNum > 10)
        myHigh = 10;
      else
        myHigh = myNum;
      
      myHigh += myLow;
      
      outlet(0, "append", myLow+1, "-", myHigh);
      
      myNum -= 10;
      myLow += 10;
    }
    
    if (n <= 10) {
      outlet(0, "hidden", 1);
      outlet(0, 0);
    }
    else {
      outlet(0, "hidden", 0);
      outlet(0, 0);
    }
  }
}