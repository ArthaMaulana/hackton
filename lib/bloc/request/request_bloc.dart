import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/models/response_get_request';
import 'package:flutter_day2/source/request_source.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(RequestInitial()) {
    on<OnGetRequest>((event, emit) async {
      emit(GetRequestWaiting());
      ResponseGetRequest? responseGetRequest =
          await RequestSource.getRequest(event.token);
      if (responseGetRequest != null) {
        emit(GetRequestSuccess(responseGetRequest: responseGetRequest));
      } else {
        emit(GetRequestError(errorMessage: "Terjadi Kesalahan"));
      }
    });
  }
}
