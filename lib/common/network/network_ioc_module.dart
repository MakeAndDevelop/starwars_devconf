import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/endpoints.dart';

final _dio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl));

@module
abstract class NetworkIocModule {
  Dio get dio => _dio;
}
