extends Node2D

var score : int = 0;
@export var win_score : int = 4;

func _ready() -> void:
	_update_ui();
	for c in get_tree().get_nodes_in_group("collectible"):
		c.collected.connect(_on_collectible_collected);

func _on_collectible_collected() -> void:
	score += 1;
	_update_ui();
	
	if(score >= win_score):
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn");

func _update_ui() -> void:
	$CanvasLayer/LabelScore.text = "Score: %d / %d" %[score,win_score];
