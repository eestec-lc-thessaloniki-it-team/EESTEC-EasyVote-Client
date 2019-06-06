# EESTEC Easy-Vote Client

This serves as the client-side of the EESTEC Voting Application of the EESTEC LC Thessaloniki's IT Team.
In this attempt, I will try to create a dart UI Library for EESTEC components in order to make the life
of the UI Developers easier and write less code for the UI.

# Flutter Logic

Flutter has the React ideology, built into it. Meaning that you write a virtual DOM and you mix the BI with the UI
in order to make your code 
1) Centralized
2) Easy to maintain
3) Easy to develop.

Flutter is big with Widgets. Widgets are packs of code that work like Classes but they are mainly used for UI components.
Other than that, every Widget has a child that takes another Widget as a paramater. This basically creates the "DOM tree"
(It's not actually a DOM Tree, since it's not HTML).

# Dart

Flutter is built in Dart. Dart is a language that was developed by Google in order to fix the problems that Javascript has (No scope,
no types etc.). It looks like Java or C# but it's more versitile and forgiving than those two cause at the end of the day it needs to be
transpiled to Javascript for Web Applications. Dart transpiles to Javascript for Web and native ARM code for mobile. That gives Flutter
the ability to be cross-platform in iOS and Android with only duplicated code in the UI (if you so choose, to have different design
languages, Cupertino for iOS and Material for Android. But the BI stays the same.

# Docs

More Documentation for the Widgets that I will create will be added during the progression of the app. This ReadMe will be used in order
for the next IT Team to maintain the application or even expand it with ease.
