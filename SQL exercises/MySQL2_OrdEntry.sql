/* MySQL2_OrdEntry */

CREATE TABLE Customer
(
  CustNo CHAR(8),
  CustFirstName VARCHAR (50) NOT NULL,
  CustLastName VARCHAR (50) NOT NULL,
  CustStreet VARCHAR (50),
  CUstCity VARCHAR (50),
  CustState CHAR (2),
  CustZip CHAR (10),
  CustBal INTEGER,

  CONSTRAINT PKCustomer PRIMARY KEY (CustNo)
)

create table Employee
  (
    EmpNo char(8),
    EmpFirstName VARCHAR (50) NOT NULL,
    EmpLastName VARCHAR (50) NOT NULL,
    EmpPhone CHAR (14),
    SupEmpNo CHAR (8),
    EmpCommRate	DECIMAL(3,2),
    EmpEmail VARCHAR (50),

    CONSTRAINT PKEmployee PRIMARY KEY(EmpNo),

    CONSTRAINT UniqueEmployee UNIQUE key (EmpEmail)

  )

create table OrderTbl
(
  OrdNo char (8),
  OrdDate char (10) not null,
  CustNo char(8),
  EmpNo char(8),
  OrdName Varchar (50),
  OrdStreet varchar (50),
  OrdCity varchar (50),
  OrdState char(2),
  OrdZip char(10),

  CONSTRAINT PKOrderTbl primary key (OrdNo),

  Constraint FKCustomer foreign key (CustNo)
    REFERENCES Customer(CustNo),
  CONSTRAINT FKEmployee foreign key (EmpNo)
    REFERENCES Employee(EmpNo)
)

Create table Product
(
  ProdNo char(8),
  ProdName varchar(50),
  ProdMfg varchar(50),
  ProdQOH char(3),
  ProdPrice Decimal (6,2),
  ProdNextShipDate char(10),

  CONSTRAINT PKProduct primary key(ProdNo)
)

Create table OrderLine
(
  OrdNo char(8),
  ProdNo char(8),
  Qty varchar(50),

  CONSTRAINT PKOrderLine primary key(OrdNo,ProdNo),

  Constraint FKOrderTbl foreign key(OrdNo)
    REFERENCES OrderTbl(Ordno)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  Constraint FKProduct foreign key(ProdNo)
    REFERENCES Product(ProdNo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
