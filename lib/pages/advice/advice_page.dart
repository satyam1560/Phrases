import 'package:advicer/3_application/core/services/theme_service.dart';
import 'package:advicer/pages/advice/widget/custom_button.dart';
import 'package:advicer/pages/advice/widget/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../injection.dart';
import 'bloc/advicer_bloc.dart';
import 'widget/advice_field.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerBloc>(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Advicer',
            style: themedata.textTheme.displayLarge,
          ),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                  child: Center(child: BlocBuilder<AdvicerBloc, AdvicerState>(
                builder: (context, state) {
                  if (state is AdvicerInitial) {
                    return Text(
                      'your advice is waiting for you!',
                      style: themedata.textTheme.bodyLarge,
                    );
                  } else if (state is AdvicerStateLoading) {
                    return CircularProgressIndicator(
                      color: themedata.colorScheme.secondary,
                    );
                  } else if (state is AdvicerStateLoaded) {
                    return AdviceField(
                      advice: state.advice,
                    );
                  } else if (state is AdvicerStateError) {
                    return ErrorMessage(message: state.message);
                    // final errorMessage = ErrorMessage(message: state.message);
                    // return errorMessage;
                  }
                  return const SizedBox();
                },
              ))),
              /**/

              /* */

              /* */

              const SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(),
                ),
              )
            ],
          ),
        ));
  }
}
