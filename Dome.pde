/* Dome */
int layer = 7; // number of circles
int[] r = new int[layer]; // each circle's radius
int[] num = new int[layer]; // number of elements for each circle
int stars = 500;

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < stars; i++) {
    starfield();
  }
  
  for (int i = 0; i < layer; i++) { // init
    r[i] = 0;
    num[i] = 0;
  }  
  r[0] = 10;
  num[0] = 10;
  for (int i = 1; i < layer; i++) {
    r[i] = r[i-1] + int(random(20, 35));
    num[i] = int(random(20, 40));
  }
  
  pushMatrix();
  translate(width/2, height/2);
  fill(random(360),70,99,80);
  ellipse(0, 0, 2*r[layer-1]+20, 2*r[layer-1]+20);
  for (int i = 0; i < layer; i++) {
    drawlayer(r[i],num[i]);
  }
  popMatrix();  
}

void draw() {

}

void drawlayer(int radius, int elements) {
  float angle = TWO_PI/elements;
  int shape = int(random(6));
  if (shape == 0) { //circle
    for (float a = 0; a < TWO_PI; a += angle) {
      float cx = cos(a) * radius; // center of each elements
      float cy = sin(a) * radius;
      float cc = map(a,0,TWO_PI,0,360);
      fill(cc,37,90);
      ellipse(cx, cy, 20, 20);
    }    
  }
  else if (shape == 1) { //triangle1
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float x1 = cos(a) * (radius + 10);
      float y1 = sin(a) * (radius + 10);
      float x2 = cos(a-angle/2) * (radius - 10);
      float y2 = sin(a-angle/2) * (radius - 10);
      float x3 = cos(a-angle) * (radius + 10);
      float y3 = sin(a-angle) * (radius + 10);    
      float cc = map(a,0,TWO_PI,150,360);
      fill(cc,37,90);
      triangle(x1, y1, x2, y2, x3, y3);
    }
    endShape();
  }
  else if (shape == 2) { //triangle2
    for (float a = 0; a < TWO_PI; a += angle) {
      float x1 = cos(a) * (radius + 10);
      float y1 = sin(a) * (radius + 10);
      float x2 = cos(a-angle/2) * (radius - 10);
      float y2 = sin(a-angle/2) * (radius - 10);
      float x3 = cos(a) * (radius - 10);
      float y3 = sin(a) * (radius - 10);  
      float cc = map(a,0,TWO_PI,0,150);
      fill(cc,37,90);   
      triangle(x1, y1, x2, y2, x3, y3);
    }
  }
  else if (shape == 3) { //quad1
    for (float a = 0; a < TWO_PI; a += angle) {
      float x1 = cos(a) * (radius + 10);
      float y1 = sin(a) * (radius + 10);
      float x2 = cos(a) * (radius - 10);
      float y2 = sin(a) * (radius - 10);
      float x3 = cos(a+angle/2) * (radius - 10);
      float y3 = sin(a+angle/2) * (radius - 10);   
      float x4 = cos(a+angle/2) * (radius + 10);
      float y4 = sin(a+angle/2) * (radius + 10);
      float cc = map(a,0,TWO_PI,random(360),random(360));
      fill(cc,37,90);      
      quad(x1, y1, x2, y2, x3, y3, x4, y4);
    }
  }
  else if (shape == 4) { //quad2
    for (float a = 0; a < TWO_PI; a += angle) {
      float cc = map(a,0,TWO_PI,random(360),random(360));
      fill(cc,37,90);   
      beginShape();
      vertex(cos(a) * radius, sin(a) * radius);
      vertex(cos(a) * (radius+10), sin(a) * (radius+10));
      vertex(cos(a+angle/2) * (radius+10), sin(a+angle/2) * (radius+10));
      vertex(cos(a+angle/2) * radius, sin(a+angle/2) * radius);
      vertex(cos(a-angle/2) * radius, sin(a-angle/2) * radius);
      vertex(cos(a-angle/2) * (radius-10), sin(a-angle/2) * (radius-10));
      vertex(cos(a) * (radius-10), sin(a) * (radius-10));
      endShape();    
    }    
  }  
  else if (shape == 5 || shape == 6) { //heart
    for (float a = 0; a < TWO_PI; a += angle) {
      float cc = map(a,0,TWO_PI,random(360),random(360));
      fill(cc,37,90);   
      beginShape();
      vertex(cos(a) * (radius+5), sin(a) * (radius+5));
      bezierVertex(cos(a+angle/3) * (radius+20), sin(a+angle/3) * (radius+20),
                   cos(a+angle/2) * (radius+5), sin(a+angle/2) * (radius+5),
                   cos(a) * (radius-10), sin(a) * (radius-10));
      bezierVertex(cos(a-angle/2) * (radius-5), sin(a-angle/2) * (radius-5),
                   cos(a-angle/3) * (radius+20), sin(a-angle/3) * (radius+20),
                   cos(a) * (radius+5), sin(a) * (radius+5));
      endShape();
    }
  }
  else {
    //more shapes
  }
}

void starfield() {
  float x, y, sz, bri;
  x = random(width);
  y = random(height);
  sz = random(5);    
  bri = random(250,360);
  fill(bri);
  ellipse(x, y, sz, sz);
}

void mouseClicked() {
  setup();
}
