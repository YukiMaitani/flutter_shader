#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = (vec2(FlutterFragCoord().xy) / uResolution) * 2. - 1.;
    float tickness = 1/ uResolution.y;
    vec3 col = vec3(0);
    if (abs(uv.x) < tickness) {
        col.g = 1.;
    }
    if (abs(uv.y) < tickness) {
        col.r = 1.;
    }
    fragColor = vec4(col, 1.);
}