// �޸� ��ũ��, Ʈ���� � ���
function onMemoToggle(id)
{	
	if (document.getElementById(id).style.display == "none")
	{
		document.getElementById(id).style.display = "block";
	}
	else
	{
		document.getElementById(id).style.display = "none";
	}
	return false;
}

// �ۼ� ��� �� Ȯ��
var previous_text = "", current_text = "", conflict = false, closeok = false;
function chk_close(e, str) {
	if (!e) e = event;
	if (!closeok) {
		current_text = document.form_edit.text.value;

		if (conflict || (previous_text != current_text)) {
			e.returnValue = str;
		}
	}
}

// msg - ����ڿ��� Ȯ��â�� ��ﶧ ��µǴ� �޽���
// text - Ŭ�����忡 ����� �ؽ�Ʈ
// ��ó: http://www.krikkit.net/howto_javascript_copy_clipboard.html
// modified by raymundo, gypark@gmail.com

// Copyright (C) krikkit - krikkit@gmx.net
// --> http://www.krikkit.net
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
function copy_clip(msg, text) {
	if (!confirm(msg)) return;

	// IE
	if (window.clipboardData) { 
		window.clipboardData.setData("Text", text);
	}
	// Firefox/Mozilla
	else if (window.netscape) {
		// firefox/mozilla ���� �����ϱ� ���ؼ��� ����� �������� ���丮�� prefs.js ���Ͽ� ������ ���� �����ش�
		// user_pref("signed.applets.codebase_principal_support", true);
		// �Ǵ� "about:config" �������� ��� ���� �׸��� ���� true�� ������ �ش�
		// signed.applets.codebase_principal_support

		netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');

		var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
		if (!clip) return;

		var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
		if (!trans) return;

		trans.addDataFlavor('text/unicode');

		var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
		var copytext=text;

		str.data=copytext;

		trans.setTransferData("text/unicode",str,copytext.length*2);

		var clipid=Components.interfaces.nsIClipboard;

		if (!clip) return false;

		clip.setData(trans,null,clipid.kGlobalClipboard);
	}
	return false;
}

