import java.util.ArrayList;

ArrayList<Integer> al;
ArrayList<Button>stepsUI;
ArrayList<ArrayList<Integer>>steps;
ArrayList<Button>algorithms;

int step;
int yPos = 130;

void setup() {
  textAlign(CENTER);
  size(600, 600);
  al = new ArrayList<Integer>();
  stepsUI = new ArrayList<Button>();
  steps = new ArrayList<ArrayList<Integer>>();//holds steps of algo, displayed as arraylist of integers
  algorithms = new ArrayList<Button>();
  al.add(6);
  al.add(2);
  al.add(7);
  al.add(4);
  al.add(3);
  al.add(1);
  al.add(5);
}

void draw() {
  background(100);
  for (Button b : algorithms) {
    b.display();
  }
  for (Button b : stepsUI) {
    b.display();
  }
  displayAl();
  displayAlUI();
}

void mousePressed() {
  for (Button b : algorithms) {
    if (b.contains(mouseX, mouseY)) {
      algorithmAction(b.act);
    }
  }
  for (Button b : stepsUI) {
    if (b.contains(mouseX, mouseY)) {
      arrowAction(b.act);
    }
  }
}

void algorithmAction(int id) {
  //algorithms.clear();
  steps.clear();
  step = 0;
  stepsUI.clear(); 
  copyStep();
  if (id == 0) {
    bubbleSort();
    
  } else if (id == 1) {
    selectionSort();
    
  } else if (id == 2) {
    insertionSort();
    
  }
  al = steps.get(0);
  stepsUI.add(new Button("<-", 190, 180, 40, 80, 0));
  stepsUI.add(new Button("->", 330, 180, 40, 80, 1));
  stepsUI.add(new Button((step)+"/"+(steps.size()-1), 270, 180, 40, 60, 3));
}

void arrowAction(int id) {
  if (id == 0) {
    if (step > 0) {
      step--;
    }
  } else {
    if (step < steps.size() -1) {
      step++;
    }
  }
  al = steps.get(step);
  stepsUI.get(2).text = step+"/"+ (steps.size()-1);
}

//Copies current state of arraylist into steps
void copyStep() { 
  ArrayList<Integer> copy = new ArrayList<Integer>();
  for (int i : al) {
    copy.add(i);
  }
  steps.add(copy);
}

void bubbleSort() {
  for (int x = 0; x < al.size(); x++) {
    for (int y = 0; y < al.size()-1; y++) {
      if (al.get(y) > al.get(y+1)) {
        Integer temp = al.get(y);
        al.set(y, al.get(y+1));
        al.set(y+1, temp);
        copyStep();
      }
    }
  }
}

void selectionSort() {
  for (int x = 0; x < al.size(); x++) {
    int smallest = x;
    for (int i = x; i < al.size()-1; i++) {
      if (al.get(smallest) > al.get(i+1)) {
        smallest = i+1;
      }
    }
    int temp = al.get(x);
    al.set(x, al.get(smallest));
    al.set(smallest, temp);
    copyStep();
  }
}

void insertionSort(){
 for(int x = 0; x < al.size(); x++){
  int partition = x;
  while(partition > 0 && al.get(x) < al.get(partition-1)){
   partition --; 
  }
  int temp = al.get(x);
  for(int i = x; i > partition; i--){
   al.set(i, al.get(i-1)); 
  }
  al.set(partition, temp);
  copyStep();
 }
}