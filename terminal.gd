extends Terminal # Mantendo a base que você já tem

func _ready():
	clear()
	grab_focus()
	# Estética verde terminal (ANSI escape codes para cores)
	write("\u001b[32m[ SISTEMA ARKHAM - ACESSO RESTRITO ]\u001b[0m\n")
	write("Carregando dossiê investigativo... [OK]\n")
	write("Digite 'logs' ou 'squad' para iniciar.\n\n> ")
	data_sent.connect(_on_terminal_data_sent)

func _on_terminal_data_sent(data: PackedByteArray):
	var entrada = data.get_string_from_utf8().strip_edges().to_lower()
	if entrada == "": return

	match entrada:
		"ajuda":
			write("\nCOMANDOS: logs, squad, limpar, sair")
		"squad":
			write("\n[CONTROLE DE PESSOAL OPERACIONAL]:")
			write("\n- Dyane, John, Joshua, Mariana, Owen, Seraphyne, Shane: [VIVOS]") [cite: 73, 74, 75, 76, 77, 78, 79, 80]
			write("\n- Oliver, Oscar, Ted, Walt: [CONEXÃO PERDIDA/MORTO]") [cite: 81, 82, 83, 84]
		"logs":
			write("\nREGISTROS DISPONÍVEIS:")
			write("\n1. system_boot.log\n2. umbral_contact.log\n3. observer_incident.log") [cite: 1, 11, 17]
			write("\nDigite o número do log para ler.")
		"1":
			write("\n[LOG 1]: SISTEMA ARKHAM - RESUMÃO PARA OS NOVATOS.") 
		"2":
			write("\n[LOG 2]: CONTATO UMBRAL. Grupo perseguido por um Lobo do Umbral.") [cite: 15, 16]
		"3":
			write("\n[LOG 3]: EVENTO OBSERVADOR. Oscar sob influência. Conflito fatal: Oscar [MORTO].") [cite: 18, 19, 23]
		"limpar":
			clear()
		_:
			write("\nERRO: Comando '" + entrada + "' não reconhecido pelo Kernel Codex.")
	
	write("\n\n> ")
