//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float size;
const float speed = 0.002;
const float frequency = 20.0;

void main()
{
	float wave = sin(time * speed + v_vTexcoord.y * frequency) * (size);
	vec4 distort = v_vColour * texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + wave, v_vTexcoord.y));
	gl_FragColor = distort;
}