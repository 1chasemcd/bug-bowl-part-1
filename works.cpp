#include <iostream>
// Define functions
void iterate_fib(int* a, int* b);
bool is_prime(int n);
bool is_odd_binary_digits(int n);
int getLength(std::string sentence);

int main() {

	// Prompts the user to enter a string and calls the getLength function on the string
	std::string sentence;
	std::cout << "Enter a string: ";
	getline(std::cin, sentence);
	int length = getLength(sentence);

	std::cout << "The length of your string is: " << length << std::endl;


	// Calls is_prime to determine if the length of the string is a prime number.
	if(is_prime(length) == true){
		std::cout << "The length of your string is a prime number." << std::endl;
	} else{
		std::cout << "The length of your string is a composite number." << std::endl;
	}

	// Calls is_odd_binary_digits to determine if the length of the string is an odd number.
	if(is_odd_binary_digits(length) == true){
		std::cout << "The length of your string has an odd number of binary digits." << std::endl;
	} else{
		std::cout << "The length of your string has an even number of binary digits." << std::endl;
	}

	return 0;
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
int getLength(std::string sentence){
	int count = 0;
	for(int i = 0; sentence[i] != '\0'; i++){
		count++;
	}
	return count;
}
