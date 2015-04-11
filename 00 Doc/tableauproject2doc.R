# Crosstab 1

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select * from (SELECT year, states, cigarette_tax_dollar_per_pack, (rank() 
OVER (PARTITION BY year order by cigarette_tax_dollar_per_pack desc)) as tax_rank 
FROM cig_tax where (year in (1995, 2000, 2010, 2013)) order by 1, 2) where tax_rank < 11"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

# Crosstab 2






