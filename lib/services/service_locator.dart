import 'package:fili/index.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<LocalNotificationService>(
    () => LocalNotificationService(),
  );
}
