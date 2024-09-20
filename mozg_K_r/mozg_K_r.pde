int nc = 4000; // number of circles
float[] cx = new float [nc]; //int egész számokat tartalmaz, kör mérete
                        // int[] = array - tömb, amibe akárhány darab változót tárolhatunk
                        //float cx = 0; tört számok
float[] vx = new float [nc];             // vx = velocity / sebesség
float[] cy = new float [nc];
float[] vy = new float [nc];

void setup() {
    size(800, 600); // P3D könnyebben kezeli a grafikus dolgokat
    surface.setResizable(true);
    for (int i = 0; i < nc; i = i + 1 )
    {
    cx[i] = width/2;
    cy[i] = height / 2;
    vx[i] = random(1,3.5);//round (random (15)); // a random tört számot ad, amit az int nem tud tárolni, ezért a round függvény kerekíti
    vy[i] = random (1,3);
    }  
}

void draw() {
    background(color(0,0,0));
    for (int i = 0; i < nc; i = i + 1 )
    {
      //println(cy[i]); // kiírja az adott változó értékeit
    circle(cx[i], cy[i], 10);
    cx[i] = cx[i] + vx[i];
    cy[i] = cy[i] + vy[i];
    if(cx[i] > width || cx[i] < 0 ) vx[i] = vx[i] * -1; // operátor || = or 
    if(cy[i] > height || cy[i] < 0 ) vy[i] = vy[i] * -1;
    }
}
