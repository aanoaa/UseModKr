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
