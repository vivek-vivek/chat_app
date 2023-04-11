// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/colors.dart';

class ChatCard extends StatelessWidget {
  ChatCard({required this.index, required this.documents, super.key});

  int index;
  List<DocumentChange<Map<String, dynamic>>> documents;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/chatscreen'),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            color: Mycolors.white1, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/9a/90/9a/9a909a545686c6977d21da39d2c4b186.jpg'),
          ),
          title: Text(
            'Sara ali',
            style: GoogleFonts.lato(
                color: Mycolors.black, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            documents[index].doc['text'].toString(),
            style: GoogleFonts.lato(color: Mycolors.black),
          ),
          trailing: Column(
            children: [
              Text(
                '10.30 PM',
                style: GoogleFonts.lato(
                  color: Mycolors.black,
                  fontSize: 11,
                ),
              ),
              CircleAvatar(
                backgroundColor: Mycolors.purple,
                radius: 14,
                child: Text(
                  '1',
                  style: GoogleFonts.lato(
                    color: Mycolors.white1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
