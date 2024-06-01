CREATE TABLE `Contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `insurance_contract_number` VARCHAR(255) DEFAULT NULL,
  `insurer` VARCHAR(255) DEFAULT NULL,
  `status` ENUM('prospect', 'signed_contract') DEFAULT 'prospect',
  `start_date_of_insurance_coverage` TIMESTAMP DEFAULT NULL,
  `end_date_of_insurance_coverage` TIMESTAMP DEFAULT NULL,
  `supervising_underwriter` INT DEFAULT NULL, 
  `supervising_UOPB_employee` INT DEFAULT NULL, 
  `policyholder` VARCHAR(255) DEFAULT NULL, 
  `covered_countries` JSON DEFAULT NULL,
  `covered_risks` ENUM('political', 'commercial', 'both') DEFAULT NULL,
  `insured_share_political` VARCHAR(255) DEFAULT NULL,
  `waiting_period_political` INT DEFAULT 0,
  `max_commercial_credit_period_political` INT DEFAULT 0,
  `insured_share_commercial` VARCHAR(255) DEFAULT NULL,
  `waiting_period_commercial` INT DEFAULT 0,
  `max_commercial_credit_period_commercial` INT DEFAULT 0,
  `client_name` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_supervising_underwriter FOREIGN KEY (`supervising_underwriter`) REFERENCES `user`(`id`), 
  CONSTRAINT FK_supervising_UOPB_employee FOREIGN KEY (`supervising_UOPB_employee`) REFERENCES `user`(`id`)
);


CREATE TABLE `Debtors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `addres` varchar(255) DEFAULT NULL,
  `information_provider_code` varchar(255) DEFAULT NULL,
  `company_registration_codes` varchar(255) DEFAULT NULL,
  `OKVED_code` varchar(255) DEFAULT NULL,
  `debtor_company_email` varchar(255) DEFAULT NULL,
  `company_status` TEXT DEFAULT NULL,
  `owner_information` TEXT DEFAULT NULL,
  `contact_person_details` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Request` (
    `id` int NOT NULL AUTO_INCREMENT,
    `insurance_contract_number` varchar(255) DEFAULT NULL,
    `debitors_country` varchar(255) DEFAULT NULL,
    `registration_code` varchar(255) DEFAULT NULL,
    `CL_amount` DECIMAL(10,2) DEFAULT 0.00,
    `CL_currency` varchar(255) DEFAULT NULL,
    `CL_terms_conditions` TEXT DEFAULT NULL,
    `adjustment_possibility` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `Debtors_Contract` (
  `debtor_id` int DEFAULT NULL,
  `contract_id` int DEFAULT NULL,
  CONSTRAINT FK_debtor_id FOREIGN KEY (`debtor_id`) REFERENCES `Debtors`(`id`), 
  CONSTRAINT FK_contract_id FOREIGN KEY (`contract_id`) REFERENCES `Contract`(`id`)
);



-- CREATE TABLE `Client` (
--     `id` int NOT NULL AUTO_INCREMENT,
--     `name` varchar(255) DEFAULT NULL,
--     `insurance_contract_id` varchar(255) DEFAULT NULL,
--     `number_of_current_limits` INT DEFAULT NULL,
--     -- `CL_number_under_consideration` INT DEFAULT NULL,
--     -- `total_active_exposure_sum` DECIMAL(20,2) DEFAULT 0.00,
--     `insurance_contract_periods` DATE DEFAULT NULL,
--     `supervising_underwriter_and_UOPB_employee` varchar(255) DEFAULT NULL,
--     `phone_number` varchar(255) DEFAULT NULL,

--     PRIMARY KEY (`id`),
--     CONSTRAINT FK_insurance_contract_id FOREIGN KEY (`insurance_contract_id`) REFERENCES `Contract`(`id`), 
-- )






