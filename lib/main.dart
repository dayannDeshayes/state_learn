import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'main.pods.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(helloMessagerProvider);
    final myTab = ref.watch(wordTabProvider);

    // ref.read(helloMessagerProvider.notifier).goodbye();
    return MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 70,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(value,style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                          
                        )),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        ref.read(helloMessagerProvider.notifier).goodbye(),
                    icon: const Icon(Icons.add_circle)),
                Expanded(
                  child: ListView.builder(
                  itemCount: myTab.length,
                  itemBuilder: (context, i) {
                    var tab = myTab[i];
                    return ListTile(
                      visualDensity: VisualDensity.comfortable,
                      title: Row(
                        children: [
                          Text('item: '+ tab,style:Theme.of(context).textTheme.bodyMedium,),
                          Spacer(),
                          Text('delete',style:Theme.of(context).textTheme.bodyMedium,),
                          IconButton(
                              onPressed: () => ref.read(wordTabProvider.notifier).remove(i),
                              icon: const Icon(
                                  Icons.remove_circle_outline_outlined
                              ))
                        ],
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => ref.read(wordTabProvider.notifier).addBar('other word'),
                    child: const Text('add a word'),
                  ),
                )
],

            ),
          ),
        ));
  }
}

/*ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: MyHomePage(),
      ),
    );*/

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = const LikePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  const NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                //SelectedIndex propriété indiquant l'index dans la barre de recherche
                selectedIndex: selectedIndex,
                //méthode appelé lors d'une destination sélectionné dans la barre navigation
                onDestinationSelected: (value) {
                  //setStat appelé pour mettre à jour l'état interne de l'applcation et définir la valeur de `selectedIndex sur la valeur de value passé entrée
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('NO favorites yet'),
      );
    } else {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          for (var pair in appState.favorites)
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
            ),
        ],
      );
    }
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context représente le contexte dans lequel l'application s'exécute, il est généralement passé à travers les widgets dans la structure de l'arbre de widgets.
    //watch est une méthode de la classe BlocProvider qui permet de souscrire à un bloc particulier et de recevoir les mises à jour de son état.
    //<MyAppState> est un type générique qui spécifie quel bloc vous voulez souscrire. Dans ce cas, il s'agit d'un bloc nommé MyAppState.
    var appState = context.watch<MyAppState>();
    //La valeur retournée par watch est stockée dans une variable nommée appState qui peut être utilisée pour accéder à l'état actuel du bloc MyAppState.
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20),

              // ↓ Make the following change.
              child: Text(
                pair.asLowerCase,
                style: style,
                semanticsLabel: pair.asPascalCase,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
