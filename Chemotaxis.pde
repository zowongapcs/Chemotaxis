Fan[] fans = new Fan[10000];
int num=10;
int lives=5;
boolean pause=true;
int songs=1;
int fanCounter=10;
int clicks=1;
boolean game=true;
boolean start=false;

void setup(){
  size(1250,700);
  for(int i=0;i<num;i++){
    fans[i]= new Fan();
  }
}
void draw(){
  background(250);
  fill(150);
  rect(1150,0,100,700);
  fill(250);
  text("Songs released: ",1155,515);
  text(songs,1195,530);
  text("Number of fans:",1155,560);
  text(fanCounter,1185,575);
  text("Money:",1180,605);
  text("$"+songs*fanCounter,1160,620);
  if(start==false){
    fill(200);
    noStroke();
    rect(1160,10,80,80,20);
    fill(175);
    textSize(20);
    text("Start",1177,55);
    fill(0);
    textSize(12);
    text("Click to start game --->",1000,55);
  }else if(pause==false){
  fill(200);
  noStroke();
  rect(1160,10,80,80,20);
  fill(175);
  rect(1180,30,10,40,10);
  rect(1210,30,10,40,10);
  }else{
  fill(200);
  noStroke();
  rect(1160,10,80,80,20);
  fill(175);
  triangle(1185,30,1185,70,1225,50);
  }
  fill(250,0,0);
  for(int i=1;i<=lives;i++){
    triangle(1200,(70*i)+105,1185,(70*i)+90,1215,(70*i)+90);
    arc(1200,(70*i)+85,14,14,PI+HALF_PI+QUARTER_PI,TWO_PI+PI+QUARTER_PI);
    arc(1190,(70*i)+85,14,14,0,TWO_PI);
    arc(1210,(70*i)+85,14,14,0,TWO_PI);
  }
  if(fans[num]!= new Fan()){
    fans[num]= new Fan();
  }
  for(int i=0;i<num;i++){
    if(start==true){
    if(pause==false){
    fans[i].move();
    fans[i].touch();
    }
    fans[i].show();
    }
    fans[i].death();
  }
}
void mousePressed(){
  if(get(mouseX,mouseY) == color(200) || get(mouseX,mouseY) == color(175)){
    if(start==false){
      start=true;
    }
    if(pause==false){
      pause=true;
    }else{
      pause=false;
    }
  }else if(mouseX<1150 && game==true){
    num++;
    songs++;
    clicks++;
    fanCounter+=10*clicks;
  }
}

class Fan{
  int myX,myY,myColor;
  Fan(){
    myX=(int)(Math.random()*1150);
    myY=(int)(Math.random()*700);
  }
  void move(){
    if(myX<1145||mouseX<1150){
    if(mouseX>myX){
      myX = myX + (int)((Math.random()*5)-1);
    }else{
      myX = myX + (int)((Math.random()*5)-4);
    }
    }
    if(mouseY>myY){
      myY = myY + (int)((Math.random()*5)-1);
    }else{
      myY = myY + (int)((Math.random()*5)-4);
    }
  }
  void show(){
    fill(0);
    ellipse(myX,myY,6,6);
  }
  void touch(){
    if(dist(mouseX,mouseY,myX,myY)<3){
      lives--;
    }
  }
  void death(){
   if(lives<=0){
    background(249);
    game=false;
    fill(1);
    text("You've been smothered to death. The idol life is not for you.",450,350); 
    text("Songs released: "+songs,575,525);
    text("Fans accumulated: "+fanCounter,575,550);
    text("Money made: $"+(songs*fanCounter),575,575);
   }
  }
}
