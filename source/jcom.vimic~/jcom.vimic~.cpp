#include "jcom.vimic~.h"
#include "ViMic_Engine.h"
#include "Properties.h"
#include "Mic.h"
#include "MicArray.h"
#include "Mirror.h"
#include "Room.h"
#include "Filter.h"
#include "HiMidLow.h"
#include "LowPass.h"
#include "Source.h"
#include "ext_common.h"
//#include "ext_critical.h"
#include "TTClassWrapperMax.h"
#include "TTDSP.h"

bool globWarningFlag;
bool globReportFlag;

/// Setup max class and bind messages to corresponding handlers.
int TTCLASSWRAPPERMAX_EXPORT main(void)
{   
	t_class *c;
	
    TTDSPInit();
    common_symbols_init(); 
	
	c = class_new("jcom.vimic~", (method)vimic_new, (method)vimic_free, sizeof(t_vimic), (method)0L, A_GIMME, 0);	
	//setup((t_messlist**)&vimic_class, (method)vimic_new, (method)vimic_free, sizeof(t_vimic), 0L, A_GIMME, 0);
	
    class_addmethod(c,(method)vimic_dsp,			"dsp",		A_CANT, 0);
	class_addmethod(c,(method)vimic_dsp64,			"dsp64",	A_CANT, 0);
	class_addmethod(c,(method)vimic_bang,			"bang",				0);
    /*----------------------------------------------*/ 
    /* Bind to corresponding methods                */
    /*----------------------------------------------*/ 
    class_addmethod(c,(method)vimic_sourcePosAbs,	"sourcePosAbs", A_GIMME, 0);
	class_addmethod(c,(method)vimic_sourcePos,		"sourcePos", A_GIMME, 0);
	class_addmethod(c,(method)vimic_reflGain,		"reflGain", A_GIMME, 0);
    class_addmethod(c,(method)vimic_micPos,			"micPos", A_GIMME, 0);
	class_addmethod(c,(method)vimic_micAngle,		"micAngle", A_GIMME, 0); 
	class_addmethod(c,(method)vimic_micDirectivity, "directivity", A_GIMME, 0);
	class_addmethod(c,(method)vimic_micGain,		"micGain", A_GIMME, 0);	
	class_addmethod(c,(method)vimic_roomSize,		"roomSize", A_GIMME, 0);
	class_addmethod(c,(method)vimic_disPow,			"disPow", A_GIMME, 0);
	class_addmethod(c,(method)vimic_dirPow,			"dirPow", A_GIMME, 0);
	class_addmethod(c,(method)vimic_dbUnit,			"dbUnit", A_GIMME, 0);
	class_addmethod(c,(method)vimic_temperature,	"temperature", A_FLOAT, 0);	
	class_addmethod(c,(method)vimic_minSensi,		"minSensi", A_FLOAT, 0);
	class_addmethod(c,(method)vimic_directBang,		"directBang", A_LONG, 0);
	class_addmethod(c,(method)vimic_micPolarity,	"micPolarity", A_LONG, 0);	
	class_addmethod(c,(method)vimic_distModel,		"distModel", A_LONG, 0);
	class_addmethod(c,(method)vimic_renderType,		"renderType", A_LONG, 0);
	class_addmethod(c,(method)vimic_report,			"report", A_LONG, 0);
	class_addmethod(c,(method)vimic_sourceYaw,		"sourceYaw", A_LONG, 0);
	class_addmethod(c,(method)vimic_renderintervall, "renderintervall", A_LONG, 0);
	class_addmethod(c,(method)vimic_sourceDirectivityFlag, "sourceDirectivityFlag", A_LONG, 0);
	class_addmethod(c,(method)vimic_normalizeSensiFlag, "normalizeSensiFlag", A_LONG, 0);
	class_addmethod(c,(method)vimic_minimumDelayFlag, "minimumDelayFlag", A_LONG, 0);
	class_addmethod(c,(method)vimic_minSensiFlag,	"minSensiFlag", A_LONG, 0);
	class_addmethod(c,(method)vimic_xFadeLength,	"xFadeLength", A_LONG, 0);
	class_addmethod(c,(method)vimic_xFadeFunction,	"xFadeFunction", A_LONG, 0);
	class_addmethod(c,(method)vimic_xFadeThreshold, "xFadeThreshold", A_LONG, 0);
	class_addmethod(c,(method)vimic_reportAll,		"reportAll", 0);
	class_addmethod(c,(method)vimic_warnings,		"warnings", A_LONG, 0);
	class_addmethod(c,(method)vimic_airfilter,		"airfilter", A_LONG, 0);
	class_addmethod(c,(method)vimic_getDirTable,	"getDirTable", A_DEFSYM, 0);
	class_addmethod(c,(method)vimic_highCf,			"highCf", A_LONG, A_LONG, 0);
	class_addmethod(c,(method)vimic_lowCf,			"lowCf", A_LONG, A_LONG, 0);
	class_addmethod(c,(method)vimic_lowAbsorption,	"lowAbsorption", A_GIMME, 0);
	class_addmethod(c,(method)vimic_midAbsorption,	"midAbsorption", A_GIMME, 0);
	class_addmethod(c,(method)vimic_highAbsorption, "highAbsorption", A_GIMME, 0);
	class_addmethod(c,(method)vimic_wallFilter,		"wallFilter", A_GIMME, 0);
	class_addmethod(c,(method)vimic_assist,			"assist",A_CANT,0); 

#ifdef __INTEL_COMPILER
	post("ViMiC for Max/MSP, © 2005-2012 Nils Peters, Tristan Matthews, Jonas Braasch. Version built with icc on " __DATE__ " at " __TIME__);
#else
	post("ViMiC for Max/MSP, © 2005-2012 Nils Peters, Tristan Matthews, Jonas Braasch. Version built on " __DATE__ " at " __TIME__);
#endif	
	
    class_dspinit(c);
	class_register(CLASS_BOX, c);
	vimic_class = c;
    return 0;
}

/// Object creation method
void *vimic_new(t_symbol *s, int argc, t_atom *argv)
{
    long n;
    t_vimic *x = (t_vimic*)object_alloc(vimic_class);
    if(x){
		x->numOfSources = 1;	
		x->numOfChannels = 8;	
		x->reflOrder = 2;
		x->maxReflOrder = 2; //TODO: we don't really need this, don'twe
		globWarningFlag = false;
		globReportFlag = false; 
		x->normalizeSensiFlag = false;
		x->minSensiFlag = false;
		x->minimumDelayFlag = false;
		x->minSensi = 0.0;		
		x->distModel = 1;	
		
		if(argc){
			if(argv[0].a_w.w_long > 0 && argv[0].a_w.w_long <= Properties::MAXNUMCHANNELS)
				x->numOfChannels = (int) argv[0].a_w.w_long;
			else if (globWarningFlag) 
				post("requested number of channels could not be set. Set to default of 8 instead");
        /*if(argv[1].a_w.w_long >= 0 && argv[1].a_w.w_long <= Properties::REFLECTIONORDER)
            x->maxReflOrder = (int) argv[1].a_w.w_long;
        else if (globWarningFlag) 
            post("requested reflection order could not be set. Set to default of 1 instead");*/
		}

		//x->reflOrder = x->maxReflOrder;

		dsp_setup((t_pxobject*)x, 1); // one signal inlet

    /* 
       According to the image Model the number of Reflections can be determined based on the Reflection Order
       that is how many times a ray is allowed to hit a wall.
     */
    
	/*if (x->reflOrder < 0 || x->reflOrder > 3)
    {
        post("Invalid reflection order, defaulting to 2.");
        x->reflOrder = 2;
    }*/
		x->numRefl = Properties::REFLECTIONS_PER_REFLECTION_ORDER[x->reflOrder];

		x->maxDynRefl = x->numRefl;
		x->reflGains[0] = 0.0;
		x->reflGains[1] = 0.0;
		x->reflGains[2] = 0.0;
		x->reflGainFlag = true;

		x->bufSz = x->numRefl * x->numOfChannels;
    
		x->room = new Room(20, 30, 8, x->numOfChannels, x->numOfSources, x->reflOrder);		// width, depth, height, channels, sources, reflection order

		x->AudioProcType = Properties::VIMIC_LITE; // Set to ViMiC
		x->c_phase = 0;
		x->directBang = 0;
		x->x_sr = Properties::SAMPLERATE;  
		x->micPolarity = -1.0;
		/////
		x->renderInterval = 50;
		x->blocksize = 64;
		x->grainsize = (double) 1.0 / (x->renderInterval * x->blocksize);

		///////////////////x-fade parameter
		x->fades = new CrossFadeQueue(10, Properties::FADE_TABLE_SIZE, Properties::COS, x->x_sr);

		////////////////// air properties
		x->temperature = 21; //degree Celsius
		x->speedOfSound = (331.3 * sqrt(1.0 + x->temperature / 273.15)) / x->x_sr; //x->temperature/x->x_sr; //331.3*sqrt(1+temp/273.15)
		x->invSpeedOfSound = 1.0 / x->speedOfSound; 	

		if ((x->c_vec = (double *) malloc(Properties::DELAYBYTES * sizeof(double))) == NULL)	
			exit(EXIT_FAILURE);

		for (n = 0; n < Properties::DELAYBYTES; n++)
			x->c_vec[n] = 0.0;

		if ((x->delay = (double *) getbytes((short) x->bufSz * sizeof(double))) == NULL)
			exit(EXIT_FAILURE);
		if ((x->currentDelay = (double *) getbytes((short) x->bufSz * sizeof(double))) == NULL)
			exit(EXIT_FAILURE);
		if ((x->delGrain= (double *) getbytes((short) x->bufSz  * sizeof(double))) == NULL)
			exit(EXIT_FAILURE);
		if ((x->sensiGrain= (double *) getbytes((short) x->bufSz * sizeof(double))) == NULL)
			exit(EXIT_FAILURE);
		if ((x->sensitivity= (double *) getbytes((short) x->bufSz * sizeof(double))) == NULL)
			exit(EXIT_FAILURE);
		if ((x->currentSensitivity= (double *) getbytes((short) x->bufSz * sizeof(double))) == NULL)
			exit(EXIT_FAILURE);

		for(n = 0; n < x->bufSz; n++){
			x->currentDelay[n] = 0.0;
			x->delay[n] = 0.0;
			x->sensitivity[n] = 0.0;
			x->currentSensitivity[n] = 0.0;
			x->delGrain[n] = 0.0;
			x->sensiGrain[n] = 0.0;
		}    
		x->grainCounter = 0;

		for(n = 0; n < x->numOfChannels; n++)
			outlet_new((t_pxobject *)x, "signal");

		x->room->renderMirrors();
		x->room->mics.renderMics();
	}
    return x;
}

/// Memory deallocation
void vimic_free(t_vimic *x)
{   
    dsp_free((t_pxobject*)x); 
    free(x->c_vec);
    freebytes(x->delay, (short) x->bufSz * sizeof(double));
    freebytes(x->currentDelay, (short) x->bufSz * sizeof(double));
    freebytes(x->delGrain, (short) x->bufSz * sizeof(double));
    freebytes(x->sensiGrain, (short) x->bufSz * sizeof(double));
    freebytes(x->sensitivity, (short) x->bufSz * sizeof(double));
    freebytes(x->currentSensitivity, (short) x->bufSz * sizeof(double));

    // Freeing of objects or arrays of objects instantiated with cpp operator "new" must be done with "delete"
    delete x->fades;
    delete x->room;
}

void vimic_sourcePosAbs(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{   
    if (argc == 3)
    {
        if(argv[0].a_type == A_FLOAT) // First variable is x coordinate
        {
            x->room->sources[0].xPosAbs(argv[0].a_w.w_float);

            if (argv[1].a_type == A_FLOAT) // Second variable is y coordinate
            {
                x->room->sources[0].yPosAbs(argv[1].a_w.w_float);

                if (argv[2].a_type == A_FLOAT) // Third variable is z coordinate
                    x->room->sources[0].zPosAbs(argv[2].a_w.w_float);
            }
        }
        if (x->directBang == 1) vimic_bang(x);
    }
    else if (globWarningFlag) error("Numbers of args. is wrong");	

}


void vimic_sourcePos(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{
    if (argc == 3)
    {
        if(argv[0].a_type == A_FLOAT) // First variable is x coordinate
        {
            x->room->sources[0].xPosRel(argv[0].a_w.w_float);

            if (argv[1].a_type == A_FLOAT) // Second variable is y coordinate
            {
                x->room->sources[0].yPosRel(argv[1].a_w.w_float);

                if (argv[2].a_type == A_FLOAT) // Third variable is z coordinate
                    x->room->sources[0].zPosRel(argv[2].a_w.w_float);
            }
        }
        if (x->directBang == 1) vimic_bang(x);
    }
    else if (globWarningFlag)	error("Numbers of args. is wrong");
}


void vimic_micPos(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{    
    long b = 0;

    switch (argc)
    {
        case 3: 		// All mics
            if(argv[0].a_type == A_FLOAT) // First variable is x coordinate
            {
                x->room->mics.xPos(argv[0].a_w.w_float);
                if(argv[1].a_type == A_FLOAT) // Second variable is y coordinate
                {
                    x->room->mics.yPos(argv[1].a_w.w_float);

                    if(argv[2].a_type == A_FLOAT) // Third variable is z coordinate
                        x->room->mics.zPos(argv[2].a_w.w_float);
                }
            }
            break;			
        case 4:			// one mic
            if (argv[0].a_type == A_LONG)	 // index
                b = argv[0].a_w.w_long; // get index

            if (x->room->mics.validChannel(b))
            {
                // get X-coordinate
                x->room->mics[b - 1].xPos(argv[1].a_w.w_float);   

                // get Y-coordinate
                x->room->mics[b - 1].yPos(argv[2].a_w.w_float);   

                // get Z-coordinate
                x->room->mics[b - 1].zPos(argv[3].a_w.w_float);   		
            }
            else if (globWarningFlag) post("Invalid channel number %d", b);
            break;			
        default:
            if (globWarningFlag) error("Incorrect # of args.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}// of "/MicPos"




void vimic_micAngle(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{   
    long b = 0;

    if (argc == 3)
    {
        if (argv[0].a_type == A_LONG) // index for microphone
        {
            b = argv[0].a_w.w_long;
            if (argv[1].a_type == A_FLOAT) // azimuth angle
            { 
                if (x->room->mics.validChannel(b))
                {
                    x->room->mics[b - 1].azi(argv[1].a_w.w_float);

                    if (argv[2].a_type == A_FLOAT) // elevation angle
                        x->room->mics[b - 1].ele(argv[2].a_w.w_float);
                }
                else if (globWarningFlag) post("Invalid channel number %d", b);
            }
        }
        if (x->directBang == 1) vimic_bang(x);
    }
    else if (globWarningFlag) error("Incorrect # of args.");
} 


void vimic_micDirectivity(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{   
    long b = 0;
    switch (argc)
    {
        case 2: //two parameters
            if (argv[0].a_type == A_LONG)  //case 2: /directivity [index(int) value(float)] 
            {
                b = argv[0].a_w.w_long;
                if (argv[1].a_type == A_FLOAT) // one mic with index b=argv[0]
                {
                    if (x->room->mics.validChannel(b))
                        x->room->mics[b - 1].dirGainA(argv[1].a_w.w_float);
                    else if (globWarningFlag) post("Invalid channel number %d", b);
                }
            }
            break;
        case 1: //one parameter 
            if (argv[0].a_type == A_FLOAT)// else // all microphones
                x->room->mics.dirGain(argv[0].a_w.w_float);
            break;
        default:
            if (globWarningFlag) error("Incorrect # of args.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}

void vimic_micGain(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{
    long b = 0;

    switch (argc)
    {
        case 2:
            if(argv[0].a_type == A_LONG)
            {
                b = argv[0].a_w.w_long;
                if(argv[1].a_type == A_FLOAT) // one mic with index b=argv[0]
                {
                    if (x->room->mics.validChannel(b))
                        x->room->mics[b - 1].gain(argv[1].a_w.w_float);
                    else if (globWarningFlag) error("Invalid channel number %d", b);
                }
            }
            break;
        case 1:
            if (argv[0].a_type == A_FLOAT) // all microphones
                x->room->mics.gain(argv[0].a_w.w_float);
            break;
        default:
            if (globWarningFlag) error("Incorrect # of args.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}



void vimic_roomSize(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{  
    if (argc == 3)
    {
        if(argv[0].a_type == A_FLOAT) // First variable is x coordinate
        {
            x->room->width(argv[0].a_w.w_float);

            if (argv[1].a_type == A_FLOAT) // Second variable is y coordinate
            {
                x->room->depth(argv[1].a_w.w_float);

                if(argv[2].a_type == A_FLOAT) // Third variable is z coordinate
                    x->room->height(argv[2].a_w.w_float);					
            }
        }
        if (x->directBang == 1) vimic_bang(x);
    }
    else if (globWarningFlag)
        error("Incorrect # of args.");
}



void vimic_reflGain(t_vimic *x, t_symbol *s, short argc, t_atom *argv) //TODO change to long float
{   
    long b = 0;

    if (argc == 2)
    {
        if (argv[0].a_type == A_LONG)
        {
            b = argv[0].a_w.w_long;
            if (b >= 0 && b < Properties::REFLECTIONORDER) 
            {
                if (argv[1].a_type == A_FLOAT)
                {
                    //if (argv[1].a_w.w_float <= 8.0 && argv[1].a_w.w_float >= 0.0)
                    //{
                    x->reflGains[b] = CLIP(argv[1].a_w.w_float,0.0, 8.0);
					
					if (x->reflGains[2] > 0.0){
						x->reflOrder = 2;
						x->numRefl = Properties::REFLECTIONS_PER_REFLECTION_ORDER[x->reflOrder];
						x->maxReflOrder = x->reflOrder;						
						x->maxDynRefl = x->numRefl;						
					}
					else if(x->reflGains[1] > 0.0){
						x->reflOrder = 1;
						x->numRefl = Properties::REFLECTIONS_PER_REFLECTION_ORDER[x->reflOrder];
						x->maxReflOrder = x->reflOrder;						
						x->maxDynRefl = x->numRefl;						
					}
					else{
						x->reflOrder = 0;
						x->numRefl = Properties::REFLECTIONS_PER_REFLECTION_ORDER[x->reflOrder];
						x->maxReflOrder = x->reflOrder;						
						x->maxDynRefl = x->numRefl;						
					}					
					
                    x->reflGainFlag = true;
					
                    if (globReportFlag)
                        post("Reflection order %d gain: %f", b, x->reflGains[b]);

                }
            }
            else if (globWarningFlag) post("Invalid channel number %d", b);
        }
        if (x->directBang == 1) vimic_bang(x);	
    }
    else if (globWarningFlag) error("Incorrect # of args.");
}


void vimic_dirPow(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{  
    long b = 0;

    switch (argc)
    {
        case 2:
            if(argv[0].a_type == A_LONG)
            {
                b = argv[0].a_w.w_long;
                if(argv[1].a_type == A_LONG) // one mic with index b=argv[0]
                {
                    if (x->room->mics.validChannel(b))
                        x->room->mics[b - 1].dirPow(argv[1].a_w.w_long);
                    else if (globWarningFlag)
                        error("Invalid channel number %d", b);
                }
            }
            break;
        case 1:
            if (argv[0].a_type == A_LONG) // all microphones
                x->room->mics.dirPow(argv[0].a_w.w_long);
            break;
        default:
            if (globWarningFlag)
                error("Incorrect # of args.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}

void vimic_disPow(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{	
    long b = 0;
    switch (argc)
    {   
        case 2:
            if(argv[0].a_type == A_LONG)
            {
                b = argv[0].a_w.w_long;
                if(argv[1].a_type == A_FLOAT) // one mic with index b=argv[0]
                {
                    if (x->room->mics.validChannel(b))
                        x->room->mics[b - 1].distPow(argv[1].a_w.w_float);
                    else if (globWarningFlag)
                        error("Invalid channel number %d", b);
                }
            }
            break;
        case 1:
            if (argv[0].a_type == A_FLOAT) // all microphones
                x->room->mics.distPow(argv[0].a_w.w_float);
            break;
        default:
            if (globWarningFlag)
                error("Incorrect # of args.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}


void vimic_dbUnit(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{ 
    long b = 0;

    switch (argc)
    {
        case 2:
            if(argv[0].a_type == A_LONG)
            {
                b = argv[0].a_w.w_long;
                if(argv[1].a_type == A_FLOAT) // one mic with index b=argv[0]
                {
                    if (x->room->mics.validChannel(b))
                        x->room->mics[b - 1].dbUnit(argv[1].a_w.w_float);
                    else if (globWarningFlag) error("Invalid channel number %d", b);
                }
            }
            break;
        case 1:
            if (argv[0].a_type == A_FLOAT) // all microphones
                x->room->mics.dbUnit(argv[0].a_w.w_float);
            break;
        default:
            if (globWarningFlag) error("Incorrect # of args.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}



void vimic_directBang(t_vimic *x, long n)
{
    if (n == 1)
    {
        x->directBang = 1;
        post("Automatic Rendering Update: On");
    }
    else
    {
        x->directBang = 0;
        post("Automatic Rendering Update: Off");
    }
}




void vimic_temperature(t_vimic *x, double n)
{		
    if ((n >= -20.0)||(n <= 40.0))
    {
        x->temperature = n;
        x->speedOfSound = (331.3 * sqrt(1.0 + x->temperature / 273.15)) / x->x_sr;
        x->invSpeedOfSound = 1.0 / x->speedOfSound;
        if (globReportFlag) post("expected speed of sound is %f at %f degree celius", x->speedOfSound * x->x_sr, x->temperature);
        if (x->directBang == 1) vimic_bang(x);
    }
    else if (globWarningFlag) post("Temperature must be between -20 and 40 degree");

}

void vimic_minSensi(t_vimic *x, double n)
{

    if (n >= 0.0 && n <= 1.0)
    {
        x->minSensi = n;
        x->room->sources[0].flag(true);
        if (x->directBang == 1) vimic_bang(x);	
        if (globReportFlag)	post("Minimum sensitivity: %f", x->minSensi);
    }
    else if (globWarningFlag) error("Minimum sensitivity must be >= 0.0 and <= 1.0");
}






void vimic_distModel(t_vimic *x, long n)
{   
    x->distModel = CLIP(n,1,2);
    x->room->sources[0].flag(true);
    if (x->directBang == 1) vimic_bang(x);
    // modelID 1 for inverse proportional decrease
    // modelID 2 for exponential decrease
}


void vimic_warnings(t_vimic *x, long n)
{	
    switch (n)
    {
        case 0:
            if (globWarningFlag == true) post("Warnings off"); //this condition prevents postings when the module is initialized.
            globWarningFlag = false;
            break;
        case 1:
            if (globWarningFlag == false) post("Warnings on"); //this condition prevents postings when the module is initialized.
            globWarningFlag = true;	
            break;
    }
}

void vimic_reportAll(t_vimic *x)
{
    int n = 0;
    int m = 0;
    post("This is ViMiC for Max/MSP, (c) 2005-2012 Nils Peters, Tristan Matthews, Jonas Braasch. Version built on " __DATE__ " at " __TIME__);
    post("renderInterval: %d",x->renderInterval);
    post("Grainsize: %f",x->grainsize);
    post("expected speed of sound is %f at %f degrees celsius", x->speedOfSound * x->x_sr, x->temperature);
    x->room->mics.print();
    x->room->print();
    for(m = 0; m < x->room->mics.numChannels(); m++)
    {
        for (n = 0; n < x->numRefl; n++)
        {
            post("Mic %d, Refl %d, Sensi: %f", m, n, *(x->sensitivity + (x->numRefl * m) + n));
            post("Mic %d, Refl %d, Delay: %f", m, n, *(x->delay + (x->numRefl * m) + n));
        }
    }

    for (m = 0; m < Properties::REFLECTIONORDER; m++)
        post("Reflgains[%d] = %f", m, x->reflGains[m]);
}




void vimic_report(t_vimic *x, long n)
{	
    switch (n) 
    {
        case 0:
            if (globReportFlag == true){ 
				post("Report off"); //this condition prevents postings when the module is initialized.
            }
            globReportFlag = false;
            break;
        case 1:
            if (globReportFlag == false){
				post("Report on"); //this condition prevents postings when the module is initialized.
            }
            globReportFlag = true;
            break;
    }
}

void vimic_sourceYaw(t_vimic *x, long n)
{
    x->room->sources[0].aziAngle(n);
}


void vimic_normalizeSensiFlag(t_vimic *x, long n)
{	
    switch (n) 
    {
        case 0:
            x->normalizeSensiFlag = false;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Sensitivity normalization: off");
            break;
        case 1:
            x->normalizeSensiFlag = true;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag) post("Sensitivity normalization: on");
            break;
    }
}

void vimic_minimumDelayFlag(t_vimic *x, long n)
{	
    switch (n) 
    {
        case 0:
            x->minimumDelayFlag = false;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Minimizing time-of-fights delays: off");
            break;
        case 1:
            x->minimumDelayFlag = true;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag) post("Minimizing time-of-fights delays: on");
            break;
    }
}

void vimic_minSensiFlag(t_vimic *x, long n)
{
    switch (n) 
    {
        case 0:
            x->minSensiFlag = false;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Sensitivity minimum: off");
            break;
        case 1:
            x->minSensiFlag = true;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Sensitivity minimum: on");
            break;
    }
}



void vimic_sourceDirectivityFlag(t_vimic *x, long n)
    // Source directivity flag, if true, use source directivity for sensitivity calculation
{	
    switch (n) 
    {
        case 0:
            x->room->sources[0].directivityFlag(false);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Source directivity: off");
            break;
        case 1:
            x->room->sources[0].directivityFlag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Source directivity: on");
            break;
    }
}


void vimic_micPolarity(t_vimic *x, long n)
{
    switch (n)
    {					
        case 1: 
            x->micPolarity = -1.0;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag)	post("Microphone polarity is unrestricted, microphone gains are between -1 and 1");
            break;
        case 0: 
            x->micPolarity = 0.0;
            x->room->sources[0].flag(true);
            if (x->directBang == 1) vimic_bang(x);
            if (globReportFlag) post("Microphone polarity is restricted, microphone gains are between 0 and 1");
            break;
        default:
            if (globWarningFlag) error("Argument must be either 1 or 0");
            break;
    }
} 

void vimic_renderintervall(t_vimic *x, long n)
{
    if (n > 0)
    {
        x->renderInterval = n;
        x->grainsize = 1.0 / (x->renderInterval * x->blocksize);
    }
    else post("renderInterval must be more than 1 blocks");
    if (globReportFlag) post("renderInterval is %d blocks", x->renderInterval);
}

void vimic_xFadeFunction(t_vimic *x, long n) //distance threshold before a x-fade is started in samples
{	
    x->fades->fadeFunction((Properties::fadeMode) n);
}



void vimic_xFadeLength(t_vimic *x, long n) //fadelength in samples
{		
    // create a new fade-lookup table
    if (x->fades->isActive()) post("No change, can't change fade time while actively crossfading.");
    else x->fades->fadeLength(n);	
}



void vimic_xFadeThreshold(t_vimic *x, long n) //fadelength in samples
    //distance threshold before a x-fade is started in samples
{
    if (n >= 1)	x->fades->fadeThreshold(n);
    else post("Crossfade threshold must be >= 1");
    if (globReportFlag)	post("Crossfade threshold in samples: %d", x->fades->fadeThreshold());
}


void vimic_airfilter(t_vimic *x, long n)
{
	for (int i = 0; i < x->numOfChannels; i++){
		x->room->air[i][0].cutOff(n);
		x->room->xfadeAir[i].cutOff(n);
		x->room->air[i][1].cutOff(n);
	}
    if (x->directBang == 1) 
		vimic_bang(x);
	if (globReportFlag) 
		post("Air absorption cutoff: %ld", n);
}

// Render Type
void vimic_renderType(t_vimic *x, long n)
{
    switch (n)
    {
        case 0:
            x->AudioProcType = Properties::NONE;
            if (globReportFlag)
                post("Audio off");
            break;

        case 1:
            x->AudioProcType = Properties::VIMIC_LITE;
            if (globReportFlag)
                post("Processing: ViMiC lite -> ViMiC with one Filter for all walls");
            break;

        case 2:
            x->AudioProcType = Properties::AMP_PAN;
            if (globReportFlag)
                post("Processing: Amplitude Panning");
            break;

        case 3:
            x->AudioProcType = Properties::X_FADE_LITE;
            if (globReportFlag)
                post("Processing: Delay w/o Pitch Shift");
            break;

        case 4:
            x->AudioProcType = Properties::X_FADE_XL;
            if (globReportFlag)
                post("Processing: Delay w/o Pitch Shift");
            break;

        case 5:
            x->AudioProcType = Properties::VIMIC_XL;
            if (globReportFlag)
                post("Processing: ViMiC XL -> ViMiC with separate Filter for each wall");
            break;

        case 6:
            x->AudioProcType = Properties::STATIC;
            if (globReportFlag)
                post("Processing: Integer delays only.");
            break;

        default:
            if (globWarningFlag)
                error("Unknown rendering type.");
            break;
    }
    if (x->directBang == 1) vimic_bang(x);
}  


void vimic_getDirTable(t_vimic *x, t_symbol *s)
{
    long **storage; 
    long size;		// not using this, yet
    if (!table_get(s, &storage, &size))
        x->room->sources[0].updateDirectivity(storage);		

}




void vimic_highCf(t_vimic *x, long n, long freq)
{
    //if (x->reflOrder > 0)
    //{
        if (n > 0 && n <= Properties::NUMWALLS)
        {
            for (int i = 0; i < x->numOfChannels; i++)
            {
                if (n == Properties::LEFT)	// left filter controls filtering for lite sim
                {
                    for (int filterNum = 0; filterNum < 2; filterNum++)		// set all filters to match
                        x->room->xfadeWalls[i][filterNum].highShelfFrequency(freq); 
                }
                x->room->walls[i][n - 1].highShelfFrequency(freq);

                //if (x->reflOrder == 2)
                    x->room->walls[i][n + Properties::NUMWALLS - 1].highShelfFrequency(freq);
            }
        }
        else if (globWarningFlag) post("Invalid wall index %d", n);		
        if (x->directBang == 1) vimic_bang(x);
        if (globReportFlag) post("Wall %d high shelf centre frequency: %ld", n, freq);
    //}
    //else if (globWarningFlag)	error("No filtering for reflection order of 0.");
}


void vimic_lowCf(t_vimic *x, long n, long freq)
{
    //if (x->reflOrder > 0)
    //{
        if (n > 0 && n <= Properties::NUMWALLS)
        {
            for (int i = 0; i < x->numOfChannels; i++)
            {
                if (n == Properties::LEFT)	// left filter controls filtering for lite sim
                {
                    for (int filterNum = 0; filterNum < 2; filterNum++)		// set all filters to match
                        x->room->xfadeWalls[i][filterNum].lowShelfFrequency(freq); 
                }
                x->room->walls[i][n - 1].lowShelfFrequency(freq);
                //if (x->reflOrder == 2)
                    x->room->walls[i][n + Properties::NUMWALLS - 1].lowShelfFrequency(freq);
            }
        }
        else if (globWarningFlag) post("Invalid wall index %d", n);
        if (x->directBang == 1) vimic_bang(x);
        if (globReportFlag) post("Wall %d low shelf centre frequency: %ld", n, freq);
    //}
    //else if (globWarningFlag)	error("No filtering for reflection order of 0.");
}

void vimic_lowAbsorption(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{
    //if (x->reflOrder > 0)
    //{   
        long b = 0;

        if (argc == 2)
        {
            if (argv[0].a_type == A_LONG)
            { 
                b = argv[0].a_w.w_long;
                if (argv[1].a_type == A_FLOAT) 
                {
                    if (b > 0 && b <= Properties::NUMWALLS)
                    {
                        for (int i = 0; i < x->numOfChannels; i++)
                        {
                            if (b == Properties::LEFT)	
                            {
                                for (int filterNum = 0; filterNum < 2; filterNum++)	// set all filters to match
                                    x->room->xfadeWalls[i][filterNum].lowGain(argv[1].a_w.w_float);
                            }

                            x->room->walls[i][b - 1].lowGain(argv[1].a_w.w_float);

                            //if (x->reflOrder == 2)
                            //{
                                x->room->walls[i][b + Properties::NUMWALLS - 1].lowGain(argv[1].a_w.w_float);
                            //}
                        }
                    }
                    else if (globWarningFlag) post("Invalid wall index %d", b);

                    if (globReportFlag) post("Wall %d low gain: %f", b, argv[1].a_w.w_float);
                }
            }
        }
        else if (globWarningFlag) error("Incorrect # of args.");
        if (x->directBang == 1) vimic_bang(x);
    //}
    //else if (globWarningFlag) error("No filtering for reflection order of 0.");
}





void vimic_midAbsorption(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{
    //if (x->reflOrder > 0)
    //{
        long b = 0;

        if (argc == 2)
        {
            if (argv[0].a_type == A_LONG)
            { 
                b = argv[0].a_w.w_long;
                if (argv[1].a_type == A_FLOAT) 
                {
                    if (b > 0 && b <= Properties::NUMWALLS)
                    {
                        for (int i = 0; i < x->numOfChannels; i++)
                        {
                            if (b == Properties::LEFT)	
                            {
                                for (int filterNum = 0; filterNum < 2; filterNum++)		
                                    x->room->xfadeWalls[i][filterNum].midGain(argv[1].a_w.w_float);
                            }

                            x->room->walls[i][b - 1].midGain(argv[1].a_w.w_float);

                            //if (x->reflOrder == 2)
                            //{
                                x->room->walls[i][b + Properties::NUMWALLS - 1].midGain(argv[1].a_w.w_float);
                            //}
                        }
                    }					
                    else if (globWarningFlag) post("Invalid wall index %d", b);
                    if (globReportFlag) post("Wall %d mid gain: %f", b, argv[1].a_w.w_float);
                }
            }
        }
        else if (globWarningFlag)
            error("Incorrect # of args.");
    //}
    //else if (globWarningFlag)
    //    error("No filtering for reflection order of 0.");
}


void vimic_highAbsorption(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{
  //  if (x->reflOrder > 0)
   // {
        long b = 0;

        if (argc == 2)
        {
            if (argv[0].a_type == A_LONG)
            { 
                b = argv[0].a_w.w_long;

                if (argv[1].a_type == A_FLOAT) 
                {
                    if (b > 0 && b <= Properties::NUMWALLS)
                    {
                        for (int i = 0; i < x->numOfChannels; i++)
                        {
                            if (b == Properties::LEFT)	// left filter controls filtering for lite sim
                            {
                                for (int filterNum = 0; filterNum < 2; filterNum++)		// set all filters to match
                                    x->room->xfadeWalls[i][filterNum].highGain(argv[1].a_w.w_float); 
                            }

                            x->room->walls[i][b - 1].highGain(argv[1].a_w.w_float);

                            //if (x->reflOrder == 2)
                            //{
                                //post("b: %d", b);
                                x->room->walls[i][b + Properties::NUMWALLS - 1].highGain(argv[1].a_w.w_float);
                            //}
                        }
                    }
                    else if (globWarningFlag) post("Invalid wall index %d", b);

                    if (globReportFlag) post("Wall %d high gain: %f", b, argv[1].a_w.w_float);
                }
            }
        }
        else if (globWarningFlag) error("Incorrect # of args.");
    //}
    //else if (globWarningFlag) error("No filtering for reflection order of 0.");
}

void vimic_wallFilter(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
{
  //  if (x->reflOrder > 0)
  //  {
        long b = 0;

        if (argc == 6)
        {
            if (argv[0].a_type == A_LONG)
            { 
                b = argv[0].a_w.w_long;

                if ((argv[1].a_type == A_FLOAT) && (argv[2].a_type == A_FLOAT) &&  (argv[3].a_type == A_FLOAT) && (argv[4].a_type == A_LONG) && (argv[5].a_type == A_LONG))
                {
                    if (b > 0 && b <= Properties::NUMWALLS)
                    {
                        for (int i = 0; i < x->numOfChannels; i++)
                        {
                            if (b == Properties::LEFT)	// left filter controls filtering for lite sim
                            {
                                for (int filterNum = 0; filterNum < 2; filterNum++)
                                {		// set all filters to match
                                    x->room->xfadeWalls[i][filterNum].lowGain(argv[1].a_w.w_float); 
                                    x->room->xfadeWalls[i][filterNum].midGain(argv[2].a_w.w_float); 
                                    x->room->xfadeWalls[i][filterNum].highGain(argv[3].a_w.w_float); 
                                    x->room->xfadeWalls[i][filterNum].lowShelfFrequency(argv[4].a_w.w_long); 
                                    x->room->xfadeWalls[i][filterNum].highShelfFrequency(argv[5].a_w.w_long); 
                                }
                            }

                            x->room->walls[i][b - 1].lowGain(argv[1].a_w.w_float);
                            x->room->walls[i][b - 1].midGain(argv[2].a_w.w_float);
                            x->room->walls[i][b - 1].highGain(argv[3].a_w.w_float);
                            x->room->walls[i][b - 1].lowShelfFrequency(argv[4].a_w.w_long); 
                            x->room->walls[i][b - 1].highShelfFrequency(argv[5].a_w.w_long);


                            //if (x->reflOrder == 2)
                            //{
                                x->room->walls[i][b + Properties::NUMWALLS - 1].lowGain(argv[1].a_w.w_float);
                                x->room->walls[i][b + Properties::NUMWALLS - 1].midGain(argv[2].a_w.w_float);
                                x->room->walls[i][b + Properties::NUMWALLS - 1].highGain(argv[3].a_w.w_float);
                                x->room->walls[i][b + Properties::NUMWALLS - 1].lowShelfFrequency(argv[4].a_w.w_long); 
                                x->room->walls[i][b + Properties::NUMWALLS - 1].highShelfFrequency(argv[5].a_w.w_long);
                            //}
                        }
                    }
                    else if (globWarningFlag) post("Invalid wall index %d", b);
                    if (globReportFlag) post("Wall %d lowGain %f, midGain: %f, highGain: %f, lowShelfFreq %f, highShelfFreq %f", b, argv[1].a_w.w_float, argv[2].a_w.w_float, argv[3].a_w.w_float, argv[4].a_w.w_float, argv[5].a_w.w_float);
                } 
                else if (globWarningFlag) error("Incorrect syntax. wallFilter index <int> lowGain <float> midGain <float> highGain <float> lowShelfFrequency <int> highShelfFrequency <int>");
            }
        }
        else if (globWarningFlag) error("Incorrect # of args.");
  //  }
  //  else if (globWarningFlag) error("No filtering for reflection order of 0.");
}



/*void vimic_anything(t_vimic *x, t_symbol *s, short argc, t_atom *argv)
  {  // leftovers 

  if (s == gensym("/MicCenterDistance"))
  {
  if (argc == 1)
  {
  if(argv[0].a_type == A_FLOAT) // First variable is Center Distance coordinate
  x->room->mics.centerDistance(argv[0].a_w.w_float);	// renders all mics
  }
  else if (globWarningFlag)
  error("Incorrect # of args.");
  }

  else if (s == gensym("/HeadAngle"))
  {
  if (argc == 1)
  {
  if (argv[0].a_type == A_FLOAT) // variable is head angle in deg
  {
  x->headAngle = argv[0].a_w.w_float;
  if (globReportFlag)
  post("/HeadAngle= %f",x->headAngle);
  }
  }
  else if (globWarningFlag)
  error("Incorrect # of args.");
  }
  }*/


void vimic_bang(t_vimic *x)
{
    int m; // counter
    bool grainCounterFlag = false;

    if (x->room->mirrorFlag())
    {
        grainCounterFlag = true;
        x->room->renderMirrors();  
    }


    //if(x->reflOrder < 3)
    //{   
        //critical_enter(0);
        for (m = 0; m < x->numOfChannels; m++)
        {
            if (x->room->sources[0].flag() || x->room->mics[m].flag() || x->room->mics.flag() || x->reflGainFlag)
            {
                grainCounterFlag = true;
                vimic_mirrors(x->sensitivity + x->numRefl * m,
                        x->delay + x->numRefl * m,
                        &x->room->mics[m],
                        x->room->mirrors,
                        &x->room->sources[0],
                        x->invSpeedOfSound,
                        x->numRefl, x->AudioProcType, x->currentDelay + x->numRefl * m, x->reflGains, x->fades, x->micPolarity, x->distModel);
                //post("mirrors: Mic number %d has xpos of %f", m, x->room->mics[m].xPos());
            }
            x->room->mics[m].flag(false);
        }
        x->room->mics.flag(false);
        //critical_exit(0);
    //} 


    if (grainCounterFlag)		// something has changed
    {
        if (x->minSensiFlag)
        {   //critical_enter(0);
            for (int i = 0; i < x->bufSz; i++)
                vimic_floorSensi(x->sensitivity + i, x->minSensi);
            //critical_exit(0);
        }

        if (x->normalizeSensiFlag){   
			//critical_enter(0);
            double invSqrtSumSensi = vimic_invSqrtSumSensi(x->sensitivity, x->bufSz);
            for (int i = 0; i < x->bufSz; i++)
                vimic_normalizeSensi(x->sensitivity + i, invSqrtSumSensi);
            //critical_exit(0);
        }
		        
		if (x->minimumDelayFlag){
			double minDelay = vimic_findMinDelayValue(x->delay, x->bufSz);
			for (int i = 0; i < x->bufSz; i++)
				vimic_minimizeDelay(x->delay + i, minDelay);
		}
		
		//critical_enter(0);		
        for (m = 0; m < x->bufSz; m++){
			x->delGrain[m] = ((double) x->delay[m] - x->currentDelay[m]) * x->grainsize;  // copy old values into buffer	 
#ifndef __INTEL_COMPILER
            TTZeroDenormal(x->delGrain[m]); // FIXME: necessary?
#endif			
			x->sensiGrain[m] = (x->sensitivity[m] - x->currentSensitivity[m]) * x->grainsize; // copy old values into buffer  
#ifndef __INTEL_COMPILER		
            TTZeroDenormal(x->sensiGrain[m]);
#endif			
        }
        //critical_exit(0);
        x->grainCounter = 0;
    }
    x->room->sources[0].flag(false);
    x->reflGainFlag = false;
}

#pragma warning(push)
#pragma warning(disable: 4312; disable : 4700)
t_int*	vimic_perform(t_int *w)// is that good to initialize all the variable in the perform function?
{
    t_vimic *x = (t_vimic *)(w[1]);
    int numChannels = x->numOfChannels;

    if (x->x_obj.z_disabled) 	// if muted, return 
        return (w + 4 + numChannels);

    t_sample  *in; 

    // TM: allocate based on number of channels now.
    t_sample *out[Properties::MAXNUMCHANNELS];
    bool micGainNonZero[Properties::MAXNUMCHANNELS];

    int n = (t_int)(w[3 + x->numOfChannels]); //can be calculated outside?? maybe?
    int phase = x->c_phase;
    int blocksize = n; // it is also good to have 1_over_blocksize calculated to ge rid of the divisions
    int renderInterval = x->renderInterval;
    int GrainCounter = x->grainCounter;
    int numOfRefl = x->numRefl;
    int maxDynRefl = x->maxDynRefl;
    int reflOrderIndex = 0;
    double *reflGains = x->reflGains;
    double *currentDelay = x->currentDelay;
    double *currentSensitivity = x->currentSensitivity;
    double *delGrain = x->delGrain;
    double *sensiGrain = x->sensiGrain;
    double *bp = x->c_vec + phase;
    double *ep = x->c_vec + Properties::DELAYSIZE;
    double frac;
    int idelay, idelayOld;
    double newSamp, oldSamp, newReflSamps, oldReflSamps, reflSamps = 0.0;
    int sampPos = 0;
    double *delay = x->delay;		
    double *sensitivity = x->sensitivity;
    int numwallsMinusOne = Properties::NUMWALLS - 1;  //optimization
    int numOfReflTimesK;
    HiMidLow **walls = x->room->walls;
    LowPass **air = x->room->air;

    // for Xfade
    HiMidLow **xfadeWalls = x->room->xfadeWalls;
    LowPass *xfadeAir = x->room->xfadeAir;

    CrossFadeQueue *fades = x->fades;

    in = (t_sample *)(w[2]);

    for (int i = 0; i < numChannels; ++i)
    {
        out[i] = (t_sample *)(w[3 + i]);
        if (x->room->mics[i].gain() != 0.0)
            micGainNonZero[i] = true;
        else
            micGainNonZero[i] = false;
    }

    switch (x->AudioProcType)
    {
        case Properties::VIMIC_LITE: // ViMiC wtih reduced Filtering

            if (GrainCounter < renderInterval)
            {
                double a, b, c, d, cminusb; // variables for fractional delay line
                while (n--)
                {
                    // Write to delay line
                    double f = *in++;		// get input
                    *(bp) = f; 
                    *(bp + Properties::DELAYSIZE) = f; 

                    for (int k = 0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        reflSamps = 0.0;
                        numOfReflTimesK =  numOfRefl * k;

                        if (micGainNonZero[k])
                        { // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) 
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;

                                *(currentDelay + reflOrderIndex) += *(delGrain + reflOrderIndex);	 // TM: Changed
                                *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);

                                if (*(currentSensitivity + reflOrderIndex) != 0.0)
                                {    
                                    idelay = *(currentDelay + reflOrderIndex) + 0.5;  
                                    frac = *(currentDelay + reflOrderIndex) - (double) idelay;	// fractional part of delay value
                                    sampPos = Properties::DELAYSIZE - idelay; // was sampPos = DELAYSIZE;

                                    d = *(bp + sampPos - 3); 
                                    c = *(bp + sampPos - 2);
                                    b = *(bp + sampPos - 1);
                                    a = *(bp + sampPos); 
                                    cminusb = c - b;

                                    switch (reflNum)
                                    {   
                                        case 0:			// sum direct sound with reflections
                                            *out[k] = (*(currentSensitivity + reflOrderIndex) * (b + frac * (cminusb - 0.1666667 * (1.0 - frac) 
                                                            * ((d - a - 3.0 * cminusb) * frac + (d + 2.0 * a - 3.0 * b))))) + reflSamps;
                                            break;
                                        case 1: 	// sum 1st order reflections (potentially with 2nd order reflections)								    
                                            reflSamps += *(currentSensitivity + reflOrderIndex)
                                                * (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb)
                                                                * frac + (d + 2.0 * a - 3.0 * b))));
                                            reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                            break;	
                                        case 7:			// sum 2nd order reflections
                                            reflSamps += *(currentSensitivity + reflOrderIndex) 
                                                * (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb) 
                                                                * frac + (d + 2.0 * a - 3.0 * b))));
                                            reflSamps = walls[k][6].tick(reflSamps);
                                            break;	
                                        default:		
                                            reflSamps += *(currentSensitivity + reflOrderIndex) 
                                                * (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb) 
                                                                * frac + (d + 2.0 * a - 3.0 * b))));
                                            break;
                                    }
                                }
                                else
                                {//post("here %d",reflNum);
                                    switch (reflNum)
                                    {   
                                        case 1: 		// sum 1st order reflections (potentially with 2nd order reflections)	
                                            reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                            break;	
                                        case 7:			// sum 2nd order reflections
                                            reflSamps = walls[k][6].tick(reflSamps);
                                            break;	
                                    }

                                }
                            }
                        }
                        out[k]++;
                    }
                    bp++;
                } // end of while
                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)    //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated
                {    
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                    x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                }
            }
            else // steady state, non-fractional delay, constant values
            {
                while (n--)
                {
                    //Write to delay line
                    double f = *in++;		// get input
                    *(bp) = f; 
                    *(bp + Properties::DELAYSIZE) = f; 

                    for (int k = 0; k < numChannels; ++k)
                    {   
                        numOfReflTimesK = numOfRefl * k;
                        *out[k] = 0.0;
                        reflSamps = 0.0;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK; 
                                idelay = *(currentDelay + reflOrderIndex) +1.5; //was - 0.5; but I think that we cause a general delay of 2 samples due to the interpolation, so we have to respect that in the static method too, otherwise we will have small jumps of 2 samples back & forth

                                switch (reflNum)
                                {   
                                    case 0:
                                        *out[k] = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay) + reflSamps; 
                                        break;

                                    case 1: 									    
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                        break;

                                    case 7:
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = walls[k][6].tick(reflSamps); 
                                        break;

                                    default:		
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }

                            }
                        }
                        out[k]++;
                    }
                    bp++;
                } // end of while
            }

            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
             //NP: I think this condition has to be checked only at the end of a block (control-rate) and not at sample rate.
            else 
                x->c_phase = phase + blocksize; 

            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break;
            ////////////////////////////////////////////////////////////////////////////////
        case Properties::VIMIC_XL: // reflections are filtered
            double frontSamps, rearSamps, floorSamps, ceilSamps, filterInputSamp;
            if (GrainCounter < renderInterval) // transitional state with fractional delay and interpolated values
            {
                double a, b, c, d, cminusb; // variables for fractional delay line
                while (n--)
                {
                    double f = *in++;		// get input
                    *(bp) = f;  	          	// write to delay line
                    *(bp + Properties::DELAYSIZE) = f; 	  

                    for (int k = 0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = filterInputSamp = 0.0;
                        numOfReflTimesK = numOfRefl * k;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = maxDynRefl - 1; reflNum >=  0; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;
                                *(currentDelay + reflOrderIndex) += *(delGrain + reflOrderIndex);	 // TM: Changed
                                *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);

                                if (*(sensitivity + reflOrderIndex) != 0.0) 
                                {
                                    idelay = 0.5 + *(currentDelay + reflOrderIndex);
                                    frac = *(currentDelay + reflOrderIndex) - (double) idelay;	// fractional part of delay value
                                    sampPos = Properties::DELAYSIZE - idelay; // was sampPos = Properties::DELAYSIZE;

                                    d = *(bp + sampPos - 3); 
                                    c = *(bp + sampPos - 2);
                                    b = *(bp + sampPos - 1);
                                    a = *(bp + sampPos); 
                                    cminusb = c - b;

                                    filterInputSamp = *(currentSensitivity + reflOrderIndex) 
                                        * (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb) * frac + (d + 2.0 * a - 3.0 * b))));

                                    switch (reflNum)			// TODO: is there a cleaner and clear way of doing this that is as fast?
                                    { 
                                        case Properties::FRONT_FLOOR:
                                            floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_FLOOR:
                                            floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_FLOOR:
                                            floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FLOOR:
                                            floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                        case Properties::LEFT_CEILING:
                                            ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_CEILING:
                                            ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::FRONT_CEILING:
                                            ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_CEILING:
                                            ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                        case Properties::LEFT_FRONT:
                                            frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
                                        case Properties::RIGHT_FRONT:
                                            frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											

                                        case Properties::LEFT_REAR:
                                            rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_REAR:
                                            rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                        case Properties::AIR:
                                            *out[k] += filterInputSamp;
                                            break;

                                            //after one reflection

                                        case Properties::LEFT:// after one reflection
                                            reflSamps += walls[k][0].tick(filterInputSamp);	// write first order reflection to output [Properties::LEFT - 1]
                                            *out[k] = air[k][0].tick(reflSamps);	// reflections are filtered by air absorption LPF
                                            break;

                                        case Properties::RIGHT:
                                            reflSamps += walls[k][1].tick(filterInputSamp);	// write first order reflection to output [Properties::RIGHT - 1]
                                            break;	


                                        case Properties::FRONT:
                                            frontSamps += filterInputSamp;
                                            reflSamps += walls[k][2].tick(frontSamps);				// write reflections to output [Properties::FRONT - 1]
                                            break;

                                        case Properties::REAR:
                                            rearSamps += filterInputSamp;
                                            reflSamps += walls[k][3].tick(rearSamps);				// write reflections to output [Properties::REAR - 1]
                                            break;

                                        case Properties::FLOOR:
                                            floorSamps += filterInputSamp;
                                            reflSamps += walls[k][4].tick(floorSamps);				// write reflections to output [FLOOR - 1]
                                            break;

                                        case Properties::CEILING:
                                            ceilSamps += filterInputSamp;
                                            reflSamps += walls[k][5].tick(ceilSamps);			// write first order reflection to output [CEILING - 1]
                                            break;		
                                    }
                                }
                                else
                                {
                                    switch (reflNum)			// TODO: is there a cleaner and clear way of doing this that is as fast?
                                    { 
                                        case Properties::FRONT_FLOOR:
                                            floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_FLOOR:
                                            floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_FLOOR:
                                            floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FLOOR:
                                            floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_CEILING:
                                            ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_CEILING:
                                            ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::FRONT_CEILING:
                                            ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_CEILING:
                                            ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                        case Properties::LEFT_FRONT:
                                            frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FRONT:
                                            frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											

                                        case Properties::LEFT_REAR:
                                            rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_REAR:
                                            rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                            /*case AIR:
                                             *out[k] += filterInputSamp;
                                             break;*/

                                            //after one reflection

                                        case Properties::LEFT:// after one reflection
                                            reflSamps += walls[k][0].tick(filterInputSamp);	// write first order reflection to output [Properties::LEFT - 1]
                                            *out[k] += air[k][0].tick(reflSamps);	// reflections are filtered by air absorption LPF
                                            break;	
                                        case Properties::RIGHT:
                                            reflSamps += walls[k][1].tick(filterInputSamp);	// write first order reflection to output [Properties::RIGHT - 1]
                                            break;	


                                        case Properties::FRONT:
                                            //frontSamps += filterInputSamp;
                                            reflSamps += walls[k][2].tick(frontSamps);				// write reflections to output [Properties::FRONT - 1]
                                            break;

                                        case Properties::REAR:
                                            //rearSamps += filterInputSamp;
                                            reflSamps += walls[k][3].tick(rearSamps);				// write reflections to output [Properties::REAR - 1]
                                            break;

                                        case Properties::FLOOR:
                                            //floorSamps += filterInputSamp;
                                            reflSamps += walls[k][4].tick(floorSamps);				// write reflections to output [FLOOR - 1]
                                            break;

                                        case Properties::CEILING:
                                            //ceilSamps += filterInputSamp;
                                            reflSamps += walls[k][5].tick(ceilSamps);			// write first order reflection to output [CEILING - 1]
                                            break;		
                                    }
                                }
                            }
                        }
                        out[k]++;
                    }
                    bp++;
                } // end of while

                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)    
                {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                    x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                }
            }
            else // steady state, non-fractional delay, constant values
            {
                while (n--)
                {
                    //Write to delay line

                    double f = *in++;		// get input

                    *(bp) = f;  	          // Direct sound
                    *(bp + Properties::DELAYSIZE) = f; 	// first order reflections

                    for (int k = 0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = filterInputSamp = 0.0;
                        numOfReflTimesK =  numOfRefl * k;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= 0; --reflNum)
                            {   
                                if (reflGains[0] != 0.0 || reflGains[1] != 0.0 || reflGains[2] != 0.0) 	// 0 for direct, 1 for 1st order, 2 for snd order
                                {
                                    reflOrderIndex = reflNum + numOfReflTimesK; 
                                    idelay = *(currentDelay + reflOrderIndex) +0.5; 
                                    filterInputSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);

                                    switch (reflNum)	// TODO: is there a cleaner but also clear way of doing this that is as fast?
                                    { 
                                        case Properties::FRONT_FLOOR:
                                            floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_FLOOR:
                                            floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_FLOOR:
                                            floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FLOOR:
                                            floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_CEILING:
                                            ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_CEILING:
                                            ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::FRONT_CEILING:
                                            ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_CEILING:
                                            ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                        case Properties::LEFT_FRONT:
                                            frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
                                        case Properties::RIGHT_FRONT:
                                            frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											

                                        case Properties::LEFT_REAR:
                                            rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_REAR:
                                            rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;

                                        case Properties::AIR: 			// filtered direct sound
                                            *out[k] += filterInputSamp;
                                            break;

                                            // after one reflection
                                        case Properties::LEFT:
                                            reflSamps += walls[k][0].tick(filterInputSamp);	// sum first order reflections [Properties::LEFT - 1]
                                            *out[k] += air[k][0].tick(reflSamps);	// reflections are filtered by air absorption LPF
                                            break;	

                                        case Properties::RIGHT:
                                            reflSamps += walls[k][1].tick(filterInputSamp);	// sum first order reflections [Properties::RIGHT - 1]
                                            break;	


                                        case Properties::FRONT:
                                            frontSamps += filterInputSamp;
                                            reflSamps += walls[k][2].tick(frontSamps);				// write reflections to output [Properties::FRONT - 1]
                                            break;

                                        case Properties::REAR:
                                            rearSamps += filterInputSamp;
                                            reflSamps += walls[k][3].tick(rearSamps);				// write reflections to output [Properties::REAR - 1]
                                            break;

                                        case Properties::FLOOR:
                                            floorSamps += filterInputSamp;
                                            reflSamps += walls[k][4].tick(floorSamps);				// write reflections to output [FLOOR - 1]
                                            break;

                                        case Properties::CEILING:
                                            ceilSamps += filterInputSamp;
                                            reflSamps += walls[k][5].tick(ceilSamps);			// write first order reflection to output [CEILING - 1]
                                            break;		
                                    }
                                }
                            }
                        }
                        out[k]++;
                    }
                    bp++;
                }	// end of while


            }
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + blocksize;

            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break;
            ////////////////////////////////////////////////////////////////////////////////

        case Properties::X_FADE_LITE: // with crossfade between delay 	

            while (n--)
            {
                //Write to delay line
                double f = *in++;		// get input
                *(bp) = f; 
                *(bp + Properties::DELAYSIZE) = f; 

                if (fades->isActive()) // we're crossfading!
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        oldSamp = newSamp = 0.0;
                        *out[k] = 0.0;
                        newReflSamps = 0.0;
                        oldReflSamps= 0.0;

                        if (micGainNonZero[k])
                        {
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + maxDynRefl * k;

                                idelay = *(delay + reflOrderIndex) - 0.5; // a bit more efficient that the two lines above
                                idelayOld = *(currentDelay + reflOrderIndex) - 0.5; 

                                switch (reflNum)
                                {   
                                    // direct sound
                                    case 0:
                                        oldSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                        newSamp = *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay); 
                                        *out[k] += fades->tick(newSamp, oldSamp); // write cross fade of signals to output
                                        break;

                                        // 1st order reflections, filtered by walls and air absorption
                                    case 1: 									    
                                        oldReflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);	
                                        newReflSamps += *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);

                                        *out[k] = xfadeWalls[k][0].tick(*out[k] + fades->tick(newReflSamps, oldReflSamps));
                                        *out[k] = xfadeAir[k].tick(*out[k]);		// filter all by air filter
                                        break;

                                        // 2nd order reflections
                                    case 7:			
                                        oldReflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                        newReflSamps += *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);

                                        *out[k] = xfadeWalls[k][1].tick(fades->tick(newReflSamps, oldReflSamps));
                                        newReflSamps = 0.0;
                                        oldReflSamps = 0.0;
                                        break;

                                    default:		
                                        oldReflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                        newReflSamps += *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }
                            }
                        }
                        out[k]++;
                    }

                    fades->increment(); 	// update crossfade counters by one sample
                    // TM: Don't take anything else out of this
                    if (!fades->isActive()) // if done crossfading
                    {
                        for (int k = 0; k < numChannels; ++k)
                        {
                            numOfReflTimesK = numOfRefl * k;
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;//maxDynRefl * k;
                                *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delays and sensitivities
                                *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
                            }
                        }
                    }

                    for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)     //NP: not sure if we need this for X-fade methods...
                    {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                        x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                        x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                    }

                }
                else			// steady state, not crossfading
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        reflSamps = 0.0;
                        numOfReflTimesK =  numOfRefl * k;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)	// iterate backward through reflections, to filter
                            {   
                                reflOrderIndex = reflNum +numOfReflTimesK; 

                                // update sensitivity
                                if (GrainCounter < renderInterval)
                                    *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex); 
                                else
                                {
                                    *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delay time
                                    *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
                                }

                                idelay = *(currentDelay + reflOrderIndex) - 0.5; 

                                switch (reflNum)
                                {   
                                    case Properties::DIRECT:
                                        *out[k] = (*(currentSensitivity + reflOrderIndex) * 
                                                *(bp + Properties::DELAYSIZE - idelay)) + reflSamps; 
                                        break;
                                        // sample is filtered by first order reflection filter only and air 
                                    case 1: 									    
                                        reflSamps += (*(currentSensitivity + reflOrderIndex) * 
                                                *(bp + Properties::DELAYSIZE - idelay)); 

                                        reflSamps = xfadeWalls[k][0].tick(reflSamps);
                                        reflSamps = xfadeAir[k].tick(reflSamps);
                                        break;	

                                    case 7:	// sample is filtered by 2nd order reflection filter only
                                        reflSamps += (*(currentSensitivity + reflOrderIndex) *
                                                *(bp + Properties::DELAYSIZE - idelay)); 

                                        reflSamps = xfadeWalls[k][1].tick(reflSamps);
                                        break;	

                                    default:		
                                        reflSamps += (*(currentSensitivity + reflOrderIndex) *
                                                *(bp + Properties::DELAYSIZE - idelay)); 
                                        break;
                                } 
                            }
                        }
                        out[k]++;
                    }
                } 
                bp++;
            }	// end of while

            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + blocksize;

            if (x->grainCounter < renderInterval)
                x->grainCounter++; 

            break;

            /********************************************************************************************************************************************************************/
            /********************************************************************************************************************************************************************/
        case Properties::X_FADE_XL: // with crossfade between delay, independent filtering for each wall 	
            double oldFilterInputSamp, newFilterInputSamp;

            while (n--)
            {
                //Write to delay line
                double f = *in++;		// get input
                *(bp) = f; 
                *(bp + Properties::DELAYSIZE) = f; 

                if (fades->isActive()) // we're crossfading!
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        oldFilterInputSamp = newFilterInputSamp = 0.0;
                        frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = 0.0;
                        *out[k] = 0.0;
                        numOfReflTimesK = numOfRefl * k;

                        if (micGainNonZero[k])
                        {
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum)// TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;
                                idelay = *(delay + reflOrderIndex) - 0.5; // a bit more efficient that the two lines above
                                idelayOld = *(currentDelay + reflOrderIndex) - 0.5; 

                                oldFilterInputSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                newFilterInputSamp = *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);

                                switch (reflNum)
                                {   
                                    case Properties::FRONT_FLOOR:
                                        floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::REAR_FLOOR:
                                        floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::LEFT_FLOOR:
                                        floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::RIGHT_FLOOR:
                                        floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;

                                    case Properties::LEFT_CEILING:
                                        ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::RIGHT_CEILING:
                                        ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::FRONT_CEILING:
                                        ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::REAR_CEILING:
                                        ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;

                                    case Properties::LEFT_FRONT:
                                        frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;											
                                    case Properties::RIGHT_FRONT:
                                        frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;											

                                    case Properties::LEFT_REAR:
                                        rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::RIGHT_REAR:
                                        rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;

                                        // direct sound
                                    case Properties::AIR:
                                        *out[k] +=fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        break;

                                    case Properties::LEFT: 									    
                                        reflSamps = walls[k][Properties::LEFT - 1].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        *out[k] = walls[k][0].tick(reflSamps);	// apply air filter at this last stage
                                        break;

                                    case Properties::RIGHT: 									    
                                        reflSamps += walls[k][Properties::RIGHT - 1].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;

                                    case Properties::FRONT:
                                        frontSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::FRONT - 1].tick(frontSamps);
                                        break;

                                    case Properties::REAR:
                                        rearSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::REAR - 1].tick(rearSamps);
                                        break;

                                    case Properties::FLOOR:
                                        floorSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::FLOOR - 1].tick(floorSamps);
                                        break;

                                    case Properties::CEILING:
                                        ceilSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::CEILING - 1].tick(ceilSamps);
                                        break;		
                                }
                            }
                        }
                        out[k]++;
                    }

                    fades->increment(); 	// update crossfade counters by one sample

                    // TM: Don't take anything else out of this
                    if (!fades->isActive()) // if done crossfading
                    {
                        for (int k = 0; k < numChannels; ++k)
                        {
                            numOfReflTimesK = numOfRefl * k;
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;//maxDynRefl * k;
                                *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delays and sensitivities
                                *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);

                            }
                        }
                    }

                    for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)     //NP: not sure if we need this for X-fade methods...
                    {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                        x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                        x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                    }
                }
                else			// steady state, not crossfading
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        reflSamps = 0.0;
                        frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = filterInputSamp = 0.0;
                        numOfReflTimesK = numOfRefl * k;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)	// iterate backward through reflections, to filter
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK; 

                                // update sensitivity
                                if (GrainCounter < renderInterval)
                                    *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex); 
                                else
                                {
                                    *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
                                    *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delay time
                                }

                                idelay = *(currentDelay + reflOrderIndex) - 0.5; 
                                filterInputSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);

                                switch (reflNum)	// TODO: is there a cleaner but also clear way of doing this that is as fast?
                                { 
                                    case Properties::FRONT_FLOOR:
                                        floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::REAR_FLOOR:
                                        floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::LEFT_FLOOR:
                                        floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::RIGHT_FLOOR:
                                        floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;

                                    case Properties::LEFT_CEILING:
                                        ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::RIGHT_CEILING:
                                        ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::FRONT_CEILING:
                                        ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::REAR_CEILING:
                                        ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                        break;

                                    case Properties::LEFT_FRONT:
                                        frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;											
                                    case Properties::RIGHT_FRONT:
                                        frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;											

                                    case Properties::LEFT_REAR:
                                        rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::RIGHT_REAR:
                                        rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;

                                    case Properties::DIRECT: 			// filtered direct sound
                                        *out[k] += filterInputSamp;
                                        break;

                                        // after one reflection
                                    case Properties::LEFT:
                                        reflSamps += walls[k][Properties::LEFT - 1].tick(filterInputSamp);	// sum first order reflections
                                        *out[k] = air[k][0].tick(reflSamps);
                                        break;

                                    case Properties::RIGHT:
                                        reflSamps += walls[k][Properties::RIGHT - 1].tick(filterInputSamp);	// sum first order reflections
                                        break;	

                                    case Properties::FRONT:
                                        frontSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::FRONT - 1].tick(frontSamps);				// write reflections to output
                                        break;

                                    case Properties::REAR:
                                        rearSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::REAR - 1].tick(rearSamps);				// write reflections to output
                                        break;

                                    case Properties::FLOOR:
                                        floorSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::FLOOR - 1].tick(floorSamps);				// write reflections to output
                                        break;

                                    case Properties::CEILING:
                                        ceilSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::CEILING - 1].tick(ceilSamps);			// write first order reflection to output
                                        break;		
                                }
                            }
                        }
                        out[k]++;
                    }
                } 
                bp++;
            }	// end of while

            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + blocksize; 
            if (x->grainCounter < renderInterval)
                x->grainCounter++; 
            break;

            /* 						END OF X_FADE_XL												    */
            /********************************************************************************************************************************************************************/
            /********************************************************************************************************************************************************************/

        case Properties::AMP_PAN: // amplitude panning only	
            if (GrainCounter < renderInterval)
            {
                while (n--)
                {
                    //Write to delay line
                    double f = *in++;		// get input
                    *(bp) = f; 
                    *(bp + Properties::DELAYSIZE) = f; 

                    for (int k = 0; k < numChannels; ++k)
                    {   
                        *out[k] = 0.0;
                        if (micGainNonZero[k])
                        {   
                            reflOrderIndex = numOfRefl * k;
                            *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);
                            *out[k] = (*(currentSensitivity + reflOrderIndex) * f);
                        }
                        out[k]++;
                    }
				bp++;
                } // end of while
                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)     //NP: not sure if we need this for X-fade methods...
                {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                }
				
            }
            else
            {
                while (n--)
                {
                    //Write to delay line
                    double f = *in++;		// get input
                    *(bp) = f; 
                    *(bp + Properties::DELAYSIZE) = f; 
					
                    for (int k = 0; k < numChannels; ++k)
                    {
                        if (micGainNonZero[k])// && reflGains[0] != 0.0)
                            *out[k] = (*(currentSensitivity + numOfRefl * k) * f);
                        else 
                            *out[k] = 0.0;
						out[k]++;
                    }
				bp++;
                } // end of while
            } 
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break; 
            ////////////////////////////////////////////////////////////////////////////////
        case Properties::STATIC:		// Nothing moves, only integer delays
            if (GrainCounter < renderInterval)
            {
                while (n--)
                {
                    //Write to delay line
                    double f = *in++;		// get input
                    *(bp) = f; 
                    *(bp + Properties::DELAYSIZE) = f; 

                    for (int k = 0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        reflSamps = 0.0; 
                        numOfReflTimesK =  numOfRefl * k; 

                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK;
                                *(currentDelay + reflOrderIndex) += *(delGrain + reflOrderIndex);	 // TM: Changed
                                *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);
                                idelay = *(currentDelay + reflOrderIndex) - 0.5;

                                switch (reflNum)
                                {   
                                    case 0:
                                        *out[k] = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay) + reflSamps; 
                                        break;

                                    case 1: 									    
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                        break;

                                    case 7:
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = walls[k][6].tick(reflSamps); 
                                        break;

                                    default:		
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }
                            }
                        }			
                        out[k]++;
                    }
                    bp++;
                } // end of while

                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)    
                {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                    x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                }

            }
            else	// steady state
            {
                while (n--)
                {
                    //Write to delay line
                    double f = *in++;		// get input
                    *(bp) = f; 
                    *(bp + Properties::DELAYSIZE) = f; 

                    for (int k=0; k < numChannels; ++k)
                    {
                        *out[k] = 0.0;
                        reflSamps = 0.0; 
                        numOfReflTimesK =  numOfRefl * k; 

                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK; 
                                idelay = *(currentDelay + reflOrderIndex) - 0.5;

                                switch (reflNum)
                                {   
                                    case 0:
                                        *out[k] = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay) + reflSamps; 
                                        break;

                                    case 1: 									    
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                        break;

                                    case 7:
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = walls[k][6].tick(reflSamps); 
                                        break;

                                    default:		
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }
                            }
                        }
                        out[k]++;
                    }
                    bp++;
                } // end of while
            }
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + blocksize;
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break;
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        case Properties::NONE: // no audio
            while (n--)
            {				
                //Write to delay line so that the internal buffer doesn't contain crap if the rendermode changes
                double f = *in++;		// get input
                *(bp) = f; 
                *(bp + Properties::DELAYSIZE) = f; 

                for (int k = 0; k < numChannels; ++k)
                    *out[k]++ = 0.0;
                bp++;
            }
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + blocksize;
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break; 
    }
    return (w + 4 + numChannels);
}

#pragma warning(pop)

void vimic_dsp(t_vimic *x, t_signal **sp, short *count)
{
    // clear out the delay line
    for (int n = 0; n < Properties::DELAYBYTES; n++)
        x->c_vec[n] = 0.0;

    if (x->x_sr != (double)sp[0]->s_sr)
    {
        x->x_sr = (double) sp[0]->s_sr;
        x->speedOfSound = (331.3 * sqrt(1.0 + x->temperature / 273.15)) / x->x_sr;
        x->invSpeedOfSound = 1.0 / x->speedOfSound;
    }

    // sp[0]->s_n  is the vector size
    if (x->blocksize != (int)sp[0]->s_n)
    {
        x->blocksize = (int)sp[0]->s_n;
        //post("Grainsize was %f", x->grainsize);
        x->grainsize = 1.0 / (x->blocksize * x->renderInterval);
        //post("Grainsize is now %f", x->grainsize);
        //post("blocksize is now %d", (int)sp[0]->s_n);
    }

    short num_args = x->numOfChannels + 3;

    if (num_args < 4 || num_args > 147) 
        post( "jcom.vimic~ : Combination of Reflection Order and Channels not supported" );

    t_int **vec = (t_int **) getbytes(sizeof(t_int *) * num_args);	// vector of pointers

    vec[0] = (t_int *)x;	// first arg is x struct pointer
    int i;
    for (i = 0; i < num_args - 2; i++)
        vec[i + 1] = (t_int *) sp[i]->s_vec;

    vec[i + 1] = (t_int *) sp[0]->s_n;	// last arg = sp[0]->s_n is signal vector size

    dsp_addv(vimic_perform, num_args, (void **)vec);

    freebytes(vec, sizeof(t_int *) * num_args);		// deallocate vector of pointers
}

void vimic_assist(t_vimic *x, Object *b, long msg, long arg, char *s)  
{ 
    // copy the appropriate message to the destination string 
    if (msg == ASSIST_INLET)  
    { 
        switch (arg) 
        { 
            case 0: 
                snprintf(s, 256, "%s", "Bang, anything, direct sound"); 
                break; 
                /*case 1: 
                  sprintf(s, "%s", "1st order refl.");
                  break;
                  case 2: 
                  sprintf(s, "%s", "2nd order refl.");
                  break;
                  case 3: 
                  sprintf(s, "%s", "3rd order refl.");
                  break; */ 
        }
    } 
    else if (msg == ASSIST_OUTLET)
        snprintf(s, 256, "%s %ld", "Output", arg + 1); 
}

void vimic_perform64(t_vimic *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	int numChannels = x->numOfChannels;   
    bool micGainNonZero[Properties::MAXNUMCHANNELS];
	
    int phase = x->c_phase;
    int renderInterval = x->renderInterval;
    int GrainCounter = x->grainCounter;
    int numOfRefl = x->numRefl;
    int maxDynRefl = x->maxDynRefl;
    int reflOrderIndex = 0;
    
	double *reflGains = x->reflGains;
    double *currentDelay = x->currentDelay;
    double *currentSensitivity = x->currentSensitivity;
    double *delGrain = x->delGrain;
    double *sensiGrain = x->sensiGrain;
    double *bp = x->c_vec + phase;
    double *ep = x->c_vec + Properties::DELAYSIZE;
	double *delay = x->delay;		
    double *sensitivity = x->sensitivity;
    
    double frac;
    int idelay, idelayOld;
    double newSamp, oldSamp, newReflSamps, oldReflSamps, reflSamps = 0.0;
    
	int sampPos = 0;
    
	int numwallsMinusOne = Properties::NUMWALLS - 1;  //optimization
    int numOfReflTimesK;
    
	HiMidLow **walls = x->room->walls;
    LowPass **air = x->room->air;
	
    // for Xfade
    HiMidLow **xfadeWalls = x->room->xfadeWalls;
    LowPass *xfadeAir = x->room->xfadeAir;	
    CrossFadeQueue *fades = x->fades;
	
	// variables for fractional delay lines
	double a, b, c, d, cminusb; 
	
    for (int i = 0; i < numChannels; ++i)
    {
        if (x->room->mics[i].gain() != 0.0)
            micGainNonZero[i] = true;
        else
            micGainNonZero[i] = false;
    }
	
	//copying input to delayline
	memcpy(bp, ins[0], sizeof(double) * sampleframes);
	memcpy((bp + Properties::DELAYSIZE), ins[0], sizeof(double) * sampleframes);
	
    switch (x->AudioProcType)
    {
        case Properties::VIMIC_LITE: // ViMiC wtih reduced Filtering			
			
            if (GrainCounter < renderInterval) {				
				for (int k = 0; k < numChannels; ++k) {
					memset(outs[k], 0, sizeof(double) * sampleframes);            
					numOfReflTimesK =  numOfRefl * k;
					if (micGainNonZero[k]) {
						for (int n=0 ; n < sampleframes; n++) {
							reflSamps  = 0.0;						
                         // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) {
								reflOrderIndex = reflNum + numOfReflTimesK;								
                                *(currentDelay + reflOrderIndex) += *(delGrain + reflOrderIndex);	 // TM: Changed
                                *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);								
                                if (*(currentSensitivity + reflOrderIndex) != 0.0) {
                                    idelay = *(currentDelay + reflOrderIndex) + 0.5;  
                                    frac = *(currentDelay + reflOrderIndex) - (double) idelay;	// fractional part of delay value
                                    sampPos = Properties::DELAYSIZE - idelay + n; 
									
                                    d = *(bp + sampPos - 3); 
                                    c = *(bp + sampPos - 2);
                                    b = *(bp + sampPos - 1);
                                    a = *(bp + sampPos); 
                                    cminusb = c - b;
									
                                    switch (reflNum){
                                        case 0:			// sum direct sound with reflections
                                            outs[k][n] = (*(currentSensitivity + reflOrderIndex) * (b + frac * (cminusb - 0.1666667 * (1.0 - frac) 
																											 * ((d - a - 3.0 * cminusb) * frac + (d + 2.0 * a - 3.0 * b))))) + reflSamps;
                                            break;
                                        case 1: 	// sum 1st order reflections (potentially with 2nd order reflections)								    
                                            reflSamps += *(currentSensitivity + reflOrderIndex)
											* (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb)
																								 * frac + (d + 2.0 * a - 3.0 * b))));
                                            reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                            break;	
                                        case 7:			// sum 2nd order reflections
                                            reflSamps += *(currentSensitivity + reflOrderIndex) 
											* (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb) 
																								 * frac + (d + 2.0 * a - 3.0 * b))));
                                            reflSamps = walls[k][6].tick(reflSamps);
                                            break;	
                                        default:		
                                            reflSamps += *(currentSensitivity + reflOrderIndex) 
											* (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb) 
																								 * frac + (d + 2.0 * a - 3.0 * b))));
                                            break;
                                    }
                                }
                                else {
									switch (reflNum) {
                                        case 1: 		// sum 1st order reflections (potentially with 2nd order reflections)	
                                            reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                            break;	
                                        case 7:			// sum 2nd order reflections
                                            reflSamps = walls[k][6].tick(reflSamps);
                                            break;	
                                    }									
                                }
                            }
                        }                        
                    }                    
                } 
				bp += sampleframes; 
                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum) {
					//We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated 
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                    x->currentDelay[reflNum] =  *(currentDelay + reflNum); 					
                }
            }
            else { // steady state, non-fractional delay, constant values
				for (int k = 0; k < numChannels; ++k) {
					memset(outs[k], 0, sizeof(double) * sampleframes);
					numOfReflTimesK = numOfRefl * k;
					if (micGainNonZero[k]) {
						for (int n=0 ; n < sampleframes; n++) {							 
							reflSamps = 0.0;                   
							sampPos = n + Properties::DELAYSIZE;
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum){
								reflOrderIndex = reflNum + numOfReflTimesK; 
                                idelay = *(currentDelay + reflOrderIndex) +1.5; //was - 0.5; but I think that we cause a general delay of 2 samples due to the interpolation, so we have to respect that in the static method too, otherwise we will have small jumps of 2 samples back & forth
								
                                switch (reflNum){
                                    case 0:
                                        outs[k][n] = *(currentSensitivity + reflOrderIndex) * *(bp+ sampPos - idelay) + reflSamps; 
                                        break;
										
                                    case 1: 									    
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp+sampPos - idelay);
                                        reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                        break;
										
                                    case 7:
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp+sampPos - idelay);
                                        reflSamps = walls[k][6].tick(reflSamps); 
                                        break;
										
                                    default:		
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp+sampPos - idelay);
                                        break;
                                }								
                            }
                        }                       
                    }
                } 
				bp += sampleframes;
            }
			
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes; 
			
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break;
            ////////////////////////////////////////////////////////////////////////////////
		case Properties::VIMIC_XL: // reflections are filtered
            double frontSamps, rearSamps, floorSamps, ceilSamps, filterInputSamp;
            if (GrainCounter < renderInterval) { // transitional state with fractional delay and interpolated values                
				for (int k = 0; k < numChannels; ++k) {
					memset(outs[k],0 , sizeof(double)*sampleframes);
					if (micGainNonZero[k]) {
	                    numOfReflTimesK = numOfRefl * k;
						for (int n=0 ; n < sampleframes; n++) {					
							frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = filterInputSamp = 0.0;
                            for (int reflNum = maxDynRefl - 1; reflNum >=  0; --reflNum){ // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?                            
                                reflOrderIndex = reflNum + numOfReflTimesK;
                                *(currentDelay + reflOrderIndex) += *(delGrain + reflOrderIndex);	 // TM: Changed
                                *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);
								
                                if (*(sensitivity + reflOrderIndex) != 0.0){ 
                                    idelay = 0.5 + *(currentDelay + reflOrderIndex);
                                    frac = *(currentDelay + reflOrderIndex) - (double) idelay;	// fractional part of delay value
                                    sampPos = Properties::DELAYSIZE - idelay + n;
									
                                    d = *(bp + sampPos - 3); 
                                    c = *(bp + sampPos - 2);
                                    b = *(bp + sampPos - 1);
                                    a = *(bp + sampPos); 
                                    cminusb = c - b;
									
                                    filterInputSamp = *(currentSensitivity + reflOrderIndex) 
									* (b + frac * (cminusb - 0.1666667 * (1.0 - frac) * ((d - a - 3.0 * cminusb) * frac + (d + 2.0 * a - 3.0 * b))));
									
                                    switch (reflNum)			// TODO: is there a cleaner and clear way of doing this that is as fast?
                                    { 
                                        case Properties::FRONT_FLOOR:
                                            floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_FLOOR:
                                            floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_FLOOR:
                                            floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FLOOR:
                                            floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                        case Properties::LEFT_CEILING:
                                            ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_CEILING:
                                            ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::FRONT_CEILING:
                                            ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_CEILING:
                                            ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                        case Properties::LEFT_FRONT:
                                            frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
                                        case Properties::RIGHT_FRONT:
                                            frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
											
                                        case Properties::LEFT_REAR:
                                            rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_REAR:
                                            rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                        case Properties::AIR:
                                            outs[k][n] += filterInputSamp;
                                            break;
											
                                            //after one reflection
											
                                        case Properties::LEFT:// after one reflection
                                            reflSamps += walls[k][0].tick(filterInputSamp);	// write first order reflection to output [Properties::LEFT - 1]
                                            outs[k][n] = air[k][0].tick(reflSamps);	// reflections are filtered by air absorption LPF
                                            break;
											
                                        case Properties::RIGHT:
                                            reflSamps += walls[k][1].tick(filterInputSamp);	// write first order reflection to output [Properties::RIGHT - 1]
                                            break;	
											
											
                                        case Properties::FRONT:
                                            frontSamps += filterInputSamp;
                                            reflSamps += walls[k][2].tick(frontSamps);				// write reflections to output [Properties::FRONT - 1]
                                            break;
											
                                        case Properties::REAR:
                                            rearSamps += filterInputSamp;
                                            reflSamps += walls[k][3].tick(rearSamps);				// write reflections to output [Properties::REAR - 1]
                                            break;
											
                                        case Properties::FLOOR:
                                            floorSamps += filterInputSamp;
                                            reflSamps += walls[k][4].tick(floorSamps);				// write reflections to output [FLOOR - 1]
                                            break;
											
                                        case Properties::CEILING:
                                            ceilSamps += filterInputSamp;
                                            reflSamps += walls[k][5].tick(ceilSamps);			// write first order reflection to output [CEILING - 1]
                                            break;		
                                    }
                                }
                                else
                                {
                                    switch (reflNum) {			// TODO: is there a cleaner and clear way of doing this that is as fast?
                                        case Properties::FRONT_FLOOR:
                                            floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_FLOOR:
                                            floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_FLOOR:
                                            floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FLOOR:
                                            floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_CEILING:
                                            ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_CEILING:
                                            ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::FRONT_CEILING:
                                            ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_CEILING:
                                            ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                        case Properties::LEFT_FRONT:
                                            frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FRONT:
                                            frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
											
                                        case Properties::LEFT_REAR:
                                            rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_REAR:
                                            rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                            /*case AIR:
                                             *out[k] += filterInputSamp;
                                             break;*/
											
                                            //after one reflection
											
                                        case Properties::LEFT:// after one reflection
                                            reflSamps += walls[k][0].tick(filterInputSamp);	// write first order reflection to output [Properties::LEFT - 1]
                                            outs[k][n] += air[k][0].tick(reflSamps);	// reflections are filtered by air absorption LPF
                                            break;	
                                        case Properties::RIGHT:
                                            reflSamps += walls[k][1].tick(filterInputSamp);	// write first order reflection to output [Properties::RIGHT - 1]
                                            break;	
											
											
                                        case Properties::FRONT:
                                            //frontSamps += filterInputSamp;
                                            reflSamps += walls[k][2].tick(frontSamps);				// write reflections to output [Properties::FRONT - 1]
                                            break;
											
                                        case Properties::REAR:
                                            //rearSamps += filterInputSamp;
                                            reflSamps += walls[k][3].tick(rearSamps);				// write reflections to output [Properties::REAR - 1]
                                            break;
											
                                        case Properties::FLOOR:
                                            //floorSamps += filterInputSamp;
                                            reflSamps += walls[k][4].tick(floorSamps);				// write reflections to output [FLOOR - 1]
                                            break;
											
                                        case Properties::CEILING:
                                            //ceilSamps += filterInputSamp;
                                            reflSamps += walls[k][5].tick(ceilSamps);			// write first order reflection to output [CEILING - 1]
                                            break;		
                                    }
                                }
                            }
                        }                        
                    }                 
                }				
                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum) {   
					//We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                    x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
				}
			}
            else // steady state, non-fractional delay, constant values
            {
				for (int k = 0; k < numChannels; ++k){
					memset(outs[k], 0, sizeof(double)*sampleframes);
                    if (micGainNonZero[k]) {
						numOfReflTimesK =  numOfRefl * k;
						for (int n=0 ; n < sampleframes; n++){
							frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = filterInputSamp = 0.0;
                            for (int reflNum = numOfRefl - 1; reflNum >= 0; --reflNum)
                            {   
                                if (reflGains[0] != 0.0 || reflGains[1] != 0.0 || reflGains[2] != 0.0) 	// 0 for direct, 1 for 1st order, 2 for snd order
                                {
                                    reflOrderIndex = reflNum + numOfReflTimesK; 
                                    idelay = *(currentDelay + reflOrderIndex) +0.5; 
                                    filterInputSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay + n);
									
                                    switch (reflNum)	// TODO: is there a cleaner but also clear way of doing this that is as fast?
                                    { 
                                        case Properties::FRONT_FLOOR:
                                            floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_FLOOR:
                                            floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_FLOOR:
                                            floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_FLOOR:
                                            floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::LEFT_CEILING:
                                            ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_CEILING:
                                            ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::FRONT_CEILING:
                                            ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::REAR_CEILING:
                                            ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                        case Properties::LEFT_FRONT:
                                            frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
                                        case Properties::RIGHT_FRONT:
                                            frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;											
											
                                        case Properties::LEFT_REAR:
                                            rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
                                        case Properties::RIGHT_REAR:
                                            rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                            break;
											
                                        case Properties::AIR: 			// filtered direct sound
                                            outs[k][n] += filterInputSamp;
                                            break;
											
                                            // after one reflection
                                        case Properties::LEFT:
                                            reflSamps += walls[k][0].tick(filterInputSamp);	// sum first order reflections [Properties::LEFT - 1]
                                            outs[k][n] += air[k][0].tick(reflSamps);	// reflections are filtered by air absorption LPF
                                            break;	
											
                                        case Properties::RIGHT:
                                            reflSamps += walls[k][1].tick(filterInputSamp);	// sum first order reflections [Properties::RIGHT - 1]
                                            break;	
											
											
                                        case Properties::FRONT:
                                            frontSamps += filterInputSamp;
                                            reflSamps += walls[k][2].tick(frontSamps);				// write reflections to output [Properties::FRONT - 1]
                                            break;
											
                                        case Properties::REAR:
                                            rearSamps += filterInputSamp;
                                            reflSamps += walls[k][3].tick(rearSamps);				// write reflections to output [Properties::REAR - 1]
                                            break;
											
                                        case Properties::FLOOR:
                                            floorSamps += filterInputSamp;
                                            reflSamps += walls[k][4].tick(floorSamps);				// write reflections to output [FLOOR - 1]
                                            break;
											
                                        case Properties::CEILING:
                                            ceilSamps += filterInputSamp;
                                            reflSamps += walls[k][5].tick(ceilSamps);			// write first order reflection to output [CEILING - 1]
                                            break;		
                                    }
                                }
                            }
                        }                        
                    }                    
                }	// end of while				
            }
			bp += sampleframes;	
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes;
			
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break;
            ////////////////////////////////////////////////////////////////////////////////
			
		case Properties::X_FADE_LITE: // with crossfade between delay 	
			
            for (int n=0 ; n < sampleframes; n++)
            {
                if (fades->isActive()) // we're crossfading!
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        oldSamp = newSamp = 0.0;
                        outs[k][n] = 0.0;
                        newReflSamps = 0.0;
                        oldReflSamps= 0.0;
						
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + maxDynRefl * k;
								
                                idelay = *(delay + reflOrderIndex) - 0.5; 
                                idelayOld = *(currentDelay + reflOrderIndex) - 0.5; 
								
                                switch (reflNum)
                                {   
										// direct sound
                                    case 0:
                                        oldSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                        newSamp = *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay); 
                                        outs[k][n] += fades->tick(newSamp, oldSamp); // write cross fade of signals to output
                                        break;
										
                                        // 1st order reflections, filtered by walls and air absorption
                                    case 1: 									    
                                        oldReflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);	
                                        newReflSamps += *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
										
                                        outs[k][n] = xfadeWalls[k][0].tick(outs[k][n] + fades->tick(newReflSamps, oldReflSamps));
                                        outs[k][n] = xfadeAir[k].tick(outs[k][n]);		// filter all by air filter
                                        break;
										
                                        // 2nd order reflections
                                    case 7:			
                                        oldReflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                        newReflSamps += *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
										
                                        outs[k][n] = xfadeWalls[k][1].tick(fades->tick(newReflSamps, oldReflSamps));
                                        newReflSamps = 0.0;
                                        oldReflSamps = 0.0;
                                        break;
										
                                    default:		
                                        oldReflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                        newReflSamps += *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }
                            }
                        }                       
                    }
					
                    fades->increment(); 	// update crossfade counters by one sample
                    // TM: Don't take anything else out of this
                    if (!fades->isActive()) // if done crossfading
                    {
                        for (int k = 0; k < numChannels; ++k)
                        {
                            numOfReflTimesK = numOfRefl * k;
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;//maxDynRefl * k;
                                *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delays and sensitivities
                                *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
                            }
                        }
                    }
					
                    for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)     //NP: not sure if we need this for X-fade methods...
                    {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                        x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                        x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                    }
					
                }
                else			// steady state, not crossfading
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        outs[k][n] = 0.0;
                        reflSamps = 0.0;
                        numOfReflTimesK =  numOfRefl * k;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)	// iterate backward through reflections, to filter
                            {   
                                reflOrderIndex = reflNum +numOfReflTimesK; 
								
                                // update sensitivity
                                if (GrainCounter < renderInterval)
                                    *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex); 
                                else
                                {
                                    *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delay time
                                    *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
                                }
								
                                idelay = *(currentDelay + reflOrderIndex) - 0.5; 
								
                                switch (reflNum)
                                {   
                                    case Properties::DIRECT:
                                        outs[k][n] = (*(currentSensitivity + reflOrderIndex) * 
												   *(bp + Properties::DELAYSIZE - idelay)) + reflSamps; 
                                        break;
                                        // sample is filtered by first order reflection filter only and air 
                                    case 1: 									    
                                        reflSamps += (*(currentSensitivity + reflOrderIndex) * 
													  *(bp + Properties::DELAYSIZE - idelay)); 
										
                                        reflSamps = xfadeWalls[k][0].tick(reflSamps);
                                        reflSamps = xfadeAir[k].tick(reflSamps);
                                        break;	
										
                                    case 7:	// sample is filtered by 2nd order reflection filter only
                                        reflSamps += (*(currentSensitivity + reflOrderIndex) *
													  *(bp + Properties::DELAYSIZE - idelay)); 
										
                                        reflSamps = xfadeWalls[k][1].tick(reflSamps);
                                        break;	
										
                                    default:		
                                        reflSamps += (*(currentSensitivity + reflOrderIndex) *
													  *(bp + Properties::DELAYSIZE - idelay)); 
                                        break;
                                } 
                            }
                        }                        
                    }
                } 
                bp++;
            }	// end of while
			
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes;
			
            if (x->grainCounter < renderInterval)
                x->grainCounter++; 
			
            break;
/************************************************************************************************/
		case Properties::X_FADE_XL: // with crossfade between delay, independent filtering for each wall 	
            double oldFilterInputSamp, newFilterInputSamp;
			
            for (int n=0 ; n < sampleframes; n++)
            {	
                if (fades->isActive()) // we're crossfading!
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        oldFilterInputSamp = newFilterInputSamp = 0.0;
                        frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = 0.0;
                        outs[k][n] = 0.0;
                        numOfReflTimesK = numOfRefl * k;
						
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum)// TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;
                                idelay = *(delay + reflOrderIndex) - 0.5; // a bit more efficient that the two lines above
                                idelayOld = *(currentDelay + reflOrderIndex) - 0.5; 
								
                                oldFilterInputSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelayOld);
                                newFilterInputSamp = *(sensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
								
                                switch (reflNum)
                                {   
                                    case Properties::FRONT_FLOOR:
                                        floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::REAR_FLOOR:
                                        floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::LEFT_FLOOR:
                                        floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::RIGHT_FLOOR:
                                        floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
										
                                    case Properties::LEFT_CEILING:
                                        ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::RIGHT_CEILING:
                                        ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::FRONT_CEILING:
                                        ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::REAR_CEILING:
                                        ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
										
                                    case Properties::LEFT_FRONT:
                                        frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;											
                                    case Properties::RIGHT_FRONT:
                                        frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;											
										
                                    case Properties::LEFT_REAR:
                                        rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
                                    case Properties::RIGHT_REAR:
                                        rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
										
                                        // direct sound
                                    case Properties::AIR:
                                        outs[k][n] +=fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        break;
										
                                    case Properties::LEFT: 									    
                                        reflSamps = walls[k][Properties::LEFT - 1].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        outs[k][n] = walls[k][0].tick(reflSamps);	// apply air filter at this last stage
                                        break;
										
                                    case Properties::RIGHT: 									    
                                        reflSamps += walls[k][Properties::RIGHT - 1].tick(fades->tick(newFilterInputSamp, oldFilterInputSamp));
                                        break;
										
                                    case Properties::FRONT:
                                        frontSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::FRONT - 1].tick(frontSamps);
                                        break;
										
                                    case Properties::REAR:
                                        rearSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::REAR - 1].tick(rearSamps);
                                        break;
										
                                    case Properties::FLOOR:
                                        floorSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::FLOOR - 1].tick(floorSamps);
                                        break;
										
                                    case Properties::CEILING:
                                        ceilSamps += fades->tick(newFilterInputSamp, oldFilterInputSamp);
                                        reflSamps += walls[k][Properties::CEILING - 1].tick(ceilSamps);
                                        break;		
                                }
                            }
                        }                        
                    }
					
                    fades->increment(); 	// update crossfade counters by one sample
					
                    // TM: Don't take anything else out of this
                    if (!fades->isActive()) // if done crossfading
                    {
                        for (int k = 0; k < numChannels; ++k)
                        {
                            numOfReflTimesK = numOfRefl * k;
                            for (int reflNum = maxDynRefl - 1; reflNum >= Properties::DIRECT; --reflNum) // TM: if x->maxDynRefl is always same as x->numRefl, why is it necessary?
                            {
                                reflOrderIndex = reflNum + numOfReflTimesK;//maxDynRefl * k;
                                *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delays and sensitivities
                                *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
								
                            }
                        }
                    }
					
                    for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)     //NP: not sure if we need this for X-fade methods...
                    {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                        x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                        x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                    }
                }
                else			// steady state, not crossfading
                {
                    for (int k = 0; k < numChannels; ++k)
                    {
                        outs[k][n] = 0.0;
                        reflSamps = 0.0;
                        frontSamps = rearSamps = floorSamps = ceilSamps = reflSamps = filterInputSamp = 0.0;
                        numOfReflTimesK = numOfRefl * k;
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)	// iterate backward through reflections, to filter
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK; 
								
                                // update sensitivity
                                if (GrainCounter < renderInterval)
                                    *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex); 
                                else
                                {
                                    *(currentSensitivity + reflOrderIndex) = *(sensitivity + reflOrderIndex);
                                    *(currentDelay + reflOrderIndex) = *(delay + reflOrderIndex);	 // Update delay time
                                }
								
                                idelay = *(currentDelay + reflOrderIndex) - 0.5; 
                                filterInputSamp = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
								
                                switch (reflNum)	// TODO: is there a cleaner but also clear way of doing this that is as fast?
                                { 
                                    case Properties::FRONT_FLOOR:
                                        floorSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::REAR_FLOOR:
                                        floorSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::LEFT_FLOOR:
                                        floorSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::RIGHT_FLOOR:
                                        floorSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
										
                                    case Properties::LEFT_CEILING:
                                        ceilSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::RIGHT_CEILING:
                                        ceilSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::FRONT_CEILING:
                                        ceilSamps += walls[k][Properties::FRONT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::REAR_CEILING:
                                        ceilSamps += walls[k][Properties::REAR + numwallsMinusOne].tick(filterInputSamp);
                                        break;
										
                                    case Properties::LEFT_FRONT:
                                        frontSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;											
                                    case Properties::RIGHT_FRONT:
                                        frontSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;											
										
                                    case Properties::LEFT_REAR:
                                        rearSamps += walls[k][Properties::LEFT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
                                    case Properties::RIGHT_REAR:
                                        rearSamps += walls[k][Properties::RIGHT + numwallsMinusOne].tick(filterInputSamp);
                                        break;
										
                                    case Properties::DIRECT: 			// filtered direct sound
                                        outs[k][n] += filterInputSamp;
                                        break;
										
                                        // after one reflection
                                    case Properties::LEFT:
                                        reflSamps += walls[k][Properties::LEFT - 1].tick(filterInputSamp);	// sum first order reflections
                                        outs[k][n] = air[k][0].tick(reflSamps);
                                        break;
										
                                    case Properties::RIGHT:
                                        reflSamps += walls[k][Properties::RIGHT - 1].tick(filterInputSamp);	// sum first order reflections
                                        break;	
										
                                    case Properties::FRONT:
                                        frontSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::FRONT - 1].tick(frontSamps);				// write reflections to output
                                        break;
										
                                    case Properties::REAR:
                                        rearSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::REAR - 1].tick(rearSamps);				// write reflections to output
                                        break;
										
                                    case Properties::FLOOR:
                                        floorSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::FLOOR - 1].tick(floorSamps);				// write reflections to output
                                        break;
										
                                    case Properties::CEILING:
                                        ceilSamps += filterInputSamp;
                                        reflSamps += walls[k][Properties::CEILING - 1].tick(ceilSamps);			// write first order reflection to output
                                        break;		
                                }
                            }
                        }                        
                    }
                } 
                bp++;
            }	// end of while
			
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes; 
            if (x->grainCounter < renderInterval)
                x->grainCounter++; 
            break;
			
////////////////////////////////////////////////////////////////////////////////////////////////////////////			
        case Properties::AMP_PAN: // amplitude panning only	
            if (GrainCounter < renderInterval) {
				for (int k = 0; k < numChannels; k++) {
					memset(outs[k], 0, sizeof(double)*sampleframes);					
					if (micGainNonZero[k]){
						reflOrderIndex = numOfRefl * k;
						for (int n=0 ; n < sampleframes; n++) {
							*(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);
                            outs[k][n] = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE + n);
						}
					}				
                }				
                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum){
					//We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
				} 
            }
            else {
				for (int k = 0; k < numChannels; k++) {
					memset(outs[k], 0, sizeof(double)*sampleframes);					
					if (micGainNonZero[k]){
						reflOrderIndex = numOfRefl * k;						
						for (int n=0 ; n < sampleframes; n++) {			                        
							outs[k][n] = *(bp + Properties::DELAYSIZE + n) * *(currentSensitivity + reflOrderIndex);
						}
					}
				}					
            } 
			bp += sampleframes;
			
			if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes;
			
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break; 
 ////////////////////////////////////////////////////////////////////////////////
		case Properties::STATIC:		// Nothing moves, only integer delays
            if (GrainCounter < renderInterval)
            {
                for (int n=0 ; n < sampleframes; n++)
                {                    					
                    for (int k = 0; k < numChannels; ++k)
                    {
                        outs[k][n]   = 0.0;
                        reflSamps    = 0.0; 
                        numOfReflTimesK =  numOfRefl * k; 
						
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK;
                                *(currentDelay + reflOrderIndex) += *(delGrain + reflOrderIndex);	 // TM: Changed
                                *(currentSensitivity + reflOrderIndex) += *(sensiGrain + reflOrderIndex);
                                idelay = *(currentDelay + reflOrderIndex) - 0.5;
								
                                switch (reflNum)
                                {   
                                    case 0:
                                        outs[k][n] = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay) + reflSamps; 
                                        break;
										
                                    case 1: 									    
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                        break;
										
                                    case 7:
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = walls[k][6].tick(reflSamps); 
                                        break;
										
                                    default:		
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }
                            }
                        }
                    }
                    bp++;
                } // end of while
				
                for (int reflNum = 0 ; reflNum < numChannels * numOfRefl ; ++reflNum)    
                {  //We need to update the Sensi and Delay vector so that in case for a new bang, the correct grains can be calculated  
                    x->currentSensitivity[reflNum] = *(currentSensitivity + reflNum);
                    x->currentDelay[reflNum] =  *(currentDelay + reflNum); 
                }
				
            }
            else	// steady state
            {
                for (int n=0 ; n < sampleframes; n++)
                {
                    for (int k=0; k < numChannels; ++k)
                    {
                        outs[k][n] = 0.0;
                        reflSamps = 0.0; 
                        numOfReflTimesK =  numOfRefl * k; 
						
                        if (micGainNonZero[k])
                        {
                            for (int reflNum = numOfRefl - 1; reflNum >= Properties::DIRECT; --reflNum)
                            {   
                                reflOrderIndex = reflNum + numOfReflTimesK; 
                                idelay = *(currentDelay + reflOrderIndex) - 0.5;
								
                                switch (reflNum)
                                {   
                                    case 0:
                                        outs[k][n] = *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay) + reflSamps; 
                                        break;
										
                                    case 1: 									    
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = air[k][0].tick(walls[k][0].tick(reflSamps));
                                        break;
										
                                    case 7:
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        reflSamps = walls[k][6].tick(reflSamps); 
                                        break;
										
                                    default:		
                                        reflSamps += *(currentSensitivity + reflOrderIndex) * *(bp + Properties::DELAYSIZE - idelay);
                                        break;
                                }
                            }
                        }
                    }
                    bp++;
                } // end of while
            }
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes;
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break;
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
		case Properties::NONE: // no audio
            bp += sampleframes;
			for (int k = 0; k < numChannels; k++){
				memset(outs[k], 0, sizeof(double) * sampleframes);            
			}
			bp += sampleframes;
            if (bp >= ep) // return pointer to start when it arrives at the end. TM: changed == to >=
                x->c_phase = 0;
            else 
                x->c_phase = phase + sampleframes;
			
            if (x->grainCounter < renderInterval)
                x->grainCounter++;
            break; 
	}
	
}

void vimic_dsp64(t_vimic *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	// clear out the delay line
    for (int n = 0; n < Properties::DELAYBYTES; n++)
        x->c_vec[n] = 0.0;
	
    if (x->x_sr != samplerate)
    {
        x->x_sr = samplerate;
        x->speedOfSound = (331.3 * sqrt(1.0 + x->temperature / 273.15)) / x->x_sr;
        x->invSpeedOfSound = 1.0 / x->speedOfSound;
    }	

    if (x->blocksize != (int)maxvectorsize){
		x->blocksize = (int)maxvectorsize;        
        x->grainsize = 1.0 / (x->blocksize * x->renderInterval);
	}

	object_method(dsp64, gensym("dsp_add64"), x, vimic_perform64, 0, NULL);	
}