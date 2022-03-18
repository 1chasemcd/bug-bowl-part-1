#include <iostream>
// Define functions
void iterate_fib(int* a, int* b);
bool is_prime(int n);
bool is_odd_binary_digits(int n);
void getLength(std::string sentence);

int main() {
	// Initialize fibonacci numbers a and b
	int a = 1;
	int b = 1;

	// Maximum number to test
	int max = 1000000000;

	// Loop until fibonacci number exceeds maximum value specified
	while (a <= max) {
		// Print out fibonacci numbers that are prime and have an odd number of binary digits
		if (is_prime(a) && is_odd_binary_digits(a)) {
			std::cout << a << std::endl;
		}

		// Increment a and be to be next fibonacci numbers
		iterate_fib(&a, &b);
	}

	// Prompts the user to enter a string and calls the getLength function on the string
	std::string sentence;
	std::cout << "Enter a string: ";
	getline(std::cin, sentence);
	getLength(sentence);
	return 0;
}

// Function to get next iteration of fibonacci (b -> a, next_fib -> b)
void iterate_fib(int* a, int* b) {
	int temp = *a + *b;
	*a = *b;
	*b = temp;
}

// Function to check if a number n is prime
bool is_prime(int n) {
	for (int i = 2; i < n / 2; i++) {
		// If n is divisible by any number between 2 and n / 2, it is composite
		if (n % i == 0) {
			return false;
		}
	}

	// n is prime
	return true;
}

// Function to check if a number n has an odd number of digits when converted to binary
bool is_odd_binary_digits(int n) {
	int digits = 0;

	while (n != 0) {
		digits++;
		// Every division by 2 is a binary digit
		n = n / 2;
	}

	// Check if counted number of digits is odd
	return digits % 2 == 1;
}

//Function that allows the user to input a string and returns the length of the string
void getLength(std::string sentence){
	int count = 0;
	for(int i = 0; sentence[i] != '\0'; i++){
		count++;
	}
	std::cout << "The length of your string is: " << count;
}
