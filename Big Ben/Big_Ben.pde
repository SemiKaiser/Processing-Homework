PImage img;
int numRows = 300;
int numCols = 200;
int cursorRadius = 70;
boolean showRectangles = true;
PVector mouse;
PVector coordinates;

void setup() {
  size(800, 1200);
  img = loadImage("Your_image.jpeg");
  img.resize(width, height);
  background(0, 101, 199);
  generateRectangles();
  mouse = new PVector(mouseX, mouseY);
  coordinates = new PVector(0, 0);  // 添加这一行来声明 coordinates
}

void draw() {
  // 在每一帧更新鼠标位置
  mouse.set(mouseX, mouseY);
  PVector coordinates = calculatePendulumCoordinates(mouse);


  if (showRectangles) {
    generateRectangles();
  } 
}

void generateRectangles() {
  int rectWidth = width / numCols;
  int rectHeight = height / numRows;
  PVector coordinates = calculatePendulumCoordinates(mouse);
  int cursorX = (int) coordinates.x;
  int cursorY = (int) coordinates.y;
  for (int y = 0; y < height; y += rectHeight) {
    for (int x = 0; x < width; x += rectWidth) {
      int centerX = x + rectWidth / 2;
      int centerY = y + rectHeight / 2;

      float distance = dist(cursorX, cursorY, centerX, centerY);

      if (distance < cursorRadius) {
        float gradient = map(distance, 0, cursorRadius, 0, 1);
        int rectColor = img.get(centerX, centerY);  // 修正类型为int
        fill(rectColor);
        rect(x, y, rectWidth, rectHeight);
      }
    }
  }
}

float angleAcceleration = 0;
float angleVelocity = 0;
float angle = 30;
float gravity = 0.2;
float originX = 400, originY = 0;

PVector calculatePendulumCoordinates(PVector mouse) {
  float r =50+millis()/30;
  float num1 = -gravity / r * sin(angle);
  angleAcceleration = num1;
  angleVelocity += angleAcceleration;
  angle += angleVelocity;
  float bobX = originX + r * sin(angle);
  float bobY = originY + r * cos(angle);

  println("bobX: " + bobX + ", bobY: " + bobY); // 打印 bobX 和 bobY 的值

  return new PVector(bobX, bobY);
}
