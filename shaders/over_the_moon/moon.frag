#include <flutter/runtime_effect.glsl>

#define S(a, b, x) smoothstep(a, b, x)
#define C FlutterFragCoord()

uniform vec2 uResolution;
uniform float uTime;
uniform vec2 uMouse;

out vec4 fragColor;

float TaperBox(vec2 p, float wb, float wt, float yb, float yt, float blur) {
    float m = S(-blur, blur, p.y-yb);
    m *= S(blur, -blur, p.y-yt);
    p.x = abs(p.x);
    float w = mix(wb, wt, (p.y - yb) / (yt - yb));
    m *= S(blur, -blur, p.x - w);
    return m;
}

float GetHeight(float x) {
    return sin(x * .423) + sin(x) * .3;
}

float Hash21(vec2 p) {
    p = fract(p * vec2(234.45, 765.34));
    p += dot(p, p+547.123);
    return fract(p.x * p.y);
}
vec4 Tree(vec2 uv, vec3 col, float blur) {
    float m = TaperBox(uv, .03, .03, -.05, .25, blur);
    m += TaperBox(uv, .2, .1, .25, .5, blur);
    m += TaperBox(uv, .15, .05, .5, .75, blur);
    m += TaperBox(uv, .1, .0, .75, 1, blur);
    float shadow = TaperBox(uv-vec2(.2, 0), .1, .5, .15, .25, blur);
    shadow += TaperBox(uv+vec2(.25, 0), .1, .5, .45, .5, blur);
    shadow += TaperBox(uv-vec2(.25, 0), .1, .5, .7, .75, blur);
    col -= shadow * .8;
    return vec4(col, m);
}

vec4 Layer(vec2 uv, float blur) {
    vec4 col = vec4(0);
    float id = floor(uv.x);
    float n = fract(sin(id*234.12) * 5463.3)* 2 - 1.;
    float x = n * .3;
    float y = GetHeight(uv.x);
    float ground = S(blur, -blur, uv.y + y);
    col += ground;
    y = GetHeight(id + .5 + x);
    uv.x = fract(uv.x) - .5;
    vec4 tree = Tree((uv - vec2(x, -y)) * vec2(1, 1. + n * .2), vec3(1), blur);
    col = mix(col, tree, tree.a);
    col.a = max(ground, tree.a);
    return col;
}

void main() {
    vec2 centerOrigin = vec2(C.xy -.5*uResolution);
    vec2 uv = vec2(centerOrigin.x, 1-centerOrigin.y)/uResolution.y;
    float t = uTime * .3;
    vec2 M = (uMouse / uResolution) * 2. * vec2(1, -1) - 1.;

    float twinkle = dot(length(sin(uv.x + t)), length(cos(uv * vec2(22,6.7) -t * 3.)));
    twinkle = sin(twinkle) * .5 + .5;
    float star = pow(Hash21(uv), 30.) * twinkle;
    vec4 col = vec4(vec3(star), 1);
    float moon =  S(.01, -.01, length(uv - vec2(.4 ,.2)) -.15) * S(-.01, .1, length(uv - vec2(.5 ,.25)) -.15);
    col *= 1 - moon;

    for(float i = 0.; i < 1.; i += 1./10.) {
        float scale = mix(30., 1., i);
        float blur = mix(.1, .005, i);
        vec4 layer = Layer(uv * scale + vec2(t + i * 100., i) - M, blur);
        layer.rgb *= (1 - i) * vec3(.9,.9,1.);
        col = mix(col, layer, layer.a);
    }
    fragColor = col;
}