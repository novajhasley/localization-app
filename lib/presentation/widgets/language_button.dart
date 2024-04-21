import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/domain/entities/language.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_event.dart';

class LanguageButton extends StatefulWidget {
  final Language language;

  const LanguageButton({
    super.key,
    required this.language,
  });

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = Localizations.localeOf(context).languageCode;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = widget.language.languageCode;
        });
        BlocProvider.of<LocalizationBloc>(context)
            .add(SetLocale(Locale(widget.language.languageCode)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedLanguage == widget.language.languageCode
              ? Colors.blue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            const Icon(IconData(0xf017b, fontFamily: 'MaterialIcons'),
                color: Colors.white),
            const SizedBox(width: 10),
            Text(widget.language.localizedName,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
