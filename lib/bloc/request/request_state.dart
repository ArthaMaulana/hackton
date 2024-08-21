part of 'request_bloc.dart';

@immutable
sealed class RequestState {}

final class RequestInitial extends RequestState {}

final class GetRequestWaiting extends RequestState {}

final class GetRequestError extends RequestState {
  final String errorMessage;

  GetRequestError({required this.errorMessage});
}

final class GetRequestSuccess extends RequestState {
  final ResponseGetRequest responseGetRequest;

  GetRequestSuccess({required this.responseGetRequest});
}
