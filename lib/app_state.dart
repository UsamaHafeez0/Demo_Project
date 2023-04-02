abstract class AppState{}

class UnauthenticatedAppState extends AppState{} // representing that app in unauthenticated, token
                                                  // not fetched in our case

class ErrorAppState extends AppState{
  String error;

  ErrorAppState({required this.error});
}

class AuthenticatedAppState extends AppState{}