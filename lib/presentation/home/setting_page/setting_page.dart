import 'package:flutter/material.dart';
import 'package:muaho/common/common.dart';
import 'package:muaho/generated/assets.gen.dart';
import 'package:muaho/generated/locale_keys.g.dart';
import 'package:muaho/main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final AppLocalization appLocalization = getIt.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 92),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    userInfoBuilder(context),
                    Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(top: 35, left: 20, right: 20),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _itemSettingBuilder(
                            title: LocaleKeys.setting_emailTitle.translate(),
                            leadingIcon: Icon(
                              Icons.email_outlined,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            trailingIcon: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.grey[400] ?? Colors.grey,
                            ),
                            subtitle: "Muaho@email.com",
                            onPress: () {},
                            underlineWidth: 0.5,
                          ),
                          _itemSettingBuilder(
                            title:
                                LocaleKeys.setting_phoneNumberTitle.translate(),
                            subtitle: '0909909909',
                            leadingIcon: Icon(
                              Icons.phone_iphone_sharp,
                              color: Colors.blue,
                            ),
                            trailingIcon: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.grey[400] ?? Colors.grey,
                            ),
                            onPress: () {},
                            underlineWidth: 0.5,
                          ),
                          // _itemSettingBuilder(
                          //   title: LocaleKeys.setting_addressTitle.translate(),
                          //   subtitle: '171/6ter Tôn Thất Thuyết',
                          //   leadingIcon: Icon(
                          //     Icons.home_sharp,
                          //     color: Colors.amber,
                          //   ),
                          //   trailingIcon: Icon(
                          //     Icons.navigate_next_sharp,
                          //     color: Colors.grey[400] ?? Colors.grey,
                          //   ),
                          //   onPress: () {},
                          //   underlineWidth: 0.5,
                          // ),
                          _itemSettingBuilder(
                            title: LocaleKeys.setting_discountTitle.translate(),
                            subtitle: LocaleKeys.setting_discountSubtitle
                                .translate(namedArgs: {
                              "discount": "8",
                            }),
                            leadingIcon: Icon(
                              Icons.local_offer,
                              color: Colors.red,
                            ),
                            trailingIcon: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.grey[400] ?? Colors.grey,
                            ),
                            onPress: () {},
                            underlineWidth: 0.5,
                          ),
                          _itemSettingBuilder(
                            title: LocaleKeys.setting_languageTitle.translate(),
                            subtitle: LocaleKeys.setting_currentLanguageSubtitle
                                .translate(),
                            leadingIcon: Icon(
                              Icons.language,
                              color: Colors.green,
                            ),
                            trailingIcon: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.grey[400] ?? Colors.grey,
                            ),
                            onPress: () {
                              _showDialogResult(context);
                            },
                            underlineWidth: 0.5,
                          ),
                          _itemSettingBuilder(
                            title: LocaleKeys.setting_changePasswordTitle
                                .translate(),
                            leadingIcon: Icon(
                              Icons.change_circle,
                              color: Colors.brown,
                            ),
                            trailingIcon: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.grey[400] ?? Colors.grey,
                            ),
                            onPress: () {},
                            underlineWidth: 0.5,
                          ),
                          _itemSettingBuilder(
                            title: LocaleKeys.setting_logoutTitle.translate(),
                            leadingIcon: Icon(
                              Icons.logout,
                              color: Colors.grey,
                            ),
                            trailingIcon: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.grey[400] ?? Colors.grey,
                            ),
                            onPress: () {},
                            underlineWidth: 0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showDialogResult(BuildContext context) async {
    int _value = 1;
    if (appLocalization.getCurrentLocale(context).languageCode == 'vi') {
      _value = 1;
    } else {
      _value = 2;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          side: BorderSide(
              color: Theme.of(context).primaryColorLight, width: 1.5),
        ),
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                LocaleKeys.setting_languageSelectionTitle.translate(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                await appLocalization.setLocale(
                  context,
                  Locale("vi"),
                );
                context.pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    activeColor: Theme.of(context).primaryColorLight,
                    onChanged: (int? value) async {
                      await appLocalization.setLocale(
                        context,
                        Locale("vi"),
                      );
                      context.pop();
                    },
                  ),
                  Text("Tiếng Việt"),
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                await appLocalization.setLocale(
                  context,
                  Locale("en"),
                );
                context.pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Radio(
                    value: 2,
                    activeColor: Theme.of(context).primaryColorLight,
                    groupValue: _value,
                    onChanged: (value) async {
                      await appLocalization.setLocale(
                        context,
                        Locale("en"),
                      );
                      context.pop();
                    },
                  ),
                  Text("English"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemSettingBuilder({
    required Icon leadingIcon,
    required String title,
    String? subtitle,
    Function()? onPress,
    Icon? trailingIcon,
    double? underlineWidth,
  }) {
    return GestureDetector(
      onTap: onPress,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SizedBox(
            height: subtitle != null ? 10 : 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: leadingIcon,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                    subtitle != null
                        ? SizedBox(
                            height: 7,
                          )
                        : SizedBox.shrink(),
                    subtitle != null
                        ? Text(
                            subtitle,
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              trailingIcon != null
                  ? Expanded(
                      flex: 2,
                      child: trailingIcon,
                    )
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(
            height: subtitle != null ? 12 : 20,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: SizedBox(
              width: double.infinity,
              height: underlineWidth ?? 0.5,
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Container userInfoBuilder(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                  radius: 39,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Tiny Flutter team",
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.mode_edit,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.images.crownSvgrepoCom.svg(
                          width: 20,
                          height: 20,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Thành viên vàng",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
