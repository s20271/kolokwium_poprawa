-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-28 07:03:10.369

-- tables
-- Table: File
CREATE TABLE "File" (
    FileID int  NOT NULL,
    TeamID int  NOT NULL,
    FileName varchar(100)  NOT NULL,
    FileExtension varchar(4)  NOT NULL,
    FileSize int  NOT NULL,
    CONSTRAINT File_pk PRIMARY KEY  (FileID,TeamID)
);

-- Table: Member
CREATE TABLE Member (
    MemberID int  NOT NULL,
    OrganizationID int  NOT NULL,
    MemberName varchar(20)  NOT NULL,
    MemberSurname varchar(50)  NOT NULL,
    MemberNickName varchar(20)  NULL,
    CONSTRAINT Member_pk PRIMARY KEY  (MemberID)
);

-- Table: Membership
CREATE TABLE Membership (
    MemberId int  NOT NULL,
    TeamID int  NOT NULL,
    MembershipDate datetime  NOT NULL,
    CONSTRAINT Membership_pk PRIMARY KEY  (TeamID,MemberId)
);

-- Table: Organization
CREATE TABLE Organization (
    OrganizationID int  NOT NULL,
    OrganizationName varchar(100)  NOT NULL,
    OrganizationDomain varchar(50)  NOT NULL,
    CONSTRAINT Organization_pk PRIMARY KEY  (OrganizationID)
);

-- Table: Team
CREATE TABLE Team (
    TeamID int  NOT NULL,
    OrganizationID int  NOT NULL,
    TeamName varchar(50)  NOT NULL,
    TeamDescription varchar(500)  NULL,
    CONSTRAINT Team_pk PRIMARY KEY  (TeamID)
);

-- foreign keys
-- Reference: File_Team (table: File)
ALTER TABLE "File" ADD CONSTRAINT File_Team
    FOREIGN KEY (TeamID)
    REFERENCES Team (TeamID);

-- Reference: Member_Organization (table: Member)
ALTER TABLE Member ADD CONSTRAINT Member_Organization
    FOREIGN KEY (OrganizationID)
    REFERENCES Organization (OrganizationID);

-- Reference: Membership_Member (table: Membership)
ALTER TABLE Membership ADD CONSTRAINT Membership_Member
    FOREIGN KEY (MemberId)
    REFERENCES Member (MemberID);

-- Reference: Membership_Team (table: Membership)
ALTER TABLE Membership ADD CONSTRAINT Membership_Team
    FOREIGN KEY (TeamID)
    REFERENCES Team (TeamID);

-- Reference: Team_Organization (table: Team)
ALTER TABLE Team ADD CONSTRAINT Team_Organization
    FOREIGN KEY (OrganizationID)
    REFERENCES Organization (OrganizationID);

-- End of file.

