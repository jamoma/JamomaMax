/*
j.vst_get_plugs.js

Retrieve audio plugin names from the Max database and feed to j.parameter

Based on the script getplugs.js distributed with Max, by Andrew Pask and Tim Place,
and adapted for use with the VST model.
*/


var sqlite = new SQLite;
var result = new SQLResult;

NUM_WINDOWS_BOGUS_DLLs = 6; // hack to avoid returning .dlls installed on Windows by Max which are not VSTs

result_filter = ((max.os === "windows") * NUM_WINDOWS_BOGUS_DLLs);


// Query string for getting plug-in names from the Max database
var query = "SELECT name FROM objects JOIN files ON file_id_ext = files.file_id WHERE role_id_ext in (SELECT role_id FROM roles WHERE rolename = \"audioplugin\") AND validity = 1";



/* By default, the Max database is not used by the Max runtime or in standalones.

If you wish to enable the database for use in a standalone,  check the "Database" attribute in the inspector for the standalone object
If you wish to enable the database in the Max runtime application, create a text file in the c74:/init folder and add the following line to it:

  max db.enable 1;

*/

var task = new Task(open_db, this); 
task.interval = 500;
task.repeat();



function open_db()
{
	var status = sqlite.open("__max5db__",1);

	if (status == 0)
	{	
		var err = sqlite.exec(query, result);
		
		if (err)
			post("get_plugs.js error executing sql query: " + err);
		else {
			if (result.numrecords()> result_filter)
			{
				formatResult();
				arguments.callee.task.cancel();
			}
		}	
	}	
		
}


function formatResult()
{
	switch(max.os)
	{
		case "windows":
			var iStart = NUM_WINDOWS_BOGUS_DLLs;
			break;
	
		case "macintosh":	
		  var iStart = 0;
		  break;
	}
  
  var numrecords = result.numrecords();
  var plugArray = new Array();
  
  for (var i=iStart; i<numrecords; i++)
  {
    plugArray.push(result.value(0, i));
  }
  
  // Case-insensitive sorting of array, courtesy of Ivan Krechetov:
  // http://stackoverflow.com/questions/8996963/how-to-perform-case-insensitive-sorting-in-javascript
  plugArray = plugArray.sort(function (a, b) {
      return a.toLowerCase().localeCompare(b.toLowerCase());
  });
  
  outlet(0, plugArray);
}


