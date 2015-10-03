string = ARGV[0].split("")

string.each{|c|
	filename = "./usdev_chara/" + c + ".log"

	begin
		File.open(filename) do |file|
			preX = 0
			preY = 0
			file.each_line do |l|
				l.delete!("{")
				l.delete!("}")
				l.delete!("[")
				l.delete!("]")
				l.delete!("\n")
				l = l.split(",")
				l.delete("")
				p l
				if ((preX - l[0].to_i).abs > 10) || ((preY - l[1].to_i).abs >10) then
					stop()
					p 1
					sleep(0.5)
				else
					sleep(0.005)
				end

				startOutput(l[0].to_i/5,l[1].to_i/5)
				preX = l[0].to_i
				preY = l[1].to_i


			end
			stop()
		end
	rescue SystemCallError => e
		puts %Q(class=[#{e.class}] message=[#{e.message}])
	rescue IOError => e
		puts %Q(class=[#{e.class}] message=[#{e.message}])
	end
}

