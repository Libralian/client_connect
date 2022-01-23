#include <amxmodx>

new const DemoName[] = "Public";

public plugin_init()
{
	register_plugin("Auto demo", "1.0", "Admin");
}

public client_putinserver(id)
{
	set_task(10.0, "DemoRecording", id);
}

public DemoRecording(id)
{	
	if(!is_user_connected(id)) return;
	
	new CurrentTime[32];

	get_time("%d.%m.%Y", CurrentTime, charsmax(CurrentTime));
	
	client_cmd(id, "stop; record %s", DemoName);
	client_print_color(id, print_team_default, "^4* ^1Запущена запись демо в папку с игрой! ^3|^4 ^"%s.dem^"", DemoName);
	client_print_color(id, print_team_default, "^4* ^1Дата запуска записи демо:^3 %s", CurrentTime);
}
