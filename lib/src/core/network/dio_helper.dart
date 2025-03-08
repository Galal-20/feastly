// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:weather_ai_app/core/utils/constants.dart';

// class DioHelper {
//   final String _baseUrl = AppConstants.apiEndpoint;
//   final Dio _dio;

//   DioHelper(this._dio);

//   Future<dynamic> get({
//     String? endpoint,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headers,
//   }) async {
//     var response = await _dio.get('$_baseUrl$endpoint',
//         queryParameters: queryParameters,
//         data: body,
//         options: Options(headers: headers));
//     return response.data;
//   }

//   Future<Map<String, dynamic>> post({
//     String? endpoint,
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     String? inputUrl,
//   }) async {
//     log('inputUrl -- $inputUrl');
//     var response = await _dio.post(inputUrl ?? '$_baseUrl$endpoint',
//         data: data,
//         queryParameters: queryParameters,
//         options: Options(headers: headers));
//     return response.data;
//   }

//   Future<Map<String, dynamic>> put(
//       {required String endpoint,
//       Map<String, dynamic>? data,
//       Map<String, dynamic>? queryParameters,
//       Map<String, dynamic>? headers}) async {
//     var response = await _dio.put(
//       '$_baseUrl$endpoint',
//       data: data,
//       queryParameters: queryParameters,
//       options: Options(headers: headers),
//     );
//     return response.data;
//   }

//   Future<Map<String, dynamic>> delete({
//     required String endpoint,
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//   }) async {
//     var response = await _dio.delete('$_baseUrl$endpoint',
//         data: data,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: headers,
//         ));
//     return response.data;
//   }

//   Future<Map<String, dynamic>> patch(
//       {required String endpoint,
//       Map<String, dynamic>? data,
//       Map<String, dynamic>? queryParameters}) async {
//     var response = await _dio.patch(
//       '$_baseUrl$endpoint',
//       data: data,
//       queryParameters: queryParameters,
//     );
//     return response.data;
//   }
// }
