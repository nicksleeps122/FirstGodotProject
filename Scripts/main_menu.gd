extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/ButtonPlay.pressed.connect(_on_play_pressed);
	$CenterContainer/VBoxContainer/ButtonQuit.pressed.connect(_on_quit_pressed);

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn");

func _on_quit_pressed() -> void:
	get_tree().quit();
