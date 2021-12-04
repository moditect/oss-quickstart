def file = new File(request.outputDirectory, request.artifactId + '/.gitignore.tmpl')
def gitIgnoreFile = new File(request.outputDirectory, request.artifactId + '/.gitignore')
file.renameTo(gitIgnoreFile)

def mvnwFile = new File(request.outputDirectory, request.artifactId + '/mvnw')
mvnwFile.setExecutable(true);
