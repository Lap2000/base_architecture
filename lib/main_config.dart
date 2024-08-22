part of 'main.dart';

Future<void> _config() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flavor.instance.getNativeFlavor();
}
