varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float Position;

void main()
{
    vec4 Colour = texture2D( gm_BaseTexture, v_vTexcoord ); // get colour of pixel
    float Max = max(Colour.r, max(Colour.g, Colour.b)); // get max channel of pixel
    float Min = min(Colour.r, min(Colour.g, Colour.b)); // get min channel of pixel
    float Sat = 1.0-Min/Max; // get current saturation of pixel
    // set saturation to pixel that depends on Position uniform
    Colour.r = clamp(Max-(Max-Colour.r)/Sat*(Sat+Position), 0.0, Max); // for red channel
    Colour.g = clamp(Max-(Max-Colour.g)/Sat*(Sat+Position), 0.0, Max); // for green channel
    Colour.b = clamp(Max-(Max-Colour.b)/Sat*(Sat+Position), 0.0, Max); // for blue channel
    gl_FragColor = v_vColour * Colour;
}

