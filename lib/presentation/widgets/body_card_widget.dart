import 'package:flutter/material.dart';
import 'package:time_line_app/core/style/app_color.dart';

import 'users_widet.dart';

import '../../core/constant/app_size.dart';
import '../../core/constant/contant_api.dart';
import '../../core/constant/functions_app.dart';
import '../../domain/entity/event.dart';

class BodyCardComponent extends StatelessWidget {
  final Event model;
  const BodyCardComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double itemSize = 310.0;
    if (model.users.length > 0) {
      itemSize = 345.0;
    } else {
      itemSize = 310.0;
    }
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: itemSize,
      child: Row(
        children: [
          Column(
            children: [
              Container(height: 20, width: 2, color: AppColor.gray400),
              Container(
                height: 60,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.redLight,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppFunctions.formatDate(
                          date: model.date.split('T')[0], typeFormat: 'dd'),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      AppFunctions.formatDate(
                          date: model.date.split('T')[0], typeFormat: 'MMM'),
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(width: 2, color: AppColor.gray400),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                      //blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160.0,
                      decoration: BoxDecoration(
                        color: AppColor.gray400,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              ApiContent.getImage(model.featuredImage)),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            height: 30.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              color: AppColor.gray100,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: AppColor.gray400,
                                  backgroundImage: NetworkImage(
                                      ApiContent.getImage(model.tagIcon)),
                                ),
                                AppSize.SH_5,
                                Text(
                                  model.tagTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: AppColor.black),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5.0,
                            left: 10.0,
                            child: Container(
                              height: 25.0,
                              width: 90,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: AppColor.gray100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  '${model.spots} Spots Left',
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    AppSize.SV_10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.72,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${AppFunctions.formatDate(date: model.date.split('T')[0], typeFormat: 'EEEE')} , ${AppFunctions.formatDate(date: model.date.split('T')[0], typeFormat: 'dd MMMM yyyy')}. ${AppFunctions.formatTime(time: model.date.split('T')[1])}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    model.communityTitle,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    '${model.placeName.split(' - ')[2]} , ${model.placeName.split(' - ')[3]}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    //function to get the finish date
                                    '${AppFunctions.getFinishDate(
                                      date: model.date.split('T')[0],
                                    )} Days Left',

                                    style: TextStyle(
                                      color: AppColor.redLight,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  AppSize.SV_5,
                                  if (model.users.length > 0)
                                    UserComponent(users: model.users),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: SizedBox(
                                height: 50.0,
                                width: 90.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (model.paymentMethod == 'CASH')
                                          _buildPaymentIcon(
                                              IconPayment: Icons
                                                  .monetization_on_rounded),
                                        if (model.paymentMethod ==
                                            'ONLINE') ...[
                                          _buildPaymentIcon(
                                              IconPayment: Icons.payment),
                                          _buildPaymentIcon(
                                              IconPayment: Icons.wallet),
                                        ],
                                        if (model.paymentMethod ==
                                            'CREDIT_CARD')
                                          _buildPaymentIcon(
                                              IconPayment: Icons.credit_card),
                                      ],
                                    ),
                                    const SizedBox(height: 3.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'AED ${model.price}',
                                          style: TextStyle(
                                              letterSpacing: 1.5,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.redLight),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentIcon({required IconData IconPayment}) {
    return Icon(
      IconPayment,
      color: Colors.red.withOpacity(0.5),
      size: 20.0,
    );
  }
}
