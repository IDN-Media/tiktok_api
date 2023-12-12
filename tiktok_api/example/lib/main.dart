import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:tiktok_api/tiktok_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _tiktokApiPlugin = TiktokApi();

  @override
  void initState() {
    super.initState();

    /// Step 1. Call the setup and passed the client key (this is applies to Android only)
    _tiktokApiPlugin.setup('<YOUR_TIKTOK_APP_CLIENT_KEY>');
  }

  // Platform messages are asynchronous, so we initialize in an async method.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(child: const  Text('Login to Tikok'), onPressed: () async {

            /// Step 2. Call login and passed the scopes and redirect uri
            final result = await _tiktokApiPlugin.login(['user.info.basic'], '<YOUR_TIKTOK_APP_REDIRECT_URI>', true);
            
            /// Step 3. Store the code verifier, we will need this later on for getting the access token
            final codeVerifier = result.codeVerifier!;

            /// Step 4. Tiktok will redirect to your app redirect_uri and you can retrieve the code from the query string.
            /// You have to use App Link or Universal Link to make sure the OS can redirect to your app.
            /// Below is an example using uni_link package
            /*
            if(link.startsWith('<REDIRECT_URI>')){
              final authCode = link.replaceAll("<REDIRECT_URI>?code=", "");

              /// Once we got the authCode we can exchange it with the access token
              /// Read more here: https://developers.tiktok.com/doc/oauth-user-access-token-management
              
            } 
            */           

          },),
        ),
      ),
    );
  }
}
