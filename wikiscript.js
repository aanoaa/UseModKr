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
var closeok = false;
function chk_close(e, str) {
	if (!e) e = event;
	if (!closeok) {
		e.returnValue = str;
	}
}
