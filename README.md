Basically, navigator works as `stack`. When `push` is called, the widget is placed on top of `stack`. Like this:

<p align="center"><img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/d067defd-dbbd-4a42-b661-0fe8eaf136fe/1_v77nG0BRIWrOghj8fCq_EA.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T153612Z&X-Amz-Expires=86400&X-Amz-Signature=adad3c46080c8bcd748ac21428e581919edaff53a29a0a9f750770efae75cf33&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%221_v77nG0BRIWrOghj8fCq_EA.png%22" /></p>

## Navigator 2.0

Flutter 1.22 introduced navigator 2.0, a new declarative API that allows you to take full control of your navigation stack. Advantages:

- Manage your pages. More power, more control;
- Can use both imperative and declarative styles in the same app;
- Parse routes and handles web URLs and deep linking.

It include new keys:

- [**Page**](https://master-api.flutter.dev/flutter/widgets/Page-class.html): an immutable class that describes the configuration for a route;
- [**Router**](https://master-api.flutter.dev/flutter/widgets/Router-class.html): configures the list of pages the Navigator displays;
- **[RouteInformationParser](https://master-api.flutter.dev/flutter/widgets/Router/routeInformationParser.html)**: the route information parser for the router;
- [**RouterDelegate**](https://master-api.flutter.dev/flutter/widgets/RouterDelegate-class.html): This delegate is the core piece of the Router to build and configure a navigating widget;
- **[BackButtonDispatcher](https://master-api.flutter.dev/flutter/widgets/BackButtonDispatcher-class.html)**: reports back button presses to the Router.

## References

[Learning Flutter’s new navigation and routing system](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade)

[Flutter apprentice - Navigator 2.0 overview](https://www.raywenderlich.com/books/flutter-apprentice/v2.0/chapters/7-routes-navigation#toc-chapter-013-anchor-004)

[Github olmps/memo](https://github.com/olmps/memo)
