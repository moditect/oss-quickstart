file = new File( request.getOutputDirectory(), request.getArtifactId()+"/.gitignore.tmpl" );
def gitIgnorefile = new File( request.getOutputDirectory(), request.getArtifactId()+"/.gitignore" );
file.renameTo(gitIgnorefile)