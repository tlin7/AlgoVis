class Button {
  int x;
  int y;
  int l;
  int w;
  String text;
  int act;

  Button(String content, int xPos, int yPos, int len, int wid, int action) {
    text = content;
    x = xPos;
    y = yPos;
    l = len;
    w = wid;
    act = action;
  }
  
  void display(){
    textSize(16);
    textAlign(CENTER);
    fill(200);
   rect(x,y,w,l);
   fill(0);
   text(text, x+w/2, y+l/2);
  }
  boolean contains(int mx, int my){
   return(mx > x && mx < x+w && my > y && my < y+l);
  }
}