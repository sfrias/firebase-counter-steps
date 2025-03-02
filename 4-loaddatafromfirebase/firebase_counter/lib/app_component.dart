// Copyright (c) 2017, janamou. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'package:firebase/firebase.dart';

import 'todo_list/todo_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [CORE_DIRECTIVES, materialDirectives, TodoListComponent],
  providers: const [materialProviders],
)
class AppComponent implements OnInit {
  int count = 0;
  DatabaseReference ref;

  @override
  ngOnInit() {
    initializeApp(
        apiKey: "AIzaSyAH7S_gsce9RtNI8w0z7doiP3ugVJM8ZbI",
        authDomain: "angulardart-firebase-io-2017.firebaseapp.com",
        databaseURL: "https://angulardart-firebase-io-2017.firebaseio.com",
        storageBucket: "angulardart-firebase-io-2017.appspot.com");

    ref = database().ref('counter');
    ref.onValue.listen((e) {
      count = e.snapshot.val();
    });
  }
}
