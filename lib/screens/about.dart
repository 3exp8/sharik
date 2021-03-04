import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/helper.dart';

// todo check fonts for consistence
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Current version', style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 16)),
            const Text('3.0', style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 16)),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('The latest version', style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 16)),
            const Text('3.1', style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 16)),
          ],
        ),
        SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple[400],
                child: InkWell(
                  splashColor: Colors.deepPurple[100]!.withOpacity(0.32),
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {},
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Text('Update',
                          style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 16, color: Colors.white))),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Material(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  splashColor: Colors.deepPurple[400]!.withOpacity(0.32),
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      'Changelog',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple[700], fontFamily: 'JetBrainsMono'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 38),
        Text('Sharik is completely free with its code published on GitHub.\nEveryone is welcomed to contribute :)',
            textAlign: TextAlign.center, style: GoogleFonts.getFont(context.l!.fontComfortaa, fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.deepPurple[400]!.withOpacity(0.32),
                hoverColor: Colors.deepPurple.shade50,
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 52,
                  height: 52,
                  child: SvgPicture.asset('assets/icons/social/github.svg', width: 26),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.deepPurple[400]!.withOpacity(0.32),
                hoverColor: Colors.deepPurple.shade50,
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 52,
                  height: 52,
                  child: SvgPicture.asset('assets/icons/social/telegram.svg', width: 26),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text('Contributors',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(context.l!.fontComfortaa, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Column(
          children: const [
            _ContributorCard(
              'Mark Motliuk',
              'marchellodev',
              'Maintainer',
            ),
            _ContributorCard(
              'Behzad Najafzadeh',
              'behzad-njf',
              'Translator',
            ),
            _ContributorCard(
              'Atrate',
              'atrate',
              'Translator',
            ),
            _ContributorCard(
              '...',
              '...',
              '...',
            ),
            _ContributorCard(
              '...',
              '...',
              '...',
            ),
            _ContributorCard(
              '...',
              '...',
              '...',
            ),
          ],
        )
      ],
    );
  }
}

class _ContributorCard extends StatelessWidget {
  final String fullName;
  final String nickName;
  final String role;

  const _ContributorCard(this.fullName, this.nickName, this.role);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.deepPurple.shade50.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.deepPurple[400]!.withOpacity(0.32),
          hoverColor: Colors.deepPurple.shade50,
          onTap: () => launch('https://github.com/$nickName'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(fullName,
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.deepPurple.shade700, letterSpacing: 0.2)),
                Text(role, style: GoogleFonts.poppins(fontSize: 16, fontStyle: FontStyle.italic, letterSpacing: 0.4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}