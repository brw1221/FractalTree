private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
PImage photo;
public void setup() 
{   
	size(640,480);    
	noLoop(); 
	photo = loadImage("tree.png");
} 
public void draw() 
{   
	background(0);
	image(photo,0,0,640,480);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	line(160,480,160,380);
	line(480,480,480,380);
	drawBranches(320,380,100,3*Math.PI/2);
	drawBranches(160,380,100,3*Math.PI/2); 
	drawBranches(480,380,100,3*Math.PI/2); //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
	int endX1, endX2, endY1, endY2;
	angle1=angle+branchAngle;
	angle2=angle-branchAngle;
	branchLength=branchLength*fractionLength;
	endX1 = (int)(branchLength*Math.cos(angle1) + x);
	endY1 = (int)(branchLength*Math.sin(angle1) + y);
	endX2 = (int)(branchLength*Math.cos(angle2) + x);
	endY2 = (int)(branchLength*Math.sin(angle2) + y);
	stroke(0,255,0);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
	
} 
