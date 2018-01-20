void displayAl() {
  int x = 20;
  int y = 250;
  int size = 80;
  for (int i : al) {
    fill(255);
    rect(x, y, size, size);
    fill(0);
    text(i, x+size/2, y+size/2);
    x+= size;
  }
}
void displayAlUI() {
  algorithms.add(new Button("BubbleSort", 0, 0, 100, 200, 0));
  algorithms.add(new Button("SelectionSort", 200, 0, 100, 200,1));
  algorithms.add(new Button("InsertionSort", 400, 0, 100,200,2));
}