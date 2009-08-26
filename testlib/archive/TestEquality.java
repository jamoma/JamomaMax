import com.cycling74.max.*;
///import com.cycling74.jitter.*;

public class TestEquality extends MaxObject {

	TestEquality()
	{
		declareIO(2,1);
		setOutletAssist(new String[] {"1 if the same, 0 if not"});
	}
	
	Atom stored[] = null;

	public void anything(String s, Atom a[])
	{
		Atom args[] = null;
		if ( (!s.equals("int"))
				&& (!s.equals("float"))
				&& (!s.equals("list")) )
		{
			args = Atom.newAtom(s, a);
		}
		else
		{
			args = a;
		}
		
		int inlet = getInlet();
		if (inlet == 0)
		{
			report(equal(args, stored));
		}
		else
		{
			stored = args;
		}
	}
	
	private boolean equal(Atom x[], Atom y[])
	{
		if (x.length != y.length)
			return false;
		for (int i=0;i<x.length;i++)
		{
			if (!x[i].equals(y[i]))
				return false;
		}
		return true;
	}
	
	private void report(boolean result)
	{
		if (result == true)
			outlet(0, 1);
		else
			outlet(0, 0);
	}
	
}
