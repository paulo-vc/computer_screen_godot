extends Control

# Vamos usar caminhos diretos para não haver erro de "not found"
func _ready():
	# Limpa o ecrã inicial se o nó existir
	if has_node("Display"):
		get_node("Display").clear()
		_print_to_screen("[color=#00FF41][ SISTEMA ARKHAM - ACESSO RESTRITO ][/color]")
		_print_to_screen("Aguardando seleção do operador...")

# Funções para os botões (Clica no nó do botão -> Sinais -> pressed() -> conectar a este script)

func _on_btn_relatorio_pressed():
	_clear_and_header("RELATÓRIO DE MISSÃO")
	_print_to_screen("Resumo: Incursão na Pizzaria e Incidente do Rato.")
	_print_to_screen("Status: Sucesso tático com baixas confirmadas.")

func _on_btn_monitor_pressed():
	_clear_and_header("MONITORAMENTO DE SQUAD")
	_print_to_screen("[color=green]- VIVOS: Dyane, John, Joshua, Mariana, Owen, Shane[/color]")
	_clear_and_header("") # Linha vazia
	_print_to_screen("[color=red]- BAIXAS: Oliver, Oscar, Ted, Walt[/color]")

func _on_btn_anexos_pressed():
	_clear_and_header("ARQUIVOS ANEXOS")
	_print_to_screen("Conceito: O Umbral (Dimensão Paralela).")
	_print_to_screen("Corporação: OSKOFF (Investigação em curso).")

# Função auxiliar para não dar erro de referência
func _print_to_screen(texto: String):
	if has_node("Display"):
		get_node("Display").append_text("> " + texto + "\n")

func _clear_and_header(titulo: String):
	if has_node("Display"):
		var d = get_node("Display")
		d.clear()
		if titulo != "":
			d.append_text("[b]" + titulo + "[/b]\n\n")
