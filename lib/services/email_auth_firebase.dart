import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthFirebase{
  final auth = FirebaseAuth.instance;

  Future<bool> signUpUser({required String name, required String password,required String email}) async{
    try{
      var user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(user.user!=null){
        user.user!.sendEmailVerification();
        return true;
      }
      return false;
    }catch(e){
      return false;
    }
  }

  Future<bool> signInUser({required String password,required String email}) async{
    var flag = false;
    final UserCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
    if(UserCredential.user != null){
      if(UserCredential.user!.emailVerified){
          flag=true;
      }
    }
    return flag;
  }
}