//making and array from the data
JSONArray mlbData;
PApplet p;
//declaring an array of the Team class
Team[] mlb;
Banner b;
StringDict TmColors;
String TmCol[][];
   

void setup(){
 size(1500,900,P3D);
 ortho();
 //load json data
 mlbData =loadJSONArray("MLBbat.json");
 //finding how many rows are in the file
 int dataSize = mlbData.size();
 
 //initialize and instantiate the array of teams from JSON data
 
 //giving my array with the same number of rows in the file
 mlb = new Team[dataSize];
 b = new Banner(this,width*.1,height*.95);
 
  // these hex stings may or may not work.  fill(hex) hasn't worked for me
 TmColors = new StringDict();
   TmColors.set("ARI","#A71930");
   TmColors.set("ATL","#002855");
   TmColors.set("BAL","#FC4C00");
   TmColors.set("BOS","#C60C30");
   TmColors.set("CHC","#002F6C");
   TmColors.set("CHW","#DCDDDF");
   TmColors.set("CIN","#BA0C2F");
   TmColors.set("CLE","#24135E");
   TmColors.set("COL","#24135E");
   TmColors.set("DET","#0C2340");
   TmColors.set("MIA","#F9423B");
   TmColors.set("HOU","#FF7F00");
   TmColors.set("KCR","#74B4FA");
   TmColors.set("LAA","#BA032E");
   TmColors.set("LAD","#002F60");
   TmColors.set("MIL","#C4953B");
   TmColors.set("MIN","#0C2341");
   TmColors.set("NYM","#FC4C00");
   TmColors.set("NYY","#FFFFFF");
   TmColors.set("OAK","#00483A");
   TmColors.set("PHI","#BA0C2E");
   TmColors.set("PIT","#FFC72B");
   TmColors.set("STL","#C41E3A");
   TmColors.set("SDP","#483727");
   TmColors.set("SFG","#FB5B1F");
   TmColors.set("SEA","#1C8B85");
   TmColors.set("TBR","#79BDEE");
   TmColors.set("TEX","#BD1021");
   TmColors.set("TOR","#003DA5");
   TmColors.set("WSN","#BA122B");
 
 //calling a Team object for every row using a temporary object "tm" to get the JSON data
 for(int i=0;i<dataSize;i++){
   JSONObject tm = mlbData.getJSONObject(i);
   float x = map(i,0,mlbData.size(),width*.05,width);
   float y = map(float(tm.getString("OPS")),.65,.85,0,height);
   float rad = map(float(tm.getString("R")),600,900,15,50);
   String s = tm.getString("Tm");
   String runs = tm.getString("R");
   String hr = tm.getString("HR");
   String rbi = tm.getString("RBI");
   String tmcolor = TmColors.get(tm.getString("Tm"));
   //creating each object in the array
   mlb[i] = new Team(this,int(random(255)),int(random(255)),int(random(255)),x,y,rad,s,runs,hr,rbi,tmcolor);
 }
 
 
}
void draw(){
  //setting the lighting
  background(25);
  ambientLight(85, 85, 85);
  emissive(30, 0, 0);
  lightSpecular(255, 255, 255);
  pointLight(255, 255, 255, -100, -100, 800);
  pointLight(150, 150, 150, -100, 100, 800);
  specular(255, 255, 255);
  shininess(95);
  b.display();
  //drawing all the objects in the array
  for(int i=0;i<mlbData.size();i++){
    mlb[i].display();
    if(mlb[i].isHit()){
     println("hit"+i);
     println("in if loop");
     b.setBanner("TEAM    "+mlb[i].team+"    RUNS   "+mlb[i].runs+"    HOME RUNS    "+mlb[i].hr+"    RBI    "+mlb[i].rbi+"    COLOR    "+mlb[i].tmcolor);
     b.showBanner();
    } else if(mlb[i].isHit()) {
      b.hideBanner();
    }
  }
  
}