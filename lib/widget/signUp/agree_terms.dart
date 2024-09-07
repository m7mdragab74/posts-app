import 'package:flutter/material.dart';

class AgreeTerms extends StatefulWidget {
  const AgreeTerms({
    super.key,
  });

  @override
  State<AgreeTerms> createState() => _AgreeTermsState();
}

class _AgreeTermsState extends State<AgreeTerms> {
  bool isAgreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isAgreeToTerms = !isAgreeToTerms;
            });
          },
          child: Row(
            children: [
              Transform.translate(
                offset: const Offset(-5, 0),
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: const BorderSide(color: Colors.white),
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  value: isAgreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      isAgreeToTerms = value!;
                    });
                  },
                ),
              ),
              const Text('I agree to the terms of use',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
