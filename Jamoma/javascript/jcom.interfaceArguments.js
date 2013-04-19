outlets = 1;

function bang()
{
    var arguments = this.patcher.getattr("arguments");

    outlet(0, arguments);
}

