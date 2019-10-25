extends Panel

var style = StyleBoxFlat.new()

func _ready():
    # The Panel doc tells you which style names there are
     #add_style_override("Panel", style)
    set_process(true)

func _process(delta):
    # Some basic code animation
    var color = Color(0.5*sin(OS.get_ticks_msec()/100.0)+0.5, 0, 0)
    style.set_bg_color(color)
    # Don't forget to update so the control will redraw
   