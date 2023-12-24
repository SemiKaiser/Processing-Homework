int cols, rows;
float[][] terrain;
int resolution = 10;
import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlP5 cp;

void setup() {
  size(800, 600, P3D);
  cols = width / resolution;
  rows = height / resolution;
  terrain = new float[cols][rows];
  noiseDetail(4, 0.1);
  generateTerrain();
    cam = new PeasyCam(this, 500);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  rotateX(PI / 3);
  translate(-width / 2, -height / 2);
  drawTerrain();
    PVector point = new PVector(100, 100, 0);
    point = ROT(point, radians(45));
  

  point = zROT(point, radians(30));

}

PVector ROT(PVector p, float ang) {
  PVector pr = new PVector(p.x*cos(ang) - p.y*sin(ang), p.x*sin(ang) + p.y*cos(ang), p.z);
  return pr;
}

PVector zROT(PVector p, float ang) {
  PVector pr = new PVector(p.z*sin(ang) + p.x*cos(ang), p.y, p.z*cos(ang) - p.x*sin(ang));
  return pr;
}
void generateTerrain() {
  float yOffset = 0;
  float offset = random(10);
  float minNoise = Float.MAX_VALUE;
  float maxNoise = Float.MIN_VALUE;

  for (int y = 0; y < rows; y++) {
    float xOffset = 0;
    for (int x = 0; x < cols; x++) {
      float noiseVal = noise(xOffset, yOffset) + offset;
      terrain[x][y] = map(noiseVal, 0, 1, -100, 100);
      if (noiseVal < minNoise) minNoise = noiseVal;
      if (noiseVal > maxNoise) maxNoise = noiseVal;

      xOffset += 0.1;
    }
    yOffset += 0.1;
  }

  println("Min noise: " + minNoise);
  println("Max noise: " + maxNoise);
}

void drawTerrain() {
  for (int x = 0; x < cols - 1; x++) {
    beginShape(TRIANGLE_STRIP);
    for (int y = 0; y < rows; y++) {

      int colorValue = color(map(terrain[x][y], -50, 50, 0, 255), 0, 255);

      fill(colorValue);

      vertex(x * resolution, y * resolution, terrain[x][y]);
      vertex((x + 1) * resolution, y * resolution, terrain[x + 1][y]);
    }
    endShape();
  }
}
