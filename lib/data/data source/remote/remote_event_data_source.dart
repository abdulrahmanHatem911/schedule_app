import 'package:dio/dio.dart';
import '../../../core/constant/contant_api.dart';
import '../../models/event_model.dart';
import '../../../domain/use%20case/get_all_event_use_case.dart';

import '../../../core/errors/exeption.dart';
import '../../../core/network/error_model.dart';
import '../../../domain/entity/event.dart';

abstract class BaseRemoteEventDataSource {
  Future<List<Event>> getAllEventDataSource(EventParameters parameters);
}

class RemoteEventDataSource extends BaseRemoteEventDataSource {
  @override
  Future<List<Event>> getAllEventDataSource(EventParameters parameters) async {
    final response = await Dio().get(
      ApiContent.getEvent(parameters.numberPage),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "authorization": ApiContent.token,
        },
      ),
    );
    if (response.statusCode == 200) {
      return List<Event>.from(
        (response.data as List).map(
          (e) => EventModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
