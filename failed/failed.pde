float frames;

PImage failed1;
PImage failed2;
PImage backbuffer;

PShader shader;

void failed( color _c1, color _c2 ) {
  tint( _c2 );
  image( failed2, 0, 0 );
  tint( _c1 );
  image( failed1, 0, 0 );
}

void setup() {
  size( 400, 400, P2D );
  
  frames = 100.0;
  
  failed1 = loadImage( "failed1.png" );
  failed2 = loadImage( "failed2.png" );
  backbuffer = createImage( width, height, RGB );
  
  shader = loadShader( "fuck.frag" );
}

void draw() {
  imageMode( CORNER );
  shader.set( "time", frameCount / frames % 1.0 );
  shader.set( "resolution", width * 1.0, height * 1.0 );
  shader.set( "backbuffer", backbuffer );
  filter( shader );
  
  imageMode( CENTER );
  for ( int i = 0; i < 8; i ++ ) {
    translate(
      200 + 120 * sin( 20 + i * 16 + frameCount / frames * PI * ( 6.0 - i * 2.0 ) ),
      200 + 120 * sin( 40 + i * 19 + frameCount / frames * PI * ( 4.0 + i * 2.0 ) )
    );
    rotate( frameCount / frames * PI * ( 6.0 - i * 8.0 ) );
    scale( 0.4 );
    failed(
      color(
        ( noise( 56 + i, frameCount % frames, 1 ) - 0.5 ) * 1E9,
        ( noise( 56 + i, frameCount % frames, 2 ) - 0.5 ) * 1E9,
        ( noise( 56 + i, frameCount % frames, 3 ) - 0.5 ) * 1E9
      ),
      color(
        ( noise( 156 + i, frameCount % frames, 4 ) - 0.5 ) * 1E9,
        ( noise( 156 + i, frameCount % frames, 5 ) - 0.5 ) * 1E9,
        ( noise( 156 + i, frameCount % frames, 6 ) - 0.5 ) * 1E9
      )
    );
    resetMatrix();
  }
  
  translate( 200, 200 );
  scale( ( frameCount / frames % 1.0 ) * 2.0 );
  failed(
    color( 0 ),
    color( 255, frameCount % 4 < 2 ? 0 : 255, 0 )
  );
  resetMatrix();
  
  for ( int i = 0; i < 6; i ++ ) {
    translate(
      i * 180.0 - ( frameCount % frames ) / frames * 360.0,
      360
    );
    scale( 0.5 );
    rotate( i );
    failed(
      color(
        ( noise( 256, frameCount % frames, 1 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 256, frameCount % frames, 2 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 256, frameCount % frames, 3 + 1.2 * i ) - 0.5 ) * 1E9
      ),
      color(
        ( noise( 256, frameCount % frames, 4 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 256, frameCount % frames, 5 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 256, frameCount % frames, 6 + 1.2 * i ) - 0.5 ) * 1E9
      )
    );
    resetMatrix();
    
    translate(
      400 - ( i * 168.0 - ( frameCount % frames ) / frames * 360.0 ),
      40
    );
    scale( 0.5 );
    rotate( i );
    failed(
      color(
        ( noise( 216, frameCount % frames, 1 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 216, frameCount % frames, 2 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 216, frameCount % frames, 3 + 1.2 * i ) - 0.5 ) * 1E9
      ),
      color(
        ( noise( 216, frameCount % frames, 4 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 216, frameCount % frames, 5 + 1.2 * i ) - 0.5 ) * 1E9,
        ( noise( 216, frameCount % frames, 6 + 1.2 * i ) - 0.5 ) * 1E9
      )
    );
    resetMatrix();
  }
  
  backbuffer = get();
  
  //saveFrame( "out/###.png" );
}