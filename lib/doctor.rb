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
require 'pry'

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
  
  def new_appointment(date, patient)  
    # date == #<Patient:0x000000000176e430 @name="Devin Townsend">
    # patient == "Friday, January 32nd"
    # self == #<Doctor:0x000000000176e4a8 @name="The Doctor">
    # binding.pry
    Appointment.new(patient, date, self)
  end
  
  def appointments
    # binding.pry
    Appointment.all {|appointment| appointment.doctor == self}
  end
  
  def patients
    appointments.map {|appointment| appointment.patient}
  end
 
end

  