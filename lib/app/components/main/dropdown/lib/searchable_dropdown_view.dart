import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'extensions/global_key_extension.dart';
import 'model/searchable_dropdown_menu_item.dart';
import 'searchable_dropdown_controller.dart';
import 'utils/custom_inkwell.dart';
import 'utils/search_bar.dart';

// ignore: must_be_immutable
class SearchableDropdown<T> extends StatefulWidget {
  ///Hint text shown when the dropdown is empty
  final Widget? hintText;

  ///Background decoration of dropdown, i.e. with this you can wrap dropdown with Card
  final Widget Function(Widget child)? backgroundDecoration;

  ///Shwons if there is no record found
  final Widget? noRecordText;

  ///Dropdown trailing icon
  final Widget? trailingIcon;

  ///Dropdown trailing icon
  final Widget? leadingIcon;

  ///Dropdown error text
  final String? errorText;

  ///Searchbar hint text
  final String? searchHintText;

  ///Focus status
  final bool isFocused;

  ///Dropdowns margin padding with other widgets
  final EdgeInsetsGeometry? margin;

  ///Height of dropdown's dialog, default: MediaQuery.of(context).size.height*0.3
  final double? dropDownMaxHeight;

  ///Returns selected Item
  final void Function(T? value)? onChanged;

  ///Manual request focus
  final void Function(bool value)? onFocusUnFocus;

  //Initial value of dropdown
  T? value;

  //Is dropdown enabled
  bool isEnabled;

  //Triggers this function if dropdown pressed while disabled
  VoidCallback? disabledOnTap;

  ///Dropdown items
  List<SearchableDropdownMenuItem<T>>? items;

  ///Paginated request service which is returns DropdownMenuItem list
  Future<List<SearchableDropdownMenuItem<T>>?> Function(
      int page, String? searchKey)? paginatedRequest;

  ///Future service which is returns DropdownMenuItem list
  Future<List<SearchableDropdownMenuItem<T>>?> Function()? futureRequest;

  ///Paginated request item count which returns in one page, this value is using for knowledge about isDropdown has more item or not.
  int? requestItemCount;

  bool isBorderWidget;

  SearchableDropdown({
    Key? key,
    this.hintText,
    this.backgroundDecoration,
    this.searchHintText,
    this.noRecordText,
    this.dropDownMaxHeight,
    this.margin,
    this.trailingIcon,
    this.leadingIcon,
    this.onChanged,
    this.items,
    this.value,
    this.isEnabled = true,
    this.disabledOnTap,
    this.errorText,
    this.onFocusUnFocus,
    this.isFocused = false,
    this.isBorderWidget = false,
  }) : super(key: key);

  SearchableDropdown.paginated({
    Key? key,
    this.hintText,
    this.backgroundDecoration,
    this.searchHintText,
    this.noRecordText,
    this.dropDownMaxHeight,
    this.margin,
    this.trailingIcon,
    this.leadingIcon,
    this.isEnabled = true,
    this.disabledOnTap,
    this.onChanged,
    required this.paginatedRequest,
    this.requestItemCount,
    this.errorText,
    this.onFocusUnFocus,
    this.isFocused = false,
    this.isBorderWidget = false,
  }) : super(key: key);

  SearchableDropdown.future({
    Key? key,
    this.hintText,
    this.backgroundDecoration,
    this.searchHintText,
    this.noRecordText,
    this.dropDownMaxHeight,
    this.margin,
    this.trailingIcon,
    this.leadingIcon,
    this.isEnabled = true,
    this.disabledOnTap,
    this.onChanged,
    required this.futureRequest,
    this.errorText,
    this.onFocusUnFocus,
    this.isFocused = false,
    this.isBorderWidget = false,
  }) : super(key: key);

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  late SearchableDropdownController<T> controller;

  @override
  void initState() {
    controller = SearchableDropdownController<T>();
    controller.paginatedRequest = widget.paginatedRequest;
    controller.futureRequest = widget.futureRequest;
    controller.requestItemCount = widget.requestItemCount ?? 0;
    controller.items = widget.items;
    controller.searchedItems.value = widget.items;
    for (var element in widget.items ?? <SearchableDropdownMenuItem<T>>[]) {
      if (element.value == widget.value) {
        controller.selectedItem.value = element;
        return;
      }
    }
    controller.onInit();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchableDropdown<T> oldWidget) {
    controller.items = widget.items;
    if (widget.value == null) {
      controller.selectedItem.value = null;
    }
    for (var element in widget.items ?? <SearchableDropdownMenuItem<T>>[]) {
      if (element.value == widget.value) {
        controller.selectedItem.value = element;
        return;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: controller.key,
      width: widget.isBorderWidget ? null : MediaQuery.of(context).size.width,
      child: widget.backgroundDecoration != null
          ? widget.backgroundDecoration!(buildDropDown(context, controller))
          : widget.isBorderWidget
              ? buildDropBorderDown(context, controller)
              : buildDropDown(context, controller),
    );
  }

  InkWell buildDropDown(
      BuildContext context, SearchableDropdownController<T> controller) {
    return InkWell(
      onTap: widget.isEnabled
          ? () {
              _dropDownOnTab(context, controller);
              // don't use
              // if (widget.isEnabled) {
              //   _dropDownOnTab(context, controller);
              // } else if (widget.disabledOnTap != null) {
              //   widget.disabledOnTap!();
              // }
            }
          : null,
      child: InputDecorator(
        isFocused: widget.isFocused,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, bottom: 12),
          disabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.disabledColor, width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.disabledColor, width: 1),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.errorColor, width: 1),
          ),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.disabledColor, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.primaryColor, width: 1),
          ),
          isDense: true,
          errorText: widget.errorText,
        ),
        child: Row(
          children: [
            Expanded(child: dropDownText(controller)),
            widget.trailingIcon ?? Container()
          ],
        ),
      ),
    );
  }

  InkWell buildDropBorderDown(
      BuildContext context, SearchableDropdownController<T> controller) {
    return InkWell(
      onTap: widget.isEnabled
          ? () {
              _dropDownOnTab(context, controller);
              // don't use
              // if (widget.isEnabled) {
              //   _dropDownOnTab(context, controller);
              // } else if (widget.disabledOnTap != null) {
              //   widget.disabledOnTap!();
              // }
            }
          : null,
      child: InputDecorator(
        isFocused: widget.isFocused,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.disabledColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.disabledColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.errorColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.disabledColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.primaryColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            isDense: true,
            errorText: widget.errorText,
            hintMaxLines: 1,
            errorMaxLines: 1,
            helperMaxLines: 1),
        child: SizedBox(
          height: 32,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Expanded(child: dropDownText(controller)),
                widget.trailingIcon ??
                    Icon(
                      Icons.arrow_drop_down,
                      size: MediaQuery.of(context).size.height * 0.033,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _dropDownOnTab(
      BuildContext context, SearchableDropdownController<T> controller) {
    bool isReversed = false;
    double? positionFromBottom = controller.key.globalPaintBounds != null
        ? MediaQuery.of(context).size.height -
            controller.key.globalPaintBounds!.bottom
        : null;
    double alertDialogMaxHeight =
        widget.dropDownMaxHeight ?? MediaQuery.of(context).size.height * 0.35;
    double? dialogPositionFromBottom = positionFromBottom != null
        ? positionFromBottom - alertDialogMaxHeight
        : null;
    if (dialogPositionFromBottom != null) {
      //Dialog ekrana sığmıyor ise reverseler
      //If dialog couldn't fit the screen, reverse it
      if (dialogPositionFromBottom <= 0) {
        isReversed = true;
        dialogPositionFromBottom += alertDialogMaxHeight +
            controller.key.globalPaintBounds!.height +
            MediaQuery.of(context).size.height * 0.005;
      } else {
        dialogPositionFromBottom -= MediaQuery.of(context).size.height * 0.005;
      }
    }
    if (controller.items == null) {
      if (widget.paginatedRequest != null) {
        controller.getItemsWithPaginatedRequest(page: 1, isNewSearch: true);
      }
      if (widget.futureRequest != null) controller.getItemsWithFutureRequest();
    } else {
      controller.searchedItems.value = controller.items;
    }
    //Hesaplamaları yaptıktan sonra dialogu göster
    //TODO: fixme an.nn => Show the dialog
    widget.onFocusUnFocus!(true);
    showDialog(
      context: context,
      builder: (context) {
        double? reCalculatePosition = dialogPositionFromBottom;
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        //Keyboard varsa digalogu ofsetler
        //If keyboard pushes the dialog, recalculate the dialog's possition.
        if (reCalculatePosition != null &&
            reCalculatePosition <= keyboardHeight) {
          reCalculatePosition =
              (keyboardHeight - reCalculatePosition) + reCalculatePosition;
        }
        return Padding(
          padding: EdgeInsets.only(
              bottom: reCalculatePosition ?? 0,
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: alertDialogMaxHeight,
                child: _buildStatefullDropdownCard(
                    context, controller, isReversed),
              ),
            ],
          ),
        );
      },
      barrierDismissible: true,
      barrierColor: Colors.transparent,
    ).then((value) => widget.onFocusUnFocus!(false));
  }

  Widget _buildStatefullDropdownCard(BuildContext context,
      SearchableDropdownController<T> controller, bool isReversed) {
    return Column(
      mainAxisAlignment:
          isReversed ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Card(
            color: context.theme.dialogBackgroundColor,
            surfaceTintColor: context.theme.colorScheme.surfaceTint,
            elevation: 3.0,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection:
                  isReversed ? VerticalDirection.up : VerticalDirection.down,
              children: [
                buildSearchBar(context, controller),
                Flexible(
                  child: buildListView(controller, isReversed),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding buildSearchBar(
      BuildContext context, SearchableDropdownController controller) {
    return Padding(
      padding: EdgeInsets.zero,
      child: CustomSearchBar(
        focusNode: controller.searchFocusNode,
        changeCompletionDelay: const Duration(milliseconds: 200),
        hintText: widget.searchHintText ?? 'Search',
        isOutlined: false,
        leadingIcon: Icon(Icons.search,
            size: MediaQuery.of(context).size.height * 0.033),
        onChangeComplete: (value) {
          controller.searchText = value;
          if (controller.items != null) {
            controller.fillSearchedList(value);
            return;
          }
          if (value == '') {
            controller.getItemsWithPaginatedRequest(page: 1, isNewSearch: true);
          } else {
            controller.getItemsWithPaginatedRequest(
                page: 1, key: value, isNewSearch: true);
          }
        },
      ),
    );
  }

  Widget buildListView(
      SearchableDropdownController<T> controller, bool isReversed) {
    return ValueListenableBuilder(
      valueListenable: (widget.paginatedRequest != null
          ? controller.paginatedItemList
          : controller.searchedItems),
      builder: (context, List<SearchableDropdownMenuItem<T>>? itemList,
              child) =>
          itemList == null
              ? const Center(child: CircularProgressIndicator())
              : itemList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.015),
                      child: widget.noRecordText ?? const Text('No record'),
                    )
                  : Scrollbar(
                      thumbVisibility: true,
                      controller: controller.scrollController,
                      child: ListView.builder(
                        controller: controller.scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: itemList.length + 1,
                        shrinkWrap: true,
                        reverse: isReversed,
                        itemBuilder: (context, index) {
                          if (index < itemList.length) {
                            final item = itemList.elementAt(index);
                            return CustomInkwell(
                              child: item.child,
                              onTap: () {
                                controller.selectedItem.value = item;
                                if (widget.onChanged != null) {
                                  widget.onChanged!(item.value);
                                }
                                Navigator.pop(context);
                                if (item.onTap != null) item.onTap!();
                              },
                            );
                          } else {
                            return ValueListenableBuilder(
                              valueListenable: controller.state,
                              builder: (context, SearcableDropdownState state,
                                      child) =>
                                  state == SearcableDropdownState.Busy
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : const SizedBox(),
                            );
                          }
                        },
                      ),
                    ),
    );
  }

  Widget dropDownText(SearchableDropdownController<T> controller) {
    return ValueListenableBuilder(
      valueListenable: controller.selectedItem,
      builder: (context, SearchableDropdownMenuItem<T>? selectedItem, child) =>
          selectedItem?.child ??
          (selectedItem?.label != null
              ? Text(
                  selectedItem!.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : widget.hintText) ??
          const SizedBox.shrink(),
    );
  }
}
