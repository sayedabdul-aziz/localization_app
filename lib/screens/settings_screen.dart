import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/cubit/locale_cubit.dart';
import 'package:localization_app/shared/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr(context)),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Text(
                'language'.tr(context),
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              BlocConsumer<LocaleCubit, ChangeLocalState>(
                listener: (context, state) {
                  Navigator.of(context).pop();
                },
                builder: (context, state) {
                  return DropdownButton<String>(
                    value: state.locale.languageCode,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: [
                      DropdownMenuItem(
                          value: "en", child: Text('english'.tr(context))),
                      DropdownMenuItem(
                          value: "ar", child: Text('arabic'.tr(context))),
                    ],
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        context.read<LocaleCubit>().changeLanguage(newValue);
                      }
                    },
                  );
                },
              ),
            ],
          )),
    );
  }
}
