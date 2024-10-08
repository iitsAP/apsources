#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    if (texture(Sampler0, texCoord0).a == 254.0/255.0) {
        fragColor = linear_fog(texture(Sampler0, texCoord0), vertexDistance, FogStart, FogEnd, FogColor);
    } else {
        fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
    }
}
