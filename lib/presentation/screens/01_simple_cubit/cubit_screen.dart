import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';


class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),

      // el BlocBuilder se utiliza para escuchar los cambios de un cubit
      // solo el va a estar pendiente de los cambios del cubit
      // y se redibuja el widget que está dentro del builder
      //forma 2
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          // buildWhen: (previous, current) => previous != current,
          // puede validar si los estados son iguales
          // puede validar partes del estado
          builder: (context, state) {
            debugPrint('CubitScreen: $state');
            return Text(state);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // dependiendo el nivel de donde se encuentre el cubit
          // el cubit se vuelve a inicializar

          // .read solo se usa para leer el estado actual del cubit
          // o para tener acceso a un cubit sin estar pendiente de los cambios
          // se utilizan en métodos

          //forma 2
          // final usernameCubit = context.read<UsernameCubit>();
          context.read<UsernameCubit>().setUsername(
            RandomGenerator.getRandomName()
          );

        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}


class CubitScreen1 extends StatelessWidget {

  const CubitScreen1({super.key});

  @override
  Widget build(BuildContext context) {

    // forma 1
    // final usernameCubit = context.watch<UsernameCubit>().state; // Obtiene el estado del cubit
    
    final usernameCubit = context.watch<UsernameCubit>();

    // .watch esta escuchando a los cambios del cubit
    // y se redibuja el build cada vez que cambia el estado del cubit

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),

      // forma 1
      body: Center(
        child: Text( usernameCubit.state )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // forma 1
          // se está utilizando con el watch
          usernameCubit.setUsername(
            RandomGenerator.getRandomName()
          );

        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}