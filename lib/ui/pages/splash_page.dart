part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 136,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  'New Experience',
                  style: blackTextFont.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Watch a new movie much\neasier than any before",
                style: greyTextFont.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: const EdgeInsets.only(top: 70, bottom: 19),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor),
                  onPressed: () {
                    context
                        .read<PageBloc>()
                        .add(GoToRegistrationPage(RegistrationData()));
                  },
                  child: Text(
                    "Get Started",
                    style: whiteTextFont.copyWith(fontSize: 18),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign In to ",
                    style: greyTextFont.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(GoToLoginPage());
                    },
                    child: Text(
                      "My Account",
                      style: purpleTextFont.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
