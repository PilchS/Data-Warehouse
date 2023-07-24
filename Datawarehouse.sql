\o task1.txt
CREATE TABLE customer (
    idcustomer varchar(10) NOT NULL,
    password varchar(10) NOT NULL,
    name varchar(40) NOT NULL,
    city varchar(40) NOT NULL,
    zip char(6) NOT NULL,
    address varchar(40) NOT NULL,
    email varchar(40),
    phone varchar(16) NOT NULL,
    fax varchar(16),
    nip char(13),
    regon char(9)
);

CREATE TABLE product (
    idproduct char(5) NOT NULL,
    name varchar(40) NOT NULL,
    description varchar(100),
    price numeric(7,2),
    min integer,
    available integer
);

CREATE TABLE addressee (
    idaddressee integer NOT NULL,
    name varchar(40) NOT NULL,
    city varchar(40) NOT NULL,
    zip char(6) NOT NULL,
    address varchar(60) NOT NULL
);

CREATE TABLE orders (
    idorder integer NOT NULL,
    idcustomer varchar(10) NOT NULL,
    idaddressee integer NOT NULL,
    idproduct char(5) NOT NULL,
    date date NOT NULL,
    price numeric(7,2),
    paid boolean,
    comments varchar(200)
);
\o


\o task2.txt
SELECT 
  count(id_customer) as "Orders", 
  date_trunc('month', date) as "Month", 
  sum(price) as "Total price", 
FROM
  olap.orders
WHERE
  date >='2016-01-01'
  and date <='2016-12-31'
GROUP BY
  date_trunc('month',date)
ORDER BY
  date_trunc('month',date);
\o