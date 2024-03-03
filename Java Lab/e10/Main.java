class Shape {
    private float x; 
    private float y;

    public Shape(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void findDistance(Shape other) {
        System.out.println(Math.sqrt(Math.pow(other.x - this.x, 2) + Math.pow(other.y - this.y, 2)));
    }
}

class Rectangle extends Shape {
    private float length;
    private float breadth;

    Rectangle(float length, float breadth, float x, float y) {
        super(x, y);
        this.length = length;
        this.breadth = breadth; 
    }

    public void calcArea() {
        System.out.println("Area: " + length * breadth);
    }

    public void calcPerimeter() {
        System.out.println("Perimeter: " + 2 * (length + breadth));
    }
} 

class Square extends Rectangle {
    public Square(float side, float x, float y){
        super(side, side, x, y);
    }
}

class Circle extends Shape {
    private float radius;

    public Circle(float radius, float x, float y) {
        super(x, y);
        this.radius = radius;
    }

    public void calcCircumference() {
        System.out.println("Cricumference: " + 2 * Math.PI * this.radius);
    }

    public void calcArea() {
        System.out.println("Area: " + (Math.PI * Math.pow(this.radius, 2)));
    }

    public void calcDiameter() {
        System.out.println("Diameter: " + 2 * this.radius);
    } 
}

class Triangle extends Shape {
    private float side_1, side_2, side_3;

    public Triangle(float side_a, float side_b, float side_c, float x, float y) {
        super(x, y);
        this.side_1 = side_a;
        this.side_2 = side_b;
        this.side_3 = side_c;
    }

    public void calcArea() {
        float s = (side_1 + side_2 + side_3) / 2;
        System.out.println(Math.sqrt(s*(s-side_1)*(s-side_2)*(s-side_3)));
    } 

    public void calcPerimeter() {
        System.out.println("Perimemter: " + side_1 + side_2 + side_3);
    }
}

public class Main {
    public static void main(String[] args) {
        /*Rectangle rect_A = new Rectangle(4, 5, 1, 9);
        Rectangle rect_B = new Rectangle(3, 1, 2, 4);

        rect_A.calcPerimeter();

        Square square_A = new Square(4, 3, 9.8f);
        square_A.calcPerimeter();
        square_A.calcArea();

        Circle circle_A = new Circle(4, 0, 0);
        circle_A.calcCircumference();
        circle_A.calcArea();
        circle_A.calcDiameter();*/
    } 
}
