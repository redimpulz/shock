for deg in 0...359 do
	rad = deg / 180.0 * Math::PI
	x = Math::sin(rad) * 100 + 100
	y = Math::cos(rad) * 100 + 100
	puts (x.to_i.to_s + "," + y.to_i.to_s)
end