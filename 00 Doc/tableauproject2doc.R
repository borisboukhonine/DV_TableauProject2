# Crosstab 1

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select * from (SELECT year, states, cigarette_tax_dollar_per_pack, (rank() 
OVER (PARTITION BY year order by cigarette_tax_dollar_per_pack desc)) as tax_rank 
FROM cig_tax where (year in (1995, 2000, 2010, 2013)) order by 1, 2) where tax_rank < 11"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

# Crosstab 2

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select year, states, cigarette_tax_dollar_per_pack, last_value(max_tax) 
OVER (PARTITION BY year order by cigarette_tax_dollar_per_pack) max_tax, last_value(max_tax) 
OVER (PARTITION BY year order by cigarette_tax_dollar_per_pack) - cigarette_tax_dollar_per_pack tax_diff
from
(SELECT year, states, cigarette_tax_dollar_per_pack, max(cigarette_tax_dollar_per_pack)
OVER (PARTITION BY year) max_tax 
FROM cig_tax) 
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

# Crosstab 3

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT year, states, cigarette_tax_dollar_per_pack, nth_value(cigarette_tax_dollar_per_pack, 2)
OVER (PARTITION BY year order by cigarette_tax_dollar_per_pack desc) nth_tax 
FROM cig_tax
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

# Crosstab 4

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select year, states, cigarette_tax_dollar_per_pack, cume_dist() 
OVER (PARTITION BY year order by cigarette_tax_dollar_per_pack) cume_dist
from cig_tax 
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_bb25684', PASS='orcl_bb25684', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)



