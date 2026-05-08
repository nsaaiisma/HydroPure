import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);