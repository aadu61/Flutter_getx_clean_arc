import 'package:mashe/core/export_core.dart';
import 'package:mashe/core/theam_data/aap_theam.dart';
import 'package:mashe/ui/splash_module/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(VALUE_FIGMA_DESIGN_WIDTH, VALUE_FIGMA_DESIGN_HEIGHT),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // translations: LanguageChange(),
          translationsKeys: LanguageChange().keys,
          locale: const Locale("en","US"),   /// for getting device local we can use get.deviceLocale
          fallbackLocale: const Locale("en","US"),
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: ThemeMode.system,
          home: const SplashScreen(),
        );
      }
    );
  }
}

