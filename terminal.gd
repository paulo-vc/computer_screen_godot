extends Terminal

func _ready():
	# 1. Limpa o terminal e foca o cursor nele
	clear()
	grab_focus()
	
	# 2. Escreve uma mensagem de boot estilizada (usando cores ANSI)
	# \u001b[32m é o código para VERDE, \u001b[0m reseta a cor
	write("\u001b[32m[ ACESSANDO NÚCLEO CODEX... ]\u001b[0m\n")
	write("Engenharia de Sistemas UEMG - Terminal Ativo.\n")
	write("Digite 'ajuda' para listar comandos.\n\n> ")

	# 3. Conecta o sinal de envio de dados (quando você digita e dá Enter)
	# O sinal 'data_sent' é nativo do addon GodotXTerm
	data_sent.connect(_on_terminal_data_sent)

func _on_terminal_data_sent(data: PackedByteArray):
	# Transforma os bytes recebidos em string
	var entrada = data.get_string_from_utf8().strip_edges()
	
	if entrada == "":
		return

	# Lógica de comandos simples
	match entrada.to_lower():
		"ajuda":
			write("\nComandos disponíveis: status, limpar, sobre")
		"status":
			write("\n[SISTEMA]: Memória estável. Banco de dados RPG carregado.")
		"limpar":
			clear()
		"sobre":
			write("\nCodex Terminal v1.0 - Desenvolvido para gestão de RPG.")
		_:
			write("\nComando desconhecido: " + entrada)
	
	# Pula linha e coloca o prompt novamente
	write("\n\n> ")
