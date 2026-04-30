extends Control

@onready var display = $Display

func _ready():
	display.clear()
	_print_to_screen("[color=#00FF41][ SISTEMA ARKHAM - INTERFACE DE PONTEIRO ][/color]")
	_print_to_screen("Aguardando seleção do operador...")

# Conecte o sinal 'pressed' de cada botão a estas funções:

func _on_btn_logs_pressed():
	display.clear()
	_print_to_screen("[ REGISTROS DISPONÍVEIS ]")
	_print_to_screen("1. system_boot.log: Resumo inicial [cite: 1, 3]")
	_print_to_screen("2. umbral_contact.log: Incidente Lobo [cite: 11, 16]")
	_print_to_screen("3. observer_incident.log: Baixa de Oscar [cite: 17, 23]")

func _on_btn_squad_pressed():
	display.clear()
	_print_to_screen("[ CONTROLE DE PESSOAL OPERACIONAL ]")
	_print_to_screen("- VIVOS: Dyane, John, Joshua, Mariana, Owen, Seraphyne, Shane [cite: 74, 75, 76, 77, 78, 79, 80]")
	_print_to_screen("- MORTOS: Oliver, Oscar, Ted, Walt [cite: 81, 82, 83, 84]")

func _on_btn_limpar_pressed():
	display.clear()
	_print_to_screen("Terminal resetado.")

func _print_to_screen(text_to_add: String):
	display.append_text("> " + text_to_add + "\n")
