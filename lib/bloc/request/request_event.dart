part of 'request_bloc.dart';

@immutable
sealed class RequestEvent {}

final class OnGetRequest extends RequestEvent {
  final String token;

  OnGetRequest({required this.token});
}
