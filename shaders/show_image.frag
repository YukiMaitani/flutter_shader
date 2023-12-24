#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 uSize;
uniform sampler2D uTexture;

void main() {
    vec2 uv = FlutterFragCoord().xy / uSize;
    fragColor = texture(uTexture, uv.xy).rgba;
}