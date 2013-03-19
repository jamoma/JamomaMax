var root = new node_o("root",new Array());
var level = 0;
var cnode;
outlets = 3;
inlets = 1;
var addr = new Array();

 //Re = new RegExp("([\w]*)\.([\d]*)")
 //Re = new RegExp("(\w*)")
 //Re2 = new RegExp("(\w*)\[(\d*)\]")

function test(name)
{
    outlet(0,name.split(".")[1]+3);

}

function node_o(name,child)
{
    this.name = name;
    this.child = child;
    this.instance
    this.add = add_node;
    this.out = out_node;
    this.searchadd = search_node;
}

function out_node()
{

    outlet(2,"<outline text= \"/"+this.name);
    //post();   
    addr.push(this.name);
    //post(this.name);
   
    for(var k = 0 ; k < this.child.length ; k++)
    {
        outlet(0,"bang");
        this.child[k].out();
    }
    if(this.child.length == 0)
     {
        outlet(0,addr); 
    }    

    addr.pop();
    outlet(1,"</outline>");
    //post();
}

function search_node(name)
{
    var res
    var num
    var cnode;
    
    res = name.split(".");
    
    if(res.length > 1)
    {
        name = res[0];
        num = parseInt(res[1]);
        var res2
        var num2
        var name2
        
        //post("1 "+name + " " + num);
        
        for(var k = 0; k < this.child.length ; k++)
        {
            res2 = this.child[k].name.split("[");
            if(res2.length > 1)
            {
                name2 = res2[0];
                num2 = parseInt(res2[1]);
                
                post("2 "+name2 + " " + num2);
                if(name2 == name )
                {
                    this.child[k].name = name2 +"["+Math.max(num,num2)+"]"
                    return this.child[k];
                }
            }
            else if (this.child[k].name == name)
            {
                this.child[k].name = this.child[k].name +"["+num+"]"
                return this.child[k];
            }
        }
            
    }
    
    else for(var k = 0; k < this.child.length ; k++)
    {
        
        if(this.child[k].name == name )
        {
            return this.child[k];
        }
    }
    
    var v = new node_o(name,new Array());
    this.child.push(v);
    return v;
}

function add_node(name)
{
    var v = new node_o(name,new Array());
    this.child.push(v);
    return v;
}



function reset()
{
    root.child.length = 0;
    level = 0;
}



function attr(l)
{
    //if (arguments.length >= 2)
    
}



function bang()
{
    addr.length = 0;
    for(var k = 0 ; k<root.child.length; k++)
        root.child[k].out();
        
    //outlet(0,"done");
}



function node()
{
    var inl = arguments.length
    var clevel;
    var croot = root ;
    var index;
    
    for( var l = 0 ; l < inl ; l++)
    {
        name = arguments[l];
        
        croot = croot.searchadd(name);
        
        
    }
}