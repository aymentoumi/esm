library component;

import 'package:event/event.dart';
import 'package:eventsubscriber/eventsubscriber.dart';
import 'package:url_router/url_router.dart';
import 'package:flutter/material.dart';

///
/// [Component] class allow to create a widget with mutable state.
///
/// Sample use :
/// ```dart
/// class Counter extends Component<int> {
///   const Counter(super.state, {super.key});
///
///   @override
///   Widget render(BuildContext context) {
///     return Center(
///       child: Column(
///         mainAxisAlignment: MainAxisAlignment.center,
///         children: <Widget>[
///           const Text(
///             'You have pushed the button this many times:',
///           ),
///           Text(
///             '${state.value}',
///             style: Theme.of(context).textTheme.headlineMedium,
///           ),
///           ElevatedButton(
///             onPressed: () => state.value++,
///             child: const Text('Increment'),
///           ),
///         ],
///       ),
///     );
///   }
/// }
/// ```
///
abstract class Component<T> extends StatelessWidget {
  /// Component [state] attribut
  final State<T> state;

  ///
  /// Constructor.
  ///
  const Component(this.state, {super.key});

  ///
  /// Return [Component] widget.
  ///
  Widget render(BuildContext context);

  ///
  /// Refresh [Component] widget.
  ///
  void refresh() => state.update();

  ///
  /// StatelessWidget build function - not to override.
  ///
  @override
  Widget build(BuildContext context) => EventSubscriber(
      event: state._event, builder: (context, args) => render(context));
}

class _Args<T> extends EventArgs {
  T value;

  _Args(this.value);
}

///
/// [T] state class.
///
class State<T> {
  late final _Args<T> _args;
  final _event = Event<_Args<T>>();

  ///
  /// Create new state for [value].
  ///
  State(T value) : _args = _Args(value);

  ///
  /// Get state's [value].
  ///
  T get value => _args.value;

  ///
  /// Set state's [value] and refresh component widget.
  ///
  set value(T val) {
    _args.value = val;
    _event.broadcast(_args);
  }

  ///
  /// Notify state's retated components to refresh widget.
  ///
  void update() => _event.broadcast();
}

///
/// Abstract Application class.
///
abstract class Application {
  final String _url;

  ///
  /// Constructor that define the application boot [url].
  ///
  const Application({String url = '/'}) : _url = url;

  ///
  /// Application widget builder that run every time the url changed.
  ///
  Widget render(BuildContext context);

  ///
  /// Route information parser ready to be used by the [MaterialApp.router] at a later stage.
  ///
  RouteInformationParser<Object>? get routeInformationParser =>
      UrlRouteParser();

  ///
  /// Router delegate ready to be used by the [MaterialApp.router] at a later stage.
  ///
  RouterDelegate<Object>? get routerDelegate => UrlRouter(
        url: _url,
        builder: ((router, navigator) => Navigator(
              onGenerateRoute: (settings) {
                ComponentContext._app = this;
                ComponentContext._router = router;
                ComponentContext._routeSettings = settings;
                return MaterialPageRoute(builder: render);
              },
            )),
      );

  ///
  /// Shortcut that returns a MaterialApp for this application.
  ///
  MaterialApp operator ~() => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      );
}

extension ComponentContext on BuildContext {
  static late Application _app;
  static late UrlRouter _router;
  static late RouteSettings _routeSettings;

  ///
  /// Returns the current application.
  ///
  T app<T extends Application>() => _app as T;

  ///
  /// Returns the current [url].
  ///
  String get url => _router.url;

  ///
  /// Modify the current [url].
  ///
  set url(String value) => _router.url = value;

  ///
  /// Get the current route settings.
  ///
  RouteSettings get routeSettings => _routeSettings;
}

extension StateBuilder<T> on T {
  ///
  /// Build a state for [T] object.
  ///
  State<T> get state => State<T>(this);
}
