import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthDefault());

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();


  //----login----

  Future login(String email, String password) async{
    emit(const AuthLoginLoading());
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
      if(user!= null){
        emit(AuthLoginSuccess(user: user));
      }
    }on FirebaseAuthException catch(e){
      emit(AuthLoginError(error: e.message!));
    }
  }

  //----signup-----
  Future signup(String email, String password, String name) async{
    emit(const AuthSignUpLoading());
    try{
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
      if(user!= null){
        user.updateDisplayName(name);
        emit(const AuthSignUpSuccess());
      }
    }on FirebaseAuthException catch(e){
      emit(AuthSignUpError(e.message!));
    }
  }

  //----forget----
  Future forgetPassword(String email ) async{
    emit(const AuthForgotPasswordLoading());
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      emit(const AuthForgotPasswordSuccess());
    }on FirebaseAuthException catch(e){
      emit(AuthForgotPasswordError(e.message!));
    }
  }

  //---google---
  Future googleAuth() async {
    emit(const AuthGoogleLoading());
    try {
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      if (_googleUser != null) {
        emit(AuthDefault());
      } else {
        final GoogleSignInAuthentication googleAuth =
        await _googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        User? user = (await _firebaseAuth.signInWithCredential(credential)).user;
        if (user != null) {
          emit(AuthGoogleSuccess(user: user));
        }
      }
    } catch (e) {
      emit(AuthGoogleError(error: e.toString()));
    }
  }

  Future googleLogout() async {
    await _googleSignIn.signOut();
    emit(const AuthLogout());
  }

  //---auth logout---
  Future logout()async{
    await _firebaseAuth.signOut();
    emit(const AuthLogout());
  }
}
