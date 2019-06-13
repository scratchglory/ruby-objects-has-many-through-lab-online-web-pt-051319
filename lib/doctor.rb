=begin
  Doctor
  #name
    has a name
  #new
    initializes with a name and adds itself to an array of all doctors
  #new_appointment
    given a date and a patient, creates a new appointment (FAILED - 1)
  #appointments
    has many appointments (FAILED - 2)
  #patients
    has many patients, through appointments (FAILED - 3)
=end

class Doctor
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end
  
  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self}
  end
  
  def patients
    appointments.map {|appointment| appointment.patient}
  end
 
end

  