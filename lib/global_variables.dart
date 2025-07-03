import 'package:flutter_dotenv/flutter_dotenv.dart';

var url = dotenv.env['URL'];
String ip = "http://$url:3000";
