import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/result.dart';
import '../response/api_response.dart';

final String apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
const String baseUrl = 'https://api.themoviedb.org/3';

/// Step by step by TMDB Docs.
class TmdbService {
  /// Step 1 create request token.
  Future<String> createRequestToken() async {
    final response = await http.get(Uri.parse('$baseUrl/authentication/token/new?api_key=$apiKey'));

    if (response.statusCode == 200) {
      print('Response: ${response.statusCode}, ${response.body}');
      final data = jsonDecode(response.body);
      return data['request_token'];
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to create request token');
    }
  }
  /// Step 2 ask user permission.
  Future<void> askUserForPermission(String authUrl) async {
    if (await canLaunchUrl(Uri.parse(authUrl))) {
      await launchUrl(Uri.parse(authUrl)); // Open the URL in the browser
    } else {
      throw Exception('Could not launch $authUrl');
    }
  }

  /// Step 3 create session id
  Future<String> createSessionId(String requestToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/authentication/session/new?api_key=$apiKey'),
      body: jsonEncode({'request_token': requestToken}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print('Response: ${response.statusCode}, ${response.body}');
      final data = jsonDecode(response.body);
      return data['session_id'];
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to create session ID');
    }
  }

  Future<bool> deleteSession(String? sessionId) async {
    if (sessionId == null || sessionId.isEmpty) {
      throw Exception('Session ID is null or empty. Cannot delete session.');
    }

    final url = Uri.parse('$baseUrl/authentication/session?api_key=$apiKey');
    try {
      print('Deleting session with ID: $sessionId');
      final response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'session_id': sessionId}),
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return responseBody['success'] == true;
      } else {
        throw Exception(
          'Failed to delete session: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      print('Error occurred while deleting session: $e');
      throw Exception('Error occurred while deleting session: $e');
    }
  }

  Future<void> startTmdbAuth(String requestToken) async {
    try{
      final authUrl = 'https://www.themoviedb.org/authenticate/$requestToken?redirect_to=myapp://tmdb.com?approved=true';
      await TmdbService().askUserForPermission(authUrl);
    } catch (e) {
      print(e);
    }
  }

  //create guest session
  Future<Result<ApiResponseGuestSession>> createGuestSession() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/authentication/guest_session/new?api_key=$apiKey'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Result.ok(ApiResponseGuestSession.fromJson(data));
      } else {
        throw Exception('Failed to create guest session');
      }
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}

///
// Future<void> openTMDBLogin(String requestToken) async {
//   final Uri url = Uri.parse(
//   'https://www.themoviedb.org/authenticate/$requestToken'
//   );
//
//   if (await canLaunchUrl(url)) {
//     await launchUrl(
//       url,
//       mode: LaunchMode.externalApplication,
//     );
//   } else {
//     throw Exception('Could not launch $url');
//   }
// }
// static Future<bool> isRequestTokenApproved(String requestToken) async {
// final response = await http.get(
// Uri.parse('$baseUrl/authentication/token/validate_with_login?request_token=$requestToken'),
// );
//
// if (response.statusCode == 200) {
// print('Response: ${response.statusCode}, ${response.body}');
// final data = jsonDecode(response.body);
// return data['success'];
// } else {
// print('Error: ${response.statusCode}, ${response.body}');
// throw Exception('Failed to check request token status');
// }
// }

