extends RichTextLabel

# Simulando o sinal de entrada de dados
signal data_sent(data: PackedByteArray)

var current_input = ""

func _ready():
	# Configurações iniciais baseadas no Dossiê Arkham [cite: 85, 86]
	clear_terminal()
	grab_focus()
	
	var verde = "[color=#00FF41]"
	var reset = "[/color]"
	
	append_text(verde + "[ SISTEMA ARKHAM - ACESSO RESTRITO ]" + reset + "\n")
	append_text("Carregando dossie investigativo... [OK]\n")
	append_text("Digite 'logs' ou 'squad' e aperte ENTER.\n\n> ")

# Função para detectar o que você digita no teclado
func _gui_input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER:
			append_text("\n")
			_on_terminal_data_sent(current_input.to_utf8_buffer())
			current_input = ""
			append_text("> ")
		elif event.keycode == KEY_BACKSPACE:
			if current_input.length() > 0:
				current_input = current_input.left(-1)
				# Aqui precisaríamos de lógica extra para apagar o caractere visualmente
		else:
			var c = char(event.unicode)
			if event.unicode >= 32:
				current_input += c
				append_text(c)

func _on_terminal_data_sent(data: PackedByteArray):
	var entrada = data.get_string_from_utf8().strip_edges().to_lower()
	
	match entrada:
		"ajuda":
			append_text("\nCOMANDOS: logs, squad, limpar, sobre")
		"squad":
			append_text("\n[CONTROLE DE PESSOAL OPERACIONAL]:")
			# Dados do Dossiê Arkham [cite: 74, 75, 76, 77, 78, 79, 80]
			append_text("\n- Dyane, John, Joshua, Mariana, Owen, Seraphyne, Shane: [VIVOS]")
			# Dados do Dossiê Arkham [cite: 81, 82, 83, 84]
			append_text("\n- Oliver, Oscar, Ted, Walt: [CONEXAO PERDIDA/MORTO]")
		"logs":
			append_text("\nREGISTROS DISPONIVEIS:")
			# Referências do Dossiê [cite: 1, 11, 17]
			append_text("\n1. system_boot.log\n2. umbral_contact.log\n3. observer_incident.log")
		"1":
			append_text("\n[LOG 1]: SISTEMA ARKHAM - RESUMAO PARA OS NOVATOS. [cite: 3]")
		"2":
			append_text("\n[LOG 2]: CONTATO UMBRAL. Grupo perseguido por um Lobo do Umbral. [cite: 15, 16]")
		"3":
			append_text("\n[LOG 3]: EVENTO OBSERVADOR. Conflito fatal: Oscar [MORTO]. [cite: 18, 23]")
		"limpar":
			clear_terminal()
		_:
			append_text("\nComando desconhecido: " + entrada)
	
	append_text("\n\n")

func clear_terminal():
	text = ""
