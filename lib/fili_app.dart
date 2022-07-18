import 'index.dart';

final LocalNotificationService _notificationService =
    getIt<LocalNotificationService>();

class FiliApp extends StatelessWidget {
  const FiliApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TMDBApi.alice.getNavigatorKey(),
      title: 'Fili',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => PopularCubit(TMDBService())..init(),
          child: BlocBuilder<PopularCubit, PopularState>(
            builder: (context, state) {
              PopularCubit cubit = context.read<PopularCubit>();
              return Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Current Page: ${state.currentPage}'),
                      const SizedBox(height: 8),
                      Text('Items: ${state.movies.length}'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: cubit.getPopularMovies,
                        child: const Text('Get More Popular Movies'),
                      ),
                      ElevatedButton(
                        onPressed: () => _notificationService.show(
                          Movie.fromJson(
                            {
                              'adult': false,
                              'backdrop_path':
                                  '/qTkJ6kbTeSjqfHCFCmWnfWZJOtm.jpg',
                              'genre_ids': [10751, 16, 12, 35, 14],
                              'id': 438148,
                              'original_language': 'en',
                              'original_title': 'Minions: The Rise of Gru',
                              'overview':
                                  'A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.',
                              'popularity': 13207.201,
                              'poster_path': '/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg',
                              'release_date': '2022-06-29',
                              'title': 'Minions: The Rise of Gru',
                              'video': false,
                              'vote_average': 7.6,
                              'vote_count': 375,
                            },
                          ),
                        ),
                        child: const Text('Show Notification'),
                      ),
                      ElevatedButton(
                        onPressed: _notificationService.cancelAllNotifications,
                        child: const Text('Cancel Notification'),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.status == ResponseCubitState.loading) ...[
                        const SizedBox(height: 200),
                        const CircularProgressIndicator(),
                        const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
