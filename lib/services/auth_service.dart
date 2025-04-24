import 'package:firebase_auth/firebase_auth.dart';
// import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  // Google Sign in
  signInWithGoogle() async {
    // begin interaction sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Signed in at last
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Github Sign in
  /* signInWithGitHub(context) async {
    final gitHubSignIn = GitHubSignIn(
      clientId: dotenv.env['GITHUB_CLIENT_ID']!,
      clientSecret: dotenv.env['GITHUB_CLIENT_SECRET']!,
      redirectUrl: dotenv.env['GITHUB_REDIRECT_URL']!,
    );

    var result = await gitHubSignIn.signIn(context);
    switch (result.status) {
      case GitHubSignInResultStatus.ok:
        print(result.token);
        break;

      case GitHubSignInResultStatus.cancelled:
      case GitHubSignInResultStatus.failed:
        print(result.errorMessage);
        break;
    }
  } */
}
