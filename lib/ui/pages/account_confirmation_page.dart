part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  const AccountConfirmationPage(this.registrationData, {Key? key})
      : super(key: key);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 90),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.read<PageBloc>().add(GoToSplashPage());
                            },
                            child: const Icon(Icons.arrow_back_ios_new_rounded,
                                color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\n New Account",
                            style: blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: (widget.registrationData.profileImage ==
                                    null)
                                ? const AssetImage("assets/user_pic.png")
                                : FileImage(
                                        widget.registrationData.profileImage!)
                                    as ImageProvider,
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "Welcome,",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.registrationData.name,
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Yes, I am in",
                      style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    isSigningUp
                        ? const SpinKitFadingCircle(
                            color: Color(0xFF3E9D9D),
                            size: 45,
                          )
                        : GestureDetector(
                            onTap: () async {
                              setState(() {
                                isSigningUp = true;
                              });

                              imageFileToUpload = widget.registrationData.profileImage;

                              SignInSignUpResult result = await AuthServices.signUp(
                                widget.registrationData.email,
                                widget.registrationData.password,
                                widget.registrationData.name,
                                widget.registrationData.selectedGenres,
                                widget.registrationData.selectedLang,
                              );
                              
                              if (result.user == null) {
                                setState(() {
                                  isSigningUp = false;
                                });
                                Flushbar(
                                  duration: const Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: const Color(0xFFFF5C83),
                                  message: result.message,
                                ).show(context);
                              }
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFF3E9D9D),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
