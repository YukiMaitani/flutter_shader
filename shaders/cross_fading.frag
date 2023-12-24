#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 uSize;
uniform float uTime;
uniform sampler2D uTexture1;
uniform sampler2D uTexture2;

void main() {
    vec2 uv = FlutterFragCoord().xy / uSize;
    vec4 color1 = texture(uTexture1, uv.xy).rgba;
    vec4 color2 = texture(uTexture2, uv.xy).rgba;
    fragColor = mix(color1, color2, sin(uTime));
}