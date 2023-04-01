shader_type canvas_item;

uniform bool enable = true;
uniform vec4 line_color : source_color = vec4(1);
uniform vec4 fill_color : source_color = vec4(1);
uniform float line_thickness : hint_range(0, 20) = 1.0;

void fragment() {
	if (enable) {
		vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
		
		float outline = texture(TEXTURE, UV + vec2(-size.x, 0)).a;
		outline += texture(TEXTURE, UV + vec2(0, size.y)).a;
		outline += texture(TEXTURE, UV + vec2(size.x, 0)).a;
		outline += texture(TEXTURE, UV + vec2(0, -size.y)).a;
		outline += texture(TEXTURE, UV + vec2(-size.x, size.y)).a;
		outline += texture(TEXTURE, UV + vec2(size.x, size.y)).a;
		outline += texture(TEXTURE, UV + vec2(-size.x, -size.y)).a;
		outline += texture(TEXTURE, UV + vec2(size.x, -size.y)).a;
		outline = min(outline, 1.0);
		
		vec4 color = texture(TEXTURE, UV) * fill_color;
		COLOR = mix(color, line_color, outline - color.a);
	} else {
		COLOR = texture(TEXTURE, UV);
	}
}