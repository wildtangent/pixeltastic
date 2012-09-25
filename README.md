Pixeltastic

Exercise to create a STDIN-based "drawing" tool

Just run ruby pixel.rb

Commands:

I X Y       - Initialize a grid of size X,Y

C           - Clear the grid

L X Y C     - Colour a specific pixel X,Y, with the colour C

V X Y1 Y2 C - Colour a vertical segment described by X, Y1..Y2 with the colour C

H X1 X2 Y C - Colour a horizontal segment described by X1..X2, Y with the colour C

F X Y C     - Fill a region defined as X,Y expanded to include adjacent pixels of the same colour with the colour C

S           - Show the contents of the grid

X           - Terminate the application