import gab.opencv.*;
String  dia;
PImage src1, src2, src3; //container imagens
OpenCV ocv1, ocv2, ocv3; //Objeto OpenCV
ArrayList<Contour> cnt1, cnt2, cnt3; //array de contornos

void setup() {
  size(540, 540);
  noLoop();
  dia = "3"; 
  src1 = loadImage("data/pdia"+dia+"_1.jpg"); //carrega imagem
  src2 = loadImage("data/pdia"+dia+"_2.jpg");
  src3 = loadImage("data/pdia"+dia+"_3.jpg");
  ocv1 = new OpenCV(this, src1); //instancia OpenCV
  ocv2 = new OpenCV(this, src2);
  ocv3 = new OpenCV(this, src3);
  ocv1.gray();  //Converte em cinzas
  ocv2.gray();
  ocv3.gray();
  ocv1.threshold(100); //reduz à luz e sombra
  ocv2.threshold(100);
  ocv3.threshold(100); 
  cnt1 = ocv1.findContours(); //Encontra contornos
  cnt2 = ocv2.findContours();
  cnt3 = ocv3.findContours();
}

void draw() {
  background(255);
  scale(0.50);
  noStroke();     //sem pena de contorno
  for (Contour cnt1 : cnt1) {  //desenha contornos translúcidos
    fill (0, 0, 255, 128); // alPha aprox 50%
    cnt1.draw();
  }
  for (Contour cnt2 : cnt2) {
    fill (255, 0, 0, 128);
    cnt2.draw();
  }
  for (Contour cnt3 : cnt3) {
    fill (0, 255, 0, 128);
    cnt3.draw();
  }
  stroke(0);
  strokeWeight(3);
  noFill();   //desenha por fim contornos em preto
  for (Contour cnt1 : cnt1) {
    cnt1.draw();
  }
  for (Contour cnt2 : cnt2) {
    cnt2.draw();
  }
  for (Contour cnt3 : cnt3) {
    cnt3.draw();
  }
}

void keyPressed() {  
  // salva a imagem
  if (key == 'r' || key == 'R') {
    saveFrame("output/"+dia+".png");}
  }