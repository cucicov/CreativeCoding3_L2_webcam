import processing.video.*;

Capture cam;


int[] data = new int[100];

void setup() {
  size(500, 500);
  noStroke();

  cam = new Capture(this, "pipeline:autovideosrc");
  cam.start();     
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  
  int count = 0;
  
  for(int xStep = 0; xStep < 10; xStep++) {
    for (int yStep = 0; yStep < 10; yStep++) {
      
      int currentX = xStep * 50;
      int currentY = yStep * 50;
      
      data[count] = 0;
      
      for (int x = 0; x < 50; x += 12) {
        for (int y = 0; y < 50; y += 12) {
           data[count] = (int) (data[count] + brightness(get(currentX + x,currentY + y))) / 2;
        }
      }
      
      fill(data[count]);
      rect(currentX, currentY, 50, 50);
      
      count++;
    }
  }
  
}
