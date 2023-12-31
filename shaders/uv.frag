#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = vec2(FlutterFragCoord().x/uResolution.x, 1-FlutterFragCoord().y/uResolution.y);
    fragColor = vec4(uv, 0, 1);
}