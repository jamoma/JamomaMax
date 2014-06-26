outlets = 2;

function resize()
{   var x = (this.box.patcher.wind.location[2])-this.box.patcher.wind.location[0];
    this.patcher.box.rect = [0,0,x,70];
    outlet(0, x);
}

function name ()
{
outlet(1, getPath(patcher, '/' + this.patcher.name));
}

function getPath(p, path)
{
if(p.parentpatcher)
{
path = p.parentpatcher.name;
return getPath(p.parentpatcher, path);
}
else return path;
} 