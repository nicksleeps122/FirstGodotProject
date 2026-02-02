extends CharacterBody2D

const speed : float = 200;
const jumpVelocity : float = -400;

var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity");

@export var max_jumps : int = 1;
var jumps_remaining : int = 0;

@onready var anim : AnimatedSprite2D = $AnimatedPlayerSprite2D;

func _ready() -> void:
	jumps_remaining = max_jumps;

func _physics_process(delta: float) -> void:
	
	#gravity
	if(not is_on_floor()):
		velocity.y += gravity * delta;
		anim.play("jumping");
	else:
		if(abs(velocity.x)>1.0):
			anim.play("moving");
		else:
			anim.play("default");
		
		#reset extra jump counter when on the ground
		jumps_remaining = max_jumps;
	
	#jump
	if(Input.is_action_just_pressed("jump") and jumps_remaining > 0):
		velocity.y = jumpVelocity;
		jumps_remaining -= 1;
	
	#movement
	velocity.x = Input.get_axis("move_left","move_right") * speed;
	if(velocity.x != 0):
		anim.flip_h = velocity.x < 0;
	
	move_and_slide();

func _increment_jump_number() -> void :
	max_jumps += 1;
