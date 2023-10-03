// import 'package:flutter_login/flutter_login.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:game_template/src/login/login_screen.dart';
// import 'package:mockito/mockito.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class MockSupabaseClient extends Mock implements SupabaseClient {}

// void main() {
//   group('LoginScreen', () {
//     late LoginScreen loginScreen;
//     late MockSupabaseClient mockSupabaseClient;

//     setUp(() {
//       mockSupabaseClient = MockSupabaseClient();
//       loginScreen = LoginScreen(mockSupabaseClient);
//     });

//     test('_authUser returns null when user is authenticated', () async {
//       // Arrange
//       final loginData =
//           LoginData(name: 'test@example.com', password: 'password');
//       when(mockSupabaseClient.auth.signInWithPassword(
//               email: loginData.name, password: loginData.password))
//           .thenAnswer((_) async => Future.value(AuthResponse()));

//       // Act
//       final result = await loginScreen.authUser(loginData);

//       // Assert
//       expect(result, null);
//     });

//     // test('_authUser returns error message when authentication fails', () async {
//     //   // Arrange
//     //   final loginData =
//     //       LoginData(name: 'test@example.com', password: 'password');
//     //   final errorMessage = 'Unable to login';
//     //   when(mockSupabaseClient.auth.signInWithPassword(
//     //           email: loginData.name!, password: loginData.password!))
//     //       .thenThrow(AuthException(errorMessage));

//     //   // Act
//     //   final result = await loginScreen._authUser(loginData);

//     //   // Assert
//     //   expect(result, errorMessage);
//     // });
//   });
// }
