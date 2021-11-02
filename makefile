calculate.exe:main.o plus.o
	gcc *.o -fprofile-arcs -ftest-coverage -o $@
%.o:%.c
	gcc -fprofile-arcs -ftest-coverage -c $< -o $@
clean:
	rm -rf *.o calculate.exe