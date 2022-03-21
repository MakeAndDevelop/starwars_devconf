import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkIocModule {
  Dio get dio => Dio();
}
