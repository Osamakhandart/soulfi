import 'package:soulfi/src/models/error_model.dart';
import 'package:soulfi/src/widgets/custom_snackbar.dart';

class ErrorHandler {
  static void handleError(Map<String, dynamic> response, context) {
    try {
      // final Map<String, dynamic> jsonResponse = json.decode(response);
      final apiError = ApiError.fromJson(response);
      print(apiError.messages);
      displayErrorMessage(apiError.messages, context);
    } catch (e) {
      // Handle parsing error or other issues
      displayErrorMessage(['An error occurred'], context);
    }
  }

  static void displayErrorMessage(List<String> messages, context) {
    final message = messages.isNotEmpty ? messages.first : 'An error occurred';

    CustomBar.buildErrorSnackbar(context, message);
    // Show a snackbar, dialog, or any other UI element to display the error message
  }
}
