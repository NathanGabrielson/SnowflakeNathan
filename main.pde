ArrayList <Particle> snowArm;
int current = 0;
boolean stop = false;
int num = 0;
void setup() {
  size(700, 1000);
  background(0);
  stroke(255, 255, 255);
  snowArm = new ArrayList<Particle>();
  snowArm.add(new Particle());
}

void draw() {
  if (!stop) {
    Particle original = snowArm.get(current);
    while (!original.finished) {
      original.process();
      if (original.y>=height/2) {
        original.collided();
        current+=1;
        snowArm.add(new Particle());
      } else {
        for (int i = 0; i < snowArm.size() - 1; i++) {
          Particle comp = snowArm.get(i);

          if (dist(original.x, original.y, comp.x, comp.y) <= (original.diameter + comp.diameter)/2) {

            if (i != current) {
              original.collided();
              current+=1;
              Particle newFlake;
              if (Math.random() < 0.5) {
                newFlake = new ColorParticle();
              }
              else {
                newFlake = new Particle();
              }
              snowArm.add(newFlake);

              if (dist(original.x, original.y, newFlake.x, newFlake.y) <= (original.diameter + comp.diameter)/2) {
                saveFrame("images/flake" + num + ".tif");
                background(0);
                snowArm.clear();
                current = 0;
                snowArm.add(new Particle());
                num++;
              }
              return;
            }
          }
        }
      }
    }
  }
}

void keyPressed() {
  stop = true;
}
