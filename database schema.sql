Table patients {
  id integer [primary key]
  first_name varchar
  last_name varchar
  date_of_birth date
  phone_number varchar
  email varchar
}

Table doctors {
  id integer [primary key]
  first_name varchar
  last_name varchar
  specialization varchar
}

Table appointments {
  id integer [primary key]
  patient_id integer
  doctor_id integer
  appointment_date timestamp
  status varchar [note: 'Scheduled, Completed, Cancelled']
}

Table prescriptions {
  id integer [primary key]
  appointment_id integer
  medication_id integer
  dosage varchar
}

Table medications {
  id integer [primary key]
  name varchar
  stock_quantity integer
}

Table bills {
  id integer [primary key]
  patient_id integer
  amount decimal
  status varchar [note: 'Pending, Paid, Overdue']
}

Table payments {
  id integer [primary key]
  bill_id integer
  amount decimal
  payment_date timestamp
}

// Relationships
Ref: appointments.patient_id > patients.id // many-to-one
Ref: appointments.doctor_id > doctors.id // many-to-one
Ref: prescriptions.appointment_id > appointments.id // many-to-one
Ref: prescriptions.medication_id > medications.id // many-to-one
Ref: bills.patient_id > patients.id // many-to-one
Ref: payments.bill_id > bills.id // many-to-one
