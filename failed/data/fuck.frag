precision highp float;

uniform float time;
uniform vec2 resolution;
uniform sampler2D backbuffer;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution * vec2( 1.0, -1.0 ) + vec2( 0.0, 1.0 );
  gl_FragColor = texture2D( backbuffer, uv * vec2( 0.97, 1.12 - sin( time ) * uv.x ) + vec2( 0.0, 0.01 ) ) * vec4( 0.98, 0.92, 0.92, 1.0 );
}