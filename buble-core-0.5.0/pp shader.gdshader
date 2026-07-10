shader_type canvas_item;

uniform vec4 border_color : source_color;
uniform float border_width : hint_range(0, 10, 1);
uniform float tolerance : hint_range(0.0, 1.0, 0.01);
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

bool test_border(vec4 test_color, vec4 sample_color) {
	bool rsame = false;
	bool bsame = false;
	bool gsame = false;
	if (sample_color.a == 0.0) {
		return true;
	}
	if (abs(test_color.r - sample_color.r) < tolerance) {
		rsame = true;
	}
	if (abs(test_color.b - sample_color.b) < tolerance) {
		bsame = true;
	}
	if (abs(test_color.g - sample_color.g) < tolerance) {
		gsame = true;
	}
	if (rsame == true && bsame == true && gsame == true) {
		return false;
	}
	return true;
}

void fragment() {

	vec4 data = texture(screen_texture,SCREEN_UV);
	vec2 pixel_size = SCREEN_PIXEL_SIZE;
	vec2 offset = pixel_size * border_width;
	bool border = false;

	vec2 test_coord1 = SCREEN_UV + (vec2(1.0,0.0)*offset);
	vec2 test_coord2 = SCREEN_UV + (vec2(-1.0,0.0)*offset);
	vec2 test_coord3 = SCREEN_UV + (vec2(0.0,1.0)*offset);
	vec2 test_coord4 = SCREEN_UV + (vec2(0.0,-1.0)*offset);
	vec2 test_coord5 = SCREEN_UV + (vec2(0.707,0.707)*offset);
	vec2 test_coord6 = SCREEN_UV + (vec2(-0.707,0.707)*offset);
	vec2 test_coord7 = SCREEN_UV + (vec2(0.707,-0.707)*offset);
	vec2 test_coord8 = SCREEN_UV + (vec2(-0.707,-0.707)*offset);

	vec2 test_coord9 = SCREEN_UV + (vec2(0.894,0.449)*offset);
	vec2 test_coord10 = SCREEN_UV + (vec2(-0.894,0.449)*offset);
	vec2 test_coord11 = SCREEN_UV + (vec2(0.894,-0.449)*offset);
	vec2 test_coord12 = SCREEN_UV + (vec2(-0.894,-0.449)*offset);
	vec2 test_coord13 = SCREEN_UV + (vec2(0.449,0.894)*offset);
	vec2 test_coord14 = SCREEN_UV + (vec2(-0.449,0.894)*offset);
	vec2 test_coord15 = SCREEN_UV + (vec2(0.449,-0.894)*offset);
	vec2 test_coord16 = SCREEN_UV + (vec2(-0.449,-0.894)*offset);

	vec2 all_coords[16] = vec2[16] (
		test_coord1,
		test_coord2,
		test_coord3,
		test_coord4,
		test_coord5,
		test_coord6,
		test_coord7,
		test_coord8,
		test_coord9,
		test_coord10,
		test_coord11,
		test_coord12,
		test_coord13,
		test_coord14,
		test_coord15,
		test_coord16
		);

	for (int i = 0; i < all_coords.length(); i++) {
		if (test_border(data, texture(screen_texture,all_coords[i])) == true) {
			border = true;
		}
	}

	//if (test_border(data, texture(screen_texture,test_coord1)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord2)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord3)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord4)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord5)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord6)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord7)) == true) {
		//border = true;
	//}
	//if (test_border(data, texture(screen_texture,test_coord8)) == true) {
		//border = true;
	//}


	if (border == true) {
		COLOR = border_color;
	}

	if (border == false) {
		COLOR = data;
	}

}