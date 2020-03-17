import 'package:flutter/material.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/pages/chat/indicator_page_view.dart';
import 'contact_item.dart';
import 'contacts.dart';

enum ClickType { select, open }

class ContactView extends StatelessWidget {
  final ScrollController sC;
  final List<ContactItem> functionButtons;
  final List<Contact> contacts;
  final ClickType type;
  final Callback callback;

  ContactView({
    this.sC,
    this.functionButtons = const [],
    this.contacts = const [],
    this.type,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    List<String> data = [];
    return new ScrollConfiguration(
      behavior: MyBehavior(),
      child: new ListView.builder(
        controller: sC,
        itemBuilder: (BuildContext context, int index) {
          if (index < functionButtons.length) return functionButtons[index];

          int _contactIndex = index - functionButtons.length;
          bool _isGroupTitle = true;
          Contact _contact = contacts[_contactIndex];
          if (_contactIndex >= 1 &&
              _contact.nameIndex == contacts[_contactIndex - 1].nameIndex) {
            _isGroupTitle = false;
          }
          bool _isBorder = _contactIndex < contacts.length - 1 &&
              _contact.nameIndex == contacts[_contactIndex + 1].nameIndex;
          if (_contact.name != contacts[contacts.length - 1].name) {
            return new ContactItem(
              avatar: _contact.avatar,
              title: _contact.name,
              identifier: _contact.identifier,
              groupTitle: _isGroupTitle ? _contact.nameIndex : null,
              isLine: _isBorder,
              type: type,
              cancel: (v) {
                data.remove(v);
                callback(data);
              },
              add: (v) {
                data.add(v);
                callback(data);
              },
            );
          } else {
            return new Column(children: <Widget>[
              new ContactItem(
                avatar: _contact.avatar,
                title: _contact.name,
                identifier: _contact.identifier,
                groupTitle: _isGroupTitle ? _contact.nameIndex : null,
                isLine: false,
                type: type,
                cancel: (v) {
                  data.remove(v);
                  callback(data);
                },
                add: (v) {
                  data.add(v);
                  callback(data);
                },
              ),
              new HorizontalLine(),
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: new Text(
                  '${contacts.length}位联系人',
                  style: TextStyle(color: mainTextColor, fontSize: 16),
                ),
              )
            ]);
          }
        },
        itemCount: contacts.length + functionButtons.length,
      ),
    );
  }
}
