/*
	アスキー文字エフェクトシェーダー by あるる（きのもと 結衣） @arlez80
	Ascii Effect Shader by Yui Kinomoto @arlez80

	MIT License
	
	edit: slightly modded by Ktosox
*/

shader_type canvas_item;
render_mode unshaded;

const vec3 MONOCHROME_SCALE = vec3( 0.298912, 0.586611, 0.114478 );

uniform bool on = true;
uniform sampler2D ascii_tex : hint_albedo;
uniform vec2 ascii_size = vec2( 8.0, 16.0 );
uniform int available_columns = 10;
uniform int max_columns = 16;

void fragment( )
{
	
	vec2 screen_uv = floor( SCREEN_UV / SCREEN_PIXEL_SIZE / ascii_size ) * SCREEN_PIXEL_SIZE * ascii_size;
	vec2 resolution = vec2(256,144);
	vec2 diff = ascii_size * SCREEN_PIXEL_SIZE;
	vec4 color = (
		textureLod( SCREEN_TEXTURE, screen_uv, 0.0 )
	+	textureLod( SCREEN_TEXTURE, screen_uv + vec2( 0.0, diff.y ), 0.0 )
	+	textureLod( SCREEN_TEXTURE, screen_uv + vec2( diff.x, 0.0 ), 0.0 )
	+	textureLod( SCREEN_TEXTURE, screen_uv + diff, 0.0 )
	) / 4.0;
	vec2 ascii_uv = fract( SCREEN_UV / SCREEN_PIXEL_SIZE / ascii_size );
	ascii_uv.x = ( 1.0 - ascii_uv.x ) / float( max_columns );
	float col = floor( dot( color.rgb, MONOCHROME_SCALE ) * float( available_columns ) ) / float( available_columns );
	COLOR = texture(SCREEN_TEXTURE,SCREEN_UV);
	if (on){
	COLOR = texture( ascii_tex, ascii_uv + vec2( col * ( float( available_columns ) / float( max_columns ) ), 0.0 ) );
	COLOR.rgb *= textureLod( SCREEN_TEXTURE, round(SCREEN_UV*resolution)/resolution, 0.0 ).rgb;
//	COLOR.rgb *= texture(SCREEN_TEXTURE,SCREEN_UV).rgb;
	COLOR.rgb = mix(vec3(dot(vec3(1.0), COLOR.rgb) * 0.33333), COLOR.rgb, 0.6/col);
	}

}
