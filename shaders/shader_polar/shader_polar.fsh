// Black and white fragment shader
varying vec2 v_vTexcoord;

const float PI = 3.1415926;

void main()
{
    vec2 polar_out;
    
    vec2 shift = vec2(0.50000, 1.00000);
    float repeat_amp = 1.00000;
    float repeat_ang = 2.00000;
    
    vec2 __dir = v_vTexcoord - shift;
    float __radius = length(__dir) * 2.0; 
    float __angle = atan(__dir.y, __dir.x) * 1.0 / (PI * 2.0);
    //polar_out = mod(vec2(__radius * repeat_amp, __angle * repeat_ang), 1.0);
    polar_out = mod(vec2(__angle * repeat_ang, -__radius * repeat_amp), 1.0);
    //polar_out = vec2(__radius * repeat_amp, __angle * repeat_ang);
    
    vec4 texColor = texture2D(gm_BaseTexture, polar_out);
    gl_FragColor = texColor;
}
