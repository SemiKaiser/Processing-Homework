int cols = 10;
int rows = 10;
float[][] grid;
ArrayList<PVector> points = new ArrayList<PVector>();
int maxLines = 100;
ArrayList<PVector[]> lines = new ArrayList<PVector[]>();

void setup() {
  size(400, 400);
  grid = new float[cols][rows];
  
  // 初始化点阵
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = map(i, 0, cols-1, 0, width);
      float y = map(j, 0, rows-1, 0, height);
      grid[i][j] = dist(0, 0, x, y);
      points.add(new PVector(x, y));
    }
  }
}

void draw() {
  background(255);
  
  // 连接点阵中的每一个点与鼠标位置
  for (PVector point : points) {
    // 只有在未达到线段数量上限时才添加新的线段
    if (lines.size() < maxLines) {
      PVector[] line = {point, new PVector(mouseX, mouseY)};
      lines.add(line);
    } else {
      // 超过上限时，移除最早生成的线段，并添加新的线段
      lines.remove(0);
      PVector[] line = {point, new PVector(mouseX, mouseY)};
      lines.add(line);
    }
  }
  
  // 绘制线段
  for (PVector[] line : lines) {
    line(line[0].x, line[0].y, line[1].x, line[1].y);
  }
}
