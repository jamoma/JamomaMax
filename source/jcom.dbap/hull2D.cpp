/**
 @file
 
 @ingroup modularMax
 
 @brief 2D implementation on convex hull.
 
 @details This code is described in "Computational Geometry in C" (Second Edition),
 Chapter 3.  It is not written to be comprehensible without the
 explanation in that book. @n
 @n
 Input: 2n integer coordinates of points in the plane. @n
 Output: the convex hull, cw, in PostScript; other output precedes the PS. @n
 @n
 NB: The original array storing the points is overwritten. @n

 Compile: gcc -o graham graham.c  (or simply: make) @n

 Written by Joseph O'Rourke. @n
 Last modified: October 1997 @n
 Questions to orourke@cs.smith.edu. @n

 @author Joseph O'Rourke

 @copyright -------------------------------------------------------------------- @n
 This code is Copyright 1998 by Joseph O'Rourke.  It may be freely @n
 redistributed in its entirety provided that this copyright notice is @n
 not removed. @n
 --------------------------------------------------------------------
*/

#include "hull2D.h"

void	Swap(t_point point,int i, int j)
{
	long ltemp;
	bool btemp;
	double ftemp;
	/* Uses swap macro. */
	SWAP(ltemp, point[i].vnum,		point[j].vnum);
	SWAP(ftemp, point[i].v[X],		point[j].v[X]);
	SWAP(ftemp, point[i].v[Y],		point[j].v[Y]);
	SWAP(btemp, point[i].del,		point[j].del);
}

void	Copy(t_point point,int i, int j)
{
   point[j].v[X] = point[i].v[X];
   point[j].v[Y] = point[i].v[Y];
   point[j].vnum = point[i].vnum;
   point[j].del = point[i].del;
}

void	Delete(t_point point,int i)
{
   point[i].v[X] = 0.;
   point[i].v[Y] = 0.;
   point[i].vnum = -1;
   point[i].del = true;
}

/*---------------------------------------------------------------------
Compare: returns -1,0,+1 if p1 < p2, =, or > respectively;
here "<" means smaller angle.  Follows the conventions of qsort_s
(with a pointer to contextual hull data).
---------------------------------------------------------------------*/
int   Compare(const void *tpi, const void *tpj)
{
	int a;					// area sign
	double x, y;			// projections of ri & rj in 1st quadrant
	t_point pi, pj;			// data to compare

	pi = (t_point)tpi;
	pj = (t_point)tpj;

	a = AreaSign(pi->p0, pi->v, pj->v);
	if (a > 0)
		return -1;
	else if (a < 0)
		return 1;
	else { /* Collinear with P[0] (stored in each pi->p0  because we use qsort instead of qsort_s) */
		x =  abs( pi->v[X] -  pi->p0[X] ) - abs( pj->v[X] -  pi->p0[X] );
		y =  abs( pi->v[Y] -  pi->p0[Y] ) - abs( pj->v[Y] -  pi->p0[Y] );

		//h2->nb_delete++; // Now it's done after the sorting

		if ((x < 0) || (y < 0)) {
			pi->del = true;
			return -1;
		}
		else if ((x > 0) || (y > 0)) {
			pj->del = true;
			return 1;
		}
		else { /* points are coincident */
			if (pi->vnum > pj->vnum)
				pj->del = true;
			else 
				pi->del = true;
			return 0;
      }
   }
}

/*---------------------------------------------------------------------
Performs the Graham scan on an array of angularly sorted points P.
---------------------------------------------------------------------*/
t_stack	Graham(t_H2D h2)
{
	t_stack   top;
	int i;
	t_point p1, p2;  /* Top two points on stack. */

	/* Initialize stack. */
	top = NULL;
	top = Push (&h2.point[0], top);
	top = Push (&h2.point[1], top);

	/* Bottom two elements will never be removed. */
	i = 2;

	while (i < h2.nb_point) {
		//post("Stack at top of while loop, i = %d, vnum = %d :", i, P[i].vnum);
		//PrintStack( top );
		if (!top->next) 
			return NULL;	// Failure
		p1 = top->next->p;
		p2 = top->p;
		if (Left(p1->v , p2->v, h2.point[i].v)) {
			top = Push(&h2.point[i], top);
			i++;
		}
		else top = Pop( top );
		//PrintStack(top);
	}
	return top;
}

/*---------------------------------------------------------------------
Pops off top elment of stack s, frees up the cell, and returns new top.
---------------------------------------------------------------------*/
t_stack Pop(t_stack s)
{
   t_stack top;

   top = s->next;
   FREE( s );
   return top;
}

/*---------------------------------------------------------------------
Get a new cell, fill it with p, and push it onto the stack.
Return pointer to new stack top.
---------------------------------------------------------------------*/
t_stack	Push(t_point p, t_stack top)
{
	t_stack	s;

	/* Get new cell and fill it with point. */
	NEW(s, t_cell);
	s->p = p;
	s->next = top;
	return s;
}

/*---------------------------------------------------------------------
Returns true if c is strictly to the left of the directed
line through a to b.
---------------------------------------------------------------------*/
bool	Left(t_xy a, t_xy b, t_xy c)
{ 
   /*return  Area2( a, b, c ) > 0;*/
   return  AreaSign( a, b, c ) > 0;
}

int		AreaSign(t_xy a, t_xy b, t_xy c)
{
    double area2;

    area2 = ( b[0] - a[0] ) * ( c[1] - a[1] ) -
            ( c[0] - a[0] ) * ( b[1] - a[1] );

    /* The area should be an integer. */
    /*if      (area2 >  0.5) return  1;
    else if (area2 < -0.5) return -1;
    else                   return  0;*/
	if      (area2 > 0) return  1;
    else if (area2 < 0) return -1;
    else                return  0;
}