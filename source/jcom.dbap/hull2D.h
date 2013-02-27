/**
 @file
 
 @ingroup modularMax
 
 @brief Compute convex hulls in 2 dimensions.

 @details This code is described in "Computational Geometry in C" (Second Edition),
 Chapter 3.  It is not written to be comprehensible without the
 explanation in that book.

 Input: 2n integer coordinates of points in the plane.
 Output: the convex hull, cw, in PostScript; other output precedes the PS.

 NB: The original array storing the points is overwritten.

 Compile: gcc -o graham graham.c  (or simply: make)

 Written by Joseph O'Rourke.
 Last modified: October 1997
 Questions to orourke@cs.smith.edu.
 
 @author Joseph O'Rourke

 @copyright -------------------------------------------------------------------- @n
 This code is Copyright 1998 by Joseph O'Rourke.  It may be freely @n
 redistributed in its entirety provided that this copyright notice is @n
 not removed. @n
 --------------------------------------------------------------------
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

/** Macros */
#define NEW(p,type) if ((p=(type *) malloc (sizeof(type))) == NULL) {exit(EXIT_FAILURE);}
#define FREE(p)  if (p) {free ((void *) p); p = NULL;}
#define SWAP(t,x,y)     {t = x; x = y; y = t;}

#define X   0
#define Y   1

/** Data structures to store a 2 dimensional convex hull */

/*--------- Point(s) Structure ---------*/
typedef double t_xy[2];	/* Type float point */

typedef struct _structPoint t_structPoint;
typedef t_structPoint *t_point;
struct _structPoint {
	t_xy	v;
	long	vnum;
	bool	del;
	t_xy	p0;
};

/*--------- Stack Structure ------------*/
typedef struct _cell t_cell;
typedef t_cell *t_stack;
struct _cell {
   t_point	p;
   t_stack	next;
};

/*--------- Hull2D Structure ------------*/
typedef struct _H2D {
	t_stack			stack;						///< pointer to the top of the stack
	t_structPoint	point[64];					///< TODO : a dynamic array
	int				nb_point;					///< Actual # of points (!!! init to 0 in new)
	int				nb_delete;					///< # deleted points (!!! init to 0 in new)
}t_H2D;											///< Convex hull in 2 dimension

/*----------Function Prototypes-------------*/
void		Swap(t_point point, int i, int j);
void		Copy(t_point point, int i, int j);
void		Delete(t_point point,int i);
int			Compare(const void *tpi, const void *tpj);
int			AreaSign(t_xy a, t_xy b, t_xy c);
t_stack		Graham(t_H2D);
t_stack		Pop(t_stack s);
t_stack		Push(t_point point, t_stack top);
bool		Left(t_xy a, t_xy b, t_xy c);













