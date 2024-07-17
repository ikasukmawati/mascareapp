import 'package:facemask_application/bloc/confirm_otp/confirm_otp_bloc.dart';
import 'package:facemask_application/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

<<<<<<< HEAD
import '../../../bloc/change_email/change_email_bloc.dart';

=======
>>>>>>> f18f6de8d3e6239a1ef63dad41389910fb9da677
class ConfirmOtpScreen extends StatelessWidget {
  final TextEditingController otpontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permintaan Perubahan Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: otpontroller,
              decoration: InputDecoration(labelText: 'Kode OTP'),
            ),
            SizedBox(height: 20),
            BlocConsumer<ConfirmOtpBloc, ConfirmOtpState>(
              listener: (context, state) {
                if (state is ConfirmOtpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email berhasil diganti')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                } else if (state is ConfirmOtpFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ConfirmOtpLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context
                        .read<ConfirmOtpBloc>()
                        .add(ConfirmOTP(otp: otpontroller.text));
                  },
                  child: Text('Kirim OTP'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
