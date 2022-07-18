import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const FiliApp());
}

Future<void> init() async {
  await Secrets().init();
  await LocalNotificationService().init();
  setupServiceLocator();
}
