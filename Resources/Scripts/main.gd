class_name Main
extends Node

const GUI_SCENES = {
	"main_menu": preload("res://Resources/Scenes/GUI/main_menu_gui.tscn"),
	"tavern": preload("res://Resources/Scenes/GUI/tavern_gui.tscn"),
	"upgrades": preload("res://Resources/Scenes/GUI/upgrades_menu_gui.tscn"),	
	"options": preload("res://Resources/Scenes/GUI/options_menu.tscn"),
}

const GAME_SCENES = {
	"main_menu": preload("res://Resources/Scenes/Game/world.tscn")
}

var currentGUI: Node = null
var currentScene: Node = null

func _ready() -> void:
	change_gui("main_menu")

func setup_gui_signals():
	match currentGUI.name:
		"MainMenuGUI":
			var start_button = currentGUI.get_node("VBoxContainer/Buttons/Start")
			var options_button = currentGUI.get_node("VBoxContainer/Buttons/Options")
			var exit_button = currentGUI.get_node("VBoxContainer/Buttons/Exit")
			start_button.pressed.connect(change_gui.bind("tavern"))
			options_button.pressed.connect(change_gui.bind("options"))
			exit_button.pressed.connect(exit_game.bind())
		"OptionsMenu":
			var return_button = currentGUI.get_node("MarginContainer/Panel/Button")
			return_button.pressed.connect(change_gui.bind("main_menu"))

func setup_scene_signals():
	pass

func change_gui(gui : String) -> void:
	if !GUI_SCENES.has(gui):
		return
	if currentGUI != null:
		remove_child(currentGUI)
	currentGUI = GUI_SCENES.get(gui).instantiate()
	add_child(currentGUI)
	setup_gui_signals()
	
func change_scene(scene : String) -> void:
	if !GAME_SCENES.has(scene):
		return
	if currentGUI != null:
		remove_child(currentScene)
	currentScene = GAME_SCENES.get(scene).instantiate()
	add_child(currentScene)
	setup_scene_signals()

func exit_game() -> void:
	get_tree().quit()
