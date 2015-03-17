/*

	javascript for Jamoma
	determining what OS is used
	by Trond Lossius
	modified by Nils Peters, Jul. 2011
	License: BSD

*/


inlets = 1;
outlets = 1;

// the following two variables are updated via the build script
JAMOMA_MAX_VERSION = "dummy";
JAMOMA_MAX_REV = "dummy";

function bang()
{
	outlet(0, "os", this.max.os);
	outlet(0, "os_version", this.max.osversion);
	outlet(0, "max_version", this.max.version);
	outlet(0, "jamoma_version", MODULAR_VERSION);
	outlet(0, "jamoma_revision", MODULAR_REV);
	outlet(0, "plugin", this.max.isplugin);
	outlet(0, "runtime", this.max.isruntime);
}