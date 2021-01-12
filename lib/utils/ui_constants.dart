import 'package:flutter/material.dart';


// ThemeData getThemeData() {
//   return ThemeData(
//     primaryColor: AppColors.primary,
//     accentColor: AppColors.accent,
//     canvasColor: Colors.white,
//   );
// }


MaterialColor createSwatch(int r, int g, int b, double o){
	Map<int, Color> swatch = {};
	List<int> opacities = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
	for(int opacity in opacities)
		swatch[opacity] = Color.fromRGBO(r, g, b, opacity/1000);
	return MaterialColor(
		Color.fromRGBO(r, g, b, o).value,
		swatch
	);
}

class AppColors{
	static final MaterialColor accent = createSwatch(233,78,27, 1);
  static final MaterialColor primary = createSwatch(54,183,172, 1);
}