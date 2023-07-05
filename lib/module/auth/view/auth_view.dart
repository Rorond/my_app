import 'package:flutter/material.dart';
import 'package:my_app/core.dart';

class AuthView extends AuthConsumerWidget {
  const AuthView({super.key});

  @override
  void beforeInitState(bloc, state) {}

  @override
  Widget buildView(context, bloc, state) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "My APPS",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(246, 8, 109, 156),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'images/login.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: TextFormField(
                        initialValue: state.username,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(246, 8, 109, 156),
                          ),
                        ),
                        onChanged: (value) {
                          state.username = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: TextFormField(
                        initialValue: state.password,
                        obscureText: state.status,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(246, 8, 109, 156),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  bloc.add(AuthChangeStatusEvent()),
                              icon: state.status == true
                                  ? const Icon(
                                      Icons.remove_red_eye,
                                      size: 24.0,
                                      color: Color.fromARGB(246, 8, 109, 156),
                                    )
                                  : const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 24.0,
                                      color: Colors.red,
                                    ),
                            ),
                            border: InputBorder.none),
                        onChanged: (value) {
                          state.password = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(246, 8, 109, 156),
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () => bloc.add(AuthLoginEvent()),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: MediaQuery.of(context).size.width * 0.40,
            child: state.isLoading
                ? Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 70,
                    width: 70,
                    child: const CircularProgressIndicator(),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
