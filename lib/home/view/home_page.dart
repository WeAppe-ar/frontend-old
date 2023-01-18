import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

import '../cubit/home_cubit.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});
  static String get name => 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        dataPersistenceRepository: context.read<DataPersistenceRepository>(),
        client: context.read<Client>(),
      ),
      child: const ViewHome(),
    );
  }
}

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: WeappearAppbar(
        title: context.l10n.home.toUpperCase(),
        onPressed: () {},
        sizedBoxWidth: 105.sp,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.sp, left: 20.sp),
            child: Text(
              'Proyectos',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 202.sp,
          ),
          Container(
            alignment: Alignment.center,
            height: 132.sp,
            child: SvgPicture.asset(
              'assets/images/Group 1029.svg',
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          SizedBox(
            width: 209.sp,
            height: 49.sp,
            child: Text(
              context.l10n.homeText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xffC9C8C8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15.sp, bottom: 20.sp),
        child: WeappearFloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
