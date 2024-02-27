/* [Dimensions:] */

// Length of the compartment in mm
length = 44;

// Width of the compartment in mm
width = 66;

// Height of the compartment in mm
height = 3;

module spacer()
{
	cube([ length, width, height ]);
}

// Call the module to render the compartment with dividers
spacer();
