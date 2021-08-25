


system('mkdir -p render') 
system('mkdir render/courses_tools') 
system('mkdir render/resources') 
system( glue::glue( 'cp -rf courses_tools/resources render/courses_tools/.'))
system( glue::glue( 'cp -rf resources/figs render/resources/.'))

source(file.path('courses_tools','R', 'load_packages.R'))



filenames <- list.files('_presentation', pattern = '.Rmd',
                        full.names = TRUE)
system(glue::glue( 'cp resources/mpe_pres.css _presentation/.'))
system(glue::glue( 'cp resources/*.bib _presentation/.'))


for(f_ in filenames){
  system(glue::glue( 'rm -rf {stringr::str_remove(f_, ".Rmd")}_cache'))
  system(glue::glue( 'rm -rf {stringr::str_remove(f_, ".Rmd")}_files'))
  rmarkdown::render(f_, encoding = 'UTF-8')
}


system( glue::glue( 'cp -rf _presentation render/. '))




