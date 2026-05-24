import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameValidators] examples.
class GameValidatorsPage extends StatefulWidget {
  const GameValidatorsPage({super.key});

  @override
  State<GameValidatorsPage> createState() => _GameValidatorsPageState();
}

class _GameValidatorsPageState extends State<GameValidatorsPage> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameValidators'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameValidators',
              subtitle: 'FormField validators · caller-supplied messages',
              body:
                  'Pure functions returning the standard FormField validator '
                  'signature `String? Function(String?)`. Messages are passed '
                  'in by the caller — no localization baked in. Tap "Validate" '
                  'to run all rules against the current values.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Try it',
              description:
                  'Each field uses a different validator. The combined Form '
                  'validates on demand.',
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Required',
                        helperText: 'GameValidators.required',
                      ),
                      validator: GameValidators.required(
                        message: 'Please enter something',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        helperText: 'GameValidators.email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: GameValidators.email(
                        requiredMessage: 'Email is required',
                        invalidMessage: 'Invalid email format',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Number',
                        helperText: 'GameValidators.number',
                      ),
                      keyboardType: TextInputType.number,
                      validator: GameValidators.number(
                        requiredMessage: 'Number is required',
                        invalidMessage: 'Not a number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        helperText: '8+ chars · A-Z · 0-9 · !@#…',
                      ),
                      validator: GameValidators.password(
                        requiredMessage: 'Password is required',
                        tooShortMessage: 'At least 8 characters',
                        needsUppercaseMessage: 'Needs an uppercase letter',
                        needsDigitMessage: 'Needs a digit',
                        needsSpecialCharMessage: 'Needs a special character',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordConfirm,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        helperText: 'GameValidators.passwordMatch',
                      ),
                      validator: GameValidators.passwordMatch(
                        requiredMessage: 'Confirm your password',
                        mismatchMessage: 'Passwords do not match',
                        passwordController: _password,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          final ok = _formKey.currentState?.validate() ?? false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                ok ? 'All valid ✓' : 'Errors above',
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        child: const Text('VALIDATE'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'TextFormField(\n'
              '  validator: GameValidators.email(\n'
              "    requiredMessage: 'Required',\n"
              "    invalidMessage: 'Invalid email',\n"
              '  ),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
