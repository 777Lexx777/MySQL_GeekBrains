1
Executing:
ALTER TABLE `geodata`.`_cities` 
DROP COLUMN `region_cz`,
DROP COLUMN `area_cz`,
DROP COLUMN `title_cz`,
DROP COLUMN `region_lv`,
DROP COLUMN `area_lv`,
DROP COLUMN `title_lv`,
DROP COLUMN `region_lt`,
DROP COLUMN `area_lt`,
DROP COLUMN `title_lt`,
DROP COLUMN `region_ja`,
DROP COLUMN `area_ja`,
DROP COLUMN `title_ja`,
DROP COLUMN `region_pl`,
DROP COLUMN `area_pl`,
DROP COLUMN `title_pl`,
DROP COLUMN `region_it`,
DROP COLUMN `area_it`,
DROP COLUMN `title_it`,
DROP COLUMN `region_fr`,
DROP COLUMN `area_fr`,
DROP COLUMN `title_fr`,
DROP COLUMN `region_de`,
DROP COLUMN `area_de`,
DROP COLUMN `title_de`,
DROP COLUMN `region_pt`,
DROP COLUMN `area_pt`,
DROP COLUMN `title_pt`,
DROP COLUMN `region_es`,
DROP COLUMN `area_es`,
DROP COLUMN `title_es`,
DROP COLUMN `region_en`,
DROP COLUMN `area_en`,
DROP COLUMN `title_en`,
DROP COLUMN `region_be`,
DROP COLUMN `area_be`,
DROP COLUMN `title_be`,
DROP COLUMN `region_ua`,
DROP COLUMN `area_ua`,
DROP COLUMN `title_ua`,
CHANGE COLUMN `city_id` `id` INT NOT NULL ;
2 
SELECT * FROM  geodata._cities;
3
ALTER TABLE `geodata`.`_cities` 
  ADD CONSTRAINT `Foreign Key _countries_id`
  FOREIGN KEY (`country_id`) 
  REFERENCES `geodata`.`_countries` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
4
ALTER TABLE `geodata`.`_cities` (
ADD CONSTRAINT `Foreign Key _regions_id`
  FOREIGN KEY (`region_id `)
  REFERENCES `geodata`.`_regions` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
5
ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `city_id` `city_id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`city_id`);
ALTER TABLE `geodata`.`_cities` ALTER INDEX `Foreign Key _countries_id` INVISIBLE;
6
ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `city_id` `id` INT NOT NULL ,
CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL ;
