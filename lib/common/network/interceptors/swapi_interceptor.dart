import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

/// SWAPI has some questionable response times lately, so for demo's use local data.
@Injectable()
class SwapiInterceptor extends Interceptor {
  final AssetBundle _assetBundle = rootBundle;

  SwapiInterceptor();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      if (!options.path.contains('swapi.dev')) {
        return handler.next(options);
      }

      if (options.uri.pathSegments.length == 2) {
        final data = await _getLocalData(options);
        if (data.isNotEmpty) {
          return handler.resolve(Response(data: jsonDecode(data), statusCode: 200, requestOptions: options));
        }
      }

      if (options.uri.pathSegments.length > 2) {
        final data = await _getLocalData(options);
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) {
          final results = decoded['results'] as List<dynamic>;
          final item = results.firstWhere((item) => item['url'] == options.uri.toString(), orElse: () => null);

          if (item != null) {
            return handler.resolve(Response(data: item, statusCode: 200, requestOptions: options));
          }
        }
      }

      return handler.next(options);
    } catch (e) {
      print(e);
      return handler.next(options);
    }
  }

  Future<String> _getLocalData(RequestOptions options) async {
    final segment = options.uri.pathSegments[1];
    final data = await _assetBundle.loadString('assets/data/$segment.json');
    return data;
  }
}
