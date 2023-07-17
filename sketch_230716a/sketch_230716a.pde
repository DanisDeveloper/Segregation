boolean randomize = true;
float density = 0.9;
float neighbourPercent = 0.4;
int cellSize = 10;

Agent[][] agents;
Agent[] emptyAgents;
int widthAgents;
int heightAgents;


void setup() {
  size(600, 600);
  frameRate(144);

  widthAgents = width/cellSize;
  heightAgents = height/cellSize;
  int size = widthAgents * heightAgents;
  println(size);
  int countOneType = (int)(size*density/2);

  agents = new Agent[heightAgents][widthAgents];
  emptyAgents = new Agent[(int)(size*(1-density))];

  int k=0;
  int count = 0;
  for (int i=0; i<agents.length; ++i) {
    for (int j=0; j<agents[i].length; ++j) {
      agents[i][j] = new Agent(j, i, 0);
      if (count < countOneType) {
        agents[i][j].type = 1;
      } else if (count>=countOneType && count < countOneType*2) {
        agents[i][j].type = 2;
      } else {
        emptyAgents[k++] = agents[i][j];
      }
      ++count;
    }
  }
}

void draw() {
  //println(frameRate);




  for (int i=0; i<agents.length; ++i) {
    for (int j=0; j<agents[i].length; ++j) {
      switch(agents[i][j].type) {
      case 0:
        {
          fill(255);
          break;
        }
      case 1:
        {
          fill(150, 0, 200);
          break;
        }
      case 2:
        {
          fill(80, 200, 50);
          break;
        }
      }
      rect(j*cellSize, i*cellSize, cellSize, cellSize);
    }
  }
  if (randomize) {
    for (int i=0; i<50; ++i)
      agents[(int)random(0, agents.length)][(int)random(0, agents[0].length)].swap(agents[(int)random(0, agents.length)][(int)random(0, agents[0].length)]);
  } else {
    for (int i=0; i<agents.length; ++i) {
      for (int j=0; j<agents[0].length; ++j) {
        float count = 0;

        for (int k=-1; k<2; ++k) {
          for (int w=-1; w<2; ++w) {
            if (k == 0 && w == 0) continue;
            if (agents[(i+k+heightAgents)%heightAgents][(j+w+widthAgents)%widthAgents].type == agents[i][j].type) {
              ++count;
            }
          }
        }
        if (count/8 < neighbourPercent) {
          Agent a = agents[(int)random(0, agents.length)][(int)random(0, agents[0].length)];
          while (a.type!=0) {
            a = agents[(int)random(0, agents.length)][(int)random(0, agents[0].length)];
          }
          agents[i][j].swap(a);
        }
        if (random(0, 1) < 0.001) {
          agents[(int)random(0, agents.length)][(int)random(0, agents[0].length)].swap(agents[(int)random(0, agents.length)][(int)random(0, agents[0].length)]);
        }
      }
    }
    //for(int k=0;k<emptyAgents.length;++k){
    //  println(emptyAgents[k].type);
    //}
    //delay(1000);
  }

  if (keyPressed) {
    switch(key) {
    case 32:
      {
        randomize = !randomize;
        break;
      }
    }
  }
}
