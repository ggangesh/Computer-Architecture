int gcd(int a, int b) {
	for (;;) {
		if (a==b) {return a;}
		else if (a>b) {a = a-b;}
		else {b = b-a;}
	}
}
int main() {
	int a = 10, b= 75;
	int c = gcd(a,b);
	syscall_print_int(c);
	syscall_print_newline();
}