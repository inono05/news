import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import '../configurations/api_routes.dart';

part 'api.g.dart';

@RestApi(baseUrl: ApiRoutes.url)
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

}
