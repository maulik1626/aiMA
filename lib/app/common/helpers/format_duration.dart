/// Formats the given duration string into a more concise format.
///
/// The input string should represent a duration in the format:
/// "1 day 18 hours 13 mins", "18 hours 13 mins", or "13 mins".
///
/// The method returns the duration string in a more concise format like:
/// "1d 18h 13m", "18h 13m", or "13m".
///
/// Example usage:
/// ```dart
/// String input1 = '1 day 18 hours 13 mins';
/// String input2 = '18 hours 13 mins';
/// String input3 = '13 mins';
///
/// print(formatDuration(input1)); // Output: "1d 18h 13m"
/// print(formatDuration(input2)); // Output: "18h 13m"
/// print(formatDuration(input3)); // Output: "13m"
/// ```
String formatDuration(String input) {
  // Split the input string into parts separated by space
  List<String> parts = input.split(' ');

  // Initialize variables to store the duration values
  int days = 0;
  int hours = 0;
  int minutes = 0;

  // Iterate through the parts and extract the duration values
  for (int i = 0; i < parts.length; i += 2) {
    int value = int.parse(parts[i]); // Parse the numeric value
    String unit = parts[i + 1]; // Get the unit (e.g., "day", "hour", "min")

    // Map the unit to its corresponding abbreviation
    String abbreviation = '';
    switch (unit) {
      case 'day':
      case 'days':
        abbreviation = 'd';
        days = value;
        break;
      case 'hour':
      case 'hours':
        abbreviation = 'h';
        hours = value;
        break;
      case 'min':
      case 'mins':
        abbreviation = 'm';
        minutes = value;
        break;
    // Add additional cases for other units if needed
    }

    // Append the formatted duration to the result string
    input = input.replaceFirst('$value $unit', '$value$abbreviation');
  }

  // Remove any extra whitespace
  input = input.trim();

  // Return the formatted duration string
  return input;
}