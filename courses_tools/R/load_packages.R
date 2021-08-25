##########################################################
#### cran packages
##########################################################

packages_to_be_installed <- c(file.path('resources','project_package_list.csv'), 
                              file.path( 'courses_tools', 'resources', 'common_package_list.csv'))
if(exists("main_dir")){
  packages_to_be_installed <- file.path(main_dir, packages_to_be_installed)
}
for ( l in packages_to_be_installed){
  if(file.exists(l)){
    package_list <- read.table(l, header = TRUE, sep = ',')
    if(nrow(package_list)>0){
      for( i in 1:nrow(package_list)){
        if(!library(package_list$name[i],character.only = TRUE, logical.return = TRUE)){
          cat(paste0('Package ', package_list$name[i], ' mentionned in ', l, ' is missing. Now installing it'))
          if(package_list$repo[i] == 'cran'){
            install.packages(package_list$name[i])
          } else {
            remotes::install_github(paste0(package_list$repo[i],'/',package_list$name[i]))
          }
        }
        cat('Loading ', package_list$name[i],'\n')
        library(package_list$name[i],character.only = TRUE)
      }
    }
  }
}

