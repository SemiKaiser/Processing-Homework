float xmin = -2;
float ymin = -2;
float xmax = 2;
float ymax = 2;
float zoom = 1.0;

void setup() {
  size(800, 800);
  pixelDensity(1);
  loadPixels();
  drawFractal();
}

void draw() {
  // 这是一个静态图像，所以draw()函数中没有额外的代码
}

void drawFractal() {
  float dx = (xmax - xmin) / width;
  float dy = (ymax - ymin) / height;
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float a = xmin + x * dx;
      float b = ymin + y * dy;
      
      float ca = a;
      float cb = b;
      
      int n = 0;
      int maxIterations = 100;
      
      for (n = 0; n < maxIterations; n++) {
        float aa = a * a - b * b;
        float bb = 2 * a * b;
        
        a = aa + ca;
        b = bb + cb;
        
        // 检查是否越界
        if (abs(a + b) > 16) {
          break;
        }
      }
      
      // 使用颜色表示收敛性
      int bright = int(map(n, 0, maxIterations, 0, 255));
      
      if (n == maxIterations) {
        bright = 100;
      }
      
      int pix = x + y * width;
      pixels[pix] = color(255,255-bright,255-bright);
    }
  }
  
  updatePixels();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  
  // 根据滚轮方向进行缩放
  float zoomFactor = 0.05;
  if (e > 0) {
    zoom *= 1.0 - zoomFactor;  // 缩小
  } else {
    zoom *= 1.0 + zoomFactor;  // 放大
  }
  
  // 重新计算复平面的范围
  float centerReal = (xmin + xmax) / 2;
  float centerImag = (ymin + ymax) / 2;
  
  float halfWidth = (xmax - xmin) / 2 * zoom;
  float halfHeight = (ymax - ymin) / 2 * zoom;
  
  xmin = centerReal - halfWidth;
  ymin = centerImag - halfHeight;
  xmax = centerReal + halfWidth;
  ymax = centerImag + halfHeight;
  
  // 重新加载并绘制图像
  background(255);
  drawFractal();
}
