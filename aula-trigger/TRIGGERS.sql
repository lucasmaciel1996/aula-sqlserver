CREATE TRIGGER Exemplo ON ExmploTriggers 
 FOR INSERT, UPDATE, DELETE
AS
 BEGIN
  If Exits(Select Id From Deleted)
  BEGIN
    IF Exits (Select Id From Inserted)
        BEGIN
          Print 'Foi Feito um Update'
        END
    ELSE
       BEGIN
        Print 'Foi feito um delete'
       END
    ELSE
      BEGIN
      Print 'FOi feito um Insert'
      END
END

-- 1 Create a triggers where very all change value capture info 