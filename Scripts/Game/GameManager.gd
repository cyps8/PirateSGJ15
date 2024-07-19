extends Node

class_name GameManager
static var ins: GameManager

var paused = false

var pauseMenuRef: CanvasLayer

func _init():
    ins = self

func _ready():
    pauseMenuRef = $Pause
    pauseMenuRef.visible = true
    remove_child(pauseMenuRef)
    Root.ins.HideLoadingScreen()

func _process(_dt):
    if Input.is_action_just_pressed("Pause") && !Root.ins.optionsOpen:
        TogglePause()

func TogglePause():
    paused = !paused
    get_tree().paused = paused
    if paused:
        add_child(pauseMenuRef)
    else:
        remove_child(pauseMenuRef)
