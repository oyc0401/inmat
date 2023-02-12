import 'package:flutter/cupertino.dart';

class NavigatorContext {
  static late BuildContext _context;

  static BuildContext get context => _context;

  static setContext(BuildContext context) => _context = context;
}
