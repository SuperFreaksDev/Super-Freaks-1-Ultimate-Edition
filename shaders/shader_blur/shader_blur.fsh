//
// Simple passthrough fragment shader
// Credit to: DragoniteSpam
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_size;

void main() {
    vec2 texel = 1. / texture_size;
    
    vec4 surrounding_color = 
	(
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - texel.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + texel.y))
	) / 4.;
    
    vec4 diagonal_color = 
	(
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y - texel.y)) + // northwest
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y - texel.y)) + // northeast
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y + texel.y)) + // southwest
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y + texel.y))
	) / 4.; // southeast
    
    vec4 distant_color = 
	(
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2. * texel.x, v_vTexcoord.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2. * texel.x, v_vTexcoord.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 2. * texel.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 2. * texel.y)) +
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2. * texel.x, v_vTexcoord.y - 2. * texel.y)) + // northwest
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2. * texel.x, v_vTexcoord.y - 2. * texel.y)) + // northeast
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2. * texel.x, v_vTexcoord.y + 2. * texel.y)) + // southwest
        texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2. * texel.x, v_vTexcoord.y + 2. * texel.y))
	) / 8.; // southeast
    
    vec4 original_color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec4 final_color = (original_color * 4. + surrounding_color * 3. + diagonal_color * 2. + distant_color) / 10.;
    //final_color.a = original_color.a;
    
    gl_FragColor = v_vColour * final_color;
}