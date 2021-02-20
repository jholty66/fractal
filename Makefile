CC=gcc -lm 
fractal: fractal.c
	$(CC) fractal.c -o fractal 
install:
	[ -d images/ ] || mkdir images/
	./fractal 1200 400 mandlebrot | convert -size 4000x3000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" m.png
	./fractal 1200 400 julia 0.285 0 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j0.png
	./fractal 1200 400 julia 0.285 0.01 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j1.png
	./fractal 1200 400 julia 0.45 0.1428 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j2.png
	./fractal 1200 400 julia -0.70176 -0.3842 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j3.png
	./fractal 1200 400 julia -0.7269 0.1889| convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j4.png
	./fractal 1200 400 julia -0.8 0.156 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j5.png
	./fractal 1200 400 julia -0.835 -0.2321 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j6.png
	./fractal 1200 400 julia 0 -0.8 | convert -size 4000x4000 xc:black -font DejaVu-Sans-Mono -pointsize 5 -fill white -annotate +0+0 "@-" j7.png
	mv -fv *png images/
