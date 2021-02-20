#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>

int width;
int height;
int iter=200;
complex float c=-0.8 + 0.156*I;

void plot(complex float z, complex float c) {
	for (int n=0; n<iter; n++) {
		z=cpowf(z,2)+c;
		// .,~*oe$@"
		if (cabsf(z)>10) {
			if (n<4) { printf(" "); return; }
			if (n<9) { printf("."); return; }
			if (n<16) { printf(","); return; }
			if (n<25) { printf("'"); return; }
			if (n<36) { printf(":"); return; }
			if (n<49) { printf("~"); return; }
			if (n<64) { printf("*"); return; }
			if (n<81) { printf("o"); return; }
			if (n<100) { printf("e"); return; }
			if (n<121) { printf("$"); return; }
			if (n<144) { printf("@"); return; }
 		}
	}
	printf(" "); 
}

int main(int argC, char* argV[]) {
	if (argC<4) { printf("X\n"); return -1; }
	width = atoi(argV[1]);
	height = atoi(argV[2]);
	if (! strcmp(argV[3], "mandlebrot")) {
		for (float y=-1; y<1; y+=2.0/height) {
			for (float x=-2.0; x<1; x+=3.0/width) { plot(0, x+I*y); }
			printf("\n");
		}
	} else if (! strcmp(argV[3], "julia")) {
		if (argC==6) {
			c=atof(argV[4])+atof(argV[5])*I;
			printf("%i %i\n", argV[4], argV[5]);
		}
		for (float y=-1.5; y<1.5; y+=2.0/height) {
			for (float x=-2.0; x<2; x+=4.0/width) { plot(x+I*y, c); }
			printf("\n");
		}
	} else { return -1; }
}
