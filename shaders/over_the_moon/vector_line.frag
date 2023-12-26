#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;

out vec4 fragColor;

void main() {
    vec2 uv = vec2(FlutterFragCoord().xy) / uSize;

    fragColor = vec4(uv.x, uv.x, uv.x, 1.0);
}