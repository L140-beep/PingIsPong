shader_type canvas_item;
uniform sampler2D screen_texture: hint_screen_texture;
uniform float value = 0.0;
void fragment() {
	// Place fragment code here.
	COLOR = textureLod(screen_texture, SCREEN_UV, value);
}
