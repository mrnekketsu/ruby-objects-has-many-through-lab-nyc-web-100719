class Patient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        appointment = Appointment.new(date,self, doctor)
    end

    def appointments
        all_appointments = Appointment.all
        all_appointments.select do |appointment|
            appointment.patient == self
        end
    end

    def doctors 
        appointments.collect do |appointment|
            appointment.doctor
        end
    end
end