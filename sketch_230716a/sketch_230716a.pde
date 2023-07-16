class Agent{
  public int x = 0;
  public int y = 0;
  public int type = 0;
  
  Agent(int _x,int _y,int _type){
    x = _x;
    y = _y;
    type = _type;
  }
  
  void swap(Agent agent){
    Agent temp = new Agent(this.x,this.y,this.type);
    this.type = agent.type;
    agent.type = temp.type;
  }
}


boolean flag = true;
float density = 0.9;
float neighbourPercent = 0.5;
int cellSize = 10;

Agent[] agents;
Agent[] emptyAgents;

void setup(){
  size(600,600);
  frameRate(144);
  
  int size = width*height/cellSize/cellSize;
  int countOneType = (int)(size*density/2);
  agents = new Agent[size];
  emptyAgents = new Agent[(int)(size*(1-density))];
  int j=0;
  for(int i=0;i<agents.length;++i){
    agents[i] = new Agent(0,0,0);
    agents[i].x = (i%(width/cellSize)) * cellSize;
    agents[i].y = (i/(width/cellSize)) * cellSize;
    if(i < countOneType){
      agents[i].type = 1;
    }
    else if(i>=countOneType && i < countOneType*2){
      agents[i].type = 2;
    }
    else{
      emptyAgents[j++] = agents[i];
    }
  }
}

void draw(){
  //println(frameRate);
  //background(0);
  for(int i=0;i<agents.length;++i){

      switch(agents[i].type){
        case 0:{
          fill(255);
            rect(agents[i].x,agents[i].y,cellSize,cellSize);
          break;
        }
        case 1:{
          fill(150,0,200);
            rect(agents[i].x,agents[i].y,cellSize,cellSize);
          break;
        }
        case 2:{
          fill(80,200,50);
            rect(agents[i].x,agents[i].y,cellSize,cellSize);
          break;
        }
      
    }
  }
  if(flag)
    for(int i=0;i<10;++i)
      agents[(int)random(0,agents.length)].swap(agents[(int)random(0,agents.length)]);
    
  if(keyPressed){
    switch(key){
      case 32:{
        flag = !flag;
        break;
      }
    }
  }
}
