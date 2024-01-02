#include <flutter/runtime_effect.glsl>

#define S(a, b, x) smoothstep(a, b, x)
#define C FlutterFragCoord()

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

float TaperBox(vec2 p, float wb, float wt, float yb, float yt, float blur) {
    float m = S(-blur, blur, p.y-yb);
    m *= S(blur, -blur, p.y-yt);
    p.x = abs(p.x);
    float w = mix(wb, wt, (p.y - yb) / (yt - yb));
    m *= S(blur, -blur, p.x - w);
    return m;
}

vec4 Tree(vec2 uv,float x, float y, vec3 col, float blur) {
    uv -= vec2(x, y);
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
    uv.x += uTime * .1;
    uv *= 5;

    float tickness = 1/ uResolution.y;
    vec3 col = vec3(0);
    float blur = .005;

    float id = floor(uv.x);
    float n = fract(sin(id*234.12) * 5463.3)* 2 - 1.;
    uv.x = fract(uv.x) - .5;
    float x = n * .3;
    float y = 0.;
    vec4 tree = Tree(uv, x, y, vec3(1), blur);
    col.rg = uv;
    fragColor = mix(vec4(col, 1), tree, tree.a);
}