import 'package:cup_flutter_app/app/core/ui/global/global_context.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response!.statusCode == 401) {
      Injector.get<GlobalContext>().loginExpire();
    } else {
      handler.next(err);
    }
  }
}

// eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZndjLmFjYWRlbWlhZG9mbHV0dGVyLmNvbS5ici9hcGkvYXV0aCIsImlhdCI6MTY2NTg0NDMxMiwiZXhwIjoxNjY1OTMwNzEyLCJuYmYiOjE2NjU4NDQzMTIsImp0aSI6ImU0TW92aEdycUJEaDBZYWciLCJzdWIiOiIyOCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.CwxpWkmREeFiznR3zcC16nBp40jYKC-4-21SM2zx9rQ