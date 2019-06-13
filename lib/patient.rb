=begin
  Patient
  #new
    initializes with a name (FAILED - 8)
  #new_appointment
    given a doctor and date, creates a new appointment belonging to that patient (FAILED - 9)
  .all
    knows about all patients (FAILED - 10)
  #appointments
    has many appointments (FAILED - 11)
  #doctors
    has many doctors through appointments (FAILED - 12)
=end

require 'pry'

class Patient
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor) #=> self == #<Patient:0x00000000024c3310 @name="Devin Townsend">
    # appointment = date, patient, doctor
    # binding.pry
  end
  
  def appointments
    Appointment.all.select {|appointment| appointment.patient == self}
  end
  
  def doctors 
    self.appointments.map {|appointment| appointment.doctor}
  end
end


