extends Control

@onready var sfx_click = $ClickSFX
@onready var sfx_binary = $BinarySFX

@onready var page_home = find_child("PageHome")
@onready var page_monitor = find_child("PageMonitor")
@onready var page_logs = find_child("PageLogs")
@onready var page_attachments = find_child("PageAttachments")
@onready var anexo_img = find_child("DisplayImages")
@onready var anexo_txt = find_child("DisplayText")

@onready var pages = {
	"home": page_home,
	"logs": page_logs,
	"monitor": page_monitor,
	"attachments": page_attachments
}

var current_log_index = 0
var current_attach_idx = 0 

var attachment_data = [
	{
		"imagem": "",
		"texto": "[center][b][color=green]SUJEITOS COM CONHECIMENTO DO UMBRAL[/color][/b]
	[color=green]________________________________________________[/color]

	[b][color=green]CATEGORIA A: APOIO CONSTANTE[/color][/b]
	> Diretor Crawford
	> Mike Graham
	> Alex Kralie

	[color=green]________________________________________________[/color]

	[b][color=green]CATEGORIA B: FONTES INATIVAS[/color][/b]
	> Padre Malthus
	> Elliot Vance
	> Gabriel Oliveira

	[color=green]________________________________________________[/color]

	[b][color=green]CATEGORIA C: USUÁRIOS E ENVOLVIDOS[/color][/b]
	> Elias Ward
	> Chadwick
	> Grupo das Chaves (Rowan, Rato, Mira, etc.)
	________________________________________________[/center]"
	},
	{
		"imagem": "",
		"texto": "[center][b][color=green]Umbral[/color][/b][/center]
		> O umbral é como uma realidade paralela da nossa, intervindo constantemente na nossa realidade. Ele afeta ambientes e criaturas.
		[center][b][color=green]Os Sete Elementos[/color][/b][/center]
		[color=#008080]Owen Parker - Vetor[/color]
		[color=yellow]Shane - Abscôndito[/color]
		[color=red]Joshua - Hemogeia[/color]
		[color=pink]Dyane - Cataclise[/color]
		[color=blue]John / Senise - Talasso[/color]
		[color=purple]Mariana / Walt - Entropia[/color]
		[color=green]Seraphyne / Ted - Parallax[/color]
		"
	},
	{
		"imagem": "",
		"texto": "[center][b][color=green]Conexões com a Realidade[/color][/b][/center]
		
		[center][color=#008080]Vetor[/color] envolve matemática, lógica, tecnologia e estruturas não euclidianas.
		
		[color=yellow]Abscôndito[/color] tem ligação com a mente, sabedoria.
		
		[color=red]Hemogeia[/color] prioriza a sobrevivência acima de tudo e envolve carne e sangue.
		
		[color=pink]Cataclise[/color] é como a energia pura, não somente da natureza mas interior como sentimentos.
		
		[color=blue]Talasso[/color] está ligado à vida e à água.
		
		[color=purple]Entropia[/color] é um ciclo, basicamente o tempo.
		
		[color=green]Parallax[/color] é o elemento neutro que não temos conhecimento sobre ainda. Aparentemente tem ligação com o desconhecido como vida extraterrestre.[/center]
		"
	},
	{
		"imagem": "",
		"texto": "[center][b][color=green]Conexões[/color][/b][/center]
		> Cada elemento escolheu um de nós e essa conexão não é algo muito comum de se acontecer. 
		> Mike, por exemplo, não possui ligação com nenhum elemento, mesmo nos ajudando constantemente a combater as criaturas.
		
		[center][b][color=green]Ascendência Cósmica:[/color][/b][/center]
		> Evento onde nos conectamos com o Umbral e com nosso próprio elemento. 
		> Funciona como uma conexão do Umbral dentro de nossa mente, visualizando uma dimensão onde o elemento correspondente predomina.
		"
	},
	{
		"imagem": "res://assets/registro_visual_a.jpg",
		"texto": ""
	},
	{
		"imagem": "res://assets/registro_visual_b.png",
		"texto": ""	
	}
]


var log_slides = [
	
	"""	[center][b][color=green]RELATÓRIO INICIAL: INCIDENTE ARKHAM WOLVES[/color][/b][/center]

[b]DATA:[/b] 01 de Fevereiro, 2000
[b]SUJEITOS:[/b] [color=#ffff00]Oscar[/color], [color=#ffff00]Shane[/color], [color=#ff0000]Joshua[/color] e [color=#add8e6]"Oliver"[/color].
> Estudantes comuns na escola de Arkham. 
> [color=#008080]Owen Parker[/color] é um aluno novo transferido.

[center][b][color=green]SUB-ARQUIVO: CASO SENISE[/color][/b][/center]

> [color=#add8e6]Oliver[/color] apresentou mudança de comportamento. 
> Uma entidade do [color=#4b0082][b]Umbral[/b][/color] reivindicou a posse do corpo hospedeiro e se autonomeou [color=#add8e6]Senise[/color].""",

"""[center][b][color=green]SUB-ARQUIVO: ECO DE CHADWICK[/color][/b][/center]

> Após uma súbita aparição do [color=#4b0082][b]Umbral[/b][/color] na realidade, o grupo foi perseguido por uma criatura.
> A criatura demonstrava traços de inteligência e se revelou ser um eco de Chadwick (Aluno desaparecido).
> Logo após, a unidade [color=#ffc0cb]Dyane[/color] integrou-se ao grupo.
""",

	"""[center][b][color=green]EVENTO: RITUAL NO SHOW DE ROCK[/color][/b][/center]

> Primeiro contato com rituais no show de [u]Mike[/u] (irmão de [color=#ff0000]Joshua[/color]). 
> O grupo encontrou o [b]Grupo das Chaves[/b] e o indivíduo [u]Rowan[/u], que invocou [color=#008080][b]Vetor[/b][/color] (A Coisa Angular).

[center][b][color=green]SUB-ARQUIVO: OSCAR E O OBSERVADOR[/color][/b][/center]

> O sujeito [color=#ffff00]Oscar[/color] foi comprometido pela influência da entidade [b]Observador[/b]. 
> O conflito resultou na [color=#ff0000]BAIXA DEFINITIVA[/color] de [color=#ffff00]Oscar[/color] e na perda do olho de [color=#ffff00]Shane[/color].
""",

	"""[center][b][color=green]INVESTIGAÇÃO: HOSPITAL E FAROL[/color][/b][/center]

> Contato via telefone com o hospital. A ligação se originava do passado/futuro. 
> Introdução do sujeito [color=#a020f0]Walt[/color], filho do Diretor Crawford. 
> A busca por [u]Chadwick[/u] revelou operações da [u][b]OSKOFF[/b][/u].
> Derrota de um dos Doutores em estado de insanidade. [color=#ffc0cb][b]Cataclise[/b][/color].
""",

"""[center][b][color=green]SUB-ARQUIVO: MANSÃO DETERIORADA[/color][/b][/center]

> Atividade detectada na residência de [color=#ffff00]Shane[/color]. 
> Um usuário das Chaves foi derrotado com suporte do Padre Malthus. 
> Nesta operação, [color=#a020f0]Walt[/color] conseguiu sua própria [b]Chave de Entropia[/b].
""",

	"""[center][color=#00ff00][b]ARQUIVO: CONFLITO URBANO[/b][/color][/center]

> A chegada do aluno [color=#90ee90]Ted[/color] levou o grupo ao encontro de uma gangue de tráfico de drogas.

[center][color=#ff0000][b]ALERTA DE BAIXA:[/b][/color][/center]
> Durante o embate, o hospedeiro [color=#add8e6]Senise (Oliver)[/color] foi neutralizado após se jogar contra disparos de escopeta.
""",

"""
[center][b][color=green]SUB-ARQUIVO: CHAVE DE HEMOGEIA[/color][/b][/center]

> Minutos após o embate, surgiu [u]Mira[/u] com a Chave de Hemogeia. 
> O grupo foi levado para seu domínio de [color=red]Hemogeia[/color], mas a ameaça foi contida e [color=#a020f0]Walt[/color] a trouxe para o lado da equipe.
""",

	"""[center][b][color=green]INCIDENTE: POLENTINHA[/color][/b][/center]

[center]Localização: Pizzaria ([u]Emprego de Mike[/u]).[/center] 
> Identificada a presença do [u][b][color=red]RATO[/color][/b][/u].
> [b]PROTOCOLO DE SOBREVIVÊNCIA:[/b] Sobreviver a 5 noites contra o Polentinha.

[center][b][color=green]O INCÊNDIO[/color][/b][/center]

> O [u][b]Rato[/b][/u] eliminou uma das Chaves. O local foi incinerado com apoio de [u]Alex[/u]. 
> [color=#ff0000]Joshua[/color] e [u]Mike[/u] ficaram presos nas chamas, sobrevivendo por pouco.""",

"""[center][color=#00ff00][b]DESCOBERTA: LIGAÇÃO COM A OSKOFF[/b][/color][/center]

> O sujeito [color=#008080]Owen Parker[/color] descobriu que seu pai está ligado à [u][b]OSKOFF[/b][/u].
> Infiltração em laboratório nos esgotos revelou experimentos em humanos e criaturas. 

[center][b][color=green]SUB-ARQUIVO: ORIGEM DE SHANE[/color][/b][/center]

> Dados indicam que [color=#ffff00]Shane[/color] é um produto de experimentação da [u][b]OSKOFF[/b][/u], com envolvimento direto de seus pais nas operações corporativas.""",

	"""[center][color=#00ff00][b]> RELATÓRIO FINAL: CASO WENDIGO[/b][/color][/center]

> Chegada do aluno [color=#add8e6]John[/color]. 
> O grupo deslocou-se para o vilarejo de [color=#ffc0cb]Dyane[/color] para conter instabilidades vindas do [color=#4b0082][b]Umbral[/b][/color].

[center][b][color=green]SUB-ARQUIVO: WENDIGO[/color][/b][/center]

> Derrota da entidade classe [u][b]Wendigo[/b][/u] após cruzamento entre a realidade e o [color=#4b0082][b]Umbral[/b][/color].
> Neste evento, a unidade [color=#ffc0cb]Dyane[/color] revelou-se portadora da Chave de [color=#ffc0cb][b]Cataclise[/b][/color].""",

"""
[center][color=green]FIM DOS REGISTROS DE MISSÕES.[/color][/center]

[center][color=green]Adicionar mais logs[/color][/center]

[center][color=green]Sim[/color][/center][center][color=green]Não[/color][/center]
"""
]

var esta_escrevendo = false

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	for p in pages.values():
		if p: p.visible = false
	_show_page("home")

func _show_page(target_name: String):
	_tocar_som_clique()
	
	for p_name in pages:
		if pages[p_name]: 
			pages[p_name].visible = (p_name == target_name)
	
	var target_node = pages[target_name]
	
	if target_node is RichTextLabel:
		target_node.visible_ratio = 0
		var tween = get_tree().create_tween()
		tween.tween_property(target_node, "visible_ratio", 1.0, 0.8)
		_iniciar_som_binario(0.8)

func _tocar_som_clique():
	if sfx_click and not sfx_click.playing:
		sfx_click.pitch_scale = randf_range(0.95, 1.05)
		sfx_click.play()

func _iniciar_som_binario(duracao: float):
	if sfx_binary:
		sfx_binary.play()
		esta_escrevendo = true
		get_tree().create_timer(duracao).timeout.connect(_parar_som_binario)

func _parar_som_binario():
	if sfx_binary and sfx_binary.playing:
		sfx_binary.stop()
		esta_escrevendo = false


func _on_btn_logs_pressed():
	current_log_index = 0
	_update_log_text() 
	_show_page("logs")

func _on_btn_monitor_pressed(): _show_page("monitor")

func _input(event):
	if pages["attachments"].visible:
		if event.is_action_pressed("ui_right"):
			if current_attach_idx < attachment_data.size() - 1:
				current_attach_idx += 1
				_tocar_som_clique()
				_update_attachment_display()
				
		elif event.is_action_pressed("ui_left"):
			if current_attach_idx > 0:
				current_attach_idx -= 1
				_tocar_som_clique()
				_update_attachment_display()

func _change_log_slide(dir):
	current_log_index = clampi(current_log_index + dir, 0, log_slides.size() - 1)
	_update_log_text()
	_show_page("logs") 

func _update_log_text():
	if page_logs:
		var footer = "\n\n[center][color=green]PÁGINA " + str(current_log_index + 1) + " / " + str(log_slides.size()) + "[/color][/center]"
		page_logs.text = log_slides[current_log_index] + footer

func _on_btn_attachments_pressed():
	current_attach_idx = 0
	_show_page("attachments")
	_update_attachment_display()

func _update_attachment_display():
	if not page_attachments or not anexo_img or not anexo_txt:
		print("ERRO: Hierarquia de anexos não encontrada!")
		return

	var data = attachment_data[current_attach_idx]
	
	if data["imagem"] != "":
		anexo_img.visible = true
		anexo_img.texture = load(data["imagem"])
	else:
		anexo_img.visible = false
		
	if data["texto"] != "":
		anexo_txt.visible = true
		anexo_txt.text = data["texto"]
		anexo_txt.visible_ratio = 0
		var tween = get_tree().create_tween()
		tween.tween_property(anexo_txt, "visible_ratio", 1.0, 0.8)
		_iniciar_som_binario(0.8)
	else:
		anexo_txt.visible = false
