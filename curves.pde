// made by eight eyes creations - sean@8isc.com

int count = 50;
int curveCount = 4;
int width = 800;
int height = 600;
int mv = 3;

//color[] colors = {#f0f0f1,#c7d0c6,#008dcf,#f47721};
color[] colors = {#f0f0f1,#aaaaaa,#cccccc,#ce3d30};


PVector start = new PVector(-200, 100);
PVector end = new PVector(1000, 50);
PVector c1 = new PVector(300, 100);
PVector c2 = new PVector(500, 100);

Curve[] curves = new Curve[count];

void setup() {
	size(width, height);
	frameRate(15);
//	println("init");
	noFill();
	for (int j = 0; j<count;j++) {
		curves[j] = new Curve();
	}
}

void draw() {
	fill(255,10);
	rect(0,0,width,height);
	noFill();
	for (int j = 0; j<count; j++) {
		curves[j].changeB();    
		curves[j].makeB();
	}

	smooth();
}

class Curve {
	float cx1, cx2, cy1, cy2;
	float x1, x2, y1, y2;

	float width;

	color c;
	int o;

	PVector[] vertii;
	PVector change, change2;

	int changeConstant = 1;

	Curve() {
		x1 = start.x + random(-10,10);
		x2 = end.x + random(-10,10);
		y1 = start.y + random(-10,10);
		y2 = end.y + random(-10,10);

		cx1 = c1.x + random(-10,10);
		cx2 = c2.x + random(-10,10);
		cy1 = c1.y + random(-10,10);
		cy2 = c2.y + random(-10,10);

		o = 50;
		c = color(colors[0]);
		initChange();
		width = random(0.1, 4);
		if (width > 3.8){
			c = color(colors[3]);
			o = 90; 
			width *= 3;
		} 
		else if (width > 3.5){
			c = color(colors[2]);
			o = 25;
		}
		else if (width > 2){
			c = color(colors[1]);
			o = 75;
			} else if (width < 1){
				c = color(0);
				o = 25;
			}
		}

		void makeB() {
			strokeWeight(width);
			stroke(c,o);
			bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
		}

		void changeB(){
			cx1 += changeConstant * change.x * random(0,1);
			cx2 += changeConstant * change2.x * random(0,1);
			cy1 += changeConstant * change.y * random(0,1);
			cy2 += changeConstant * change2.y * random(0,1);

			if ((cy1 < 50) || (cy2 < 50) || (cx1 < 50) || (cx2 < 50))
			{ //changeConstant *= -1;
				initChange(); }
				if ((cy1 > 200) || (cy2 > 200) || (cx1 > 500) || (cx2 > 500))
				{ changeConstant *= -1;
					initChange(); }
				}
				void initChange(){

					change = new PVector(random(-mv,mv), random(-mv,mv));
					change2 = new PVector(random(-mv,mv), random(-mv,mv));
				}

			}

