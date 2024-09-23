import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Eventos de Autenticação
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}
class LoggedIn extends AuthEvent {}
class LoggedOut extends AuthEvent {}

// Estados de Autenticação
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class Authenticated extends AuthState {
  final String environment; // Ambiente do usuário
  Authenticated(this.environment);
}
class Unauthenticated extends AuthState {}

// BLoC de Autenticação
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      // Lógica para verificar se o usuário está logado
      yield Unauthenticated(); // Exemplo
    } else if (event is LoggedIn) {
      yield Authenticated("Ambiente de Desenvolvimento"); // Exemplo de ambiente
    } else if (event is LoggedOut) {
      yield Unauthenticated();
    }
  }
}
