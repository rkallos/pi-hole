
-- instal with this command: sqlite3 /usr/local/bin/piholestats.db < /usr/local/bin/setupPiholeStats.sql
DROP TABLE IF EXISTS `pie_chart_stats`;
CREATE TABLE `pie_chart_stats` (
 -- table to store stats for pie (queries vs advertisers) chart
	`insert_date` TEXT NOT NULL, -- date when values were captured
	`query_cnt` INTEGER UNSIGNED NOT NULL, -- query count appearance
	`adver_cnt` INTEGER UNSIGNED NOT NULL, -- advertiser count appearance
	PRIMARY KEY (`insert_date`)
);
-- this row would be updated to store SUM values
-- needs to be added within a table creation
INSERT INTO `pie_chart_stats` VALUES (datetime(), 0, 0);

DROP TABLE IF EXISTS `top_chart_stats`;
CREATE TABLE `top_chart_stats` (
	`insert_date` TEXT NOT NULL, -- date when values were captured
	`adver_name` TEXT NOT NULL, -- advertiser domain name
	`cnt` INTEGER NOT NULL, -- advertiser count appearance
	PRIMARY KEY (`insert_date`, `adver_name`)
);

-- TODO: Create database indexes for faster querying

