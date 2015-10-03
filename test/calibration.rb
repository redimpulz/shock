# encoding: utf-8
require 'serialport'

# sp = SerialPort.new("/dev/tty.usbserial-141A",9600, 8, 1, SerialPort::NONE)

class SerialSend 

	def initialize()
		@lenDiv = 0.265625
		@stopCmd = [0x55]
		@power = 623
		@frac = 50
		@z = 150
		@baudRate = 38400
		@sp = SerialPort.new("/dev/tty.usbserial-00005014A", @baudRate, 8, 1, SerialPort::NONE)
	end

	def send(data)
		data.each{|d| @sp.putc d}
	end

	def encodePos(v)
		v = (v / @lenDiv).to_i
		h = ((v & 0xff00) >> 8)
		l = (v & 0xff)
		return {:h => h,:l => l}
	end

	def encode(v)
		h = ((v & 0xff00) >> 8)
		l = (v & 0xff)
		return {:h => h,:l => l}
	end

	def startOutput(x,y)
		send( [0xAA,
		 encodePos(x)[:h],
		 encodePos(x)[:l],
		 encodePos(y)[:h],
		 encodePos(y)[:l],
		 encodePos(@z)[:h],
		 encodePos(@z)[:l],
		 encode(@power)[:h],
		 encode(@power)[:l],
		 encode(@frac)[:h],
		 encode(@frac)[:l]] )
	end

	def stop()
		send(@stopCmd)
	end

	def tegaki(filename)
		filename.delete!("\n")
		file = "./usdev_chara/" + filename + ".log"
		puts file

		begin
			File.open(file) do |file|
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

					if ((preX - l[0].to_i).abs > 10) || ((preY - l[1].to_i).abs > 10) then
						stop()
						p 1
						sleep(0.5)
					else
						sleep(0.005)
					end

					# startOutput((l[0].to_i/5,l[1].to_i/5)
					startOutput((l[0].to_i - 100)/4,(l[1].to_i - 100)/4)

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
	end

	def calibration()
		file = "./usdev_chara/circle.log"
		puts file

		begin
			File.open(file) do |file|
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

					if ((preX - l[0].to_i).abs > 10) || ((preY - l[1].to_i).abs > 10) then
						stop()
						p 1
						sleep(0.5)
					else
						sleep(0.005)
					end

					# startOutput((l[0].to_i/5,l[1].to_i/5)
					startOutput((l[0].to_i - 100)/4,(l[1].to_i - 100)/4)

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
	end
end

# Serialport open
ss = SerialSend.new
ss.calibration()

