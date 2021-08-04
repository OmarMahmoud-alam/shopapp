import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/loginRegist/cubitlogin.dart';
import 'package:shopapp/loginRegist/loginState.dart';
import 'package:shopapp/shared/component.dart';

//ignore: must_be_immutable
class Login extends StatelessWidget {
  final TextEditingController emailcont = TextEditingController();
  final TextEditingController passwordcont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool ispassword = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitLogin(),
      child: BlocConsumer<CubitLogin, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.menu),
                actions: [Icon(Icons.app_registration_outlined)],
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login in'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Login to our browser the hot offers ',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                              label: 'email',
                              prefix: Icons.email_outlined,
                              controller: emailcont,
                              type: TextInputType.emailAddress,
                              validate: (s) {
                                if (s!.isEmpty) return 'enter the email pls ';
                              }),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                              label: 'password',
                              prefix: Icons.lock_outline,
                              suffix: CubitLogin.get(context).ispassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              suffixPressed: () {
                                CubitLogin.get(context).changevisiblepassword();
                              },
                              isPassword: CubitLogin.get(context).ispassword,
                              controller: passwordcont,
                              type: TextInputType.visiblePassword,
                              validate: (s) {
                                if (s!.isEmpty)
                                  return 'enter the password pls ';
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  print(emailcont.text);
                                }
                              },
                              text: 'LOGIN IN'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              TextButton(
                                  onPressed: () {
                                    print(5);
                                  },
                                  child: Text('Registe now'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
