// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future checkConnection() async {
  print('start');
  print(FFAppState().tonConnected);
  print(FFAppState().tonConnector.connected);
  print('finish');
  FFAppState().tonConnected = FFAppState().tonConnector.connected;
}
