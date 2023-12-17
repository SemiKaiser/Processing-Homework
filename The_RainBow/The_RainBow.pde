import peasy.*;
import controlP5.*;
float dia = 50.0;
float sw = 1;

PVector[][] vp;
int layer = 20;
int section = 36;
float radiu = 200;
float cyHigth = 50;

PeasyCam cam;
ControlP5 cp;

void setup(){
  size(1600, 1600, P3D);
  background(0);
  cam = new PeasyCam(this, 400);
  UI();
}

void draw(){
  background(0);
  buildCylinder();
  
  displayCylinder();
  
  cam.beginHUD();
  cp.draw();
  cam.endHUD();
  
  if (mouseX<300 && mouseY<300) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void buildCylinder(){
  vp = new PVector[layer][section];
  float angle = TWO_PI/section;
  float angle2 = TWO_PI/layer;
  for(int i = 0; i < layer; i ++){
    for(int j = 0; j < section; j ++){
      vp[i][j] = new PVector(10+radiu*cos(angle*j)*cos(angle2*i), 10+radiu*sin(angle*j)*sin(angle2*i)+10, cyHigth*i);
    }
  }
}

void displayCylinder(){
  strokeWeight(1);
  stroke(255);
  float c = 255/vp.length;
  for(int i = 0; i < vp.length-1; i ++){
    colorMode(HSB);
    fill(i*c,255,200);
    for(int j = 0; j < vp[0].length; j ++){
      beginShape(TRIANGLES);
      vertex(vp[i][j].x, 
             vp[i][j].y, 
             vp[i][j].z);
      vertex(vp[i+1][j].x, 
             vp[i+1][j].y, 
             vp[i+1][j].z);
      vertex(vp[i][(j+1)%vp[0].length].x, 
             vp[i][(j+1)%vp[0].length].y, 
             vp[i][(j+1)%vp[0].length].z);
      
      vertex(vp[i][(j+1)%vp[0].length].x, 
             vp[i][(j+1)%vp[0].length].y, 
             vp[i][(j+1)%vp[0].length].z);
      vertex(vp[i+1][j].x, 
             vp[i+1][j].y, 
             vp[i+1][j].z);
      vertex(vp[i+1][(j+1)%vp[0].length].x,
             vp[i+1][(j+1)%vp[0].length].y, 
             vp[i+1][(j+1)%vp[0].length].z);
      endShape();
    }
  }
  
  for(int i = 0; i < vp.length; i ++){
    for(int j = 0; j < vp[0].length; j ++){
      strokeWeight(5);
      stroke(255,0,255);
      point(vp[i][j].x, vp[i][j].y, vp[i][j].z);
    }
  }
}
