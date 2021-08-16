USE master ;  
GO  
CREATE DATABASE SimpleOrder  
ON   
( NAME = SimpleOrders_dat,  
    FILENAME = 'D:\Programowanie\Apps\SimpleOrder\saledat.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'D:\Programowanie\Apps\SimpleOrder\salelog.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB ) ;  
GO  