def file = new File(request.outputDirectory, request.artifactId + '/.gitignore.tmpl')
def gitIgnoreFile = new File(request.outputDirectory, request.artifactId + '/.gitignore')
file.renameTo(gitIgnoreFile)

def moduleName = request.properties['moduleName']
def packagePath = request.package.replaceAll('\\.', '/')
def moduleInfoFile = new File(request.outputDirectory, request.artifactId + '/src/main/java/' + packagePath + '/module-info.java')

// module-info.java gets moved into the package of the application; move it back to src/main/java
if (!moduleName || moduleName == 'NONE') {
    moduleInfoFile.delete()
} else {
    def moduleInfoFileNew = new File(request.outputDirectory, request.artifactId + '/src/main/java/module-info.java')
    moduleInfoFile.renameTo(moduleInfoFileNew)
}
