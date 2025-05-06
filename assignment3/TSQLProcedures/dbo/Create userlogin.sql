USE [master];
CREATE LOGIN [asm3_admin] WITH PASSWORD = 'Asm3_p@ssw0rd';
ALTER SERVER ROLE sysadmin ADD MEMBER [asm3_admin];
GO