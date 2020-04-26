

import 'package:flutter_qyyim/common/provider/view_state_list_model.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/contacts/contact_item.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';

class ContactViewModel extends ViewStateModel {
  List<Contact> contacts = [];

  ///
  SessionMsg sessionMsg;
  ContactViewModel({this.sessionMsg});

  Future getContacts(List<ContactItem> _functionButtons,List<Contact> _contacts,Map _letterPosMap) async {
    List<Contact> listContact = await ContactsPageData().listFriend();

    if (sessionMsg != null) {
      String userIdData = sessionMsg.userId;
      if (sessionMsg.type == MessageType.GROUP.index) {
        List<String> userIds = userIdData.split(',');

        listContact.forEach((contact){
          userIds.forEach((id){
            if (id == contact.id) {
              contact.isSelect = ContactState.isSelect;
              contact.canEnableSelect = ContactState.isSelect;
            }
          });
        });
      } else {
        listContact.forEach((contact){
          if (userIdData == contact.id) {
            contact.isSelect = ContactState.isSelect;
            contact.canEnableSelect = ContactState.isSelect;
          }
        });
      }
    }


    contacts.clear();
    contacts..addAll(listContact);
    contacts
        .sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));

    /// 计算用于 IndexBar 进行定位的关键通讯录列表项的位置
    var _totalPos =
        _functionButtons.length * ContactItemState.heightItem(false);
    for (int i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;
      if (i > 0 &&
          _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0)
        _hasGroupTitle = false;

      if (_hasGroupTitle) _letterPosMap[_contacts[i].nameIndex] = _totalPos;

      _totalPos += ContactItemState.heightItem(_hasGroupTitle);
    }

    setIdle();
    //if (mounted) setState(() {});
  }
}