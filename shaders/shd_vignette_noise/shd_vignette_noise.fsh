varying vec2 var_texcoord;
varying vec4 v_vColour;

uniform vec4 u_settings; //vignette inner circle size, vignette outter circle size, noise strength
uniform vec3 u_vignette_colour; //R,G,B

float random(vec3 _scale, float _seed)
{
    return fract(sin(dot(vec3(var_texcoord, 1.0)+_seed, _scale))*43758.5453+_seed);
}

void main()
{
    vec4 base = texture2D( gm_BaseTexture, var_texcoord );

    float vignette = distance( vec2(0.5, 0.5), var_texcoord );
    vignette = u_settings.x - vignette * u_settings.y;
    vec3 vignette_colour = (u_vignette_colour/255.0) * vignette;

    float noise_strength = u_settings.z;
    float noise = noise_strength * ( 0.5 - random( vec3( 1.0 ), length( vec2(var_texcoord.x/var_texcoord.y, var_texcoord.y)) ) );
    if (u_settings.w == 1.0) {vignette_colour += noise;}

    gl_FragColor =  v_vColour * vec4(base.rgb * vignette_colour, base.a);
}

