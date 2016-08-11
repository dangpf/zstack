CREATE TABLE  `zstack`.`AlarmVO` (
    `uuid` varchar(32) NOT NULL UNIQUE,
    `name` varchar(255) NOT NULL,
    `description` varchar(2048) DEFAULT NULL,
    `conditionName` varchar(1024) NOT NULL,
    `conditionOperator` varchar(128) NOT NULL,
    `conditionValue` varchar(255) NOT NULL,
    `conditionDuration` int unsigned NOT NULL,
    `lastOpDate` timestamp ON UPDATE CURRENT_TIMESTAMP,
    `createDate` timestamp,
    PRIMARY KEY  (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  `zstack`.`AlarmLabelVO` (
    `id` bigint unsigned NOT NULL UNIQUE AUTO_INCREMENT,
    `alarmUuid` varchar(32) NOT NULL,
    `key` text NOT NULL,
    `value` text DEFAULT NULL,
    `lastOpDate` timestamp ON UPDATE CURRENT_TIMESTAMP,
    `createDate` timestamp,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  `zstack`.`AlertVO` (
    `uuid` varchar(32) NOT NULL UNIQUE,
    `name` text DEFAULT NULL,
    `description` text DEFAULT NULL,
    `status` varchar(128) NOT NULL,
    `count` int unsigned NOT NULL,
    `opaque` text DEFAULT NULL,
    `lastOpDate` timestamp ON UPDATE CURRENT_TIMESTAMP,
    `createDate` timestamp,
    PRIMARY KEY  (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  `zstack`.`AlertLabelVO` (
    `id` bigint unsigned NOT NULL UNIQUE AUTO_INCREMENT,
    `alertUuid` varchar(32) NOT NULL,
    `key` text NOT NULL,
    `value` text DEFAULT NULL,
    `lastOpDate` timestamp ON UPDATE CURRENT_TIMESTAMP,
    `createDate` timestamp,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  `zstack`.`AlertTimestampVO` (
    `id` bigint unsigned NOT NULL UNIQUE AUTO_INCREMENT,
    `alertUuid` varchar(32) NOT NULL,
    `time` timestamp,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Foreign keys for table AlarmLabelVO

ALTER TABLE AlarmLabelVO ADD CONSTRAINT fkAlarmLabelVOAlertVO FOREIGN KEY (alarmUuid) REFERENCES AlertVO (uuid) ON DELETE CASCADE;

# Foreign keys for table AlertLabelVO

ALTER TABLE AlertLabelVO ADD CONSTRAINT fkAlertLabelVOAlertVO FOREIGN KEY (alertUuid) REFERENCES AlertVO (uuid) ON DELETE CASCADE;

# Foreign keys for table AlertTimestampVO

ALTER TABLE AlertTimestampVO ADD CONSTRAINT fkAlertTimestampVOAlertVO FOREIGN KEY (alertUuid) REFERENCES AlertVO (uuid) ON DELETE CASCADE;
