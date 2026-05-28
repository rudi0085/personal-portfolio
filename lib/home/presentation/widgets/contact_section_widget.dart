import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_color.dart';
import 'package:portfolio_projct/core/theme/app_text_style.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 980),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.mail_outline_rounded,
                    color: colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Contact',
                    style: AppTextStyle.headlineSmall.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Have a project in mind, a product idea, or a collaboration to discuss? Send a message and I will get back to you.',
                style: AppTextStyle.bodyLarge.copyWith(
                  color: AppColors.primaryContainer,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isNarrow = constraints.maxWidth < 760;
                        final nameField = _InputField(
                          controller: _nameController,
                          label: 'Your Name',
                          hintText: 'Enter your name',
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        );

                        final emailField = _InputField(
                          controller: _emailController,
                          label: 'Email Address',
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            final email = value?.trim() ?? '';
                            if (email.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!email.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        );

                        if (isNarrow) {
                          return Column(
                            children: [
                              nameField,
                              const SizedBox(height: 14),
                              emailField,
                            ],
                          );
                        }

                        return Row(
                          children: [
                            Expanded(child: nameField),
                            const SizedBox(width: 14),
                            Expanded(child: emailField),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    _InputField(
                      controller: _messageController,
                      label: 'Message',
                      hintText: 'Tell me about your project or idea',
                      maxLines: 5,
                      textInputAction: TextInputAction.newline,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please write a message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 46,
                          child: FilledButton.icon(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Message prepared to send via email.',
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.send_rounded, size: 18),
                            label: const Text('Send Email'),
                            style: FilledButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          height: 46,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              _nameController.clear();
                              _emailController.clear();
                              _messageController.clear();
                            },
                            icon: const Icon(Icons.refresh_rounded, size: 18),
                            label: const Text('Clear Form'),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: colorScheme.outlineVariant.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
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
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.label,
    required this.hintText,
    required this.validator,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      style: AppTextStyle.bodyLarge.copyWith(color: colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        filled: true,
        fillColor: colorScheme.surface.withValues(alpha: 0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.35),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
    );
  }
}
