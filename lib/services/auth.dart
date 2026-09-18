  import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pharma_guide/models/my_user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //we create our user object based on User from Firebase
  MyUser? _myUserFromUser(User? user) {
    return user!=null ? MyUser(uid: user.uid, isAnonymous: user.isAnonymous, username: user.displayName) : null;
  }

  //auth change user stream
  Stream<MyUser?> get user{
    return _auth.userChanges().map(_myUserFromUser);
  }

  //sign in anonymously
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _myUserFromUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _myUserFromUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email, password and username
  Future signUp(String email, String password, String username) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user!=null){
        await user.updateDisplayName(username);
        await user.reload();
        user = _auth.currentUser;
      }
      return _myUserFromUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //update username
  Future updateUsername(String username) async{
    try {
      User? user = _auth.currentUser;
      if (user!=null) {
        await user.updateDisplayName(username);
        await user.reload();
        user = _auth.currentUser;
      }
      return _myUserFromUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //delete user
  Future deleteAccount() async{
    try{
      User? user = _auth.currentUser;
      if(user!=null){
        await user.delete();
        return true;
      }
      return false;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }
}