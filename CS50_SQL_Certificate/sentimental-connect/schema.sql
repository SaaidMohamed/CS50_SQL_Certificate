CREATE TABLE `users` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(50),
    `username` VARCHAR(30),
    `password` VARCHAR(50),
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools_universities`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50),
    `type` ENUM('Primary','Secondary','Higher Education') NOT NULL,
    `location` VARCHAR(30),
    `year_founded` YEAR,
    PRIMARY KEY (`id`)

);

CREATE TABLE `companies` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `industry` ENUM('Technology','Education','Business') NOT NULL,
    `location` VARCHAR(50),
    PRIMARY KEY (`id`)
);

CREATE TABLE  `users_connections`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_A_id` INT UNSIGNED NOT NULL,
    `user_B_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_A_id`) REFERENCES `users` (`id`),
    FOREIGN KEY ("user_B_id") REFERENCES `users` (`id`)
);

CREATE TABLE `users_schools`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_university_id`INT UNSIGNED NOT NULL,
    `affiliation_start_date` DATE,
    `affiliation_end_date` DATE,
    `degree` VARCHAR(20),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY(`school_university_id`) REFERENCES `schools_universities`(`id`)
);


CREATE TABLE IF NOT EXISTS `users_companies`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `work_start_date` DATE,
    `work_end_date` DATE,
    `job_title` VARCHAR(20),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
