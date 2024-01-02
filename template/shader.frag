#include <flutter/runtime_effect.glsl>
#define C FlutterFragCoord()

uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = vec2(C.x/uResolution.x, 1-C.y/uResolution.y);
    fragColor = vec4(uv, 0, 1);
}