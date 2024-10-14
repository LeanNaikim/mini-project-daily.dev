import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project/pages/signUp.dart';

void main (){
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LoginHomePage(),
    );
  }
}

class LoginHomePage extends StatelessWidget {
  const LoginHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Image.asset(
                  'assets/images/logo1.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Container(
                child: const Text('Create your Account', style: TextStyle(fontSize: 24 , color: Colors.white )),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email or Phone number',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white70, // Change this to the color you want for the text
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white70, // Change this to the color you want for the text
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                      'Login' ,
                      style: TextStyle(fontSize: 17.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                      endIndent: 20,
                      indent: 40,
                    ),
                  ),
                  Text('Or sign in with' , style: TextStyle(color: Colors.grey , fontSize: 17.0)),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 15,
                      endIndent: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.string(
                          '''
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 256 256">
                              <path fill="#1877f2" d="M256 128C256 57.308 198.692 0 128 0S0 57.308 0 128c0 63.888 46.808 116.843 108 126.445V165H75.5v-37H108V99.8c0-32.08 19.11-49.8 48.348-49.8C170.352 50 185 52.5 185 52.5V84h-16.14C152.959 84 148 93.867 148 103.99V128h35.5l-5.675 37H148v89.445c61.192-9.602 108-62.556 108-126.445" />
                              <path fill="#fff" d="m177.825 165l5.675-37H148v-24.01C148 93.866 152.959 84 168.86 84H185V52.5S170.352 50 156.347 50C127.11 50 108 67.72 108 99.8V128H75.5v37H108v89.445A129 129 0 0 0 128 256a129 129 0 0 0 20-1.555V165z" />
                            </svg>
                          ''',
                          width: 100.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.string(
                          '''
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M11.862 3.94a3.5 3.5 0 0 1 3.5-3.5h1.05v1.05a3.5 3.5 0 0 1-3.5 3.5h-1.05zm4.452 1.074c.601.04 2.183.187 3.609 1.283c.418.322.82.723 1.176 1.22l.666.93l-1.01.536c-.014.008-.197.11-.443.307c-.603.484-1.43 1.403-1.417 2.805c.014 1.257.578 2.073 1.155 2.598c.508.462 1.01.68 1.106.722q.028.012.007.005l.937.298l-.282.942c-.01.032-.039.127-.09.273a12.5 12.5 0 0 1-1.585 3.024c-.451.631-.982 1.365-1.62 1.934c-.66.588-1.495 1.056-2.558 1.073h-.004h.008h-.004c-.936.021-1.583-.246-2.095-.457l-.024-.01c-.502-.207-.895-.366-1.547-.366c-.708 0-1.132.17-1.662.386l-.026.01c-.475.194-1.071.437-1.894.47l-.01.001c-1.09.034-1.97-.494-2.64-1.093c-.664-.594-1.23-1.357-1.69-1.987l-.002-.003c-1.037-1.431-1.933-3.418-2.316-5.49c-.382-2.065-.274-4.34.87-6.237c1.142-1.894 3.175-3.101 5.407-3.13H8.33h.011h-.005c1.004-.023 1.944.333 2.596.58l.058.023c.27.102.482.182.67.239c.193.057.295.07.34.07c.019 0 .099-.007.28-.062c.176-.053.379-.129.643-.228l.05-.019c.795-.298 1.989-.746 3.341-.647m-.143 1.995c-.884-.066-1.707.23-2.546.544l-.018.007c-.242.09-.503.188-.748.262A3 3 0 0 1 12 7.97c-.331 0-.65-.075-.916-.155c-.262-.08-.537-.183-.785-.277l-.018-.007c-.72-.273-1.323-.488-1.903-.474h-.012c-1.52.019-2.928.842-3.723 2.163v.001c-.805 1.333-.947 3.058-.618 4.84c.329 1.777 1.105 3.486 1.97 4.68c.472.647.922 1.241 1.405 1.674c.477.426.874.594 1.24.584c.454-.019.771-.142 1.243-.334l.012-.005c.574-.234 1.296-.529 2.404-.529c1.057 0 1.752.287 2.297.512l.013.005c.494.204.812.328 1.314.317h.008c.442-.007.836-.189 1.261-.567c.446-.398.855-.948 1.324-1.605l.001-.002a10.5 10.5 0 0 0 1.092-1.936a6 6 0 0 1-.904-.682a5.43 5.43 0 0 1-1.81-4.057v-.002c-.018-2.05 1.078-3.421 1.9-4.158l-.091-.073c-.943-.725-2.028-.841-2.524-.873z" />
                            </svg>
                          ''',
                          width: 100.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.string(
                          '''
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                              <path fill="currentColor" fill-rule="evenodd" d="M12.006 2a9.85 9.85 0 0 0-6.484 2.44a10.32 10.32 0 0 0-3.393 6.17a10.48 10.48 0 0 0 1.317 6.955a10.05 10.05 0 0 0 5.4 4.418c.504.095.683-.223.683-.494c0-.245-.01-1.052-.014-1.908c-2.78.62-3.366-1.21-3.366-1.21a2.7 2.7 0 0 0-1.11-1.5c-.907-.637.07-.621.07-.621c.317.044.62.163.885.346c.266.183.487.426.647.71c.135.253.318.476.538.655a2.08 2.08 0 0 0 2.37.196c.045-.52.27-1.006.635-1.37c-2.219-.259-4.554-1.138-4.554-5.07a4.02 4.02 0 0 1 1.031-2.75a3.77 3.77 0 0 1 .096-2.713s.839-.275 2.749 1.05a9.26 9.26 0 0 1 5.004 0c1.906-1.325 2.74-1.05 2.74-1.05c.37.858.406 1.828.101 2.713a4.02 4.02 0 0 1 1.029 2.75c0 3.939-2.339 4.805-4.564 5.058a2.47 2.47 0 0 1 .679 1.897c0 1.372-.012 2.477-.012 2.814c0 .272.18.592.687.492a10.05 10.05 0 0 0 5.388-4.421a10.47 10.47 0 0 0 1.313-6.948a10.32 10.32 0 0 0-3.39-6.165A9.85 9.85 0 0 0 12.007 2Z" clip-rule="evenodd" />
                            </svg>
                          ''',
                          width: 100.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.string(
                          '''
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 48 48">
                              <path fill="#ffc107" d="M43.611 20.083H42V20H24v8h11.303c-1.649 4.657-6.08 8-11.303 8c-6.627 0-12-5.373-12-12s5.373-12 12-12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4C12.955 4 4 12.955 4 24s8.955 20 20 20s20-8.955 20-20c0-1.341-.138-2.65-.389-3.917" />
                              <path fill="#ff3d00" d="m6.306 14.691l6.571 4.819C14.655 15.108 18.961 12 24 12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4C16.318 4 9.656 8.337 6.306 14.691" />
                              <path fill="#4caf50" d="M24 44c5.166 0 9.86-1.977 13.409-5.192l-6.19-5.238A11.9 11.9 0 0 1 24 36c-5.202 0-9.619-3.317-11.283-7.946l-6.522 5.025C9.505 39.556 16.227 44 24 44" />
                              <path fill="#1976d2" d="M43.611 20.083H42V20H24v8h11.303a12.04 12.04 0 0 1-4.087 5.571l.003-.002l6.19 5.238C36.971 39.205 44 34 44 24c0-1.341-.138-2.65-.389-3.917" />
                            </svg>
                          ''',
                          width: 100.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Not a member yet ?', style: TextStyle(color: Colors.grey)),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO : Navigate to the SignUpPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}