
rmarkdown::render_site(encoding = 'UTF-8')


system('mkdir render/courses_tools') 
system('mkdir render/resources') 
system( glue::glue( 'cp -rf courses_tools/resources render/courses_tools/.'))
system( glue::glue( 'cp -rf resources/common_figs render/resources/.'))

source(file.path('courses_tools','R', 'load_packages.R'))



filenames <- file.path('_presentation', 'modelelineaire.Rmd')

system(glue::glue( 'cp resources/mpe_pres.css _presentation/.'))
system(glue::glue( 'cp resources/*.bib _presentation/.'))


for(f_ in filenames){
  rmarkdown::render(f_)
}


system( glue::glue( 'cp -rf _presentation render/. '))




