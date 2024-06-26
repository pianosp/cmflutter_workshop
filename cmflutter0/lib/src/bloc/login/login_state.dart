part of 'login_bloc.dart';

enum AuthenStatus { init, success, failure }

class LoginState extends Equatable {
  final int count;
  final bool isAuthened;

  const LoginState({this.count = 0, this.isAuthened = false});

  LoginState copyWith({
    int? count,
    bool? isAuthened,
  }) {
    return LoginState(
      count: count ?? this.count,
      isAuthened: isAuthened ?? this.isAuthened,
    );
  }

  @override
  List<Object?> get props =>
      [count, isAuthened]; //ส่วนในการ track ค่าที่เปลี่ยนเพื่อ update UI
}
