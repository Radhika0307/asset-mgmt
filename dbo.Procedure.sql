CREATE PROCEDURE [dbo].[SP_INSERT]
 @type CHAR(20),
 @dop dateTime,
 @invoice int,
 @count int
AS
BEGIN
DECLARE @a int=0
DECLARE @NEWID VARCHAR(5);
while(@a<@count)
set @a=@a+1
begin
INSERT INTO inventory VALUES (@NEWID,@type,@dop,@invoice)
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = UPPER(SUBSTRING(@type, 1, 1))
 SELECT @NEWID = (@PREFIX + replicate('0', 5 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)) FROM 
 (( SELECT CASE WHEN MAX(T.TID) IS null then 0 else MAX(T.TID) end as OID FROM (
   SELECT SUBSTRING(asset_id, 1, 1) as PRE_FIX,SUBSTRING(asset_id, 2, LEN(asset_id)) as TID FROM inventory)AS T WHERE T.PRE_FIX = @PREFIX ))AS N
  
INSERT INTO inventory VALUES (@NEWID,@type,@dop,@invoice,@count)
END
end
GO