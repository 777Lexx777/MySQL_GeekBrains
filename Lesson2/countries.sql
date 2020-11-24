1.
ALTER TABLE `geodata`.`_countries` 
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_en`,
DROP COLUMN `title_be`;
2
ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `country_id` `country_id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`country_id`);
3
ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL ;
4
ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL ,
ADD INDEX `Index` (`title` ASC) INVISIBLE;
5
CHANGE COLUMN `country_id` `id` INT NOT NULL AUTO_INCREMENT;
