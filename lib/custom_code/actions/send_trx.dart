// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:darttonconnect/exceptions.dart';
import 'package:darttonconnect/logger.dart';

Future sendTrx(String link, int value) async {
  print(value);
  final stringValue = value.toString();
  print(stringValue);
  var transaction = {
    "validUntil": 1718097354,
    "messages": [
      {
        "address": link,
        "amount": stringValue,
      }
    ]
  };
  print(FFAppState().tonConnector.wallet);
  try {
    await FFAppState().tonConnector.sendTransaction(transaction);
  } catch (e) {
    if (e is UserRejectsError) {
      logger.d(
          'You rejected the transaction. Please confirm it to send to the blockchain');
      print(
          'You rejected the transaction. Please confirm it to send to the blockchain');
    } else {
      logger.d('Unknown error happened $e');
      print('Unknown error happened');
    }
  }
}
