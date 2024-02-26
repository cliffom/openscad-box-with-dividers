/* [Dimensions:] */

// Length of the compartment in mm
length = 100;

// Width of the compartment in mm
width = 50;

// Height of the compartment in mm
height = 30;

// Thickness of the walls in mm
wall_thickness = 2;

/* [Compartments:] */

// Vertical dividers (columns)
columns = 2; // [0:10]

// Horizontal dividers (rows)
rows = 2; // [0:10]

module compartment()
{
	// Create the outer shell of the box
	difference()
	{
		// Outer box
		cube([ length, width, height ]);

		// Create the inner void
		translate([ wall_thickness, wall_thickness, wall_thickness ])
		cube(
		    [ length - 2 * wall_thickness, width - 2 * wall_thickness, height - wall_thickness ]); // Subtract inner box
	}

	// Add column dividers if columns > 0
	if (columns > 0)
	{
		for (i = [1:columns])
		{
			translate([ (length / (columns + 1)) * i - (wall_thickness / 2), wall_thickness, wall_thickness ])
			cube([ wall_thickness, width - 2 * wall_thickness, height - wall_thickness ]);
		}
	}

	// Add row dividers if rows > 0
	if (rows > 0)
	{
		for (j = [1:rows])
		{
			translate([ wall_thickness, (width / (rows + 1)) * j - (wall_thickness / 2), wall_thickness ])
			cube([ length - 2 * wall_thickness, wall_thickness, height - wall_thickness ]);
		}
	}
}

// Call the module to render the compartment with dividers
compartment();
