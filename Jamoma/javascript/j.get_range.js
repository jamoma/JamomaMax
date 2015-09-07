var myString = "empty";

function getRanges(array) {
  var ranges = [], rstart, rend;
  for (var i = 0; i < array.length; i++) {
    rstart = array[i];
    rend = rstart;
    while (array[i + 1] - array[i] == 1) {
      rend = array[i + 1]; // increment the index if the numbers sequential
      i++;
    }
    ranges.push(rstart == rend ? rstart+'' : rstart + '-' + rend);
  }
  return ranges;
}

var myval=0;

if (jsarguments.length>1)
	myval = jsarguments[1];

function bang()
{
	outlet(0,myString);
}

function msg_int(v)
{
	myString = v.toString();
    bang();
}

function msg_float(v)
{
	myString = v.toFixed(2).toString();
    bang();
}

function list()
{
    var a = arrayfromargs(arguments);
    myString = getRanges(a).join(', ');
	bang();
}

function anything()
{
    var a = arrayfromargs(arguments);
    myString = getRanges(a).join(', ');
	bang();
}