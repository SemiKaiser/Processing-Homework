int numRectangles = 20; // 矩形的数量
float rectWidth = 30; // 矩形的宽度
float rectHeight = 30; // 矩形的高度

void setup() {
  size(400, 400);
  background(0); // 设置背景为白色
  
  // 计算每一行和每一列可以容纳多少个矩形
  int numCols = floor(width / rectWidth);
  int numRows = floor(height / rectHeight);
  
  // 生成若干个黑色描边、内部为白色的矩形，确保填满整个背景
  for (int col = 0; col < numCols; col++) {
    for (int row = 0; row < numRows; row++) {
      float x = col * rectWidth; // 计算x坐标
      float y = row * rectHeight; // 计算y坐标
      boolean makeRed = random(1) > 0.8; // 30%的概率使矩形变为红色
      boolean makeblue = random(1) > 0.8; // 30%的概率使矩形变为蓝色
      boolean makegreen = random(1) > 0.8; // 30%的概率使矩形变为绿色
      boolean makeblack = random(1) > 1; // 0%的概率使矩形变为黑色
      // 绘制矩形
      if (makeRed) {
        fill(255, 0, 0); // 红色填充
      } else if(makeblue){
        fill(0,255,0); // 黑色填充
      } else if(makegreen){
        fill(0,0,255); // 黑色填充
      } else if(makeblue){
        fill(0); // 黑色填充
      } else{
        fill(0);
      }
      
      stroke(255); // 白色描边
      strokeWeight(1); // 描边宽度为1
      rect(x, y, rectWidth, rectHeight);
    }
  }
}

void draw() {
  // 这里可以添加动态效果或其他交互性的内容
}
