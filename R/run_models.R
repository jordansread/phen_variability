library(lakeattributes)
library(mda.lakes)
sites <- lakeattributes::location
use.i <- sites$site_id %in% zmax$site_id
sites <- sites[use.i, ]
ids <- sites$site_id

# 1) check cores, register nodes
# 2) download drivers for modeling, use cached if available
# 3) run model, calc result metrics
# 4) discard model files, write results to shared table

driver.path <- file.path(tempdir(),"NLDAS", ids[i],'.csv')
if (!file.exists(driver.path)){
  driver.path = get_driver_path(ids[i], driver_name="NLDAS")
}

kd=get_kd_avg(ids[i], default.if.null = TRUE)