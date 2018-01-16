shell: shell.h shell.c type_prompt.c read_command.c builtin_command.c parsing.c test
	gcc shell.c type_prompt.c read_command.c builtin_command.c parsing.c -o shell

shell_r: shell.h shell.c type_prompt.c read_command.c builtin_command.c parsing.c test
	gcc shell.c type_prompt.c read_command.c builtin_command.c parsing.c -o shell -D READLINE_ON -I /usr/include -lreadline -ltermcap

test: test.c
	gcc test.c -o test

clean:
	rm -f shell test
