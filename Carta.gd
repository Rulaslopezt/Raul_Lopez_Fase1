extends TextureButton

signal carta_seleccionada(carta)

var id_item: String = ""
var textura_frente: Texture2D
var textura_dorso: Texture2D = preload("res://dorso.png")
var revelada: bool = false

func _ready() -> void:
	texture_normal = textura_dorso
	pressed.connect(_on_pressed)

func configurar(nombre: String, textura: Texture2D) -> void:
	id_item = nombre
	textura_frente = textura
	ocultar()
	disabled = false

func _on_pressed() -> void:
	if not revelada:
		carta_seleccionada.emit(self)

func revelar() -> void:
	revelada = true
	texture_normal = textura_frente

func ocultar() -> void:
	revelada = false
	texture_normal = textura_dorso

func emparejar() -> void:
	revelada = true
	disabled = true
