import 'package:advicer/3_application/core/services/theme_service.dart';
import 'package:advicer/pages/advice/widget/custom_button.dart';
import 'package:advicer/pages/advice/widget/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            children: const [
              Expanded(
                  child: Center(
                      child:
                          ErrorMessage(message: "Oops something went wrong"))),
              /*AdviceField(
                advice: 'example advice-your day will be good',
              )*/

              /* CircularProgressIndicator(
                color: themedata.colorScheme.secondary,
              )*/

              /* Text(
                        'your advice is waiting for you!',
                        style: themedata.textTheme.bodyLarge,
                      ),*/

              SizedBox(
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
