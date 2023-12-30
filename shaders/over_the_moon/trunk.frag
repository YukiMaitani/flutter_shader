#include <flutter/runtime_effect.glsl>

#define S(a, b, x) smoothstep(a, b, x)
#define C FlutterFragCoord()

uniform vec2 uResolution;

out vec4 fragColor;

float TaperBox(vec2 p, float wb, float wt, float yb, float yt, float blur) {
    float m = S(-blur, blur, p.y-yb);
    m *= S(blur, -blur, p.y-yt);
    p.x = abs(p.x);
    float w = mix(wb, wt, (p.y - yb) / (yt - yb));
    m *= S(blur, -blur, p.x - w);
    return m;
}

void main() {
    vec2 uv = vec2(C.x/uResolution.x * 2 -1, C.y/uResolution.y * -2 +1);
    uv.y += 1;
    float tickness = 1/ uResolution.y;
    vec3 col = vec3(0);
    float m = TaperBox(uv, .03, .03, .0, .25, .01);
    col += m * .5;
    fragColor = vec4(col, 1.);
}