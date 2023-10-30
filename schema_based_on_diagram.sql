CREATE DATABASE clinic

CREATE TABLE patients (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    CONSTRAINT patients_pkey PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id int,
    status varchar,
    CONSTRAINT medical_histories_pkey PRIMARY KEY (id)
);

-- Creating a foreign key relationship between the "medical_histories" table and the "patients" table.
ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient_id
FOREIGN KEY (patient_id)
REFERENCES patients(id);

CREATE TABLE treatments (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type varchar,
    name varchar,
    CONSTRAINT treatments_pkey PRIMARY KEY (id)
);

-- Create a new table which connects the "medical_histories" table and the "treatments" table.
CREATE TABLE medical_history_treatments (
    medical_history_id int,
    treatment_id int,
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id)
    REFERENCES treatment(id)
);

CREATE TABLE invoices (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    CONSTRAINT invoices_pkey PRIMARY KEY (id)
);

-- Create a foreign key for invoices.
ALTER TABLE invoices
ADD CONSTRAINT fk_invoice_id
FOREIGN KEY (medical_history_id)
REFERENCES medical_histories (id);

CREATE TABLE invoice_items (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatement_id int,
    CONSTRAINT invoice_items_pkey PRIMARY KEY (id)
);

--Create foreign keys for invoice_items.
ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice_items_invoice_id
FOREIGN KEY (invoice_id)
REFERENCES invoices (id),
ADD CONSTRAINT fk_invoice_items_treatment_id
FOREIGN KEY (treatment_id)
REFERENCES treatments (id);
