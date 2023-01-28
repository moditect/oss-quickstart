def gitIgnoreFileTmpl = new File(request.outputDirectory, request.artifactId + '/.gitignore.tmpl')
def gitIgnoreFile = new File(request.outputDirectory, request.artifactId + '/.gitignore')
gitIgnoreFileTmpl.renameTo(gitIgnoreFile)

def gitattributesFileTmpl = new File(request.outputDirectory, request.artifactId + '/.gitattributes.tmpl')
def gitattributesFile = new File(request.outputDirectory, request.artifactId + '/.gitattributes')
gitattributesFileTmpl.renameTo(gitattributesFile)

def mvnwFile = new File(request.outputDirectory, request.artifactId + '/mvnw')
mvnwFile.setExecutable(true);
