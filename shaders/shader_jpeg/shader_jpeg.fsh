varying vec2 v_vTexcoord;   // Texture coordinates
varying vec4 v_vColour;     // Vertex color

uniform sampler2D gm_BaseTexture;   // Base texture input
uniform vec2 texture_size;          // Size of the input texture

// RGB to YCbCr conversion matrix and offset
const mat3 rgb_to_ycbcr = mat3(
    vec3(.299, -.168736, .5), 
    vec3(.587, -.331264, -.418688), 
    vec3(.114, .5, -.081312)
);
const vec3 rgb_to_ycbcr_offset = vec3(0.0, 0.5, 0.5);

// DCT coefficients (fixed)
const float dct[64] = float[64](
    0.353553,0.353553,0.353553,0.353553,0.353553,0.353553,0.353553,0.353553,
    0.490393,0.415735,0.277785,0.0975452,-0.0975452,-0.277785,-0.415735,-0.490393,
    0.46194,0.191342,-0.191342,-0.46194,-0.46194,-0.191342,0.191342,0.46194,
    0.415735,-0.0975452,-0.490393,-0.277785,0.277785,0.490393,0.0975452,-0.415735,
    0.353553,-0.353553,-0.353553,0.353553,0.353553,-0.353553,-0.353553,0.353553,
    0.277785,-0.490393,0.0975452,0.415735,-0.415735,-0.0975452,0.490393,-0.277785,
    0.191342,-0.46194,0.46194,-0.191342,-0.191342,0.46194,-0.46194,0.191342,
    0.0975452,-0.277785,0.415735,-0.490393,0.490393,-0.415735,0.277785,-0.0975452
);

// YCbCr to RGB conversion matrix and offset
const mat3 ycbcr_to_rgb = mat3(
    vec3(1.), 
    vec3(0., -.344136, 1.772), 
    vec3(1.402, -.714136, 0.)
);
const vec3 ycbcr_offset_to_rgb = vec3(0.0, -0.5, -0.5);

void main() 
{
    vec2 texel_size = 1.0 / texture_size;                               // Get the size of one texel
    ivec2 gid = ivec2(v_vTexcoord * texture_size);                      // Global ID in the texture grid
    ivec2 lid = ivec2(mod(float(gid.x), 8.0), mod(float(gid.y), 8.0));  // Local ID within the 8x8 block
    
    // Sample texture color and convert to YCbCr
    vec3 color = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
    color = clamp(color, 0.0001, 1.0);  // Avoid out-of-range values
    vec3 ycbcr = rgb_to_ycbcr_offset + rgb_to_ycbcr * color;
    
    // Perform Horizontal DCT
    vec3 dct_horiz = vec3(0.0);
    for (int i = 0; i < 8; i++) {
        float dct_coeff = dct[8 * lid.x + i];
        vec3 sample = texture2D(gm_BaseTexture, v_vTexcoord + vec2(texel_size.x * float(i), 0.0)).rgb;
        sample = rgb_to_ycbcr_offset + rgb_to_ycbcr * sample;
        dct_horiz += dct_coeff * sample;
    }
    
    // Perform Vertical DCT
    vec3 dct_vert = vec3(0.0);
    for (int i = 0; i < 8; i++) {
        float dct_coeff = dct[8 * lid.y + i];
        vec3 sample = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, texel_size.y * float(i))).rgb;
        sample = rgb_to_ycbcr_offset + rgb_to_ycbcr * sample;
        dct_vert += dct_coeff * sample;
    }
    
    // Apply quantization (simplified)
    float quant_factor = 1.0 * 20.0;
    float quantization = quant_factor * float(lid.x + lid.y + 1) + 1.0;
    dct_vert = round(128.0 * dct_vert / quantization) * (quantization / 128.0);
    
    // Inverse DCT and conversion back to RGB
    vec3 final_color = ycbcr_to_rgb * (dct_vert + ycbcr_offset_to_rgb);
    
    // Output the final color with vertex color modulation
    gl_FragColor = v_vColour * vec4(final_color, 1.0);
}
