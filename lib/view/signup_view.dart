import "package:flutter/material.dart";
import "package:mvvm/res/components/round_button.dart";
import "package:mvvm/utils/routes/routes_name.dart";
import "package:mvvm/utils/utils.dart";
import "package:mvvm/view_model/auth_view_model.dart";
import "package:provider/provider.dart";

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'email',
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (valu) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              //for Password
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'password',
                          prefixIcon: Icon(Icons.lock_open),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: _obsecurePassword.value
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility))),
                    );
                  }),
              SizedBox(height: height * .05),
              RoundButton(
                  title: "signUp",
                  loading: authViewModel.signUpLoading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.toastMessage("email");
                      Utils.flushBarErrorMessage(
                          "please enter a valid email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "please enter password", context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          "password length must be 6", context);
                    } else {
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                      };
                      authViewModel.signUpApi(data, context);
                      // ignore: avoid_print
                      print("signup api hit");
                    }
                  }),
              SizedBox(
                height: height * .05,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text("already have an acount? SignIn"))
            ],
          ),
        ));
  }
}
