// import 'package:dio/dio.dart';
// import 'package:weather_ai_app/core/error/failures.dart';

// class ServerFailure extends Failures {
//   ServerFailure(super.errMsg);

//   factory ServerFailure.dioError(DioException dioError) {
//     switch (dioError.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure('Connection Timeout with Api');
//       case DioExceptionType.sendTimeout:
//         return ServerFailure('Connection sent Timeout with Api');
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure('Connection recieve Timeout with Api');
//       case DioExceptionType.badCertificate:
//         return ServerFailure('Bad Certificate');

//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//             dioError.response!.statusCode!, dioError.response!.data);
//       case DioExceptionType.cancel:
//         return ServerFailure('Request Cancelled');

//       case DioExceptionType.connectionError:
//         return ServerFailure('Check your internet connection');

//       case DioExceptionType.unknown:
//         return ServerFailure('unexpected error please try again');

//       default:
//         return ServerFailure('unexpected error please try again');
//     }
//   }

//   factory ServerFailure.fromResponse(int statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure('Your request not found try again later');
//     } else if (statusCode == 500) {
//       return ServerFailure('Internel Server error, please try again later');
//     } else {
//       return ServerFailure('Oops there was an error}');
//     }
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is ServerFailure && other.errMsg == errMsg;
//   }

//   @override
//   int get hashCode => errMsg.hashCode;
// }
