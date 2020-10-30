//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D mask;
uniform float bright_x;
uniform float bright_y;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
    
    
    gl_FragColor.rgb += vec3(
                        (texture2D( mask, vec2(v_vTexcoord.x, v_vTexcoord.y + 0.0005)).r - texture2D( mask, vec2(v_vTexcoord.x, v_vTexcoord.y - 0.0005)).r) * bright_y +
                        (texture2D( mask, vec2(v_vTexcoord.x + 0.0005, v_vTexcoord.y)).r - texture2D( mask, vec2(v_vTexcoord.x - 0.0005, v_vTexcoord.y)).r) * bright_x
                            );
}

