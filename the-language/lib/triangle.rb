# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	side_count_map = { 3 => :equilateral, 2 => :isosceles, 1 => :scalene }
	total_sides_equal = equal_side_count(a, b, c)
	side_count_map[total_sides_equal]
end

def equal_side_count(a, b, c)
	sides = [a,b,c]
	sides.size + 1 - sides.uniq.size
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

