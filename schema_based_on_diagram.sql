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
CREATE TABLE treatments (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type varchar,
    name varchar,
    CONSTRAINT treatments_pkey PRIMARY KEY (id)
);
CREATE TABLE invoices (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    CONSTRAINT invoices_pkey PRIMARY KEY (id)
);
CREATE TABLE invoice_items (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatement_id int,
    CONSTRAINT invoice_items_pkey PRIMARY KEY (id)
);
