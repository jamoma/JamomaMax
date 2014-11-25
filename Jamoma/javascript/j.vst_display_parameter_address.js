/*
Used in default view for vst~.model

Input:

  OSC address to subscribe to from coll

Output:

  Left: Sets address of j.remote
  Right: Displays name of parameter in j.textslider

@authors Trond Lossius

@copyright © 2014 by Trond Lossius @n
This code is licensed under the terms of the "New BSD License" @n
http://creativecommons.org/licenses/BSD/
*/

outlets = 2;
setinletassist(0,"Node address");
setoutletassist(1,"is a match (int)");




function symbol(aNodeAddress)
{
  var sliderText = aNodeAddress.toString();
  
  sliderText = sliderText.replace("parameter/", "");
  sliderText = sliderText.replace(/\d+/,"");
  
  // underscore => space
  sliderText = sliderText.replace(/_/g, ' ');

  // Title Case, courtesy of http://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript 
  sliderText = sliderText.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    
  outlet(1, "text", sliderText);
  outlet(0, "address", aNodeAddress);
  outlet(0, "bang");
}