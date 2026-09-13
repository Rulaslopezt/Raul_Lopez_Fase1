# Archivo: main.gd
extends Control

var escena_carta: PackedScene = preload("res://Carta.tscn")
@onready var grid: GridContainer = $GridContainer

var primera_carta: TextureButton = null
var segunda_carta: TextureButton = null
var bloqueado: bool = false

var escuderias: Array = [
	{"id": "redbull", "textura": preload("res://redbull.png")},
	{"id": "ferrari", "textura": preload("res://ferrari.png")},
	{"id": "mercedes", "textura": preload("res://mercedes.png")},
	{"id": "mclaren", "textura": preload("res://mclaren.png")},
	{"id": "astonmartin", "textura": preload("res://astonmartin.png")},
	{"id": "alpine", "textura": preload("res://alpine.png")},
	{"id": "williams", "textura": preload("res://williams.png")},
	{"id": "rb", "textura": preload("res://rb.png")},
	{"id": "audi", "textura": preload("res://audi.png")},
	{"id": "haas", "textura": preload("res://haas.png")},
	{"id": "cadillac", "textura": preload("res://cadillac.png")}
]

var mazo: Array = []

func _ready() -> void:
	generar_mazo()
	mazo.shuffle()
	crear_tablero()

func generar_mazo() -> void:
	for item in escuderias:
		mazo.append(item)
		mazo.append(item)

func crear_tablero() -> void:
	for item in mazo:
		var nueva_carta = escena_carta.instantiate()
		grid.add_child(nueva_carta)
		nueva_carta.configurar(item["id"], item["textura"])
		nueva_carta.carta_seleccionada.connect(_on_carta_seleccionada)

func _on_carta_seleccionada(carta: TextureButton) -> void:
	if bloqueado or carta.revelada:
		return

	if primera_carta == null:
		primera_carta = carta
		primera_carta.revelar()
	elif segunda_carta == null and carta != primera_carta:
		segunda_carta = carta
		segunda_carta.revelar()
		verificar_pareja()

func verificar_pareja() -> void:
	bloqueado = true
	
	if primera_carta.id_item == segunda_carta.id_item:
		primera_carta.emparejar()
		segunda_carta.emparejar()
		reiniciar_turno()
	else:
		await get_tree().create_timer(0.8).timeout
		primera_carta.ocultar()
		segunda_carta.ocultar()
		reiniciar_turno()

func reiniciar_turno() -> void:
	primera_carta = null
	segunda_carta = null
	bloqueado = false
