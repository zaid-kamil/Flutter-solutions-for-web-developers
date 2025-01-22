// test/unit_2_test.dart
import 'package:test/test.dart';

// sample functions for the tests
String reverseString(String input) => input.split('').reversed.join('');

String toUpperCase(String input) => input.toUpperCase();

int add(int a, int b) => a + b;

int subtract(int a, int b) => a - b;

// main function to run the tests
void main() {
  group('String manipulation tests', () {
    test('Test string reversal', () {
      String reversed = reverseString('hello');
      expect(reversed, equals('olleh'));
    });
    test('Test string to uppercase', () {
      String upper = toUpperCase('hello');
      expect(upper, equals('HELLO'));
    });
  });
  group('Math operations tests', () {
    test('Test addition', () {
      int sum = add(2, 3);
      expect(sum, equals(5));
    });
    test('Test subtraction', () {
      int difference = subtract(5, 3);
      expect(difference, equals(2));
    });
  });
}
