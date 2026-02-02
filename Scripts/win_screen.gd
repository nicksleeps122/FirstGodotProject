extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/ButtonPlayAgain.pressed.connect(_on_play_pressed);
	$CenterContainer/VBoxContainer/ButtonMainMenu.pressed.connect(_on_quit_pressed);

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn");

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn");
