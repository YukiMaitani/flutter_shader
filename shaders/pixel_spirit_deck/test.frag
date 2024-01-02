#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = (vec2(FlutterFragCoord().xy) / uResolution) * 2. - 1.;
}