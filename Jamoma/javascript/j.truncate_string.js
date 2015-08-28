var length=40;

if (jsarguments.length>1)
	length = jsarguments[1];

var mystring = "";

function truncate(string)
{
   if (string.length > length)
      return string.substring(0,length)+'...';
   else
      return string;
};

function bang()
{
	outlet(0, truncate(mystring));
}

function list()
{
	mystring = arrayfromargs(arguments).join(" ").toString();
	bang();
}

function anything()
{
	mystring = arrayfromargs(messagename, arguments).join(" ").toString();
	bang();
}