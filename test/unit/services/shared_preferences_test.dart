import 'package:flutter_strong_boilerplate/services/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() {
    SharedPreferences.setMockInitialValues({});
    SharedPreferencesService.init();
  });

  group('Preferences Service test', () {
    test('init & instance test', () async {
      final instance = await SharedPreferencesService.instance;

      expect(instance, isA<SharedPreferences>());
    });

    test('instance test', () async {
      final instance = await SharedPreferencesService.instance;

      expect(instance, isA<SharedPreferences>());
    });

    test('saveBool & getBool test', () async {
      await SharedPreferencesService.saveBool('key', value: false);
      expect(SharedPreferencesService.getBool('key'), false);
    });

    test('saveBool & getBool test', () async {
      await SharedPreferencesService.saveInt('key', 1);
      expect(SharedPreferencesService.getInt('key'), 1);
    });

    test('containsKey & getStringList test', () async {
      expect(SharedPreferencesService.getStringList('nullKey'), null);
      expect(SharedPreferencesService.containsKey('nullKey'), false);
    });

    test('save & remove key test', () async {
      await SharedPreferencesService.saveString('mock', 'mockValue');
      await SharedPreferencesService.removeKey('mock');

      final mockValue = SharedPreferencesService.getString('mock');

      expect(mockValue, null);
    });
  });
}
