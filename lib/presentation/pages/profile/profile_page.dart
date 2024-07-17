// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/bloc/profile/profile_bloc.dart';
import 'package:facemask_application/data/localsources/auth_local_storage.dart';
import 'package:facemask_application/presentation/pages/profile/about_page.dart';
import 'package:facemask_application/presentation/pages/profile/change_password.dart';
import 'package:facemask_application/presentation/pages/profile/edit_profile_page.dart';
import 'package:facemask_application/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/profile_widget.dart';
import 'change_email_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProfileLoaded) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(209, 209, 239, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color.fromRGBO(255, 218, 240, 1),
                                  width: 2.0, // Lebar border
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  state.profile.avatar ??
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAdmCtWjfGHEabmDXtRwRDMQ1RLh2v1gxGKA&s',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              state.profile.email ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                  color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Text("no data");
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: size.height * .43,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileWidget(
                              icon: Icons.person,
                              title: 'My Profile',
                              onTap: () {
                                // Aksi yang dilakukan saat widget diklik
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()),
                                );
                              },
                            ),
                            // ProfileWidget(
                            //   icon: Icons.email_sharp,
                            //   title: 'Change Email Address',
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               RequestChangeEmailScreen()),
                            //     );
                            //   },
                            // ),
                            ProfileWidget(
                              icon: Icons.email_sharp,
                              title: 'Change Email Address',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RequestChangeEmailScreen()),
                                );
                              },
                            ),
                            ProfileWidget(
                              icon: Icons.security,
                              title: 'Change Password',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordScreen()),
                                );
                              },
                            ),
                            ProfileWidget(
                              icon: Icons.info,
                              title: 'About',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutPage()),
                                );
                              },
                            ),
                            ProfileWidget(
                              icon: Icons.logout,
                              title: 'Log Out',
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Konfirmasi Logout"),
                                      content: Text("Anda yakin ingin keluar?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Menutup dialog
                                          },
                                          child: Text("Batal"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            // Proses logout jika pengguna menekan "Ya"
                                            await AuthLocalStorage()
                                                .removeToken();

                                            // Hapus semua rute sebelumnya dan buka halaman login
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (Route<dynamic> route) => false,
                                            );
                                          },
                                          child: Text("Ya"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
