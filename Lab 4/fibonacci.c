int fibonacci(int first, int second, int n) {
	if(n<1) {return 1;}
	if(n==1) {return first;}
	if(n==2) {return second;}
	return (fibonacci(first,second,n-1) + fibonacci(first,second,n-2));
}

int main() {
	int a = fibonacci(1,2,10);
	syscall_print_int(a);
	syscall_print_newline();
}