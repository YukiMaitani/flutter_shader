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

vec4 Tree(vec2 uv, vec3 col, float blur) {
    float m = TaperBox(uv, .03, .03, .0, .25, blur);
    m += TaperBox(uv, .2, .1, .25, .5, blur);
    m += TaperBox(uv, .15, .05, .5, .75, blur);
    m += TaperBox(uv, .1, .0, .75, 1, blur);
    float shadow = TaperBox(uv-vec2(.2, 0), .1, .5, .15, .25, blur);
    shadow += TaperBox(uv+vec2(.25, 0), .1, .5, .45, .5, blur);
    shadow += TaperBox(uv-vec2(.25, 0), .1, .5, .7, .75, blur);
    col -= shadow * .8;
    return vec4(col, m);
}

void main() {
    vec2 centerOrigin = vec2(FlutterFragCoord().xy -.5*uResolution);
    vec2 uv = vec2(centerOrigin.x, 1-centerOrigin.y)/uResolution.y;
    uv.y += .5;
    float tickness = 1/ uResolution.y;
    vec3 col = vec3(0);

    float blur = .005;
    vec4 tree = Tree(uv, vec3(1), blur);
    fragColor = mix(vec4(col, 1), tree, tree.a);
}