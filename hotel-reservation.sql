set echo on
spool 'c:\Users\jessi\Desktop\PROJECT3_jxt.txt'

-- Jessica Torres
-- PW: Prieta2006

DROP TABLE RESDETAIL_jxt;
DROP TABLE ROOM_jxt;
DROP TABLE ROOMTYPE_jxt;
DROP TABLE RESERVATION_jxt;
DROP TABLE RATETYPE_jxt;
DROP TABLE AGENT_jxt;
DROP TABLE AGENTTYPE_jxt;
DROP TABLE CUSTOMER_jxt;
DROP TABLE CUSTTYPE_jxt;

-- 1A.
CREATE TABLE CUSTTYPE_jxt (
CustType	VARCHAR(1)	NOT NULL,
CustTypeDesc	VARCHAR(10)	NOT NULL,
PRIMARY KEY(CustType)
) ;

CREATE TABLE CUSTOMER_jxt (
CustID		NUMBER(3)	NOT NULL,
CustFName	VARCHAR(15)	NOT NULL,
CustLName	VARCHAR(15)	NOT NULL,
CustPhone	CHAR(10),
CustType	VARCHAR(1)	NOT NULL,
LoyaltyID	NUMBER(3),
PRIMARY KEY(CustID),
FOREIGN KEY(CustType) REFERENCES CUSTTYPE_jxt(CustType)
) ;

CREATE TABLE AGENTTYPE_jxt (
AgentType	VARCHAR(2)	NOT NULL,
AgentTypeDesc	VARCHAR(10)	NOT NULL,
PRIMARY KEY(AgentType)
) ;

CREATE TABLE AGENT_jxt (
AgentID		NUMBER (2)	NOT NULL,
AgentFName	VARCHAR(15)	NOT NULL,
AgentLName	VARCHAR(15)	NOT NULL,
AgentType	VARCHAR(2)	NOT NULL,
PRIMARY KEY(AgentID),
FOREIGN KEY(AgentType) REFERENCES AGENTTYPE_jxt(AgentType)
) ;

CREATE TABLE RATETYPE_jxt (
RateType	VARCHAR(1),
RateTypeDesc	VARCHAR(10)	NOT NULL,
PRIMARY KEY(RateType)
) ;

CREATE TABLE RESERVATION_jxt (
ResID		NUMBER(4),
CheckInDate	DATE		NOT NULL,
CheckOutDate	DATE		NOT NULL,
CustID		NUMBER(3)	NOT NULL,
AgentID		NUMBER(2)	NOT NULL,
RateType	VARCHAR(1)	NOT NULL,
PRIMARY KEY(ResID),
FOREIGN KEY(RateType) REFERENCES RATETYPE_jxt(RateType),
FOREIGN KEY(AgentID) REFERENCES AGENT_jxt(AgentID),
FOREIGN KEY(CustID) REFERENCES CUSTOMER_jxt(CustID)
) ;

CREATE TABLE ROOMTYPE_jxt (
RoomType	VARCHAR(2)	NOT NULL,
RoomTypeDesc	VARCHAR(15)	NOT NULL,
PRIMARY KEY(RoomType)
) ;

CREATE TABLE ROOM_jxt (
RoomNum		NUMBER(3)	NOT NULL,
RoomType	VARCHAR(2)	NOT NULL,
PRIMARY KEY(RoomNum),
FOREIGN KEY(RoomType) REFERENCES ROOMTYPE_jxt(RoomType)
) ;

CREATE TABLE RESDETAIL_jxt (
ResID		NUMBER(4),
RoomNum		NUMBER(3)	NOT NULL,
RateAmt		NUMBER(3)	NOT NULL,
GuestCount	NUMBER(1),
PRIMARY KEY(ResID, RoomNum),
FOREIGN KEY(RoomNum) REFERENCES ROOM_jxt(RoomNum),
FOREIGN KEY(ResID) REFERENCES RESERVATION_jxt(ResID)
) ;

-- 2A.
INSERT INTO CUSTTYPE_jxt
VALUES('C', 'Corporate');
INSERT INTO CUSTTYPE_jxt
VALUES('I', 'Individual');

INSERT INTO CUSTOMER_jxt
VALUES (85, 'Wesley', 'Tanner', '8175551193', 'C', 323) ;
INSERT INTO CUSTOMER_jxt
VALUES (100, 'Breanna', 'Rhodes', '2145559191', 'I', 129) ;
INSERT INTO CUSTOMER_jxt (CustID, CustFName, CustLName, CustType)
VALUES (15, 'Jeff', 'Miner', 'I') ;
INSERT INTO CUSTOMER_jxt
VALUES (77, 'Kim', 'Jackson', '8175554911', 'C', 210) ;
INSERT INTO CUSTOMER_jxt
VALUES (119, 'Mary', 'Vaugn', '8175552334', 'I', 118) ;
INSERT INTO CUSTOMER_jxt
VALUES (97, 'Chris', 'Mancha', '4695553440', 'I', 153) ;
INSERT INTO CUSTOMER_jxt
VALUES (28, 'Renee', 'Walker', '2145559285', 'I', 135) ;
INSERT INTO CUSTOMER_jxt (CustID, CustFName, CustLName, CustType)
VALUES (23, 'Shelby', 'Day', 'I') ;

INSERT INTO AGENTTYPE_jxt
VALUES ('FD', 'Front Desk');
INSERT INTO AGENTTYPE_jxt
VALUES ('T', 'Telephone');
INSERT INTO AGENTTYPE_jxt
VALUES ('RC', 'Res Center');

INSERT INTO AGENT_jxt
VALUES (20, 'Megan', 'Smith', 'FD') ;
INSERT INTO AGENT_jxt
VALUES (5, 'Janice', 'May', 'T') ;
INSERT INTO AGENT_jxt
VALUES (14, 'John', 'King', 'RC') ;
INSERT INTO AGENT_jxt
VALUES (28, 'Ray', 'Schultz', 'T') ;

INSERT INTO RATETYPE_jxt
VALUES ('C', 'Corporate');
INSERT INTO RATETYPE_jxt
VALUES ('S', 'Standard');
INSERT INTO RATETYPE_jxt
VALUES ('W', 'Weekend');

INSERT INTO RESERVATION_jxt
VALUES (1001, TO_DATE('2019-09-05', 'YYYY-MM-DD'), TO_DATE('2019-09-07', 'YYYY-MM-DD'), 85, 20, 'C');
INSERT INTO RESERVATION_jxt
VALUES (1002, TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2019-09-10', 'YYYY-MM-DD'), 100, 5, 'S');
INSERT INTO RESERVATION_jxt
VALUES (1003, TO_DATE('2019-09-09', 'YYYY-MM-DD'), TO_DATE('2019-09-11', 'YYYY-MM-DD'), 15, 14, 'W');
INSERT INTO RESERVATION_jxt
VALUES (1004, TO_DATE('2019-09-29', 'YYYY-MM-DD'), TO_DATE('2019-10-10', 'YYYY-MM-DD'), 77, 28, 'C');
INSERT INTO RESERVATION_jxt
VALUES (1005, TO_DATE('2019-09-15', 'YYYY-MM-DD'), TO_DATE('2019-09-18', 'YYYY-MM-DD'), 119, 20, 'S');
INSERT INTO RESERVATION_jxt
VALUES (1006, TO_DATE('2019-09-24', 'YYYY-MM-DD'), TO_DATE('2019-09-26', 'YYYY-MM-DD'), 97, 14, 'W');
INSERT INTO RESERVATION_jxt
VALUES (1007, TO_DATE('2019-09-20', 'YYYY-MM-DD'), TO_DATE('2019-09-25', 'YYYY-MM-DD'), 100, 20, 'S');
INSERT INTO RESERVATION_jxt
VALUES (1008, TO_DATE('2019-10-21', 'YYYY-MM-DD'), TO_DATE('2019-10-03', 'YYYY-MM-DD'), 85, 5, 'W');
INSERT INTO RESERVATION_jxt
VALUES (1009, TO_DATE('2019-10-01', 'YYYY-MM-DD'), TO_DATE('2019-10-04', 'YYYY-MM-DD'), 28, 14, 'W');
INSERT INTO RESERVATION_jxt
VALUES (1010, TO_DATE('2019-10-01', 'YYYY-MM-DD'), TO_DATE('2019-10-09', 'YYYY-MM-DD'), 23, 28, 'W');

INSERT INTO ROOMTYPE_jxt
VALUES ('K', 'King Bed');
INSERT INTO ROOMTYPE_jxt
VALUES ('D', '2 Double Beds');
INSERT INTO ROOMTYPE_jxt
VALUES ('KS', 'King Suite');

INSERT INTO ROOM_jxt
VALUES (224, 'K');
INSERT INTO ROOM_jxt
VALUES (225, 'D');
INSERT INTO ROOM_jxt
VALUES (305, 'D');
INSERT INTO ROOM_jxt
VALUES (409, 'D');
INSERT INTO ROOM_jxt
VALUES (320, 'D');
INSERT INTO ROOM_jxt
VALUES (302, 'K');
INSERT INTO ROOM_jxt
VALUES (501, 'KS');
INSERT INTO ROOM_jxt
VALUES (502, 'KS');
INSERT INTO ROOM_jxt
VALUES (321, 'K');

INSERT INTO RESDETAIL_jxt
VALUES (1001, 224, 120, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1001, 225, 125, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1002, 305, 149, 4);
INSERT INTO RESDETAIL_jxt
VALUES (1003, 409, 99, 3);
INSERT INTO RESDETAIL_jxt
VALUES (1004, 320, 110, 4);
INSERT INTO RESDETAIL_jxt
VALUES (1005, 302, 139, 1);
INSERT INTO RESDETAIL_jxt
VALUES (1006, 501, 119, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1006, 502, 119, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1007, 302, 139, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1008, 320, 89, 3);
INSERT INTO RESDETAIL_jxt
VALUES (1008, 321, 99, 1);
INSERT INTO RESDETAIL_jxt
VALUES (1009, 502, 129, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1009, 409, 129, 2);
INSERT INTO RESDETAIL_jxt
VALUES (1010, 225, 109, 4);

COMMIT ; 

-- 
UPDATE CUSTOMER_jxt
   SET CustPhone = '2145551234'
 WHERE CustID = 85 ;

INSERT INTO CUSTOMER_jxt(CustID, CustFName, CustLName, CustType)
VALUES (120, 'Amanda', 'Green', 'C');

UPDATE RESERVATION_jxt
   SET CheckOutDate = TO_DATE('2018-02-08', 'YYYY-MM-DD')
 WHERE ResID = 1001;

INSERT INTO RESERVATION_jxt 
VALUES (1011, TO_DATE('2018-03-01', 'YYYY-MM-DD'), TO_DATE('2018-03-04', 'YYYY-MM-DD'), 120, 14, 'W');

UPDATE RESDETAIL_jxt
   SET RateAmt = 89
 WHERE ResID = 1003 ;

UPDATE RESERVATION_jxt
   SET RateType = 'C' 
 WHERE ResID = 1003 ; 

INSERT INTO RESDETAIL_jxt(ResID, RoomNum, RateAmt)
VALUES (1011, 224, 119);

INSERT INTO RESDETAIL_jxt(ResID, RoomNum, RateAmt)
VALUES (1011, 225, 129);

COMMIT ;

-- 1. *
UPDATE RESDETAIL_jxt
   SET RoomNum = 321
 WHERE ResID = 1010 ;

UPDATE RESERVATION_jxt
   SET RateType = 'C'
 WHERE ResID = 1010 ;

SELECT RoomNum, RateAmt
  FROM RESDETAIL_jxt
 WHERE ResID = 1011 ;

-- 2. *
UPDATE CUSTOMER_jxt
   SET CustType = 'I'
 WHERE CustID = 120 ;

UPDATE RESERVATION_jxt
   SET CheckInDate = TO_DATE('2019-10-08', 'YYYY-MM-DD'), CheckOutDate = TO_DATE('2019-10-11', 'YYYY-MM-DD')
 WHERE ResID = 1011 ;

-- 3. *
INSERT INTO ROOM_jxt
VALUES (301, 'D') ;

INSERT INTO ROOM_jxt
VALUES (303, 'D') ;

INSERT INTO ROOM_jxt
VALUES (304, 'KS') ;

-- 4. *
INSERT INTO RESDETAIL_jxt(ResID, RoomNum, RateAmt, GuestCount)
VALUES (1005, 303, 119, 2) ;

INSERT INTO RESDETAIL_jxt(ResID, RoomNum, RateAmt, GuestCount)
VALUES (1005, 304, 149, 2) ;

-- 5. *
INSERT INTO CUSTOMER_jxt(CustID, CustFName, CustLName, CustPhone, CustType)
VALUES ((SELECT MAX(CustID)+1 FROM CUSTOMER_jxt), 'Susan', 'White', '2145552020', 'C') ;

SET LIN[ESIZE] {1000 | n}
SET PAGESIZE 1000

COLUMN RateType FORMAT a8
COLUMN AgentType FORMAT a9
COLUMN CheckInDate FORMAT a11
COLUMN CheckOutDate FORMAT a12
COLUMN RoomType FORMAT a8

COMMIT ;

-- 6.
SELECT CustID, CustFName, CustLName
  FROM CUSTOMER_jxt
 WHERE CustPhone IS NULL ;

-- 7. *
SELECT AVG(RateAmt) AS "AvgRate" 
  FROM RESDETAIL_jxt ; 

-- 8. *
SELECT COUNT(DISTINCT RoomNum) AS "RoomResCount" 
  FROM RESDETAIL_jxt ;

-- 9. *
SELECT RT.RoomType AS "RoomType", COUNT(R.RoomNum) AS "RoomCount"
  FROM ROOM_jxt R
 INNER JOIN ROOMTYPE_jxt RT
    ON RT.RoomType = R.RoomType
 GROUP BY RT.RoomType ;

-- 10. *
SELECT R.ResID AS "ResNum", R.CheckInDate AS "CheckIn", R.CheckOutDate AS "CheckOut", COUNT(RD.RoomNum) AS "RoomCount"
  FROM RESERVATION_jxt R
 INNER JOIN RESDETAIL_jxt RD
    ON R.ResID = RD.ResID
 GROUP BY R.ResID, R.CheckInDate, R.CheckOutDate, RD.RoomNum ;

-- 11.A *
SELECT C.CustID AS "CustomerID", CustFName || ' ' || CustLName AS "CustomerName", COUNT(R.ResID) AS "ResCount"
  FROM CUSTOMER_jxt C
 INNER JOIN RESERVATION_jxt R
    ON C.CustID = R.CustID
 GROUP BY C.CustID, CustFName || ' ' || CustLName
 ORDER BY COUNT(R.ResID) DESC, C.CustID ASC ;
 
-- 11.B *
SELECT RD.RoomNum AS "RmNum", R.ResID AS "ResNum", RT.RateType AS "RateType", RD.RateAmt AS "RateAmt"
  FROM RESDETAIL_jxt RD
 INNER JOIN RESERVATION_jxt R
    ON RD.ResID = R.ResID
 INNER JOIN RATETYPE_jxt RT
    ON R.RateType = RT.RateType
 ORDER BY R.ResID ASC, RD.RoomNum ASC ;

-- 12. *
SELECT R.RateType AS "RateType", R.RateTypeDesc AS "Description", COUNT(ResID) AS "ResCount"
  FROM RATETYPE_jxt R
 INNER JOIN RESERVATION_jxt RD
    ON R.RateType = RD.RateType
 GROUP BY R.RateType
 ORDER BY ResID DESC ; 

-- 13. *
SELECT CustID AS "Customer_ID", CustFName AS "First_Name", CustLName AS "Last_Name", '('||SUBSTR(CustPhone,1,3)||')'||SUBSTR(CustPhone,4,3)||'-'||SUBSTR(CustPhone,7,4) AS "Phone"
 FROM CUSTOMER_jxt
ORDER BY CustID ;

-- 14. 
SELECT RD.ResID AS "ResNum", R.RoomNum AS "RmNum", RT.RoomType AS "RmType", RT.RoomTypeDesc AS "RmDesc, RAT.RateType AS "RateType", RAT.RateTypeDesc AS "RateDesc, MIN(RD.RateAmt) AS "RateAmt"
  FROM RESDETAIL_jxt RD 
 INNER JOIN ROOM_jxt R
    ON RD.RoomNum = R.RoomNum
 INNER JOIN RATETYPE_jxt RAT
    ON RD.RateType = RAT.RateType
 INNER JOIN ROOMTYPE_jxt RT
    ON R.RoomType = RT.RoomType
 GROUP BY RD.ResID
 ORDER BY RateAmt DESC ;

-- 15. *
SELECT RD.RoomNum, RM.RoomType, RoomTypeDesc, RateType, RD.RateAmt
  FROM ROOM_jxt RM, ROOMTYPE_jxt RT, RESDETAIL_jxt RD, RESERVATION_jxt R
 WHERE RD.ResID = R.ResID AND
       RD.RoomNum = RM.RoomNum AND
       RM.RoomType = RT.RoomType AND
       GuestCount >= 1
 ORDER BY RM.RoomNum, RD.RateAmt ; 

-- 16. 
SELECT CT.CustType AS "CustType", CT.CustTypeDesc AS "Description", COUNT(C.CustType) AS "Count"
  FROM CUSTTYPE_jxt CT
 INNER JOIN CUSTOMER_jxt C
    ON CT.CustType = C.CustType
 GROUP BY CT.CustType, CT.CustTypeDesc
 ORDER BY COUNT(C.CustType) DESC ;

-- 17. 
SELECT R.ResID, RD.RoomNum, ROOM.RoomType, RoomTypeDesc, TO_CHAR(RateAmt, '$9999.99')
  FROM RESERVATION_jxt R
 INNER JOIN RESDETAIL_jxt RD
    ON R.ResID = RD.ResID
 INNER JOIN ROOM_jxt ROOM
    ON RD.RoomNum = ROOM.RoomNum
 INNER JOIN ROOMTYPE_jxt RT
    ON ROOM.RoomType = RT.RoomType
 WHERE RD.RateAmt <= 119
 ORDER BY RD.RateAmt DESC, RD.RoomNum ASC ;

-- 18. 
SELECT R.ResID, TO_CHAR(CheckInDate, 'mm-dd-yyyy'), TO_CHAR(CheckOutDate, 'mm-dd-yyyy'), R.CustID, C.CustFName, C.CustLName, COUNT(RoomNum)
  FROM RESERVATION_jxt R
 INNER JOIN CUSTOMER_jxt C
    ON C.CustID = R.CustID
 INNER JOIN RESDETAIL_jxt RD
    ON RD.ResID = R.ResID
 GROUP BY R.CustID, R.ResID, CheckInDate, CheckOutDate, C.CustFName, C.CustLName, RoomNum
 ORDER BY R.ResID ;

-- 19. *
SELECT R.ResID, RD.RoomNum, RT.RoomTypeDesc, TO_CHAR(RD.RateAmt, '$9,999.99')
  FROM RESERVATION_jxt R
 INNER JOIN RESDETAIL_jxt RD
    ON R.ResID = RD.ResID 
 INNER JOIN ROOM_jxt ROOM
    ON RD.RoomNum = ROOM.RooNum 
 INNER JOIN RATETYPE_jxt RT
    ON R.RateType = RT.RateType 
 INNER JOIN ROOMTYPE_jxt ROT
    ON ROOM.RoomType = ROT.RoomType 
 WHERE ResID = 1005 AND (SELECT MAX(RateAmt) FROM RESDETAIL_jxt WHERE ResID = 1005) ;

-- 20.
SELECT AGT.AgentType AS "AgentType", AGT.AgentTypeDesc AS "Desc", COUNT(A.AgentType) AS "Count"
  FROM AGENTTYPE_jxt AGT
 INNER JOIN AGENT_jxt A
    ON A.AgentType = AGT.AgentType
 GROUP BY AGT.AgentType, AGT.AgentType, AGT.AgentTypeDesc
 ORDER BY COUNT(A.AgentType) ;

-- 21. 
SELECT R.ResID, RD.RoomNum, RT.RoomTypeDesc, RateTypeDesc, RD.RateAmt
  FROM RESERVATION_jxt R
 INNER JOIN RATETYPE_jxt RT
    ON RT.RateType = R.RateType
 INNER JOIN RESDETAIL_jxt RD
    ON R.ResID = RD.ResID
 INNER JOIN ROOM_jxt ROOM
    ON RD.RoomNum = ROOM.RoomNum
 INNER JOIN ROOMTYPE_jxt RT
    ON RT.RoomType = ROOM.RoomType
 WHERE RD.RateAmt > (SELECT AVG(RateAmt) FROM RESDETAIL_jxt)
 ORDER BY RD.RoomNum ;

-- 22. *
SELECT DISTINCT RD.RoomNum AS "RmNum", R.RoomType AS "RmType", RoomTypeDesc, RS.RateType AS "RateType", RateTypeDesc, RateAmt AS "RateAmt"
  FROM RESERVATION_jxt RS, RESDETAIL_jxt RD, ROOM_jxt R, ROOMTYPE_jxt RT, RATETYPE_jxt RY
 WHERE RD.RoomNum = R.RoomNum AND
       RS.ResID = RD.ResID AND
       RS.RateType = RY.RateType AND
       R.RoomType = RT.RoomType AND
       RateAmt > 115
 ORDER BY RateAmt DESC ;

-- 23. *
SELECT R.RoomNum, R.RoomType, COUNT(RD.ResID) 
  FROM ROOM_jxt R 
  LEFT JOIN RESDETAIL_jxt RD 
    ON R.RoomNum = RD.RoomNum
 GROUP BY R.RoomNum, R.RoomType
 ORDER BY COUNT(RD.ResID) ;

-- 24.
SELECT CustID, CustFName AS "FirstName", CustLName AS "LastName", '('||SUBSTR(CustPhone,1,3)||')'||SUBSTR(CustPhone,4,3)||'-'||SUBSTR(CustPhone,7,4) AS "Phone"
  FROM CUSTOMER_jxt
 WHERE LoyaltyID IS NOT NULL ;

-- 25. *
SELECT R.RoomNum, RT.RoomTypeDesc, RateTypeDesc, TO_CHAR(RD.RateAmt, '$9,999.99') 
  FROM RATETYPE_jxt, ROOM_jxt R
 INNER JOIN ROOMTYPE_jxt RT 
    ON R.RoomType = RT.RoomType
 INNER JOIN RESDETAIL_jxt RD 
    ON R.RoomNum = RD.RoomNum
 WHERE RD.ResID IN (SELECT ResID FROM RESERVATION_jxt) AND RD.ResID = 1005 ;

-- 26. *
SELECT R.ResID, R.CheckInDate, R.CheckOutDate, C.CustID, C.CustLName, R.AgentID, AgentFName 
  FROM RESERVATION_jxt R
 INNER JOIN CUSTOMER_jxt C 
    ON R.CustID = C.CustID
 INNER JOIN AGENT_jxt A
    ON R.AgentID = A.AgentID
 WHERE R.CheckInDate >= TO_DATE('2018-02-28', 'YYYY-MM-DD')
 ORDER BY R.CheckInDate, R.ResID ASC ;

-- 27. *
SELECT RD.RoomNum, RoomTypeDesc, RateTypeDesc, RD.RateAmt 
  FROM ROOM_jxt RM, RATETYPE_jxt RAT, ROOMTYPE_jxt RT, RESDETAIL_jxt RD, RESERVATION_jxt R
 WHERE RM.RoomType = RT.RoomType AND
       RM.RoomNum = RD.RoomNum AND
       R.RateType = RAT.RateType AND
       RateAmt > (SELECT AVG(RateAmt) FROM RESDETAIL_jxt)
 GROUP BY RD.RoomNum, RoomTypeDesc, RateTypeDesc, RD.RateAmt
 ORDER BY RD.RateAmt DESC ;

-- 28. *
SELECT COUNT(CustID) AS "LoyaltyCount"
  FROM CUSTOMER_jxt 
 WHERE LoyaltyID IS NOT NULL ;

-- 29.
SELECT A.AgentID AS "AgentID", AgentFName || ' ' || AgentLName AS "Agent", COUNT(R.ResID) AS "ResCount"
  FROM AGENT_jxt A
 INNER JOIN RESERVATION_jxt R
    ON A.AgentID = R.AgentID
 GROUP BY A.AgentID, AgentFName, AgentLName
 ORDER BY COUNT(R.ResID) DESC;

-- 30.
SELECT A.AgentID AS "AgentID", AgentFName AS "FirstName", AgentLName AS "LastName", COUNT(ResID) AS "ResCount"
  FROM AGENT_jxt A
 INNER JOIN RESERVATION_jxt R
    ON A.AgentID = R.AgentID
 GROUP BY AgentFName, AgentLName, A.AgentID HAVING COUNT(ResID) > 1 
 ORDER BY COUNT(ResID) DESC, A.AgentID ASC ;

-- 31.
SELECT CustID AS "Customer_ID", CustFName AS "First_Name", CustLName AS "Last_Name"
  FROM CUSTOMER_jxt
 WHERE CustFName LIKE '%W%' OR CustLName LIKE '%W%'
 ORDER BY CustLName ;

-- 32.
SELECT C.CustID AS "CustID", C.CustFName AS "FirstName", C.CustLName AS "LastName"
  FROM RESERVATION_jxt R
  LEFT JOIN CUSTOMER_jxt C
    ON C.CustID = R.CustID
 WHERE C.CustID NOT IN (SELECT NULL FROM RESERVATION_jxt R 
			WHERE C.CustID = R.CustID ) ;

-- 33.
SELECT RD.ResID AS "ResNum", RoomNum AS "RoomNum", SUM(RD.RateAmt) AS "TotalCharge"
  FROM RESERVATION_jxt R
 INNER JOIN RESDETAIL_jxt RD
    ON RD.ResID = R.ResID
 WHERE RD.ResID = 1005 
 GROUP BY RD.ResID, RoomNum, RD.RateAmt ;

set echo off
spool off
