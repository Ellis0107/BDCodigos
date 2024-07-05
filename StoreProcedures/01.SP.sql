use NORTHWND

--Declaracion y uso de variables en transact-sql

--Declaracion deuna variable
--A las variales siempre se les pone arroba
	declare @numeroCal int
	declare @calif decimal(10,2)

--Asignacion devariables 
	set @numeroCal = 10

	if @numeroCal <=0
	begin
		set @numeroCal = 1
	end 
	 
	 declare @i = 1
	 while (@i<=@numeroCal)
	 begin 
		set @calif = @calif+10
		set @i = @i+1
		@calif = @calif/@numeroCal
		print ('El resultado es: ' + '@calif')

	    


