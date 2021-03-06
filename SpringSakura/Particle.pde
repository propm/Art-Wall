class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(-0.03,0.02);
    velocity = new PVector(random(-1,-0.3),random(-2,-0.5));
    location = l.get();
  }

  void run() {
    update();
    display();
    popMatrix();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading() - (float)1/2*PI - 0.3);
  }

  // Method to display
  void display() {
    image(img1,0,0);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (location.x < 0 || location.y > height) {
      return true;
    } else {
      return false;
    }
  }
}

