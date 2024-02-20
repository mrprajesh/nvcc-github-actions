all:
	nvcc -O3 -arch=sm_70 Hello.cu -o Hello.out
