sub action_adminmenu {
	print &GetHeader("", T('Admin Menu'), "");
	return if (!&UserIsAdminOrError());

	print
		"<p>".&ScriptLink("action=editlinks",T('Editing/Deleting page titles:')).
		"<p>".&ScriptLink("action=editbanned",T('Editing Banned list')).
		"<p>".&ScriptLink("action=maintain",T('Maintenance on all pages')).
		"<p>".&ScriptLink("action=editlock&set=1",T('Lock Site')).
		" | ".&ScriptLink("action=editlock&set=0",T('Unlock Site')).
		"<p>".&ScriptLink("action=unlock",T('Removing edit lock')).
		"\n";

	print &GetCommonFooter();
}

1;
