enum AuthState{
  authenticated,
  guestSession,
  unauthenticated;

  bool get isGuest => this == AuthState.guestSession;
  bool get isAuthenticated => this == AuthState.authenticated;
  bool get isUnauthenticated => this == AuthState.unauthenticated;
}