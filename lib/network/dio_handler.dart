import '../dependencies/network.dart';
import '../secrets/index.dart';

class TMDBApi {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: Secrets.baseUrl));
  static Alice alice = Alice(
    showNotification: true,
  );

  TMDBApi._internal();

  static final _singleton = TMDBApi._internal();

  factory TMDBApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: Secrets.baseUrl,
        receiveTimeout: 15000,
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(dio),
      alice.getDioInterceptor(),
      PrettyDioLogger(),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters.addAll({
      'api_key': Secrets.apiKey,
    });

    return handler.next(options);
  }
}
