#include <flutter/runtime_effect.glsl>

#define S(a, b, x) smoothstep(a, b, x)
#define C FlutterFragCoord()

uniform vec2 uResolution;

out vec4 fragColor;

float TaperBox(vec2 p, float wb, float wt, float yb, float yt, float blur) {
    float m = S(-.1, .1, p.y-yb);
    return m;
}

void main() {
    vec2 uv = vec2(C.x/uResolution.x * 2 -1, C.y/uResolution.y * -2 +1);
    float tickness = 1/ uResolution.y;
    vec3 col = vec3(0);
    float m = TaperBox(uv, .3, .1, .1, .3, 0.5);
    col += m;
    if (abs(uv.x) < tickness) {
        col.g = 1.;
    }
    if (abs(uv.y) < tickness) {
        col.r = 1.;
    }
    fragColor = vec4(col, 1.);
}