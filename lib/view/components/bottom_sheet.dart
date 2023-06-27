import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/data_list.dart';
import 'package:mystore/view/components/card_header.dart';
import 'package:mystore/view/components/choice_chips.dart';
import 'package:mystore/view/components/coustom_button.dart';
import 'package:mystore/view/components/coustom_redio.dart';
import 'package:mystore/view/components/randge_slider.dart';

import '../../utils/constants/colorpallets.dart';
import 'heading_text.dart';

showCoustomBottomSheet(
    context, screenwidth, screenhight, Function filterProductsController) {
  dynamic QuerryFilter = "";

  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: screenhight * 0.90,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CardHeader(
                titleText: "Price",
                navigateToList: () {},
                isVisible: false,
              ),
              Container(
                  height: screenhight * 0.070,
                  width: screenwidth,
                  color: Color.fromARGB(59, 227, 221, 221),
                  child: ChoiceChipCatogary(
                    data: dataLists.priceFilter,
                    bgColor: TheamColors.backgroundColor,
                    selectColor: TheamColors.backgroundColor,
                    textColor: TheamColors.PtexrtColor1,
                    isVisible: false,
                    ChoiceChip: (choiceValue) {
                      QuerryFilter = choiceValue['Query'];
                      if (kDebugMode) {
                        print(choiceValue);
                      }
                    },
                    chipType: 'Filter',
                  )),
              SizedBox(
                height: screenhight * 0.01,
              ),
              CardHeader(
                titleText: "Discount Percentage",
                navigateToList: () {},
                isVisible: false,
              ),
              Container(
                  height: screenhight * 0.070,
                  width: screenwidth,
                  color: Color.fromARGB(59, 227, 221, 221),
                  child: ChoiceChipCatogary(
                    data: dataLists.PercentageFilter,
                    bgColor: TheamColors.backgroundColor,
                    selectColor: TheamColors.backgroundColor,
                    textColor: TheamColors.PtexrtColor1,
                    isVisible: false,
                    ChoiceChip: (choiceValue) {
                      QuerryFilter = choiceValue['Query'];
                      if (kDebugMode) {
                        print(choiceValue);
                      }
                    },
                    chipType: 'Filter',
                  )),
              SizedBox(
                height: screenhight * 0.01,
              ),
              CardHeader(
                titleText: "Color",
                navigateToList: () {},
                isVisible: false,
              ),
              Container(
                width: screenwidth,
                height: screenhight * 0.070,
                color: Color.fromARGB(59, 227, 221, 221),
                child: CoustomRedio(
                  width: screenwidth * 0.09,
                  height: screenwidth * 0.09,
                  pL: screenwidth * 0.01,
                  pR: screenwidth * 0.03,
                  activeBtn: TheamColors.primaryColor,
                  data: dataLists.colorFilter,
                  getColorValue: (colorValue) {
                    QuerryFilter = colorValue['Query'];
                    if (kDebugMode) {
                      print(colorValue);
                    }
                  },
                  chipType: 'Filter',
                ),
              ),
              SizedBox(
                height: screenhight * 0.01,
              ),
              CardHeader(
                titleText: "Price Range",
                navigateToList: () {},
                isVisible: false,
              ),
              CoustomRangeSlider(
                Rangevalue: (rangeValue) {
                  if (kDebugMode) {
                    print("=${rangeValue.start}=${rangeValue.end}");
                  }
                  QuerryFilter = "/filter/priceRangeFilter/?smaller=${rangeValue.start}&greater=${rangeValue.end}";
                },
              ),
              SizedBox(
                height: screenhight * 0.015,
              ),
              CommonButton(
                  width: screenwidth,
                  height: screenhight * 0.056,
                  btnTitle: "ApplyFilter",
                  btnColor: TheamColors.primaryColor,
                  onTapHandler: () {
                    filterProductsController(QuerryFilter);
                  })
            ],
          ),
        ),
      );
    },
  );
}
