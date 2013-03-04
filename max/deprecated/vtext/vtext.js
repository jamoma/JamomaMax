// should resize the bpatcher window where jcom.vtext is embedded
// taken from Tim Place: Stupid JS-tricks: http://www.cycling74.com/story/2006/4/14/145031/478
//
// Nils Peters April 09

var my_width = 15;  
var my_height = 200; 

function size()
{  var a = arrayfromargs(messagename,arguments);
my_width = a[1];
my_height = a[2];
vtext_resize();
}

function vtext_resize()
{
     var grandparent_window = this.patcher.wind;
    var grandparent_patch = grandparent_window.assoc;        
    if(grandparent_patch.box){
   
    var left = grandparent_patch.box.rect[0];
    var top = grandparent_patch.box.rect[1];
    var right = left + my_width;
    var bottom = top + my_height;
    grandparent_patch.box.rect = [left, top, right, bottom];
     }

}