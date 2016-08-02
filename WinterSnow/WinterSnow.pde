import deadpixel.keystone.*;

PImage img1,img2;

Keystone ks;
CornerPinSurface surface;
PGraphics offscreen;

ParticleSystem ps;

void setup() {
  size(640*2,360*2,P3D);
  img1 = loadImage("snow.png");
  img2 = loadImage("snow2.jpg");
  
  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(640, 360, 60);
  offscreen = createGraphics(640, 360, P3D);
  
  ps = new ParticleSystem(new PVector(random(width * 2),-100));
}

void draw() {
  background(0);
  
  offscreen.beginDraw();
  offscreen.image(img2,0,0,640,360);
  offscreen.endDraw();
  
  surface.render(offscreen);
  
  ps.origin = new PVector(random(width * 2), -100);
  ps.addParticle();
  ps.run();
  
}

void keyPressed(){
  switch(key){
    case 'c':
      ks.toggleCalibration();
      break;
  }
}
