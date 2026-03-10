/*
===========================================
POWER QUERY TRANSFORMATIONS (M CODE)
Author: Jaime Echegaray
Purpose: Shape and clean hotel bookings data
===========================================
*/

let
    Source = Sql.Database("JAIME", "Hospitality_Analytics"),
    dbo_Fact_Bookings = Source{[Schema="dbo",Item="Fact_Bookings"]}[Data]
in
    dbo_Fact_Bookings
