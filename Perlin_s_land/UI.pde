void UI() {
  cp = new ControlP5(this, createFont("微软雅黑", 16));  
  cp.addSlider("radiu", 50, 500, 200, 50, 50+60+20, 200, 30).setLabel("圆柱半径");
  cp.addSlider("section", 3, 128, 36, 50, 50+90+30, 200, 30).setLabel("截面细分");
  cp.addSlider("cyHigth", 0, 100, 50, 50, 50+120+40, 200, 30).setLabel("层间高度");
  cp.setAutoDraw(false);
}
