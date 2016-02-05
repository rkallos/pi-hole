-- Use a write-ahead log instead of a rollback-journal.
-- This is (one of) the way(s) to avoid SQLite needing write permissions to a DB's directory
-- Using a WAL is only possible in versions of SQLite>=3.7.0, but it's supposedly faster.
PRAGMA journal_mode = WAL;

-- install with this command: sqlite3 /var/lib/pihole/piholestats.db < /usr/local/bin/setupPiholeStats.sql
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
INSERT INTO `pie_chart_stats` VALUES ('0000-00-00 00:00:00', 0, 0);

DROP TABLE IF EXISTS `top_chart_stats`;
CREATE TABLE `top_chart_stats` (
	`insert_date` TEXT NOT NULL, -- date when values were captured
	`adver_name` TEXT NOT NULL, -- advertiser domain name
	`cnt` INTEGER NOT NULL, -- advertiser count appearance
	PRIMARY KEY (`insert_date`, `adver_name`)
);

-- TODO: Create database indexes for faster querying

