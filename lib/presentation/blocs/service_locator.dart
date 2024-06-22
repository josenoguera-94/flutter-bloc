import 'package:blocs_app/config/config.dart';
import 'package:get_it/get_it.dart';

import 'blocs.dart';

GetIt getIt = GetIt.instance;
// serviceLocator es un patron de diseño que permite centralizar la creación de instancias de clases
void serviceLocatorInit() {
  
  // puede ser usado para estados de un cubit a otro
  // final username = getIt.registerSingleton(UsernameCubit());
  // final user = username.state;
  // getIt.registerSingleton(ThemeCubit(user: user));
  

  // se puede usar para escuchar los cambios de un cubit
  // final themeCubit = getIt.registerSingleton(ThemeCubit());
  // themeCubit.stream.listen((event) {
  //   print('ThemeCubit: $event');
  // });

  // con getit se puede crear una instancia solo cuando se necesite (averiguar como hacerlo)
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());


  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(
    PokemonBloc(
      fetchPokemon: PokemonInformation.getPokemonName, // inyección de dependencia
    )
  );

  
  // final historicBloc = getIt.registerSingleton( HistoricLocationBloc() );
  getIt.registerSingleton( HistoricLocationBloc() );


  getIt.registerSingleton( 
      GeolocationCubit(
        // onNewUserLocationCallback: historicBloc.onNewUserLocation,
        onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation,
      )
        ..watchUserLocation()
  );


}
