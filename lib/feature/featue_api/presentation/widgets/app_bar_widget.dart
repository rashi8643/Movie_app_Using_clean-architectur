import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/provider/auth_provaider.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: space.space_500 * 2.5,
      color: colors.textSubtle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: space.space_100 * 2.8,
            backgroundColor: colors.secondary,
            backgroundImage: AssetImage(
              data.profileImage,
            ),
          ),
          Text(
            data.homePage,
            style: typography.h700.copyWith(color: colors.textSubtlest),
          ),
          IconButton(
            onPressed: () {
              ref.read(authenticationProvider(context).notifier).logout();
            },
            icon: Icon(
              Icons.logout,
              size: space.space_400,
              color: colors.secondary,
            ),
          )
        ],
      ),
    );
  }
}
