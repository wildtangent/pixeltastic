# Pixeltastic

Exercise to create a STDIN-based "drawing" tool

**Requires Ruby 1.9.3**

### Just run 

```
ruby pixeltastic.rb
```

Commands:
```
I X Y       - Initialize a grid of size X,Y  
C           - Clear the grid  
L X Y C     - Colour a specific pixel X,Y, with the colour C  
V X Y1 Y2 C - Colour a vertical segment described by X, Y1..Y2 with the colour C
H X1 X2 Y C - Colour a horizontal segment described by X1..X2, Y with the colour C
F X Y C     - Fill a region defined as X,Y expanded to include adjacent pixels of the same colour with the colour C
S           - Show the contents of the grid
X           - Terminate the application
```

### Doing more

The example code will run some samples, then drop you at the command prompt. Enter combinations as above to draw stuff.

#### References:

* Code concept for flood fill [Wikipedia](http://en.wikipedia.org/wiki/Flood_fill)
* [Ruby example](http://www.ruby-forum.com/topic/184567#807275) 
* [Minesweeper](http://www.acsu.buffalo.edu/~johnnoon/programming/sweeper_2.pdf)
* [Ruby responding to command line](http://ubuntuforums.org/showthread.php?t=1403966)

#### Notes

Flood fill code might eventually stack overflow with a larger matrix.
http://cboard.cprogramming.com/brief-history-cprogramming-com/12855-floodfill-stack-overflow.html